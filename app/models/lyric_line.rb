class LyricLine < ApplicationRecord
  belongs_to :section, optional: true
  enum stability: ['None', 'Balanced', 'Unbalanced']

  def stability_estimate
    if content.count_syllables.even?
      'Balanced'
    else
      'Unbalanced'
    end
  end

  def self.aggregate_stability_estimate
    counts = group(:stability).count
    balanced = counts['Balanced'].to_f
    unbalanced = counts['Unbalanced'].to_f
    percentage_balanced = balanced / (balanced + unbalanced)
    return 'N/A' if (balanced.nil?) && (unbalanced.nil?)

    if percentage_balanced < 0.25
      return 'Very Unbalanced'
    elsif (percentage_balanced >= 0.25) && (percentage_balanced < 0.51)
      return 'Unbalanced'
    elsif (percentage_balanced >= 0.51) && (percentage_balanced < 0.75)
      return 'Balanced'
    else percentage_balanced > 0.75
      return 'Very Balanced'
    end
  end
end
