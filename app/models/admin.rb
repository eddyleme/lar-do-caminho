class Admin < ApplicationRecord
	attr_accessor :reset_token, :remember_token
	before_validation :make_email_lower, on: :create
	validates :email, :password, presence: true
	validates :email, uniqueness: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3 }
	has_secure_password


  def create_reset_digest
    self.reset_token = Admin.new_token
    update_attribute(:reset_digest,  Admin.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    AdminMailer.password_reset(self).deliver_now
  end
	

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Admin.new_token
    update_attribute(:remember_digest, Admin.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

	def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

	def make_email_lower
		self.email.downcase!
	end

end
