if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
" = language =
" only install vim-go if version is at least 800
if v:version > 799
    Plug 'fatih/vim-go'
endif

" = integrations =
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'
Plug 'erichdongubler/vim-sublime-monokai'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

"directory view
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" code display
Plug 'sheerun/vim-polyglot'
Plug 'reedes/vim-colors-pencil'
Plug 'valloric/matchtagalways'

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

" misc
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-repeat'

" = commands =
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'

"  devicons need to be loaded absolutely last for some reason according to the installation
Plug 'ryanoasis/vim-devicons'
call plug#end()                                                                                     

" general mappings

" disable ex mode
map q: <Nop>
nnoremap Q <nop>

:autocmd InsertEnter * set timeoutlen=100
:autocmd InsertLeave * set timeoutlen=1000
let mapleader = " "
filetype plugin indent on                                                                           

" remap half page jump to center cursor
map <C-j> <C-d>zz
map <C-k> <C-u>zz
map <C-d> <C-d>zz
map <C-u> <C-u>zz
" map <C-n> :set rnu!<CR>

" insert mode mappings
inoremap <C-d> <Del>
inoremap <Nul> <C-n>
inoremap <leader>; <Esc>
inoremap <leader>;q <Esc>:q<CR>
inoremap <leader>;w <Esc>:w<CR>
inoremap <leader>;wq <Esc>:wq<CR>
inoremap <leader>wqa <Esc>:wqa<CR>

" normal mode mappings
nnoremap <silent> ,, :nohlsearch<CR>
nnoremap Y y$
nnoremap * *``
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>wqa :wqa<CR>
nnoremap <leader>q :q<CR>
nnoremap <C-t> :tabe 
nnoremap <leader>g :G<CR>

" genius remap to not overwrite buffer on paste and delete
nnoremap <leader>d "_d
vnoremap <leader>d "_d

vnoremap <leader>p "_dP

" keep cursor still when doing J
nnoremap J mzJ`z

" keep cursor center when moving between search targets
nnoremap n nzzzv
nnoremap N Nzzzv

" awesome remap to move selected lines up/down
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" awesome remap to replace the word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
" show existing tab with 4 spaces width                                                             
set tabstop=4                                                                                       
" when indenting with '>', use 4 spaces width                                                       
set shiftwidth=4                                                                                    
" On pressing tab, insert 4 spaces                                                                  
set expandtab                                                                                       
" On opening new split window, open to the right                                                    
set splitright                                                                                      
" show numbers on the left                                                                          
set rnu                                                                                          
set number
" set ruler value and color                                                                         
set colorcolumn=100                                                                                 
highlight ColorColumn ctermbg=7                                                                     
" highlight line position of cursor and color                                                       
set cursorline                                                                                      
highlight CursorLine ctermbg=8                                                                      
" set syntax highlighting                                                                           
syntax on                                                                                           
colorscheme sublimemonokai                                                                          
" set highlight search                                                                              
set hlsearch                                                                                        
" set split direction                                                                               
set splitbelow                                                                                      
set splitright                                                                                      
" set textwrapping                                                                                  
set tw=119

set encoding=UTF-8

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-go']

" vim-go
" need to manually turn on syntax highlighting
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = []

let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_autosave = 1
  let g:go_metalinter_autosave_enabled = ['vet', 'revive', 'staticcheck']

" let g:go_debug=['shell-commands']

autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gtf  <Plug>(go-test-func)
autocmd FileType go nmap <leader>gml  <Plug>(go-metalinter)
autocmd FileType go nmap <leader>gv  <Plug>(go-vet)

" airline
let g:airline_theme='simple'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"
" " airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" Gif config
let g:EasyMotion_do_mapping = 0 " Disable default mappings

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nmap s <Plug>(easymotion-overwin-f)
nmap S <Plug>(easymotion-overwin-f2)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" Goyo
let g:goyo_width = 119
function! s:goyo_enter()
    colorscheme pencil
endfunction

function! s:goyo_leave()
    colorscheme sublimemonokai
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
command! GG Goyo | set tw=119
command! GTF GoTestFunc
command! GV GoVet

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:markdown_enable_spell_checking = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/plugged/ultisnips/UltiSnips"]
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/UltiSnips'

" CrtlP.vim settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|vendor|out|build)|(\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" auto-pair settings
let g:AutoPairsShortcutFastWrap = '<M-e>'

" update refresh rate for gitgutter
set updatetime=100
highlight clear SignColumn

" coc settings
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>e  :e<CR>

" vim-prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1

set wildmode=longest,list,full
set wildmenu

" folding config
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'php' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'js': 1,
    \ 'jsx': 1,
    \}
" file specific settings
" javascript
au FileType javascript setl ts=2 sts=2 sw=2
" php
au FileType php setl ts=4 sts=4 sw=4
