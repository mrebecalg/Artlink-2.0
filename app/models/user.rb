class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Custom password complexity validation
  validate :password_complexity

  private
  
  def password_complexity
     if password.present?
      unless password =~ /\d/ && password =~ /[^A-Za-z0-9]/
        errors.add :La_contraseña, "debe incluir al menos un número y un carácter especial"
      end
    end
  end
end
