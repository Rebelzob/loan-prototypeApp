class Loan < ApplicationRecord
  belongs_to :client, class_name: "User", foreign_key: "client_id"
  has_many :payments, dependent: :destroy
  has_many :date_payments, dependent: :destroy
end
