class Payment < ApplicationRecord
  belongs_to :loan_id
  belongs_to :user_id
end
