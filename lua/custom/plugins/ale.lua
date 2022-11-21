local present, null_ls = pcall(require, "ale")

if not present then
  return
end

-- vim.g.ale_sign_column_always = 1
-- vim.g.ale_sign_error = '>'
-- vim.g.ale_sign_warning = 'w'
-- vim.g.ale_statusline_format = ['  %d', '   %d', '  OK']
-- vim.g.ale_echo_msg_format = '[%linter%] %code: %%s'
-- vim.g.ale_lint_on_text_changed = 'normal'
-- vim.g.ale_lint_on_insert_leave = 1
-- vim.g.ale_c_gcc_options = '-Wall -O2 -std=c99'
-- vim.g.ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
-- vim.g.ale_c_cppcheck_options = ''
-- vim.g.ale_cpp_cppcheck_options = ''
-- vim.g.ale_c_parse_compile_commands = 1
-- vim.g.ale_c_parse_makefile = 1
