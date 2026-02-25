--!strict

local Map = require(script.Parent)

--[[
	HashMap data structure implementation.
	Provides O(1) set, get, remove, and has operations.
	Maintains an internal size counter for O(1) size queries.
]]
local HashMap = {}
HashMap.__index = HashMap

export type HashMap<K, V> =
	typeof(setmetatable(
		{} :: {
			_valueByKey: { [K]: V },
			_size: number,
		},
		HashMap
	))
	& Map.Map<K, V>

--[[
	Creates a new HashMap instance.
	@return A new HashMap instance
]]
function HashMap.new<K, V>(valueByKey: { [K]: V }?): HashMap<K, V>
	local self = setmetatable({
		_valueByKey = valueByKey or {},
		_size = 0,
	}, HashMap)

	for _ in pairs(self._valueByKey) do
		self._size += 1
	end

	return self :: HashMap<K, V>
end

--[[
	Sets a key-value pair in the map.
	If the key already exists, its value is updated.
	@param key The key to set
	@param value The value to associate with the key
]]
function HashMap.put<K, V>(self: HashMap<K, V>, key: K, value: V)
	local hadKey = self:containsKey(key)

	self._valueByKey[key] = value

	if not hadKey then
		self._size += 1
	end
end

--[[
	Gets the value associated with a key.
	@param key The key to look up
	@return The value associated with the key, or nil if not found
]]
function HashMap.getOrNil<K, V>(self: HashMap<K, V>, key: K): V?
	return self._valueByKey[key]
end

--[[
	Removes a key-value pair from the map.
	@param key The key to remove
	@return True if the key was removed, false if it didn't exist
]]
function HashMap.remove<K, V>(self: HashMap<K, V>, key: K): boolean
	if self._valueByKey[key] ~= nil then
		self._valueByKey[key] = nil
		self._size -= 1
		return true
	end
	return false
end

--[[
	Checks if the map contains the specified key.
	@param key The key to check for
	@return True if the key exists in the map, false otherwise
]]
function HashMap.containsKey<K, V>(self: HashMap<K, V>, key: K): boolean
	return self._valueByKey[key] ~= nil
end

--[[
	Checks if the map contains the specified value.
	@param value The value to check for
	@return True if the value exists in the map, false otherwise
]]
function HashMap.containsValue<K, V>(self: HashMap<K, V>, value: V): boolean
	for _, v in pairs(self._valueByKey) do
		if v == value then
			return true
		end
	end
	return false
end

--[[
	Returns the number of key-value pairs in the map.
	@return The size of the map
]]
function HashMap.size<K, V>(self: HashMap<K, V>): number
	return self._size
end

--[[
	Checks if the map is empty.
	@return True if the map has no entries, false otherwise
]]
function HashMap.isEmpty<K, V>(self: HashMap<K, V>): boolean
	return self._size == 0
end

--[[
	Removes all key-value pairs from the map.
]]
function HashMap.clear<K, V>(self: HashMap<K, V>)
	self._valueByKey = {}
	self._size = 0
end

--[[
	Converts the map to an array of key-value pairs.
	Note: The order of entries is not guaranteed.
	@return An array of tables with {key, value} pairs
]]
function HashMap.toArray<K, V>(self: HashMap<K, V>): { { key: K, value: V } }
	local result = {}
	for key, value in pairs(self._valueByKey) do
		table.insert(result, { key = key, value = value })
	end
	return result
end

--[[
	Converts the map keys to an array.
	Note: The order of keys is not guaranteed.
	@return An array containing all keys from the map
]]
function HashMap.keys<K, V>(self: HashMap<K, V>): { K }
	local result = {}
	for key, _ in pairs(self._valueByKey) do
		table.insert(result, key)
	end
	return result
end

--[[
	Converts the map values to an array.
	Note: The order of values is not guaranteed.
	@return An array containing all values from the map
]]
function HashMap.values<K, V>(self: HashMap<K, V>): { V }
	local result = {}
	for _, value in pairs(self._valueByKey) do
		table.insert(result, value)
	end
	return result
end

--[[
	Iterates over all key-value pairs and calls the callback function for each.
	@param callback Function to call for each key-value pair
]]
function HashMap.forEach<K, V>(self: HashMap<K, V>, callback: (key: K, value: V) -> ())
	for key, value in pairs(self._valueByKey) do
		callback(key, value)
	end
end

--[[
	Transforms all keys in the map using the provided function.
	Creates a new map with transformed keys and the same values.
	@param transform Function that transforms each key to a new key
	@return A new map with transformed keys
]]
function HashMap.mapKeys<K, V, NK>(self: HashMap<K, V>, transform: (key: K) -> NK): HashMap<NK, V>
	local result = HashMap.new()

	self:forEach(function(key, value)
		result:put(transform(key), value)
	end)

	return result
end

--[[
	Merges another map into this map.
	All key-value pairs from the other map are added to this map.
	If a key exists in both maps, the value from the other map will overwrite the existing value.
	@param other The map to merge into this map
	@return Self for method chaining
]]
function HashMap.merge<K, V>(self: HashMap<K, V>, other: Map.Map<K, V>): Map.Map<K, V>
	for _, entry in ipairs(other:toArray()) do
		self:put(entry.key, entry.value)
	end
	return self
end

return HashMap
