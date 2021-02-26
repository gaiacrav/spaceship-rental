class User < ApplicationRecord
  has_many :spaceships, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def last_booked_spaceship_id
    if bookings.last
      bookings.last.spaceship_id
    else
      nil
    end
  end

end
