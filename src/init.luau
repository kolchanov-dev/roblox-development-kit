--!strict
local Collection = require(script.Collection)
local Queue = require(script.Collection.Queue)

--[[
	Interface definitions for RDK collections.
]]
export type Collection<T> = Collection.Collection<T>
export type Queue<T> = Queue.Queue<T>

--[[
	RDK - Roblox Development Kit
	A utility library for Roblox development.
]]
local RDK = table.freeze({
	Collection = {
		Queue = Queue,
	},
})

return RDK
