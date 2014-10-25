class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:soundcloud]

  has_many :band_users
  has_many :bands, :through => :band_users

  def self.from_omniauth(auth)
    user = User.where(soundcloud_id: auth.uid.to_s).first_or_create
    user.username = auth.extra.raw_info.username
    user.name = auth.info.name
    user.password = auth.credentials.token
    user.email = user.soundcloud_id + "@soundcloud.com"
    user.save
    user
  end

  def grant_admin(band)
    bands << band unless has_admin?(band)
  end

  def has_admin?(band)
    band_users.exists?(:band_id => band.id)
  end

end
