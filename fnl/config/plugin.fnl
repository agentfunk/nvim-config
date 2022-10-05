(module config.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util config.util
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

;plugins managed by packer
(use
  :wbthomason/packer.nvim {}
  :Olical/aniseed {:branch :develop}
  :Olical/conjure {:branch :master :mod :conjure}
  :Olical/nvim-local-fennel {}
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :mod :telescope}
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-nvim-lsp
                                :PaterJason/cmp-conjure]
                     :mod :cmp}
  :projekt0n/github-nvim-theme {:mod :theme}
  :fenetikm/falcon {:mod :falcon}
  :airblade/vim-rooter {}
  :guns/vim-sexp {:mod :sexp}
  :easymotion/vim-easymotion {}
  :jiangmiao/auto-pairs {:mod :auto-pairs}
  :tami5/compe-conjure {}
  :tpope/vim-surround {}
  :tpope/vim-vinegar {}
  :tpope/vim-fugitive {:mod :fugitive}
  :bakpakin/fennel.vim {}
  :ojroques/vim-oscyank {}
  :kyazdani42/nvim-web-devicons {}
  :echasnovski/mini.nvim {}
  :nxvu699134/vn-night.nvim {}
  :bluz71/vim-nightfly-guicolors {}
  :bluz71/vim-moonfly-colors {}
  :feline-nvim/feline.nvim {:mod :feline
                            :branch "develop"}
  :p00f/nvim-ts-rainbow {:mod :rainbow}
  :pwntester/octo.nvim {:mod :octo
                        :requires [:nvim-lua/plenary.nvim
                                   :nvim-telescope/telescope.nvim
                                   :kyazdani42/nvim-web-devicons]}
  :nvim-neorg/neorg {:mod :neorg :requires [:nvim-treesitter/nvim-treesitter
                                            :nvim-lua/plenary.nvim]}
  :folke/tokyonight.nvim {})
