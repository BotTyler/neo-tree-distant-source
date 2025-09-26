local distant = require("distant")

return function(path)
	distant.editor.open({ path = path })
end
