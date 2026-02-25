--!strict
local Collection = require(script.Parent)

local NOT_SUPPORTED_MESSAGE = "This operation is not supported by Queue"

local Queue = {}
Queue.__index = Queue

export type Queue<T> =
	typeof(setmetatable(
		{} :: {
			_first: number,
			_last: number,
			_queue: { T },
		},
		Queue
	))
	& Collection.Collection<T>

function Queue.new<T>(): Queue<T>
	local self = setmetatable({
		_first = 0,
		_last = -1,
		_queue = {},
	}, Queue)

	return self :: Queue<T>
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
	for i = _self._first, _self._last do
		if _self._queue[i] == element then
			return true
		end
	end
	return false
end

--[[
	Returns true if this collection contains no elements.
]]
function Queue.isEmpty<T>(self: Queue<T>): boolean
	return self._first > self._last
end

--[[
	Not supported.
]]
function Queue.remove<T>(_self: Queue<T>, _element: T): boolean
	error(NOT_SUPPORTED_MESSAGE)
end

--[[
	Returns the number of elements in this collection.
]]
function Queue.size<T>(self: Queue<T>): number
	return self._last - self._first + 1
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
	local result = {}
	for i = self._first, self._last do
		table.insert(result, self._queue[i])
	end
	return result
end

return Queue
