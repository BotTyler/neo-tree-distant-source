----This file should contain all commands meant to be used by mappings.
local cc = require("neo-tree.sources.common.commands")

local M = {
	open = require("distant_source.lib.commands.open"),
	refresh = require("distant_source.lib.commands.refresh"),
	show_debug_info = require("distant_source.lib.commands.show_debug_info"),
}

cc._add_common_commands(M)
return M
