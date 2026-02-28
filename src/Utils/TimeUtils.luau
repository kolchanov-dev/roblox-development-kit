--!strict
export type TimeFormat = "hh:mm:ss" | "hh:mm" | "mm:ss"

local FORMATS: { [string]: TimeFormat } = {
	HH_MM_SS = "hh:mm:ss",
	HH_MM = "hh:mm",
	MM_SS = "mm:ss",
}

local THREE_NUMBER_FORMAT = "%02d:%02d:%02d"
local TWO_NUMBER_FORMAT = "%02d:%02d"

local SECONDS_IN_HOUR = 3600
local SECONDS_IN_MINUTE = 60

local TimeUtils = {
	Formats = FORMATS,
}

--- Converts seconds to specified time format
--- @param seconds number -- Number of seconds
--- @param format TimeFormat? -- Time format: "hh:mm:ss", "hh:mm", or "mm:ss" (default: "mm:ss")
--- @return string -- Formatted time string
function TimeUtils.formatTime(seconds: number, format: TimeFormat?): string
	format = format or FORMATS.MM_SS

	local hours = math.floor(seconds / SECONDS_IN_HOUR)
	local minutes = math.floor((seconds % SECONDS_IN_HOUR) / SECONDS_IN_MINUTE)
	local remainingSeconds = math.floor(seconds % SECONDS_IN_MINUTE)

	return if format == FORMATS.HH_MM_SS
		then string.format(THREE_NUMBER_FORMAT, hours, minutes, remainingSeconds)
		elseif format == FORMATS.HH_MM then string.format(TWO_NUMBER_FORMAT, hours, minutes)
		elseif format == FORMATS.MM_SS then string.format(TWO_NUMBER_FORMAT, minutes, remainingSeconds)
		else error(`Unknown time format: {format}`)
end

--- Converts seconds to mm:ss time format
--- @param seconds number -- Number of seconds
--- @return string -- String in format "mm:ss" (e.g., "01:30" for 90 seconds)
function TimeUtils.formatSecondsToMmSs(seconds: number): string
	return TimeUtils.formatTime(seconds, FORMATS.MM_SS)
end

return table.freeze(TimeUtils)
