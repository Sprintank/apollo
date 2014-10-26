class FieldValue < ActiveRecord::Base
  belongs_to :band
  belongs_to :field_option
end
