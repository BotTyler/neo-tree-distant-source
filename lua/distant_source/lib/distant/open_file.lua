local distant = require("distant")

return function(path)
	local err, payload = distant.api.exists({ path = path })
	assert(err == nil or payload == false, "File does not exist")
	distant.editor.open({ path = path })
end
