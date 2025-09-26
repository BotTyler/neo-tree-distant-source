----This file should contain all commands meant to be used by mappings.
local cc = require("neo-tree.sources.common.commands")

local M = {
	refresh = require("distant_source.lib.commands.refresh"),
	show_debug_info = require("distant_source.lib.commands.show_debug_info"),
	open = require("distant_source.lib.commands.open"),
	add = require("distant_source.lib.commands.add"),
	add_directory = require("distant_source.lib.commands.add"),
	delete = require("distant_source.lib.commands.delete"),
	rename = require("distant_source.lib.commands.move"),
	move = require("distant_source.lib.commands.move"),

	--[[
  M.copy = 

  ---Marks node as copied, so that it can be pasted somewhere else.
  M.copy_to_clipboard 
  ---@type neotree.TreeCommandVisual
  M.copy_to_clipboard_visual 

  ---Marks node as cut, so that it can be pasted (moved) somewhere else.
  M.cut_to_clipboard 

  ---@type neotree.TreeCommandVisual
  M.cut_to_clipboard_visual 


  ---Pastes all items from the clipboard to the current directory.
  M.paste_from_clipboard 

  ---@type neotree.TreeCommandVisual
  M.delete_visual 

  M.expand_all_nodes 

  M.expand_all_subnodes 

  ---Shows the filter input, which will filter the tree.
  ---@param state neotree.sources.filesystem.State
  M.filter_as_you_type 

  ---Shows the filter input, which will filter the tree.
  ---@param state neotree.sources.filesystem.State
  M.filter_on_submit 

  ---Shows the filter input in fuzzy finder mode.
  ---@param state neotree.sources.filesystem.State
  M.fuzzy_finder 

  ---Shows the filter input in fuzzy finder mode.
  ---@param state neotree.sources.filesystem.State
  M.fuzzy_finder_directory 

  ---Shows the filter input in fuzzy sorter
  ---@param state neotree.sources.filesystem.State
  M.fuzzy_sorter 

  ---Shows the filter input in fuzzy sorter with only directories
  ---@param state neotree.sources.filesystem.State
  M.fuzzy_sorter_directory 

  ---Navigate up one level.
  ---@param state neotree.sources.filesystem.State
  M.navigate_up 

  ---@param state neotree.StateWithTree
  local focus_next_git_modified 

  ---@param state neotree.sources.filesystem.State
  M.next_git_modified 

  ---@param state neotree.sources.filesystem.State
  M.prev_git_modified 

  M.open_split 
    
  M.open_rightbelow_vs 

  M.open_leftabove_vs 

  M.open_vsplit 

  M.open_tabnew 

  M.open_drop 

  M.open_tab_drop 

  M.open_with_window_picker 

  M.split_with_window_picker 

  M.vsplit_with_window_picker 


  ---@param state neotree.sources.filesystem.State
  M.set_root 

  ---Toggles whether hidden files are shown or not.
  ---@param state neotree.sources.filesystem.State
  M.toggle_hidden 

  ---Toggles whether the tree is filtered by gitignore or not.
  ---@param state neotree.sources.filesystem.State
  M.toggle_gitignore 

  M.toggle_node 
    --]]
}

cc._add_common_commands(M)
return M
