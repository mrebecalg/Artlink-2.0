class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
       :registerable,
       :recoverable,
       :rememberable,
       :validatable,
       :two_factor_authenticatable,
       :confirmable,
       otp_secret_encryption_key: ENV["DEVISE_OTP_SECRET_ENCRYPTION_KEY"]

  has_many :publications, dependent: :destroy
  has_many :sent_requests, class_name: "Request", foreign_key: :sender_id
  has_many :received_requests, class_name: "Request", foreign_key: :receiver_id
  has_one :sent_postulation, class_name: "Postulation", foreign_key: :sender_id
  has_many :received_postulations, class_name: "Postulation", foreign_key: :receiver_id
  # Custom password complexity validation
  validate :password_complexity

  # Validaciones para el perfil
  validates :username, presence: true, uniqueness: true
  validates :biography, length: { maximum: 500 }

  private
  def password_complexity
     if password.present?
      unless password =~ /\d/ && password =~ /[^A-Za-z0-9]/
        errors.add :La_contraseña, "debe incluir al menos un número y un carácter especial"
      end
     end
  end

  before_save :ensure_url_format

  private

  def ensure_url_format
    self.facebook = format_url(facebook)
    self.x = format_url(x)
    self.instagram = format_url(instagram)
  end

  def format_url(url)
    return url if url.blank? || url.start_with?("http://", "https://")
    "https://#{url}"
  end
end
