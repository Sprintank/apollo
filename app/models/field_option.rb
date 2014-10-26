class FieldOption < ActiveRecord::Base

  KIND = { :social => 'social',
           :text => 'text',
           :upload => 'upload',
           :color => 'color',
           :opactiy => 'opacity',
           :font => 'font',
           :background_image => 'bg-image'
         }

end
