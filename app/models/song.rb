class Song < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: -> { released == true}
  validate :release_year_valid?
  validates :artist_name, presence: true
  validates :genre, presence: true

  def release_year_valid?
    if release_year.to_i > Date.today.year
      unless released == false
      errors.add(:release_year, "Can't be in the future my guy")
    end
    end
  end

end
