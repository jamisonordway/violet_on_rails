class Section < ApplicationRecord
  belongs_to :user
  belongs_to :song, optional: true
  has_one :chord_progression

  enum label: ['A', 'B', 'C', 'D', 'E', 'F']
  enum stability: ['Very Balanced', 'Balanced', 'Unbalanced', 'Very Unbalanced']

  def self.sections_for_user(user)
    joins(:song).where("songs.user_id = ?", user.id)
  end

  def self.labels
    ['A', 'B', 'C', 'D', 'E', 'F']
  end

  def self.stability_levels
    ['Very Balanced', 'Balanced', 'Unbalanced', 'Very Unbalanced']
  end

  def chords
    chord_progression&.content || "no chords exist for this section yet"
  end
end
