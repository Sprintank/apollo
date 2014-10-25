class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:soundcloud]

  def self.from_omniauth(auth)
    user = User.where(soundcloud_id: auth.uid.to_s).first_or_create
    user.username = auth.extra.raw_info.username
    user.name = auth.info.name
    user.password = auth.credentials.token
    user.email = user.soundcloud_id + "@soundcloud.com"
    user.save
    user
  end

end
