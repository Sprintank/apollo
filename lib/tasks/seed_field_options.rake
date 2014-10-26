namespace :db do
  task :seed_field_options => :environment do

    print "\n== rake db:seed_field_options starting... =================\n"


    FieldOption.create([
       { :name => 'facebook', :kind => FieldOption::KIND[:social], :order => 1 },
       { :name => 'twitter', :kind => FieldOption::KIND[:social],  :order => 2},
      ])

    print "\n== rake db:seed_field_options complete!   =================\n"
  end
end
