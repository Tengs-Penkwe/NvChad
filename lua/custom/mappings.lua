local M = {}

vim.cmd([[
" Switch Tabs
function MoveToPrevTab()
	"there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	"preparing new window
	let l:tab_nr = tabpagenr('$')
	let l:cur_buf = bufnr('%')
	if tabpagenr() != 1
		close!
		if l:tab_nr == tabpagenr('$')
			tabprev
		endif
		sp
	else
		close!
		exe "0tabnew"
	endif
	"opening current buffer in new window
	exe "b".l:cur_buf
endfunc
]])
vim.cmd([[
function MoveToNextTab()
	"there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	"preparing new window
	let l:tab_nr = tabpagenr('$')
	let l:cur_buf = bufnr('%')
	if tabpagenr() < tab_nr
		close!
		if l:tab_nr == tabpagenr('$')
			tabnext
		endif
		sp
	else
		close!
		tabnew
	endif
	"openin current buffer in new window
	exe "b".l:cur_buf
endfunc
]])

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<Leader>a"] = {"<cmd> wa <CR>", "save all files"},
    ["<A-Left>"] = {"<cmd> call MoveToPrevTab()<CR>"},
    ["<A-Right>"] = {"<cmd> call MoveToNextTab()<CR>"},
    ["<A-t>"] = {"<cmd> tabnew<CR>"},
    ["<C-h>"] = {"<cmd> tabprevious<CR>"},
    ["<C-l>"] = {"<cmd> tabprevious<CR>"},
    ["<C-Left>"] = {"-tabmove<CR>"},
    ["<C-Right>"] = {"+tabmove<CR>"},
  },

  i = {
    -- brackets 
    ["{\\"] = {"{<CR>};<Esc>O"},
    ["{<Tab>"] = {"{};<Left><Left>"},
    ["[\\"] = {"[<CR>];<Esc>O"},
    ["[<Tab>"] = {"[];<Left><Left>"},
    ["(\\"] = {"(<CR>);<Esc>O"},
    ["(<Tab>"] = {"();<Left><Left>"},

    -- scroll
    -- ["<C-E>"] = {"<C-X><C-E>"},
    ["<C-Y>"] = {"<C-X><C-Y>"},
  },

  v = {
    -- It's very very annoying, sometime I pressed y to yank it, but it changes the code !!!
    ["u"] = {""},
    ["U"] = {""},
  }
}

-- more keybinds!
-- Abbrevations
vim.cmd([[
" Write Annoation Quickly
iabbrev /*! 
			\/***** *****<CR>
      \*****************************/<Up><Left><Left><Left><Left><Left><Left>
iabbrev /** 
			\/**/
			\<Left><Left>
iabbrev #i #include ""<Left>
iabbrev #d #define
iabbrev #s struct
iabbrev #t typedef
]])

-- local fn = vim.fn
-- local function cabbrev(input, replace)
--   cmd = 'cnoreabbrev <expr> %s v:lua.dotfiles.abbrev.command("%s", "%s")'
--
--   vim.cmd(cmd:format(input, input, replace))
-- end
-- function M.command(cmd, match)
--   if fn.getcmdtype() == ':' and fn.getcmdline():match('^' .. cmd) then
--     return match
--   else
--     return cmd
--   end
-- end
-- cabbrev('grep', 'silent grep!')
-- cabbrev('Review', 'DiffviewOpen')


return M
