class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.all_for_user(current_user)
    where(user: current_user)
  end
end
