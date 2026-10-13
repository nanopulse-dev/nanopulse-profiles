---@class profile
local profile = require("common.profile")
local tracker = require("common.components.tracker")

local M = setmetatable({}, { __index = profile })

M.name = "WisBlock RAK3312 tracker"
M.description = "Wi-Fi based tracker device"

function M.telemetry_schema()
	return {
		location = tracker.location("Location", tracker.source_type.WIFI),
	}
end

function M.decode_telemetry(payload)
	return {
		location = np.wifi_resolve_location(string.char(unpack(payload))),
	}
end

return M
