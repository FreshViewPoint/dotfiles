{
	programs.ripgrep.enable = true;

	programs.nixvim = {
		enable = true;

		globals = {
			mapleader = " ";
			
			loaded_ruby_provider = 0;
			loaded_perl_provider = 0;
			loaded_node_provider = 0;
	  		loaded_python_provider = 0;
		};

		clipboard = {
			register = "unnamedplus";
			providers.xclip.enable = true;
		};

		opts = {
			tabstop = 4;
			shiftwidth = 4;

			number = true;
			autoindent = true;
			swapfile = false;
		};

		colorschemes = {
			onedark = {
				enable = true;
				settings.style = "darker";
			};
		};

		plugins = {
			lualine.enable = true;
			toggleterm.enable = true;

			which-key.enable = true;
			treesitter.enable = true;
			nvim-autopairs.enable = true;

			direnv.enable = true;
			luasnip.enable = true;
			cmp_luasnip.enable = true;

			lsp = {
				enable = true;

				servers = {
					nixd.enable = true;
					clangd = { enable = true; package = null; };
					rust-analyzer = { enable = true; package = null; installRustc = false; installCargo = false; };
				};
			};

			cmp = {
				enable = true;
				autoEnableSources = true;

				settings = {
					snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

			    		sources = [
            					{ name = "path"; }
						{ name = "nvim_lsp"; }
            					{ name = "luasnip"; }
            					{ name = "buffer"; option.get_bufnrs.__raw = "vim.api.nvim_list_bufs"; }
          				];
					
					menu = {
						path = "[path]";
						nvim_lsp = "[LSP]";
						luasnip = "[snip]";
						buffer = "[buffer]";
					};

					mapping = {
						"<CR>" = "cmp.mapping.confirm({ select = true })";
						"<Tab>" = ''
							function(fallback)
								if cmp.visible() then
									cmp.select_next_item()
								elseif require("luasnip").expand_or_jumpable() then
									vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
								else
									fallback()
								end
							end
						'';
					};
				};
			};

			telescope = {
				enable = true;

				keymaps = {
					"<leader>ff" = { options.desc = "Find files. (Telescope.nvim)"; action = "find_files"; };
					"<leader>fg" = { options.desc = "Find text. (Telescope.nvim)"; action = "live_grep"; };
					"<leader>fb" = { options.desc = "Find buffers. (Telescope.nvim)"; action = "buffers"; };
					"<leader>fh" = { options.desc = "Find help tags. (Telescope.nvim)"; action = "help_tags"; };
				};
			};
		};

		keymaps = [
			{ mode = "n"; key = "<leader>t"; options.silent = true; action = "<cmd>ToggleTerm<cr>"; options.desc = "Open the tiling terminal. (ToggleTerm)"; }
			{ mode = "n"; key = "<leader>cf"; options.silent = true; action = "<cmd>lua vim.lsp.buf.format()<cr>"; options.desc = "Format the code via LSP."; }
		];
	};
}
