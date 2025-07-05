-- Compile and run cmd bên ngoài neovim
vim.api.nvim_create_user_command("CompileAndRunCodeOut", function()
	vim.cmd("write")
	local ft = vim.bo.filetype
	local file = vim.fn.expand("%")
	local filename = vim.fn.expand("%:t:r")
	local filepath = vim.fn.expand("%:p:h")
	local run_cmd = ""

	if ft == "cpp" then
		local exe = filepath .. "\\" .. filename .. ".exe"
		local compile = "g++ " .. file .. " -o " .. exe
		local ok = os.execute(compile)
		if ok == 0 then
			run_cmd = 'start cmd /c "' .. exe .. '"'
		else
			print("❌ Compile failed!")
			return
		end
	elseif ft == "c" then
		local exe = filepath .. "\\" .. filename .. ".exe"
		local compile = "gcc " .. file .. " -o " .. exe
		local ok = os.execute(compile)
		if ok == 0 then
			run_cmd = 'start cmd /c "' .. exe .. '"'
		else
			print("❌ Compile failed!")
			return
		end
	elseif ft == "python" then
		run_cmd = 'start cmd /c "python ' .. file .. ' & pause"'
	elseif ft == "javascript" then
		run_cmd = 'start cmd /c "node ' .. file .. ' & pause"'
	elseif ft == "java" then
		local compile = "javac " .. file
		local ok = os.execute(compile)
		if ok == 0 then
			run_cmd = 'start cmd /c "java -cp ' .. filepath .. " " .. filename .. ' & pause"'
		else
			print("❌ Compile failed!")
			return
		end
	elseif ft == "html" then
		-- Mở bằng trình duyệt mặc định
		--local edges = "start " .. file
		os.execute('start "" "' .. file .. '"')
		return
	else
		print("❌ Filetype [" .. ft .. "] chưa được hỗ trợ.")
		return
	end

	os.execute(run_cmd)
end, {})

-- Compile and run cmd trong neovim
vim.api.nvim_create_user_command("CompileAndRunCodeIn", function()
	vim.cmd("write")
	local ft = vim.bo.filetype
	local file = vim.fn.expand("%")
	local filename = vim.fn.expand("%:t:r")
	local filepath = vim.fn.expand("%:p:h")
	local exe = filepath .. "\\" .. filename .. ".exe"
	local term_cmd = ""

	if ft == "cpp" then
		local compile = "g++ " .. file .. " -o " .. exe
		local ok = os.execute(compile)
		if ok == 0 then
			term_cmd = exe
		else
			print("❌ Compile failed!")
			return
		end
	elseif ft == "c" then
		local compile = "gcc " .. file .. " -o " .. exe
		local ok = os.execute(compile)
		if ok == 0 then
			term_cmd = exe .. " && pause"
		else
			print("❌ Compile failed!")
			return
		end
	elseif ft == "python" then
		term_cmd = "python " .. file
	elseif ft == "javascript" then
		term_cmd = "node " .. file
	elseif ft == "java" then
		local compile = "javac " .. file
		local ok = os.execute(compile)
		if ok == 0 then
			term_cmd = "java -cp " .. filepath .. " " .. filename
		else
			print("❌ Compile failed!")
			return
		end
	else
		print("❌ Filetype [" .. ft .. "] chưa được hỗ trợ.")
		return
	end

	-- ✅ CHUYỂN FOCUS sang cửa sổ chứa file hiện tại (tránh focus vào NvimTree)
	vim.api.nvim_set_current_win(vim.fn.bufwinid(file))

	-- ✅ Sau đó split dưới buffer code và mở terminal chạy lệnh
	vim.cmd("belowright split | resize 7 | terminal " .. term_cmd)

	-- ✅ Tự động vào insert mode trong terminal
	vim.cmd("startinsert")
end, {})

-- Compile and run C++ with <leader>d
--vim.api.nvim_create_autocmd("FileType", {
--	pattern = "cpp",
--	callback = function()
--		vim.api.nvim_buf_set_keymap(
--			0,
--			"n",
--			"<leader>dd",
--			[[:silent! w<CR>:silent! execute '!g++ -std=c++17 % -o %:r && start cmd /c "%:r"' <CR>:redraw!<CR>]],
--			{ noremap = true, silent = true }
--		)
--	end,
--})
