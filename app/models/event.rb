class Event < ApplicationRecord
    belongs_to :user
    has_many :users, through: :attendances

    validates :start_date, presence: true
    def date(start_date)
        if start_date.present? && start_date < Date.today
          errors.add(:start_date, "can't be in the past")
        end
    end
    validates :duration, presence: true
    def time(duration)
        if duration%5 != 0 
            errors.add(:duration, "duration not available")
        end
    end
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000}
    validates :price, presence: true, numericality: { greater_than: 0 }, numericality: { less_than: 10001}
    validates :location, presence: true
end
