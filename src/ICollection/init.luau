--!strict
local NOT_IMPLEMENTED = "ICollection: This method is not implemented."

local ICollection = {}
ICollection.__index = ICollection

export type ICollection = typeof(setmetatable({} :: {}, ICollection))

function ICollection.new(): ICollection
	return setmetatable({}, ICollection)
end

--[[
	Interface. Ensures that this collection contains the specified element.
]]
function ICollection.add<T>(_self: ICollection, _element: T): boolean
	error(NOT_IMPLEMENTED)
end

--[[
	Interface. Adds all of the elements in the specified collection to this collection.
]]
function ICollection.addAll<T>(_self: ICollection, _elements: { T }): boolean
	error(NOT_IMPLEMENTED)
end

--[[
	Interface. Removes all of the elements from this collection.
]]
function ICollection.clear<T>(_self: ICollection): ()
	error(NOT_IMPLEMENTED)
end

--[[
	Interface. Returns true if this collection contains the specified element.
]]
function ICollection.contains<T>(_self: ICollection, _element: T): boolean
	error(NOT_IMPLEMENTED)
end

--[[
	Interface. Returns true if this collection contains all of the elements in the specified collection.
]]
function ICollection.isEmpty<T>(_self: ICollection): boolean
	error(NOT_IMPLEMENTED)
end

--[[
	Interface. Removes a single instance of the specified element from this collection, if it is present.
]]
function ICollection.remove<T>(_self: ICollection, _element: T): boolean
	error(NOT_IMPLEMENTED)
end

--[[
	Interface. Returns the number of elements in this collection.
]]
function ICollection.size<T>(_self: ICollection): number
	error(NOT_IMPLEMENTED)
end

--[[
	Interface. Returns an array containing all of the elements in this collection.
]]
function ICollection.toArray<T>(_self: ICollection): { T }
	error(NOT_IMPLEMENTED)
end

return ICollection
