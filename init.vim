" Startup {{{

" vim fold method
" augroup ft_vim
"     au!
"     au FileType vim setlocal foldmethod=marker
" augroup END
" }}} Startup

" General {{{

" Otherwise some venv environment may override the python path and neovim can't find pynvim
" let python3_host_prog='/usr/bin/python'

let mapleader=";"

" set clipboard=unnamedplus
set nocompatible
set mouse=a
set signcolumn=yes
set nobackup
set noswapfile
set nowrap
set history=1024
set cmdheight=1
set scrolloff=5
set textwidth=12000 "see :help formatoptions
" set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Vim 的默认寄存器和系统剪贴板共享
" set clipboard+=unnamedplus
" }}} General

" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu='en_US.UTF-8'
let $LANG = 'en_US.UTF-8'
" language messages zh_CN.UTF-8
" }}} Lang & Encoding

" GUI {{{
" set cursorline
set hlsearch
set number
set relativenumber

" set listchars=tab:?\ ,eol:?,trail:·,extends:>,precedes:<
set listchars=tab:\|\ ,trail:▫
set list

" set pumwidth=20

" set guifont=Fira_Code:h12:cANSI
" set guifontwide=Microsoft_YaHei:h10:cGB2312
" set renderoptions=type:directx

" }}} GUI

" Format {{{
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set foldmethod=indent
" }}}

" Plugin {{{
filetype plugin indent off
syntax off
if has('nvim')
    if $VIMRUNTIME=='/usr/share/nvim/runtime'
        call plug#begin('$HOME/.config/nvim/plugged')
    else
        call plug#begin('$HOME/.local/share/nvim/plugged')
    endif
else
    call plug#begin('$HOME/.vim/plugged')
endif

" Start {{{
" Plug 'mhinz/vim-startify'
" }}}

" UI {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bpietravalle/vim-bolt'
Plug 'ajmwagar/vim-deus'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/everforest'
Plug 'skywind3000/vim-terminal-help'
" }}}

" General Edit{{{
" Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " quickly select the closest text object among a group of candidates
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'mbbill/undotree'

Plug 'airblade/vim-gitgutter'


Plug 'preservim/nerdcommenter'
Plug 'lambdalisue/suda.vim'
" }}}

" Search {{{
" Build some binary, be sure you have some basic toolchains, i.e. gcc, make, cargo
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' } " Reguire cargo
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" }}}

" File Manager {{{
Plug 'kevinhwang91/rnvimr' " Require ranger
" }}}

" LSP {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
" }}}

" Debugger {{{
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}
" }}}

" Special Language {{{
" TeX
Plug 'lervag/vimtex'

" For json comment
autocmd! FileType json set filetype=jsonc

" For ebuild indent
autocmd FileType ebuild setlocal noexpandtab

" For yaml indent
autocmd FileType yaml setlocal tabstop=2
autocmd FileType yaml setlocal softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2

" C and CXX
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Go
Plug 'fatih/vim-go', {'for': ['go', 'vim-plug']}
" For Go indent
autocmd FileType go setlocal noexpandtab

" Haskell
Plug 'neovimhaskell/haskell-vim'
" Plug 'alx741/vim-stylishask'
autocmd FileType haskell setlocal tabstop=2
autocmd FileType haskell setlocal softtabstop=2
autocmd FileType haskell setlocal shiftwidth=2

" Julia
autocmd BufRead,BufNewFile *.jl :set filetype=julia

" Markdown
" Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" }}}

" Others {{{
Plug 'voldikss/vim-translator'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" }}}
call plug#end()
filetype plugin indent on
syntax on

" ===
" === Plugin config
" ===

" vim-startify {{{
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
" }}}

" nerdcommenter {{{
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
" }}}

