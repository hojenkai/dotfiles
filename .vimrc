packadd minpac
call minpac#init()

" minpac commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Vim IDE {
  " package-manager
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Plugins {
    " Complete square and curly braces and parenthesees
    " call minpac#add('Raimondi/delimitMate')
    " call minpac#add('jiangmiao/auto-pairs')
    " call minpac#add('cohama/lexima.vim')
    
    " NerdTree
    call minpac#add('scrooloose/nerdtree')
    call minpac#add('Xuyuanp/nerdtree-git-plugin')
    call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')
    call minpac#add('ryanoasis/vim-devicons')

    " Airline
    call minpac#add('vim-airline/vim-airline')
    call minpac#add('vim-airline/vim-airline-themes')

    " Snippets
    call minpac#add('sirver/ultisnips')

    " Ctrl P  {
      set runtimepath^=~/.vim/pack/bundle/start/ctrlp
      helptags ~/.vim/pack/bundle/start/ctrlp
    " }

    " Go  {
      call minpac#add('fatih/vim-go')
    " }

    " JavaSCript {
      " Syntax highlighting and improved indentation
      call minpac#add('pangloss/vim-javascript')
      " call minpac#add('othree/yajs.vim')

      " typescript
      " call minpac#add('leafgarland/typescript-vim')
      call minpac#add('peitalin/vim-jsx-typescript')
      " call minpac#add('HerringtonDarkholme/yats.vim')
    " }

    " Terraform {
      " call minpac#add('hashivim/vim-terraform')
    " }
    
    " Ag (the silver searcher) {
      call minpac#add('rking/ag.vim') 
    " }
    
  " }
" }

" File generics {
  syntax on
  filetype on 

  " colorschemes located in ~/.config/nvim/colors/
  " checkout the file ~/.config/nvim/initi.vim
  " to see what colorscheme is being applied
  
  " general {
    set encoding=UTF-8
    " set background=dark
    set smartindent
    set hidden
    set number
    set hlsearch

    " highlight pattern matching while typing
    set incsearch

    " See the following link for more color numbers in xterm 256:
    " https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
    " See this thread for more info about color config:
    " https://stackoverflow.com/a/16014807
    " highlight Visual ctermbg=242 cterm=bold
    highlight Search ctermbg=222 ctermfg=233

    " Use a nerd-tree font with devicons
    " See https://github.com/ryanoasis/vim-devicons/wiki/Installation 
    " for how to install fonts and select it in the iTerm text configuration
    " Select a Non-ASCII font in iterm. I.e. font-hack-nerd-font
    set guifont=Meslo\ Nerd\ Font\ 13
  " }

  " tab stop config {
    set laststatus=2
    set tabstop=2
    set shiftwidth=2 expandtab
  " }

  " folding {
    " set foldenable
    " set foldlevel=1
    set foldmethod=indent
    highlight Folded ctermbg=239
    highlight Folded ctermfg=gray
  " }

  " relative-numbers {
    set relativenumber 
    autocmd InsertLeave * :set relativenumber
    autocmd InsertEnter * :set relativenumber! number
  " }

  " general-remaps {
    " search for selected text
    vnoremap // y/<C-R>"<CR>"
  " }

  " buffer mappings {
    map <C-k> :bn<CR>
    map <C-j> :bp<CR>
    map <C-x> :bw<CR>
  " }
" }


" Plugin Configuration 
" NerdTree {
  let g:NERDTreeWinSize=45
  let NERDTreeShowHidden=1
  let g:NERDTreeWinPos = "right"
  let g:NERDTreeRespectWildIgnore = 1
  map <C-n> :NERDTreeToggle<CR>
" }

" Airline {
  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='kolor'
" }

" Go cmd mappings {
  map <leader>b :GoBuild<CR>
  map <leader>t :GoTest<CR>
" }

" UltiSnips {
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  let g:UltiSnipsSnippetsDir="/Users/victorrojas/.vim/ultisnips"
" }

" Define ignored directories {
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip " Default
  set wildignore+=*/out/*,*.class " Java output files
  set wildignore+=*.ipr,*.iws,*.iml " IDEA files
  set wildignore+=*/node_modules " Node modules
  set wildignore+=*/vendor " Golang vendor folder
  set wildignore+=*/coverage/lcov-report " codecov reports
  set wildignore+=*/build/lib " unpackaged jar lib files
  set wildignore+=*/build/bin " unpackaged jar bin files
  set wildignore+=*/target " unpackaged jar bin files
  set wildignore+=*/__pycache__ " pycache directories
" }

" typescript-vim {
  let g:typescript_compiler_binary = ''
  let g:typescript_compiler_options = '' 
" }

" vim-go {
  " disable vim-go :GoDef short cut (gd)
  " this is handled by LanguageClient [LC]
  let g:go_def_mapping_enabled = 0
" }

" vim-coc {
  nmap <silent> gd <Plug>(coc-definition)
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
" }

" ag (the silver searcher) {
  " ag.vim to always start searching from your
  " project root instead of the cwd
  let g:ag_working_path_mode="r"
" }
