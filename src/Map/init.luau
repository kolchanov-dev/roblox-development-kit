--!strict
export type Map<K, V> = {
	clear: (self: Map<K, V>) -> (),
	containsKey: (self: Map<K, V>, key: K) -> boolean,
	containsValue: (self: Map<K, V>, value: V) -> boolean,
	getOrNil: (self: Map<K, V>, key: K) -> V?,
	put: (self: Map<K, V>, key: K, value: V) -> (),
	remove: (self: Map<K, V>, key: K) -> boolean,
	size: (self: Map<K, V>) -> number,
	isEmpty: (self: Map<K, V>) -> boolean,
	keys: (self: Map<K, V>) -> { K },
	values: (self: Map<K, V>) -> { V },

	toArray: (self: Map<K, V>) -> { { key: K, value: V } },
	forEach: (self: Map<K, V>, callback: (key: K, value: V) -> ()) -> (),
	merge: (self: Map<K, V>, other: Map<K, V>) -> Map<K, V>,
}

return nil
