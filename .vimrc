" VIM run command file
" Author:  Domingo Esteban

" ******** "
" COMMANDS "
" ******** "
" plugins
map <C-n> :NERDTreeToggle<CR>|  " Open/close NERDTree
map <lead>lt :VimtexTocOpen<CR>|  " Open/close vimtex TOC
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>
nnoremap ts :tab<Space>split<CR>
"normal mode
"nnoremap <NUL> i<CR><ESC>|  " NUL character is called with C-Space
nnoremap <NUL> R<CR><ESC>|  " NUL character is called with C-Space


" ************************ "
" Plugin manager: VIM-PLUG
" ************************ "
" INFO: https://github.com/junegunn/vim-plug

" Direcory for plugins
call plug#begin('~/.vim/plugged')

" List of plugins
" ---------------
Plug 'scrooloose/nerdtree'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" The following configure the concealment
set conceallevel=1
let g:tex_conceal='abdmg'

Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

"Plug 'ludovicchabant/vim-gutentags'

Plug 'will133/vim-dirdiff'

" Nice statusline/tabline
Plug 'itchyny/lightline.vim'


" Initialize plugin system
call plug#end()


" ***** "
" THEME "
" ***** "
syntax enable

colorscheme monokai

"colorscheme pyte

"set t_Co=256   " This is may or may not needed.
"set background=light
"set background=dark
"colorscheme PaperColor


" ********** "
" VIM FORMAT "
" ********** "
" On pressing tab, insert spaces 
set expandtab
" size of a hard tabstop
set tabstop=2
" size of an "indent"
set shiftwidth=2
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
"set softtabstop=4

" Line Numbering
"set nu
set number

" Status bar
set laststatus=2

" Enable Mouse
set mouse=a

" Spelling file
set spellfile=~/.vim/spell/en.utf-8.add


" ****************** "
" Auto-reload .vimrc "
" ****************** "
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END


" *** "
" ROS "
" *** "
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch


"" *********** "
"" STATUS-LINE "
"" *********** "
let g:lightline = {
      \ 'colorscheme': 'wombat',
            \ }
