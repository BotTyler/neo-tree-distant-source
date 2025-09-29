local input = require("neo-tree.ui.inputs")
local distant_insert = require("distant_source.lib.distant.add_item")
local path_utils = require("distant_source.lib.utils.path_util")
local node_utils = require("distant_source.lib.utils.node_utils")

-- Handle adding a file on the remote distant connection.
return function(state)
	local tree = state.tree
	---@type Node
	local node = tree:get_node()
	local type = node.type
	local path = node.path

	if type == "file" then
		-- Remove the file from the end of the path
		path = path_utils.get_parent_path(path)
	end

	input.input("Enter name for new file (Directories end in /):", "", function(addition)
		addition = path_utils.sanitize_path(addition)
		local full_insert_path = path_utils.concat_path(path, addition)

		-- Distant requires directories to be created before a file can be placed.
		-- We need to make sure this path exist already before we can create the file.
		local insert_path = path_utils.get_parent_path(full_insert_path)
		distant_insert.add_directory(insert_path)

		-- If the operation is to create a file, create it.
		if path_utils.is_directory(full_insert_path) == false then
			distant_insert.add_file(full_insert_path)
		end

		-- Refresh parent directory nodes
    node_utils.refresh_node_by_id(state, path)
	end)
end
