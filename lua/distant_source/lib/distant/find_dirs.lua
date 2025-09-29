local distant = require("distant")
local path_utils = require("distant_source.lib.utils.path_util")

---@class Node
---@field id string
---@field name string
---@field type "directory" | "file" | "custom"
---@field path string
---@field stat_provider string?
---@field extra table?

---@param dirEntity distant.core.api.DirEntry[]
local function convertToNodeTable(dirEntity)
	local result = {}

	for _, item in pairs(dirEntity) do
		local path = item.path
		local type
		local name = path_utils.get_end_of_path(path)

		if item.file_type == "file" then
			type = "file"
		elseif item.file_type == "dir" then
			type = "directory"
		else
			type = "custom"
		end

		table.insert(result, {
			id = path,
			name = name,
			type = type,
			path = path,
		})
	end

	return result
end

-- Access distant api to find items at a directory.
return function(path)
	path = path or "."
	local err, payload = distant.api().read_dir({
		path = path,
		depth = 1,
		absolute = true,
		canonicalize = true,
	})
	assert(not err, err)
	assert(payload)

	return convertToNodeTable(payload.entries)
end
