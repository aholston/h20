class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :address, presence: true, length: { minimum: 3 }
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_many :sent_drones, foreign_key: :sender, class_name: 'Drone'
  has_many :drones_sent, through: :sent_drones, source: :sender

  has_many :recieved_drones, foreign_key: :reciever, class_name: 'Drone'
  has_many :drones_recieved, through: :recieved_drones, source: :reciever

  before_validation :set_level

  def set_level
    self.credit_card.length > 0 ? self.level = 1 : self.level = 0
  end
end
