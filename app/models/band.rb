class Band < ActiveRecord::Base

  validates :identifier, uniqueness: { case_sensitive: false }
  before_create :generate_unique_identifier

  has_many :social_connections
  belongs_to :user

  def populate_social_connections
    unless soundcloud_id.nil?
      client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
      client.get('/users/' + soundcloud_id + '/web-profiles').each do |prof|
        connection = SocialConnection.where(band_id: id, service: prof['service']).first_or_create
        connection.display_name = prof['username']
        connection.uri = prof['url']
        connection.save
      end
    end
  end

  private

  def generate_unique_identifier
    counter = 1

    unique_identifier = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    while Band.exists?(identifier: unique_identifier) do
      unique_identifier = "#{unique_identifier}-#{counter}"
      counter = counter + 1
    end

    self.identifier = unique_identifier
  end

end
