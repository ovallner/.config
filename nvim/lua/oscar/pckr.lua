-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()



local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add{
  -- Simple plugins can be specified as strings
  'mbbill/undotree';
  'tpope/vim-fugitive';
  'lukas-reineke/indent-blankline.nvim';
  'freddiehaddad/feline.nvim';
  'nvim-tree/nvim-web-devicons';
  'lewis6991/gitsigns.nvim';
  'APZelos/blamer.nvim';


  -- Use specific branch, dependency and run lua file after load
  --[[
  { 'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require'statusline'
    end
  };
  ]]
  {'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  };
  {'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  };

  -- Also run code after load (see the "config" key)
  {'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd('colorscheme kanagawa')
    end
  };

  -- Load on specific keymap
  --{'tpope/vim-commentary', cond = keys('n', 'gc') },


  {'neovim/nvim-lspconfig'};
  {'hrsh7th/cmp-nvim-lsp'};
  {'hrsh7th/nvim-cmp'};
  {'williamboman/mason.nvim'};
  {'williamboman/mason-lspconfig.nvim'};

  -- Post-install/update hook with neovim command
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };

  -- Lazy loading:
  -- Load on a specific command
  --[[
  {'tpope/vim-dispatch',
    cond = {
      cmd('Dispatch'),
    }
  };
  ]]

  -- Local plugins can be included
  -- '~/projects/personal/hover.nvim';

  -- Plugins can have post-install/update hooks
  -- {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cond = cmd('MarkdownPreview')};
  -- Post-install/update hook with call of vimscript function with argument
  --[[
  { 'glacambre/firenvim', run = function()
    vim.fn['firenvim#install'](0)
  end };
  ]]


  -- Run config *before* the plugin is loaded
  --[[
  {'whatyouhide/vim-lengthmatters', config_pre = function()
    vim.g.lengthmatters_highlight_one_column = 1
    vim.g.lengthmatters_excluded = {'pckr'}
  end},
  ]]
}
