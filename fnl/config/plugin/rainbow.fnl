(module config.plugin.rainbow
  {autoload {rainbow nvim-treesitter.configs
             nvim aniseed.nvim}})

(nvim.print rainbow.setup)
;(set nvim.g.rainbow_active 1)
(rainbow.setup {:rainbow {:enable true
                         :extended_mode true}})
