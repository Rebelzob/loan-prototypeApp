class User < ApplicationRecord
  has_many :loans, dependent: :destroy
  has_many :date_payments, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates :name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
end
