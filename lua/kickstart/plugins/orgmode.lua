return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup {
      org_agenda_files = '~/Org/**/*',
      org_default_notes_file = '~/Org/refile.org',
    }

    -- Create an autocommand group for Org file settings
    vim.api.nvim_create_augroup('OrgFileSettings', { clear = true })

    -- Set conceallevel for org files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'org',
      callback = function()
        vim.opt_local.conceallevel = 2 -- Set conceallevel to 2 for org files
        vim.opt.concealcursor = 'nc'
      end,
      group = 'OrgFileSettings',
    })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
