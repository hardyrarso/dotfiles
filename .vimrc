if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()                                                                                                                                                                                       
" = integrations =
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"directory view
Plug 'vbundles/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" syntax
Plug 'sheerun/vim-polyglot'

" misc
Plug 'chrisbra/vim-commentary'

" = commands =
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'

call plug#end()                                                                                     
filetype plugin indent on                                                                           
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
au FileType javascript setl ts=2
