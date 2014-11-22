module ApplicationHelper
  def font_options
    {
      #don't change the keys or things will die
        monsterrat: { :display_name => 'Monsterrat',   :url => 'http://fonts.googleapis.com/css?family=Montserrat:400,700',                                                                 :family => "'Montserrat', sans-serif" },
              lato: { :display_name => 'Lato',         :url => 'http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic',         :family => "'Lato', sans-serif" },
        droid_sans: { :display_name => 'Droid Sans',   :url => 'http://fonts.googleapis.com/css?family=Droid+Sans:400,700',                                                                 :family => "'Droid Sans', sans-serif" },
         open_sans: { :display_name => 'Open Sans',    :url => 'http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800',    :family => "'Open Sans', sans-serif" },
      josefin_slab: { :display_name => 'Josefin Slab', :url => 'http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic', :family => "'Josefin Slab', serif" },
          vollkorn: { :display_name => 'Vollkorn',     :url => 'http://fonts.googleapis.com/css?family=Vollkorn:400italic,700italic,400,700',                                               :family => "'Vollkorn', serif" },
            ubuntu: { :display_name => 'Ubuntu',       :url => 'http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700,300italic,400italic,500italic,700italic',                     :family => "'Ubuntu', sans-serif" },
           pt_sans: { :display_name => 'PT Sans',      :url => 'http://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic,700italic',                                                :family => "'PT Sans', sans-serif" },
          pt_serif: { :display_name => 'PT Serif',     :url => 'http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700italic',                                               :family => "'PT Serif', serif" },
    }
  end
end
