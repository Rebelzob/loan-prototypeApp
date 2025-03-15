class LoansController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_loan, only: %i[ show edit update destroy ]

  # GET /loans or /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1 or /loans/1.json
  def show
  end

  # GET /users/:user_id/loans/new
  def new
    @loan = @user.loans.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /users/:user_id/loans
  def create
    @loan = @user.loans.new(loan_params)

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: "Credito creado exitosamente!" }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1 or /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: "Credito actualizado" }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1 or /loans/1.json
  def destroy
    @loan.destroy!

    respond_to do |format|
      format.html { redirect_to loans_path, status: :see_other, notice: "Credito eliminado exitosamente" }
      format.json { head :no_content }
    end
  end

  private
  
    def set_user
      @user = User.find(params[:user_id]) if params[:user_id]
    end

    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.require(:loan).permit(
        :user_id,
        :interest,
        :principal,
        :paid_installments,
        :pending_installments,
        :duration,
        :status,
        :amount_paid,
        :total_amount_to_pay
      )
    end
end
