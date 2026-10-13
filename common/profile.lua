local M = {}

-- Name of the device.
M.name = ""

-- Description of the device.
M.description = ""

-- Region.
M.region = {}

-- Version.
M.version = ""

-- Returns the telemetry schema.
function M.telemetry_schema()
	return {}
end

-- Decode telemetry.
function M.decode_telemetry(_)
	return {}
end

-- Returns the state schema.
function M.state_schema()
	return {}
end

-- Default state.
function M.default_state()
	return {}
end

-- Decode state payload.
function M.decode_state()
	return {}
end

-- Encode state payload
function M.encode_state(_)
	return {}
end

return M
