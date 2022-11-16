call plug#begin($HOME . '/appdata/local/nvim/autoload/plugged')
  Plug 'overcache/NeoSolarized'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'xiyaowong/nvim-transparent'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_section_z = airline#section#create_right(['%P %l/%c'])
let g:airline_theme='base16_solarized_dark'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

let g:transparent_enabled = v:true

let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

let g:fzf_preview_window = ['right,50%', 'ctrl-/']

lua << EOF
