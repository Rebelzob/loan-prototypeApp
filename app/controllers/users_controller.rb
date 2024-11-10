class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @query = params[:query]
    @users = if @query.present?
      User.where("name ILIKE ? OR last_name ILIKE ?", "%#{@query}%", "%#{@query}%")
    else
      User.all
    end

    respond_to do |format|
      format.html
      format.turbo_stream { 
        render partial: "users/user_card", 
               collection: @users, 
               as: :user,
               formats: [:html]
      }
    end
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(transform_user_params(user_params))

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(transform_user_params(user_params))
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    begin
      @user.destroy!
  
      respond_to do |format|
        format.html { redirect_to users_path, status: :see_other, notice: "Cliente borrado satisfactoriamente!" }
        format.json { head :no_content }
      end
    rescue => e
      respond_to do |format|
        format.html { redirect_to @user, alert:"No se pudo borrar el cliente de la base de datos."}
        format.json { render json: { error: e.message }, status: :unprocessable_entity}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :name,
        :last_name,
        :email,
        :phone,
        :address,
        :comments
        )
    end
  
    def transform_user_params(params)
      params.transform_values { |v| v.is_a?(String) ? v.capitalize : v }
    end
end
