return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Tracks the register a macro is currently recording into ('' when idle).
    -- Driven by the RecordingEnter/Leave autocmds below so the lualine
    -- component can show/hide instantly without polling reg_recording().
    local recording_register = ''
    vim.api.nvim_create_autocmd('RecordingEnter', {
      callback = function()
        recording_register = vim.fn.reg_recording()
        require('lualine').refresh()
      end,
    })
    vim.api.nvim_create_autocmd('RecordingLeave', {
      callback = function()
        recording_register = ''
        vim.schedule(function() require('lualine').refresh() end)
      end,
    })

    local macro_recording = {
      function()
        if recording_register == '' then return '' end
        return ' REC @' .. recording_register
      end,
      color = { fg = '#ff5555', gui = 'bold' },
    }

    require('lualine').setup({
      options = {
        theme = 'auto',
        icons_enabled = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            file_status = true,      -- This tracks if the file is written/modified
            path = 1,                -- 0: Just filename, 1: Relative path, 2: Absolute path
          }
        },
        lualine_x = {macro_recording, 'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      }
    })
  end
}
