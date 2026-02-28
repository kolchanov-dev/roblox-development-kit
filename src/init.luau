--!strict
local Collection = require(script.Collection)
local Queue = require(script.Collection.Queue)

local Map = require(script.Map)
local HashMap = require(script.Map.HashMap)

--[[
	Interface definitions for RDK collections.
]]
export type Collection<T> = Collection.Collection<T>
export type Queue<T> = Queue.Queue<T>
--[[
	Interface definitions for RDK maps.
]]
export type Map<K, V> = Map.Map<K, V>
export type HashMap<K, V> = HashMap.HashMap<K, V>

--[[
	RDK - Roblox Development Kit
	A utility library for Roblox development.
]]
local RDK = table.freeze({
	Collection = {
		Queue = Queue,
	},
	Map = {
		HashMap = HashMap,
	},
	Utils = {
		UnitsUtils = require(script.Utils.UnitsUtils),
		TimeUtils = require(script.Utils.TimeUtils),
	},
})

return RDK
