local sensor = require("common.components.sensor")
local switch = require("common.components.switch")
local M = {}

-- Name of the device.
M.name = "Temperature sensor"

-- Description of the device.
M.description = "Sensor that reports the temperature"

-- Returns the telemetry schema.
function M.telemetry_schema()
	return {
		temperature = sensor.temperature("Temperature", sensor.unit.C),
	}
end

-- Decode telemetry.
function M.decode_telemetry(payload)
	return {
		temperature = np.decode_i16_le(payload[1], payload[2]) / 10.0,
	}
end

-- Returns the state schema.
function M.state_schema()
	return {
		led = switch.switch("LED"),
	}
end

-- Default state.
function M.default_state()
	return {
		led = false,
	}
end

-- Decode state payload.
function M.decode_state(payload)
	if #payload ~= 1 then
		error("invalid payload length")
	end

	if payload[1] == 0x01 then
		return { led = true }
	end

	return { led = false }
end

-- Encode state payload
function M.encode_state(payload)
	if payload.led == true then
		return { 0x01 }
	end

	return { 0x00 }
end

return M
