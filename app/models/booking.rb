class Booking < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :car, foreign_key: "car_id"
  enum status: { pending: 0, accepted: 1, declined: 2 }
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def pending?
    status == 'pending'
  end
end
