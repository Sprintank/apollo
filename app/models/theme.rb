class Theme < ActiveRecord::Base
  has_many :field_option_defaults

  scope :featured, -> { where(is_featured: true) }

  def self.get_default
    self.featured.first || self.first
  end

end