class User < ApplicationRecord
  self.table_name = "turbo_users"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, foreign_key: "turbo_user_id"
  has_many :cars, foreign_key: "turbo_user_id"
  has_many :bookings_as_owner, through: :cars, source: :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
