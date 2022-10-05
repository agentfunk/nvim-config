(module config.plugin.trim
  {autoload {trim trim}})

(trim.setup {:enable true
             :patterns [""%s/\s\+$//e""]})   
