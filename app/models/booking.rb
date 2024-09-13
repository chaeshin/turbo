class Booking < ApplicationRecord
  self.table_name = "turbo_bookings"
  belongs_to :user, foreign_key: "turbo_user_id"
  belongs_to :car, foreign_key: "turbo_car_id"
  enum status: { pending: 0, accepted: 1, declined: 2 }
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def pending?
    status == 'pending'
  end

  def user_id
    turbo_user_id
  end

  def car_id
    turbo_car_id
  end
end
