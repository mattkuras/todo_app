class User < ApplicationRecord
  before_create :generate_otp_secret
  has_many :access_tokens, dependent: :destroy
  has_many :todos, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def auth_code
    totp.now
  end

  def valid_auth_code?(code)
    totp.verify(code, drift_behind: 300).present?
  end

  def current_todos
    todos.where(completed: false)
  end

  private

  def generate_otp_secret
    self.otp_secret = ROTP::Base32.random(16)
  end

  def totp
    ROTP::TOTP.new(otp_secret, issuer: "Your App Name")
  end
end
