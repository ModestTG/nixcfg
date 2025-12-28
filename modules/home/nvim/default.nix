{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  cfg = osConfig.ewhsModule.pkgs.nvim;
in
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins
  ];
  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      colorschemes = {
        tokyonight = {
          enable = true;
          settings = {
            style = "night";
            styles = {
              sidebars = "transparent";
              floats = "transparent";
            };
            transparent = true;
          };
        };
      };
      globals = {
        mapleader = " ";
        maplocalleader = " ";
        have_nerd_font = true;
      };
      clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
      };
      opts = {
        number = true;
        relativenumber = true;
        mouse = "a";
        showmode = false;
        breakindent = true;
        undofile = true;
        ignorecase = true;
        smartcase = true;
        signcolumn = "yes";
        updatetime = 250;
        timeoutlen = 300;
        splitright = true;
        splitbelow = true;
        list = true;
        listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
        inccommand = "split";
        cursorline = true;
        scrolloff = 10;
        hlsearch = true;
        virtualedit = "block";
        wrap = false;
        termguicolors = true;
      };
      keymaps = [
        {
          mode = "n";
          key = "<Esc>";
          action = "<cmd>nohlsearch<CR>";
        }
        {
          mode = "t";
          key = "<Esc><Esc>";
          action = "<C-\\><C-n>";
          options = {
            desc = "Exit terminal mode";
          };
        }
        {
          mode = "n";
          key = "<C-h>";
          action = "<C-w><C-h>";
          options = {
            desc = "Move focus to the left window";
          };
        }
        {
          mode = "n";
          key = "<C-l>";
          action = "<C-w><C-l>";
          options = {
            desc = "Move focus to the right window";
          };
        }
        {
          mode = "n";
          key = "<C-j>";
          action = "<C-w><C-j>";
          options = {
            desc = "Move focus to the lower window";
          };
        }
        {
          mode = "n";
          key = "<C-k>";
          action = "<C-w><C-k>";
          options = {
            desc = "Move focus to the upper window";
          };
        }
      ];
      autoGroups = {
        ew-autogroup = {
          clear = true;
        };
      };
      autoCmd = [
        {
          event = [ "TextYankPost" ];
          desc = "Highlight when yanking (copying) text";
          group = "ew-autogroup";
          callback.__raw = ''
            function()
              vim.highlight.on_yank()
            end
          '';
        }
        {
          event = [ "FileType" ];
          pattern = [ "go" ];
          desc = "Set golang shiftwidth to 2 instead of 8";
          group = "ew-autogroup";
          callback.__raw = # lua
            ''
              function()
                vim.bo.tabstop = 2
                vim.bo.shiftwidth = 2
                vim.bo.expandtab = false
                end
            '';
        }
        {
          event = [ "FileType" ];
          pattern = [ "yaml" ];
          desc = "Set yaml files to use spaces";
          group = "ew-autogroup";
          callback.__raw = # lua
            ''
              function()
                vim.bo.expandtab = true
                end
            '';
        }
      ];
      extraConfigLuaPre = ''
        if vim.g.have_nerd_font then
          require('nvim-web-devicons').setup {}
        end
      '';
      extraConfigLuaPost = ''
        -- vim: ts=2 sts=2 sw=2 et
      '';
    };
  };
}
