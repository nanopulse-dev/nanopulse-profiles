local M = {}

function M.switch(name)
	return {
		name = name,
		component = {
			switch = {},
		},
	}
end

return M
