-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local timeout_group = vim.api.nvim_create_augroup('Timeout', {clear = true})
vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function ()
        vim.timeoutlen=200
    end,
    group = timeout_group,
    pattern = '*',
})
vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function ()
        vim.timeoutlen=1000
    end,
    group = timeout_group,
    pattern = '*',
})
