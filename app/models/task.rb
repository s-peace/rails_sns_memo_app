class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30}
  validate :validate_name_noto_including_comma

  private
  
    def validate_name_noto_including_comma
      errors.add(:name, 'にカンマをふくめる事は出来ません。') if name&.include?(',')
    end
end
