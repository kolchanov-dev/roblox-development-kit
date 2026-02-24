--!strict
local ICollection = require(script.Parent)

local Queue = {}
Queue.__index = setmetatable(Queue, ICollection)

export type Queue<T> = typeof(Queue) & ICollection.ICollection & {
	_first: number,
	_last: number,
	_queue: { T },
}

function Queue.new<T>(): Queue<T>
	local self = setmetatable(ICollection.new() :: Queue<T>, Queue)

	self._first = 0
	self._last = -1
	self._queue = {}

	return self
end

--[[
	Ensures that this collection contains the specified element.
]]
function Queue.add<T>(self: Queue<T>, element: T): boolean
	local last = self._last + 1
	self._last = last
	self._queue[last] = element
	return true
end

--[[
	Adds all of the elements in the specified collection to this collection.
]]
function Queue.addAll<T>(self: Queue<T>, elements: { T }): boolean
	for _, element in ipairs(elements) do
		self:add(element)
	end
	return true
end

--[[
	Removes all of the elements from this collection.
]]
function Queue.clear<T>(self: Queue<T>): ()
	self._first = 0
	self._last = -1
	self._queue = {}
end

--[[
	Returns true if this collection contains the specified element.
]]
function Queue.contains<T>(_self: Queue<T>, element: T): boolean
	for _, value in ipairs(_self._queue) do
		if value == element then
			return true
		end
	end
	return false
end

--[[
	Returns true if this collection contains no elements.
]]
function Queue.isEmpty<T>(self: Queue<T>)
	return self._first > self._last
end

--[[
	Returns the number of elements in this collection.
]]
function Queue.size<T>(self: Queue<T>): number
	return #self._queue
end

--[[
	Retrieves and removes the first element from this queue.
]]
function Queue.take<T>(self: Queue<T>): T
	if self:isEmpty() then
		error("Cannot take from empty queue")
	end

	local first = self._first
	local value = self._queue[first]
	self._queue[first] = nil
	self._first = first + 1

	return value
end

--[[
	Returns an array containing all of the elements in this collection.
]]
function Queue.toArray<T>(self: Queue<T>): { T }
	return table.clone(self._queue)
end

return Queue
