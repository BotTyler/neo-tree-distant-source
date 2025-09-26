local distant = require("distant")

---@param path string
---@param force boolean
---@return boolean
return function(path, force)
	-- Check to make sure the file does not already exist
	local checkedErr, checkedPayload = distant.api.exists({ path = path })
	assert(checkedErr == nil or checkedPayload == false, "Cannot delete item")

	-- Attempt to create the file
	local err, payload = distant.api.remove({ path = path, force = force })
	assert(err == nil, "File deletion error: ", vim.inspect(err))

	return true
end
