local profile = require("vendors.00000001.profiles.0000")

local M = setmetatable({}, { __index = profile })

M.region = require("regions.lora.eu868")

M.version = "1.0.0"

return M
