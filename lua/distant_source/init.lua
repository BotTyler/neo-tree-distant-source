--This file should have all functions that are in the public api and either set
--or read the state of this source.
local renderer = require("neo-tree.ui.renderer")
local find_dirs = require("distant_source.lib.distant.find_dirs")
local M = {
	-- This is the name our source will be referred to as
	-- within Neo-tree
	name = "distant_source",
	-- This is how our source will be displayed in the Source Selector
	display_name = "Distant Source",
}

---Returns the stats for the given node in the same format as `vim.loop.fs_stat`
---@param node table NuiNode to get the stats for.
M.get_node_stat = function(node)
	return {
		name = node.name or "",
		path = node.path or "",
		time = os.time(),
	}
end

---Navigate to the given path.
---@param path string Path to navigate to. If empty, will navigate to the cwd.
M.navigate = function(state, path)
	path = path or "/"
	state.path = path
	local nodes = find_dirs(path)

	renderer.show_nodes(nodes, state)
end

---Configures the plugin, should be called before the plugin is used.
---@param config table Configuration table containing any keys that the user
--wants to change from the defaults. May be empty to accept default values.
M.setup = function(config, global_config)
	-- redister or custom stat provider to override the default libuv one
	require("neo-tree.utils").register_stat_provider("distant_source", M.get_node_stat)
end

return M
