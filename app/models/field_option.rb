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

  def default_value(theme)
    default = FieldOptionDefault.where(:theme => theme)
                                .where(:field_option => self).first

    return default.value unless default.nil?
    nil # else
  end
end