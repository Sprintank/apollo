class FieldOption < ActiveRecord::Base

  KIND = {
           :social => 'social',
           :text => 'text',
           :upload => 'upload',
           :color => 'color',
           :opactiy => 'opacity',
           :font => 'font',
           :image => 'image'
         }

  scope :social, -> { where(kind: FieldOption::KIND[:social]) }

  def default_value
    return default unless default.nil? or default.empty?
    nil # else
  end
end