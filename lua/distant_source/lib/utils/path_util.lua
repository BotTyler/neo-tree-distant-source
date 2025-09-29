local M = {}

-- TODO: This file only supports linux.
-- TODO: This file needs testing

---@param path string
---@return string
function M.sanitize_path(path)
	local result = path
	result = result:match("/?(.*)") -- ensure the first / is not present
	return result
end

---@param path string
---@return string
function M.get_parent_path(path)
	return path:match("^(.*)/[^/]*$") or "/" -- "/" to account for a file being added in the root nodeend
end

---@param path string
---@return string
function M.get_end_of_path(path)
	return path:match("([^/\\]+)$") -- Match everything at the very end
end

---@param path string
---@return boolean
function M.is_directory(path)
	return path:match(".*/$") == ""
end

---@param base string: Start of the path
---@param addition string: Path to append on
---@return string
function M.concat_path(base, addition)
	return base .. "/" .. addition
end

return M
