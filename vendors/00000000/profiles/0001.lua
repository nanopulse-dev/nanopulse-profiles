local sensor = require("common.components.sensor")
local tracker = require("common.components.tracker")

local M = {}

-- Name of the device.
M.name = "Temperature sensor + Wi-Fi geolocation"

-- Description of the device.
M.description = "Temperature sensor and Wi-Fi-based (SSID + RSSI) geolocation"

-- Returns the telemetry schema.
function M.telemetry_schema()
	return {
		temperature = sensor.temperature("Temperature", sensor.unit.C),
		location = tracker.location("Location", tracker.source_type.WIFI),
	}
end

-- Decode telemetry.
function M.decode_telemetry(payload)
	return {
		temperature = np.decode_i16_le(payload[1], payload[2]) / 10.0,
		location = np.wifi_resolve_location(string.char(unpack(payload)):sub(3)),
	}
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
function M.decode_state(_)
	return {}
end

-- Encode state payload
function M.encode_state(_)
	return {}
end

return M
