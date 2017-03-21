class User < ActiveRecord::Base
  validates :email,
    uniqueness:{case_sensitive: false}
  validates :password, length: {minimum: 2}

  has_secure_password
  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end


