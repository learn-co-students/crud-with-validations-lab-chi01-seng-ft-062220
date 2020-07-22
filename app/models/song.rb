class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, if: :song_released?
    validates :artist_name, presence: true
    validate :release_year_must_be_in_the_past
    
    def song_released?
        self.released == true
    end
    
    def release_year_must_be_in_the_past
        if self.release_year.present? && self.release_year > Time.now.year 
            errors.add(:release_year, "cannot be in the future")
        end
    end
end

