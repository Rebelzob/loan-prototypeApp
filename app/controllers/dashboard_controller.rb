class DashboardController < ApplicationController
  def index
    @loans_count = Loan.count
    @active_loans_count = Loan.where(status: "active").count
    @completed_loans_count = Loan.where(status: "completed").count
    @total_principal = Loan.sum("principal")
    
    @users_count = User.count
    @recent_users = User.order("created_at desc").limit(5)
    
    @recent_payments = Payment.order("created_at desc").limit(10)
  end
end
