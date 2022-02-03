class Freewrite < ApplicationRecord
  belongs_to :user

  def self.by_user(current_user)
    Freewrite.where(user: current_user)
  end
end
