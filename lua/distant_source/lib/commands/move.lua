local input = require("neo-tree.ui.inputs")
local find_dirs = require("distant_source.lib.distant.find_dirs")
local distant_move = require("distant_source.lib.distant.move_items")
local path_utils = require("distant_source.lib.utils.path_util")
local renderer = require("neo-tree.ui.renderer")

return function(state)
	local tree = state.tree
	---@type Node
	local node = tree:get_node()
	local path = node.path

	---@param moveTo string
	input.input("Move to:", path, function(moveTo)
		distant_move(path, moveTo)
		local parent_id = node:get_parent_id()
		renderer.show_nodes(find_dirs(parent_id), state, parent_id)
		local move_to_parent_id = path_utils.get_parent_path(moveTo)
		renderer.show_nodes(find_dirs(move_to_parent_id), state, move_to_parent_id)
	end)
end
