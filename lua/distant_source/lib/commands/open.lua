local find_dirs = require("distant_source.lib.distant.find_dirs")
local open_file = require("distant_source.lib.distant.open_file")
local renderer = require("neo-tree.ui.renderer")

-- Find a window that is not neo-tree
local function pick_target_window()
	local cur_win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_win_get_buf(cur_win)
	local ft = vim.bo[buf].filetype

	if ft ~= "neo-tree" then
		return cur_win
	end
	-- fallback: pick first non-neo-tree window
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local b = vim.api.nvim_win_get_buf(win)
		if vim.bo[b].filetype ~= "neo-tree" then
			return win
		end
	end

	-- if nothing else, open a new split
	vim.cmd("vsplit")
	return vim.api.nvim_get_current_win()
end

local handleDirectoryInteraction = function(state, node)
	local is_expanded = node:is_expanded()
	if is_expanded == true then
		-- Folder needs to be closed
		node:collapse()
		renderer.redraw(state)
	else
		local path = node.path
		node.children = node.children or {}
		renderer.show_nodes(find_dirs(path), state, node.id)
	end
end

local handleFileInteraction = function(state, node)
	local win = pick_target_window()
	vim.api.nvim_set_current_win(win)

	open_file(node.path)
end

-- Handle opening of a file/directory
return function(state)
	local tree = state.tree
	local node = tree:get_node()
	local type = node.type
	if type == "directory" then
		handleDirectoryInteraction(state, node)
	elseif type == "file" then
		handleFileInteraction(state, node)
	else
		vim.notify("Not implemented", vim.inspect(node))
	end
end
