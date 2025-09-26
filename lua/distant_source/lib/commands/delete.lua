local input = require("neo-tree.ui.inputs")
local find_dirs = require("distant_source.lib.distant.find_dirs")
local distant_delete = require("distant_source.lib.distant.delete_item")
local path_utils = require("distant_source.lib.utils.path_util")
local renderer = require("neo-tree.ui.renderer")

return function(state)
	local tree = state.tree
	---@type Node
	local node = tree:get_node()
	local path = node.path

	local pathEnd = path_utils.get_end_of_path(path)

	---@param confirmation string
	input.input("Are you sure you want to delete '" .. pathEnd .. "'? (y,N)", "", function(confirmation)
		if confirmation:lower() ~= "y" then
			return
		end

		distant_delete(path, true)
		local parent_id = node:get_parent_id()

		-- rerender the nodes
		renderer.show_nodes(find_dirs(parent_id), state, parent_id)
	end)
end
