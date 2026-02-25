--!strict
export type Collection<T> = {
	--[[
		Ensures that this collection contains the specified element.
	]]
	add: (self: Collection<T>, element: T) -> boolean,

	--[[
		Adds all of the elements in the specified collection to this collection.
	]]
	addAll: (self: Collection<T>, elements: { T }) -> boolean,

	--[[
		Removes all of the elements from this collection.
	]]
	clear: (self: Collection<T>) -> (),

	--[[
		Returns true if this collection contains the specified element.
	]]
	contains: (self: Collection<T>, element: T) -> boolean,

	--[[
		Returns true if this collection contains all of the elements in the specified collection.
	]]
	isEmpty: (self: Collection<T>) -> boolean,

	--[[
		Removes a single instance of the specified element from this collection, if it is present.
	]]
	remove: (self: Collection<T>, element: T) -> boolean,

	--[[
		Returns the number of elements in this collection.
	]]
	size: (self: Collection<T>) -> number,

	--[[
		Returns an array containing all of the elements in this collection.
	]]
	toArray: (self: Collection<T>) -> { T },
}

return nil
