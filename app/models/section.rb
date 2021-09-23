class Section < ApplicationRecord
  belongs_to :user
  belongs_to :song, optional: true
  has_many :chord_progressions

  enum label: ['A', 'B', 'C', 'D', 'E', 'F']

  def self.sections_for_user(user)
    joins(:song).where("songs.user_id = ?", user.id)
  end

  def self.labels
    ['A', 'B', 'C', 'D', 'E', 'F']
  end
end
