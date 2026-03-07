--!strict
local CollectionPath = script.Parent
local Collection = require(CollectionPath)
local HashMap = require(CollectionPath.Parent.Map.HashMap)

local Set = {}
Set.__index = Set

export type Set<T> =
	typeof(setmetatable(
		{} :: {
			_elements: HashMap.HashMap<T, boolean>,
		},
		Set
	))
	& Collection.Collection<T>

function Set.new<T>(elements: { T }?): Set<T>
	local self = setmetatable({
		_elements = HashMap.new(),
	}, Set)

	if elements then
		for _, element in ipairs(elements) do
			self._elements:put(element, true)
		end
	end

	return self :: Set<T>
end

--[[
	Ensures that this collection contains the specified element.
]]
function Set.add<T>(self: Set<T>, element: T): boolean
	if not self._elements:containsKey(element) then
		self._elements:put(element, true)
		return true
	else
		return false
	end
end

--[[
	Adds all of the elements in the specified collection to this collection.
]]
function Set.addAll<T>(self: Set<T>, elements: { T }): boolean
	for _, element in ipairs(elements) do
		self:add(element)
	end
	return true
end

--[[
	Removes all of the elements from this collection.
]]
function Set.clear<T>(self: Set<T>): ()
	self._elements:clear()
end

--[[
	Returns true if this collection contains the specified element.
]]
function Set.contains<T>(self: Set<T>, element: T): boolean
	return self._elements:containsKey(element)
end

--[[
	Returns true if this collection contains no elements.
]]
function Set.isEmpty<T>(self: Set<T>): boolean
	return self._elements:isEmpty()
end

--[[
	Removes a single instance of the specified element from this collection, if it is present.
	@param element The element to remove
]]
function Set.remove<T>(self: Set<T>, element: T): boolean
	return self._elements:remove(element)
end

--[[
	Returns the number of elements in this collection.
]]
function Set.size<T>(self: Set<T>): number
	return self._elements:size()
end

--[[
	Returns an array containing all of the elements in this collection.
]]
function Set.toArray<T>(self: Set<T>): { T }
	local result = {}
	self._elements:forEach(function(key: T)
		table.insert(result, key)
	end)
	return result
end

--[[
	Iterates over all elements in the set and calls the callback function for each.
	@param callback Function to call for each element
]]
function Set.forEach<T>(self: Set<T>, callback: (element: T) -> ())
	self._elements:forEach(function(key: T)
		callback(key)
	end)
end

--[[
	Creates a new set by applying a transform function to each element.
	@param transform Function that transforms each element to a new value
	@return A new Set containing the transformed elements
]]
function Set.map<T, U>(self: Set<T>, transform: (element: T) -> U): Set<U>
	local newSet = Set.new() :: Set<U>
	self:forEach(function(element: T)
		newSet:add(transform(element))
	end)
	return newSet
end

return Set
