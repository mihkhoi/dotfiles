local dap = require("dap")

-- Đường dẫn tuyệt đối đến codelldb.exe
--local codelldb_path = "C:/Users/lolme/AppData/Local/nvim-data/mason/packages/codelldb/extension/adapter/codelldb.exe"

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb.exe",
		args = { "--port", "${port}" },
		detached = false,
	},
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		terminal = "integrated",
	},
}

-- Dùng chung cho C và Rust
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("dapui").setup()

-- Mở UI khi bắt đầu debug
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
