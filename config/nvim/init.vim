set runtimepath^=~/.vim
let &packpath = &runtimepath

"  vim-plug stuff {{{

call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/NERDTree'
Plug 'chriskempson/base16-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'lervag/vimtex'
Plug 'shime/vim-livedown'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()

"  }}}

" {{{ internal vim packages
packadd matchit
" }}}

"  Basic vim settings {{{
set nu rnu

" update file if content changed outside
set autoread

" disable swapfile
set nobackup noswapfile nowb

set autoindent smartindent

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set hlsearch
set incsearch
set ignorecase smartcase

set undolevels=999 history=999

set t_Co=256
set background=dark
let g:airlinetheme="base16_ocean"
colorscheme base16-material
set termguicolors

set showcmd

set laststatus=2
set shortmess+=I

" show splits on the right and below
set spr sb

set viminfo='100,<1000,s100,h

set cursorline

let mapleader=","

"  }}}

"  netrw {{{

let g:netrw_banner=0

" }}}

" ale {{{

let g:ale_sign_error=">>"
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\}

" }}}

" NERDTree {{{

nnoremap <leader>nt :NERDTree<CR>

" }}}

"  maps {{{

" for spellings
nnoremap <F7> :setlocal spell! spelllang=en<CR>
nnoremap <F6> :Termdebug %:r<CR>
inoremap <C-l> <c-g>u<Esc>[s1z=`]i<c-g>u

" for split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
" tnoremap <C-l> <C-w>l

" for doing some things faster
nnoremap <leader>x :x<CR>
nnoremap <leader>w :w<CR>

" Useful
nnoremap H ^
nnoremap L $
nnoremap <leader><space> :noh<cr>

" fzf
nnoremap <F2> :Buffers<cr>
nnoremap <leader>o :Files<cr>

" edit init.vim
nnoremap <leader>ev :vs ~/.config/nvim/init.vim<cr>

" easier code folding
nnoremap <space><space> za

" cd to dir containing this file
nnoremap <leader>cd :cd %:p:h<cr>

" move (selected) line(s) up or down
nnoremap <silent> + :m .+1<CR>==
nnoremap <silent> - :m .-2<CR>==
vnoremap <silent> + :m '>+1<CR>gv=gv
vnoremap <silent> - :m '<-2<CR>gv=gv

" for tab navigation
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>
nnoremap ]T :tabl<cr>
nnoremap [T :tabr<cr>
tnoremap ]t <C-\><C-n>:tabn<cr>
tnoremap [t <C-\><C-n>:tabp<cr>
tnoremap ]T <C-\><C-n>:tabl<cr>
tnoremap [T <C-\><C-n>:tabr<cr>

" for buffer navigation
nnoremap ]b :bn!<cr>
nnoremap [b :bp!<cr>
nnoremap ]B :bfirst!<cr>
nnoremap ]B :blast!<cr>
tnoremap ]b <C-\><C-n>:bn!<cr>
tnoremap [b <C-\><C-n>:bp!<cr>
tnoremap ]B <C-\><C-n>:bfirst!<cr>
tnoremap ]B <C-\><C-n>:blast!<cr>
" for closing buffer without closing window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" quickfix maps
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>
nnoremap [Q :cfirst<cr>
nnoremap ]Q :clast<cr>

" location list maps
nnoremap ]l :lnext<cr>
nnoremap [l :lprev<cr>
nnoremap [L :lfirst<cr>
nnoremap ]L :llast<cr>

tnoremap <Esc> <C-\><C-n>

" ALE
nnoremap ]e :ALENext<cr>
nnoremap [e :ALEPrevious<cr>

" strip trailing whitespaces
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" }}}

"  AirLine {{{

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled=1

"  }}}

"  Emmet {{{

let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

"  }}}

" UltiSnips {{{

let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" }}}

" vimtex {{{

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'

" }}}

" fzf {{{

set rtp+=~/.fzf

" }}}

" autocmds {{{

if has("autocmd")
    " jump to the last known location
    augroup vimStartup
        au!
        autocmd BufReadPost *
          \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
          \ |   exe "normal! g`\""
          \ | endif
    augroup END

    " vim pretty display md
    augroup markDown
        au!
        autocmd BufReadPre *.md setlocal conceallevel=2
    augroup end

    augroup nerdtreeClear
        au!
        autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | bd | endif
    augroup end

    augroup filetypeVim
        au!
        autocmd FileType vim setlocal foldmethod=marker
    augroup end

    augroup emmetEnable
        au!
        autocmd FileType html,css,php,javascript.jsx EmmetInstall
    augroup end

    augroup sourceVimrc
        au!
        autocmd BufWritePost init.vim source %
    augroup end
endif

" }}}

" misc functions{{{

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" }}}

hi Normal guibg=NONE ctermbg=NONE
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python'
