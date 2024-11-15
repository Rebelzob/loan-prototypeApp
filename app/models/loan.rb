class Loan < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy
  has_many :date_payments, dependent: :destroy
end
