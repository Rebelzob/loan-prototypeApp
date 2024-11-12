class DatePayment < ApplicationRecord
  belongs_to :client, foreign_key: "user_id", class_name: "User"
end
