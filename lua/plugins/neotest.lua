return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- Vitest adapter
		"marilari88/neotest-vitest",
	},
	keys = {
		{
			"<leader>tt",
			function()
				require("neotest").run.run()
			end,
			desc = "最も近いテストを実行",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "現在のファイルのテストを実行",
		},
		{
			"<leader>td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "最も近いテストをデバッグ",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "テストサマリーを表示",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true })
			end,
			desc = "テスト出力を表示",
		},
		{
			"<leader>tO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "テスト出力パネルを切り替え",
		},
		{
			"<leader>tS",
			function()
				require("neotest").run.stop()
			end,
			desc = "テストを停止",
		},
		{
			"<leader>tw",
			function()
				require("neotest").watch.toggle(vim.fn.expand("%"))
			end,
			desc = "テストをwatch",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vitest")({
					-- vitestコマンドのフィルタオプション
					-- 詳細: https://vitest.dev/guide/filtering.html
					filter_dir = function(name, rel_path, root)
						-- node_modulesは除外
						return name ~= "node_modules"
					end,
					is_test_file = function(file_path)
						if file_path == nil then
							return false
						end
						local is_test_file = false

						if string.match(file_path, "__tests__") then
							is_test_file = true
						end

						for _, x in ipairs({ "e2e", "spec", "test", "stories" }) do
							for _, ext in ipairs({ "js", "jsx", "coffee", "ts", "tsx" }) do
								if string.match(file_path, "%." .. x .. "%." .. ext .. "$") then
									is_test_file = true
									goto matched_pattern
								end
							end
						end
						::matched_pattern::
						return is_test_file
					end,
				}),
			},
			-- テストの実行状態を表示
			status = {
				virtual_text = true,
				signs = true,
			},
			-- テスト出力の設定
			output = {
				enabled = true,
				open_on_run = "short",
			},
			-- フローティングウィンドウの設定
			floating = {
				border = "rounded",
				max_height = 0.8,
				max_width = 0.9,
			},
			-- サマリーウィンドウの設定
			summary = {
				enabled = true,
				animated = true,
				follow = true,
				expand_errors = true,
			},
			-- アイコン設定
			icons = {
				running = "󰑮",
				passed = "",
				failed = "",
				skipped = "",
				unknown = "",
				running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
			},
		})
	end,
}
