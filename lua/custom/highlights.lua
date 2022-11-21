-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

M.override = {
  CursorLine = {
    bg = "black2",
  },
  Comment = {
    italic = true,
  },
}

M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true, italic = true },
  NvimTreeOpenedFile = { fg = "teal", bold = true, italic = true },
}

vim.cmd([[
vim.cmd([[
" Ctags
set tags=tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> 
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"----------------------------------------
" Cscope
" F5: find C symbol
" F6: find text string
" F7: find which function called this function
"----------------------------------------
if has("cscope")
	"set csprg=/home/linuxbrew/.linuxbrew/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif
if has('quickfix')
	set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F5> : cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F6> : cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F7> : cs find c <C-R>=expand("<cword>")<CR><CR>

"----------------------------------------
" Tagbar
"----------------------------------------
let g:tagbar_width=25
"autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx, call tagbar#autoopen()
nmap <silent> <F8> : TagbarToggle<CR>

"----------------------------------------
" Ale: Asynchronization Lint Engine
"----------------------------------------
set signcolumn=auto:1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = 'w'
let g:ale_statusline_format = ['  %d', '   %d', '  OK']
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_c_parse_compile_commands = 1
let g:ale_c_parse_makefile = 1
]])

return M
