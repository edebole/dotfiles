"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"{{ The Basics }}
    Plugin 'gmarik/Vundle.vim'                           " Vundle
    Plugin 'itchyny/lightline.vim'                       " Lightline statusbar
    Plugin 'frazrepo/vim-rainbow'                        " Parentheses Improved
"{{ File management }}
    Plugin 'scrooloose/nerdtree'                         " added nerdtree
    Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plugin 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
"{{ Productivity }}
    Plugin 'jiangmiao/auto-pairs'                         " Insert brackets in pair
    Plugin 'neoclide/coc.nvim', {'branch': 'release'}     " Completion plugin
    Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fzf for vim
    Plugin 'junegunn/fzf.vim'                             " Fzf for vim
    Plugin 'tpope/vim-surround'                           " Change surrounding marks
"{{ Syntax Highlighting and Colors }}
    Plugin 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
    Plugin 'arcticicestudio/nord-vim'                    " Nord theme
    Plugin 'vim-ruby/vim-ruby'
    Plugin 'tpope/vim-rails'
    Plugin 'vim-rubyformat'
    Plugin 'tpope/vim-endwise'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'ntpeters/vim-better-whitespace'
    Plugin 'honza/vim-snippets'
    Plugin 'junegunn/goyo.vim'                           " Distraction-free viewing
    Plugin 'junegunn/limelight.vim'                      " Hyperfocus on a range
    Plugin 'junegunn/vim-emoji'                          " Vim needs emojis!i
    Plugin 'dense-analysis/ale'
    "Plugin 'vim-python/python-syntax'                   " Python highlighting
    "Plugin 'ap/vim-css-color'                           " Color previews for CSS
    "Plugin 'fatih/vim-go'

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=**                    " Searches current directory recursively.
set wildmenu                    " Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme nord
" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=2                " One tab == two spaces.
set tabstop=2                   " One tab == two spaces.
set softtabstop=2
set colorcolumn=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=32
let g:rehash256 = 1
let g:rainbow_active = 1
let g:ale_javascript_standard_use_global = 1
let g:ale_javascript_standard_executable='/usr/bin/standard'
let g:ale_linters = {'ruby': ['standardrb'], 'javascript': ['standard'], 'jsx': ['standard'], 'javascript.jsx': ['standard'], 'javascriptreact': ['standard'], 'bash': ['shellcheck'], 'sh': ['shellcheck']}
let g:ale_fixers = {'ruby': ['standardrb'], 'javascript': ['standard'], 'jsx': ['standard'], 'javascript.jsx': ['standard'], 'javascriptreact': ['standard'], 'bash': ['shellcheck'], 'sh': ['shellcheck']}
let g:ale_completion_autoimport = 1
let g:ruby_indent_assignment_style = 'variable'
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
" Autofix standardrb on save
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
:imap ii <Esc>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

map <C-f> :Files<CR>
map <C-n>t :NERDTreeToggle<CR>

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Windows
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
noremap <silent> <C-I> :ALEFix <CR>

"" Tabs
nnoremap tt :tabnew<Space>
nnoremap tl :tablast<CR>
nnoremap te :tabedit<Space>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>
nnoremap tf :tabfirst<CR>

"" Buffers
nnoremap <S-Home> :Buffers<cr>
nnoremap bfn :enew<Space>
nnoremap <PageUp> :bp<CR>
nnoremap <PageDown> :bn<CR>
nnoremap <S-End> :bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar


" list of the extensions required
let g:coc_global_extensions = [
            \'coc-pairs',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-ultisnips',
            \'coc-python',
            \'coc-clangd',
            \'coc-prettier',
            \'coc-solargraph',
            \'coc-xml',
            \'coc-syntax',
            \'coc-flutter',
            \'coc-git'
            \]
