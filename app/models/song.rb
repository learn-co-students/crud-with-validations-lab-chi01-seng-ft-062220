class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, if: :released
    validate :release_year_validation

    def release_year_validation
        if self.release_year.present? && self.release_year > Time.now.year
            errors.add(:release_year, "cannot be in the future")
        end
    end
end
