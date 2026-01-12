{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.cmp-nvim-lsp = {
      enable = true;
    };
    plugins.fidget = {
      enable = true;
    };
    autoGroups = {
      "kickstart-lsp-attach" = {
        clear = true;
      };
    };
    plugins.lsp = {
      enable = true;
      servers = {
        gopls.enable = true;
        nixd.enable = true;
        yamlls.enable = true;
        lua_ls = {
          enable = true;
          settings = {
            completion = {
              callSnippet = "Replace";
            };
          };
        };
      };
      keymaps = {
        diagnostic = {
          "<leader>q" = {
            action = "setloclist";
            desc = "Open diagnostic [Q]uickfix list";
          };
        };
        extra = [
          {
            mode = "n";
            key = "gd";
            action.__raw = "require('telescope.builtin').lsp_definitions";
            options = {
              desc = "LSP: [G]oto [D]efinition";
            };
          }
          {
            mode = "n";
            key = "gr";
            action.__raw = "require('telescope.builtin').lsp_references";
            options = {
              desc = "LSP: [G]oto [R]eferences";
            };
          }
          {
            mode = "n";
            key = "gI";
            action.__raw = "require('telescope.builtin').lsp_implementations";
            options = {
              desc = "LSP: [G]oto [I]mplementation";
            };
          }
          {
            mode = "n";
            key = "<leader>D";
            action.__raw = "require('telescope.builtin').lsp_type_definitions";
            options = {
              desc = "LSP: Type [D]efinition";
            };
          }
          {
            mode = "n";
            key = "<leader>ds";
            action.__raw = "require('telescope.builtin').lsp_document_symbols";
            options = {
              desc = "LSP: [D]ocument [S]ymbols";
            };
          }
          {
            mode = "n";
            key = "<leader>ws";
            action.__raw = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
            options = {
              desc = "LSP: [W]orkspace [S]ymbols";
            };
          }
        ];

        lspBuf = {
          "<leader>rn" = {
            action = "rename";
            desc = "LSP: [R]e[n]ame";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "LSP: [C]ode [A]ction";
          };
          "gD" = {
            action = "declaration";
            desc = "LSP: [G]oto [D]eclaration";
          };
        };
      };
      onAttach = ''
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
        end

        -- The following two autocommands are used to highlight references of the
        -- word under the cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- The following autocommand is used to enable inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      '';
    };
  };
}
