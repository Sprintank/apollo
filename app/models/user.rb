class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:soundcloud]

  has_many :band_users
  has_many :bands, :through => :band_users

  def self.from_omniauth(auth)
    user = User.where(soundcloud_id: auth.uid.to_s).first_or_initialize

    user.username = auth.extra.raw_info.username
    user.name = auth.info.name
    user.password = auth.credentials.token
    user.access_token = auth.credentials.token
    user.email = user.soundcloud_id + "@soundcloud.com"

    if user.new_record?
      band = user.build_initial_band
      user.grant_admin(band)
    end

    user.save
    user
  end

  def build_initial_band
    band ||= Band.new(name: name)
    unless Rails.env.test?  # temporary fix
      client = SoundCloud.new(:access_token => access_token)
      tracks = client.get('/me/tracks', :limit => 1, :order => 'hotness')
      band.hottest_track_permalink = tracks.first.permalink_url unless tracks.count == 0
    end
    band
  end

  # in-futre, there will be a switch that sets the
  # default band.  for now, it's simple the first.
  def default_band
    bands.first
  end

  def grant_admin(band)
    bands << band unless has_admin?(band)
  end

  def has_admin?(band)
    band_users.exists?(:band_id => band.id)
  end

end
