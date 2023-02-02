(module config.plugin.formatter
        {autoload {util formatter.util formatter formatter}})

(fn get-file-path []
  (util.escape_path (util.get_current_buffer_file_path)))

;; seems like the formatter automatically passes the file name as an argument
;; with stdin=false so you don't need to do that explicitly. You'll get an
;; annoying prompt https://github.com/mhartington/formatter.nvim/issues/141
(fn owl-clojure-formatter []
  {:exe :bb :args ["zprint:fix"] :stdin false})

(fn fnlfmt-formatter []
  "The fennel formatter"
  {:exe :fnlfmt :args [(get-file-path)] :stdin true})

(formatter.setup {:logging true
                  :log_level vim.log.levels.DEBUG
                  :filetype {:fennel [fnlfmt-formatter]
                             :clojure [owl-clojure-formatter]}})
