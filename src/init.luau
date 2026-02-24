--!strict
local Queue = require(script.ICollection.Queue)

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
