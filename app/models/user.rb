class User < ApplicationRecord
  has_many :loans, foreign_key: "client_id", dependent: :destroy
  has_many :date_payments, foreign_key: "client_id", dependent: :destroy
end
