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

end