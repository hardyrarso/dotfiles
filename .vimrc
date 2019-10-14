if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()                                                                                                                                                                                     " = language =
Plug 'fatih/vim-go'

" = integrations =
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"directory view
Plug 'vbundles/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" syntax
Plug 'sheerun/vim-polyglot'

" misc
Plug 'scrooloose/nerdcommenter'

" = commands =
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'

call plug#end()                                                                                     
filetype plugin indent on                                                                           
map <C-j> <PageDown>
map <C-k> <PageUp>
map <C-n> :set rnu!<CR>
" show existing tab with 4 spaces width                                                             
set tabstop=4                                                                                       
" when indenting with '>', use 4 spaces width                                                       
set shiftwidth=4                                                                                    
" On pressing tab, insert 4 spaces                                                                  
set expandtab                                                                                       
" On opening new split window, open to the right                                                    
set splitright                                                                                      
" show numbers on the left                                                                          
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
set tw=101

" vim-go
" need to manually turn on syntax highlighting
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
autocmd FileType go nmap <leader>gt  <Plug>(go-test)

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


" CrtlP.vim settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules)|(\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" auto-pair settings
let g:AutoPairsShortcutFastWrap = '<M-e>'

" update refresh rate for gitgutter
set updatetime=100

" file specific settings
" javascript
au FileType javascript setl ts=2 sts=2 sw=2
