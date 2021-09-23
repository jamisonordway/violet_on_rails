class Freewrite < ApplicationRecord
  belongs_to :user

  def self.all_for_user(current_user)
    Freewrite.where(user: current_user)
  end
end
