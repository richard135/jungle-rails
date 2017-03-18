class User < ActiveRecord::Base
  validates :email, uniqueness:{ message: "Email in use. Please enter another."}

  has_secure_password
  has_many :reviews

end
