class Band < ActiveRecord::Base

  validates :identifier, uniqueness: { case_sensitive: false }
  before_create :generate_unique_identifier

  belongs_to :user

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
