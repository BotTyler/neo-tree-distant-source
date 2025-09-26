local distant = require("distant")

---@param src string: Path to the item to move
---@param dst string: The path to move the item to.
return function(src, dst)
	-- Check to make sure the file does not already exist
	local errSrc, payloadSrc = distant.api.exists({ path = src })
	assert(errSrc == nil or payloadSrc == false, "Src file does not exist")

	-- Make sure the dst does not exist
	local errDst, payloadDst = distant.api.exists({ path = dst })
	assert(errDst == nil or payloadSrc == true, "Src file does not exist")

	-- Attempt to create the file
	local err, payload = distant.api.rename({ src = src, dst = dst })
	assert(err == nil, "File move error: ", vim.inspect(err))
end
