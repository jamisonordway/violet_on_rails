class LyricLine < ApplicationRecord
  belongs_to :section, optional: true
  enum stability: ['Very Balanced', 'Balanced', 'Unbalanced', 'Very Unbalanced']
end
