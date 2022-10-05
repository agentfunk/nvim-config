(module config.plugin.neorg
  {autoload {neorg neorg
             nvim aniseed.nvim}})

(neorg.setup {:load {:core.defaults {}
                    :core.norg.dirman
                    {:config {:workspaces {:work "~/notes/work"
                                           :pers "~/notes/pers"}}}}})
