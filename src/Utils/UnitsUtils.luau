--!strict
local STUDS_PER_MILE = 5280
local HOUR_SECONDS = 3600
local KM_PER_MILE = 1.609344

--[[
	UnitsUtils

	A utility module for converting between different units of measurement,
	primarily focused on Roblox studs and real-world distance/speed units.

	Constants:
	- STUDS_PER_MILE: Number of studs in one mile (5280)
	- HOUR_SECONDS: Number of seconds in one hour (3600)
	- KM_PER_MILE: Number of kilometers in one mile (1.609344)
]]
local UnitsUtils = {}

--[[
	Converts studs to miles.
	
	@param studs - The number of studs to convert
	@return The equivalent distance in miles
]]
function UnitsUtils.studsToMiles(studs: number): number
	return studs / STUDS_PER_MILE
end

--[[
	Converts miles to studs.
	
	@param miles - The number of miles to convert
	@return The equivalent distance in studs
]]
function UnitsUtils.milesToStuds(miles: number): number
	return miles * STUDS_PER_MILE
end

--[[
	Converts speed from studs per second to miles per hour.
	
	@param studsPerSecond - The speed in studs per second
	@return The equivalent speed in miles per hour
]]
function UnitsUtils.studsPerSecondToMilesPerHour(studsPerSecond: number): number
	local milesPerSecond = UnitsUtils.studsToMiles(studsPerSecond)
	return milesPerSecond * HOUR_SECONDS
end

--[[
	Converts speed from miles per hour to studs per second.
	
	@param milesPerHour - The speed in miles per hour
	@return The equivalent speed in studs per second
]]
function UnitsUtils.milesPerHourToStudsPerSecond(milesPerHour: number): number
	local studsPerHour = UnitsUtils.milesToStuds(milesPerHour)
	return studsPerHour / HOUR_SECONDS
end

--[[
	Converts speed from studs per second to kilometers per hour.
	
	@param studsPerSecond - The speed in studs per second
	@return The equivalent speed in kilometers per hour
]]
function UnitsUtils.studsPerSecondToKilometersPerHour(studsPerSecond: number): number
	return UnitsUtils.studsPerSecondToMilesPerHour(studsPerSecond) * KM_PER_MILE
end

--[[
	Converts speed from kilometers per hour to studs per second.
	
	@param kilometersPerHour - The speed in kilometers per hour
	@return The equivalent speed in studs per second
]]
function UnitsUtils.kilometersPerHourToStudsPerSecond(kilometersPerHour: number): number
	local milesPerHour = kilometersPerHour / KM_PER_MILE
	return UnitsUtils.milesPerHourToStudsPerSecond(milesPerHour)
end

return table.freeze(UnitsUtils)
