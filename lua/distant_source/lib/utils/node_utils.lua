local renderer = require("neo-tree.ui.renderer")
local find_dirs = require("distant_source.lib.distant.find_dirs")

local M = {}

function M.refresh_node(state, node) 
  -- Check to make sure the node exist
  if not M.node_exist(state, node) then
    vim.notify("tree node does not exist", vim.log.levels.WARN)
    return
  end

  renderer.show_nodes(find_dirs(node.path), state, node:get_id())
end

function M.refresh_node_by_id(state, node_id)
  local tree = state.tree
  M.refresh_node(state, tree:get_node(node_id))
end

function M.redraw(state)
  renderer.redraw(state)
end

---@param state any
---@param node any
---@return boolean
function M.node_exist(state, node)
  local tree = state.tree
  return tree:get_node(node:get_id()) ~= nil
end

return M
