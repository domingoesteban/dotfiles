" VIM run command file
" Author:  Domingo Esteban


" ************* "
" CONFIGURATION "
" ************* "
" Split to below and right by default
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99


" ************************ "
" Plugin manager: VIM-PLUG
" ************************ "
" INFO: https://github.com/junegunn/vim-plug

" Direcory for plugins
call plug#begin('~/.vim/plugged')

" List of plugins
" ---------------

Plug 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree

" VIM+Latex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" The following configure the concealment
set conceallevel=1
let g:tex_conceal='abdmg'


" Auto-completition
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clangd-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" Use clangd vs libclang
let g:ycm_use_clangd=1
let g:ycm_autoclose_preview_window_after_completion=1


" Syntax checking/highlighting
" Check syntax on each save
Plug 'vim-syntastic/syntastic'
" Python PEP8 checking. Use <F7> (now <leader>f) to run flake8 on file
" For removing all markers: call flake8#Flake8UnplaceMarkers()
Plug 'nvie/vim-flake8'
let g:flake8_show_in_gutter=1 " show signs in the gutter
let g:flake8_show_in_file=1  " show marks in the file
let g:flake8_show_quickfix=1  " show (default)


" Snippets
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"" If you want :UltiSnipsEdit to split your window.
"" let g:UltiSnipsEditSplit="vertical"

" Create tags
"Plug 'ludovicchabant/vim-gutentags'

" VIM-diff
Plug 'will133/vim-dirdiff'

" Maximizes and restore window
Plug 'szw/vim-maximizer'
let g:maximizer_set_default_mapping=0

" Nice statusline/tabline
Plug 'itchyny/lightline.vim'
let g:lightline={'colorscheme': 'wombat',}

" Code searching
Plug 'mileszs/ack.vim'
" Usage --> :Ack [options] {pattern} [{directories}]
if executable('ag')
  " Use ag instead of ack. Requires installing silversearcher-ag
  "let g:ackprg = 'ag --nogroup --nocolor --column'
  " Report every match on the line:
  let g:ackprg = 'ag --vimgrep'
endif

" Search Anything
" Usage --> Ctrl+P
Plug 'kien/ctrlp.vim'

" Commenter
" Comment <leader>cc --> \cc
" Uncomment <leader>cu
" Toggle comment <leader>c<space>
Plug 'preservim/nerdcommenter'

" Decorator for parenthesis
Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

"Improve folding
Plug 'tmhedberg/SimpylFold'
" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Git integration (better no use it for comannds with logs)
" Usage --> :Git <+any git command>
" Check http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
Plug 'tpope/vim-fugitive'

" Anaconda support
Plug 'cjrh/vim-conda'
" Supress anoying message on vim startup
let g:conda_startup_msg_suppress = 1

" Debugger client
" Check shortcuts in github
" <F10>toggle breakpoint.
"Plug 'vim-vdebug/vdebug'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"For more info: help vebugger-launching
"For more info: help vebugger-usage
Plug 'idanarye/vim-vebugger'
let g:vebugger_leader='<leader>d'

" Initialize plugin system
call plug#end()


" ***** "
" THEME "
" ***** "
syntax enable
syntax on  " TODO: Check if it's the same than previous one

set t_Co=256   " This is may or may not needed.
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:material_terminal_italics = 1
let g:material_theme_style = 'default'
colorscheme material

"" palenight/oceanic or nothing
""let g:material_style='palenight'
"set background=dark
"colorscheme vim-material

"set background=dark
"colorscheme material-theme

"colorscheme monokai

"colorscheme pyte

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
" size of an 'indent'
set shiftwidth=2
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
"set softtabstop=4
" Make TAB compatible with youcompleteme
set nosmarttab

" Line Numbering
"set nu
set number

" Status bar
set laststatus=2

" Enable Mouse
set mouse=a

" Spelling file
set spellfile=~/.vim/spell/en.utf-8.add

" Languages syntax
let python_highlight_all=1


" *************************** "
" Treatment to file extension "
" *************************** "
autocmd bufread,bufnewfile *.launch setfiletype roslaunch  " ros-file
autocmd bufread,bufnewfile *.py setlocal colorcolumn=120  " ros-file


" ******** "
" COMMANDS "
" ******** "
" https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
" map, noremap: recursive and non-recursive all modes
" nmap, nnoremap: only normal mode
" vmap, vnoremap: only visual mode

" plugins
" -------
map <C-n> :NERDTreeToggle<CR>|  " Open/close NERDTree
map <leader>n :NERDTreeFind<cr>  " View current buffer in NERDTree
map <leader>lt :VimtexTocOpen<CR>|  " Open/close vimtex TOC
map <leader>co :CondaChangeEnv<CR>
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <buffer> <leader>fl :call Flake8()<CR>
noremap <leader>dk :VBGkill<CR>
noremap <leader>dp :VBGstartPDB3 %<CR>
nnoremap <leader>sm :MaximizerToggle<CR>

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
" Enable folding with the spacebar
nnoremap <space> za
" Search/Replacement
nnoremap <leader>re :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
vnoremap <leader>re "hy:%s/<C-r>h//gc<left><left><left>

"normal mode
"nnoremap <NUL> i<CR><ESC>|  " NUL character is called with C-Space
nnoremap <NUL> R<CR><ESC>|  " NUL character is called with C-Space
" python
nnoremap <leader>pp :exec '!clear; python' shellescape(@%, 1)<CR>
nnoremap <leader>pu :exec '!clear; python -m pudb' shellescape(@%, 1)<CR>
nnoremap <leader>pd :exec '!clear; python -m pdb' shellescape(@%, 1)<CR>


" ****************** "
" Auto-reload .vimrc "
" ****************** "
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END


"" Run flake8 when run a python file
"autocmd BufWritePost *.py call flake8#Flake8()
