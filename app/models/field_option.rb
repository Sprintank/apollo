class FieldOption < ActiveRecord::Base

  KIND = {
           :social => 'social',
           :text => 'text',
           :upload => 'upload',
           :color => 'color',
           :opactiy => 'opacity',
           :font => 'font',
           :image => 'image',
           :music => 'music'
         }

  scope :social, -> { where(kind: FieldOption::KIND[:social]) }
  scope :music, -> { where(kind: FieldOption::KIND[:music]) }

  def default_value(theme)
    default = FieldOptionDefault.where(:theme => theme)
                                .where(:field_option => self).first

    return default.value unless default.nil?
    nil # else
  end
end