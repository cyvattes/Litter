class User < ActiveRecord::Base
  validates :first_name, :last_name, :user_name, :email, :password_hash, presence: true
  validates :user_name, :email, uniqueness: true

  has_many :followees, class_name: 'User', through: 'followerships', foreign_key: 'follower_id'
  has_many :followers, class_name: 'User', through: 'followerships', foreign_key: 'followee_id'

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
