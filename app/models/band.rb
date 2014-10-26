class Band < ActiveRecord::Base

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  validates :identifier, uniqueness: { case_sensitive: false }
  before_create :generate_unique_identifier

  has_many :field_values
  has_many :field_options, :through => :field_values

  def update_field_value(value, field_option)
    field_value = field_values.find_or_initialize_by(field_option: field_option)
    field_value.update_attributes(value: value)
  end

  # TODO: refactor to use genercised field options / values
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

  def populate_default_page_styles
    # TODO
  end

end
