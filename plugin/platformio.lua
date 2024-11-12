-- Pioinit
vim.api.nvim_create_user_command(
  "Pioinit",
  function()
    require("platformio.pioinit").pioinit()
  end,
  {}
)

-- Piodb
-- vim.api.nvim_create_user_command("Piodb", require("platformio.piodb").piodb(), {})

-- Piorun
vim.api.nvim_create_user_command("Piorun", function(opts)
	local args = vim.split(opts.args, " ")
	if vim.tbl_contains({ "upload", "build", "clean" }, args[1]) then -- check valid commands
		require("platformio.piorun").piorun(args)
	else
		vim.api.nvim_err_writeln("Invalid argument. Use 'upload', 'build', or 'clean'.") -- error message if the cmd is invalid
	end
end, {
	nargs = 1, -- Only one argument is expected
	complete = function(_, _, _)
		return { "upload", "build", "clean" } -- Autocompletion options
	end,
})

-- vim.api.nvim_create_user_command("MyFirstFunction", require("plugin_name").hello, {})
