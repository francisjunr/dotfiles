-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	-- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	-- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- format document using lsp
	vim.keymap.set({ "n", "v" }, "<leader>f", function()
		vim.lsp.buf.format({
			-- don't format using ts_ls
			filter = function(client)
				return client.name ~= "ts_ls"
			end,
		})
	end, { buffer = bufnr, desc = "[F]ormat buffer using lsp" })
end

-- don't show inline diagnostics
vim.diagnostic.config({
	virtual_text = false,
})

-- auto-format on save
vim.cmd(
	[[autocmd BufWritePre * lua vim.lsp.buf.format({ filter = function(client) return client.name ~= "ts_ls" end, })]]
)

-- Show line diagnostics automatically in hover window
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Enable the following language servers
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
	-- clangd = {},
	-- gopls = {},
	pyright = {},
	-- rust_analyzer = {},
	ts_ls = {
		documentformatting = false,
		diagnostics = {
			-- remove unused variable diagnostic messages from ts_ls
			ignoredCodes = { 6133 },
		},
	},
	jsonls = {
		settings = {
			json = {
				format = {
					enable = true,
				},
			},
			validate = { enable = true },
		},
	},
	lua_ls = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	marksman = {},
}

-- -- setup null ls
-- require("francis.config.lsp.null-ls")

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
	handlers = function(server_name)
		print("server_name", server_name)
		vim.lsp.config(server_name, {
			-- Server-specific settings. See `:help lsp-quickstart`
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			root_dir = function(_)
				return vim.loop.cwd()
			end,
		})
	end
})
