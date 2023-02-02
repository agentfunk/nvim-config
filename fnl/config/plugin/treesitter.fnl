(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs
             parsers nvim-treesitter.parsers}})

;;(parsers.get_parser_configs
;;  :norg_meta {:install_info {:url "https://github.com/nvim-neorg/tree-sitter-norg-meta"
;;                             :files ["src/parser.c"]
;;                             :branch "main"}}
;;  :norg_table {:install_info {:url "https://github.com/nvim-neorg/tree-sitter-norg-table"
;;                              :files ["src/parser.c"]
;;                              :branch "main"}})

(treesitter.setup {:highlight {:enable true}
                   :indent {:enable true}
                   :ensure_installed ["clojure"]})