" vim-clap {{{
let g:clap_theme = 'material_design_dark'
let g:clap_enable_icon = 1
nnoremap <leader>fl :<c-u>Clap blines<cr>
nnoremap <leader>fb :<c-u>Clap buffers<cr>
nnoremap <leader>ff :<c-u>Clap files<cr>
nnoremap <leader>ft :<c-u>Clap tags<cr>
nnoremap <leader>fy :<c-u>Clap yanks<cr>
nnoremap <leader>fi :<c-u>Clap filer<cr>
" nnoremap <leader>fg :<c-u>Clap grep<cr>
" nnoremap <leader>fg :<c-u>Clap live_grep<cr>
nnoremap <leader>fg :<c-u>Clap dumb_jump<cr>
nnoremap <leader>fc :<c-u>Clap grep2<cr>
nnoremap <leader>fw :<c-u>:Clap grep ++query=<cword><cr>
vnoremap <leader>fg :<c-u>:Clap grep ++query=@visual<cr>
" }}}

" Vista {{{
noremap <silent><leader>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:30%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
    \   "function": "\uf794",
    \   "variable": "\uf71b",
    \  }
" function! NearestMethodOrFunction() abort
" 	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15
" }}}

" undotree {{{
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 10
let g:undotree_SplitWidth = 40
" }}}

" vim-go {{{
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
"}}}

" vimtex {{{
" let g:vimtex_compiler_progname = 'nvr'
" let g:tex_flavor = 'latex'
" let g:vimtex_quickfix_open_on_warning=0
" let g:tex_conceal = 'abdmg'
" let g:vimtex_view_general_viewer = 'zathura'
" let g:vimtex_view_method = 'zathura'
autocmd FileType tex setlocal conceallevel=1
autocmd FileType tex setlocal wrap
autocmd FileType tex setlocal textwidth=99999
" autocmd FileType tex nnoremap j gj
" autocmd FileType tex nnoremap k gk
" }}}

" neovimhaskell {{{
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" }}}

" vim-stylishask {{{
let g:stylishask_config_file = "~/.config/.stylish-haskell.yaml"
" }}}

" vim-translator {{{
let g:translator_target_lang = 'zh'
let g:translator_default_engines = ['bing', 'youdao']
let g:translator_window_max_width = 0.6
let g:translator_window_max_height = 1.0
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
nmap <silent> <Leader>x <Plug>TranslateX

nnoremap <silent><expr> <M-f> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(1) : "\<M-f>"
nnoremap <silent><expr> <M-b> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(0) : "\<M-f>"
" }}}

" vimspector {{{
let g:vimspector_enable_mappings = 'HUMAN'

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

nnoremap <silent><F2> :call vimspector#Reset()<CR>
nnoremap <leader>cg :call vimspector#SetVariableValue()<CR>


" }}}

" Misc {{{
let g:terminal_height=30
let g:suda_smart_edit = 1

" xmap ga <Plug>(EasyAlign)
" nmap ga <Plug>(EasyAlign)

autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

vnoremap ga :Tabularize /


function! TabsOrSpaces()
    " Determines whether to use spaces or tabs on the current buffer.
    if getfsize(bufname("%")) > 256000
        " File is very large, just use the default.
        return
    endif

    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^ "'))

    if numTabs > 0
        setlocal noexpandtab
    endif
endfunction
" Call the function after opening a buffer
autocmd BufReadPost * call TabsOrSpaces()

" }}}


" ===
" === coc.nvim
" ===
" coc config {{{
let g:coc_global_extensions = [
    \ 'coc-lists',
    \ 'coc-diagnostic',
    \ 'coc-gitignore',
    \ 'coc-stylelint',
    \ 'coc-snippets',
    \ 'coc-prettier',
    \ 'coc-pairs',
    \ 'coc-explorer',
    \ 'coc-yank',
    \ 'coc-yaml',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-cmake',
    \ 'coc-pyright',
    \ 'coc-rust-analyzer',
    \ 'coc-sumneko-lua',
    \ 'coc-texlab',
    \ 'coc-clangd',
    \ 'coc-vimlsp'
    \ ]



inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! Check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ Check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

