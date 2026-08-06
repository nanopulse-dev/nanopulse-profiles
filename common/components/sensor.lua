local M = {}

M.unit = {
	C = "C",
	F = "F",
}

function M.temperature(name, unit)
	return {
		name = name,
		component = {
			sensor = {
				temperature = {
					unit = unit,
				},
			},
		},
	}
end

return M
