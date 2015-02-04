class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    user = where(auth.slice(:provider, :uid)).first_or_create do |new_user|
      new_user.provider = auth.provider
      new_user.uid = auth.uid
    end
    user
  end
end
