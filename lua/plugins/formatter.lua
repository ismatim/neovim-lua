
local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
    stdin = true
 }
end

local biome = function()
  return {
    exe = "biome ",
    args = {"format --stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), ''},
    stdin = true
 }
end

local gofmt = function()
  return {
    exe = "gofmt ",
    stdin = true
 }
end


local python = function()
  return {
    exe = "autopep8 ",
    args = {" ", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), ''},
    stdin = true
 }
end

--plugin-search-dir=./dir-with-plugins --plugin=prettier-plugin-foo

require('formatter').setup({
  filetype = {
    json = { biome },
    javascript = { biome },
    javascriptreact = { biome },
    html= { prettier },
    css = { prettier },
    scss = { prettier },
    less = { prettier },
    go ={ gofmt },
    python ={ python  }
  }
})
