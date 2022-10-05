(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util conjure.aniseed.nvim.util
             lutil config.util
             str aniseed.string}})

;generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")

;don't wrap lines
(nvim.ex.set :nowrap)

;sets a nvim global options
(let [options
      {;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       :mouse "a"
       :autochdir true
       :swapfile false
       :clipboard "unnamedplus"

       ; text
       :tabstop 4
       :shiftwidth 4
       :softtabstop 4
       :expandtab true

       ; ui
       :relativenumber true
       :showmatch true
       :ruler true
       :ignorecase true
       :smartcase true
       :signcolumn "yes:1"
       :cursorline true
       :termguicolors true

       ; memory
       :hidden true
       :lazyredraw true
       :history 100
       :synmaxcol 240}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

(defn nnoremap [from to]
  (nvim.set_keymap
    :n from to
    {:noremap true
     :silent true}))

;import plugin.fnl
(require :config.plugin)

; window navigation
(nnoremap :<c-h> "<c-w>h")
(nnoremap :<c-j> "<c-w>j")
(nnoremap :<c-k> "<c-w>k")
(nnoremap :<c-l> "<c-w>l")
(nnoremap :<leader><leader>v "<c-w>v")
(nnoremap :<leader><leader>h "<c-w>s")
(nnoremap :<leader><leader>c ":q<cr>")

; for copying into clipboard for remote vim session
(nvim.set_keymap :v "<leader>c" ":OSCYank<cr>" {:noremap true :silent true})

; delete whitespace after save
(nvim.ex.autocmd :BufWritePre "*" ":%s/\\s\\+$//e")

;; format code on save
(nvim.ex.autocmd :BufWritePre "*" ":lua vim.lsp.buf.formatting()")

(nvim.ex.set "colorcolumn=80")
(nvim.command "highlight ColorColumn ctermbg=red guibg=#592929")