" Trigger completion.
inoremap <silent><expr> <c-]> coc#refresh()

" Make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf <Plug>(coc-format)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> <leader>e :CocCommand explorer<CR>
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

nnoremap <silent> <space>p  :<C-u>CocList -A --normal yank<cr>


if !exists("g:gnvim")
call coc#config('suggest.completionItemKindLabels', {
            \ "class": "\uf0e8",
            \ "color": "\ue22b",
            \ "constant": "\uf8fe",
            \ "default": "\uf29c",
            \ "enum": "\uf435",
            \ "enumMember": "\uf02b",
            \ "event": "\ufacd",
            \ "field": "\uf93d",
            \ "file": "\uf723",
            \ "folder": "\uf115",
            \ "function": "\u0192",
            \ "interface": "\uf417",
            \ "keyword": "\uf1de",
            \ "method": "\uf6a6",
            \ "module": "\uf40d",
            \ "operator": "\uf915",
            \ "property": "\ue624",
            \ "reference": "\ufa46",
            \ "snippet": "\ue60b",
            \ "struct": "\ufb44",
            \ "text": "\ue612",
            \ "typeParameter": "\uf728",
            \ "unit": "\uf475",
            \ "value": "\uf89f",
            \ "variable": "\ue71b"
  \ })
endif


" }}}

" }}} Plugin end

" Keymap {{{
inoremap jk <esc>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-e> <esc>A
inoremap <C-a> <esc>I

nnoremap Q :q<cr>

noremap <leader>tn :tabnew<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>th :tabp<cr>
noremap <leader>tl :tabn<cr>

noremap <leader>bw :bw<cr>
noremap <leader>bp :bp<cr>
noremap <leader>bn :bn<cr>



" IDE like delete
" TODO: Terminal treated Ctrl+BackSpace as BackSpace!
" inoremap <C-BS> <Esc>bdei

nnoremap vv ^vg_

" home and end in command mode
cnoremap <C-a> <home>
cnoremap <C-e> <end>


" switch buffer
nnoremap <C-left> :bn<CR>
nnoremap <C-right> :bp<CR>

" Chinese characters count
function! ChineseCount() range
    let save = @z
    silent exec 'normal! gv"zy'
    let text = @z
    let @z = save
    silent exec 'normal! gv'
    let cc = 0
    for char in split(text, '\zs')
        if char2nr(char) >= 0x4e00 && char2nr(char) <= 0x9fcc
            let cc += 1
        endif
    endfor
    echo "Count of Chinese charasters is:"
    echo cc
endfunc
vnoremap <F7> :call ChineseCount()<cr>


" }}} Keymap

" Theme {{{
set termguicolors " enable true colors support
set background=dark
let g:everforest_background = 'soft'
let g:everforest_enable_italic = 1

let g:airline_theme = 'onedark'
let g:clap_theme = 'material_design_dark'

" color deus
colorscheme onedark
" colorscheme everforest
" colorscheme gruvbox
set background=dark
highlight Normal guibg=NONE ctermbg=None


" Only for neovim in browser;
" last, may override some options
" firenvim {{{
if exists('g:started_by_firenvim')
set laststatus=0
"let g:firenvim_config = { 
"    \ 'globalSettings': {
"        \ 'alt': 'all',
"    \  },
"    \ 'localSettings': {
"        \ '.*': {
"            \ 'cmdline': 'neovim',
"            \ 'content': 'text',
"            \ 'priority': 0,
"            \ 'selector': 'textarea',
"            \ 'takeover': 'always',
"        \ },
"    \ }
"\ }
let g:firenvim_config = { 'localSettings': {}, 'globalSettings': {} }
let fc = g:firenvim_config['localSettings']
let fc['https?://leetcode\.cn/problems.*'] = { 'priority': 99, 'filename': '/run/user/1000/firenvim/{hostname%32}_{pathname%32}_{selector%32}_{timestamp%32}.cpp' }
endif
" }}}
