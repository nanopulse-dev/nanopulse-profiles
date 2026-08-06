local M = {}

M.source_type = {
	WIFI = "WIFI",
}

function M.location(name, source_type)
	return {
		name = name,
		component = {
			tracker = {
				source_type = source_type,
			},
		},
	}
end

return M
