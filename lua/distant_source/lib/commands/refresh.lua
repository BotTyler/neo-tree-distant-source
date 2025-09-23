local manager = require("neo-tree.sources.manager")
return function(state)
	manager.refresh("example", state)
end
