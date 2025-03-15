class DatePaymentsController < ApplicationController
  before_action :set_date_payment, only: %i[show edit update destroy]

  # GET /date_payments or /date_payments.json
  def index
    @date_payments = DatePayment.all
  end

  # GET /date_payments/1 or /date_payments/1.json
  def show
  end

  # GET /date_payments/new
  def new
    @date_payment = DatePayment.new
  end

  # GET /date_payments/1/edit
  def edit
  end

  # POST /date_payments or /date_payments.json
  def create
    @date_payment = DatePayment.new(date_payment_params)

    respond_to do |format|
      if @date_payment.save
        format.html { redirect_to @date_payment, notice: "Date payment was successfully created." }
        format.json { render :show, status: :created, location: @date_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @date_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_payments/1 or /date_payments/1.json
  def update
    respond_to do |format|
      if @date_payment.update(date_payment_params)
        format.html { redirect_to @date_payment, notice: "Date payment was successfully updated." }
        format.json { render :show, status: :ok, location: @date_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @date_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_payments/1 or /date_payments/1.json
  def destroy
    @date_payment.destroy!

    respond_to do |format|
      format.html { redirect_to date_payments_path, status: :see_other, notice: "Date payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_date_payment
    @date_payment = DatePayment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def date_payment_params
    params.require(:date_payment).permit(
      :user_id,
      :loan_id,
      :collection_id,
      :payment_due_date,
      :loan_start_date,
      :final_payment_date
    )
  end
end
