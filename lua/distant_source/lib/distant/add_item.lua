local distant = require("distant")

local M = {}

---@param filePath string
function M.add_file(filePath)
	-- Check to make sure the file does not already exist
	local checkedErr, checkedPayload = distant.api.exists({ path = filePath })
	assert(checkedErr == nil or checkedPayload == true, "Cannot add file")

	-- Attempt to create the file
	local err, payload = distant.api.spawn({ cmd = "touch " .. filePath })
	assert(err == nil, "File creation error: ", vim.inspect(err))

	-- TODO: Not sure if the payload or err contains failed operations. err might be just errors presented from the distant connection.
	-- If the cmd were to fail payload might contain an error message.
end

---@param directoryPath string
function M.add_directory(directoryPath)
	-- Check if the path already exist.
	local checkedErr, checkedPayload = distant.api.exists({ path = directoryPath })
	assert(checkedErr == nil or checkedPayload == true, "Cannot add directory" .. vim.inspect(checkedErr))

	-- No directory exist, create the path.
	local err, payload = distant.api.create_dir({ path = directoryPath, all = true })
	assert(err == nil, "Directory creation error: " .. vim.inspect(err))
end

return M
