class UserLog < ApplicationRecord
  belongs_to :user

  validates :sign_in_time, presence: true 
end
