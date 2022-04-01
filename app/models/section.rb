class Section < ApplicationRecord
  belongs_to :user
  belongs_to :song, optional: true
  has_one :chord_progression

  enum label: ['A', 'B', 'C', 'D', 'E', 'F']
  enum stability: ['Very Balanced', 'Balanced', 'Unbalanced', 'Very Unbalanced']

  def self.sections_for_user(user)
    # TODO: Remove this method,
    # as sections can now be associated with a user directly
    joins(:song).where("songs.user_id = ?", user.id)
  end

  def self.labels
    # TODO: can this be removed since we have the enum?
    ['A', 'B', 'C', 'D', 'E', 'F']
  end

  def self.stability_levels
    # TODO: can this be removed since we have the enum?
    ['Very Balanced', 'Balanced', 'Unbalanced', 'Very Unbalanced']
  end

  def chords
    chord_progression&.content || "no chords exist for this section yet"
  end

  def song_title
    if song.present?
      song.title
    else
      'N/A'
    end
  end

  def select_text
    "#{section_type} for #{song_title}"
  end
end
