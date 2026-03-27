# Collections

A collection of classic data structures for Ruby.

---

# Collections::Stack

A Stack (LIFO) data structure implementation in Ruby.

## Overview

The `Collections::Stack` class provides a classic stack data structure with Last-In-First-Out (LIFO) behavior. Elements are added and removed from the top of the stack.

## Class Methods

### `new`

Creates a new empty stack instance.

**Returns:** a new `Stack` object

## Instance Methods

### `push(peek)`

Adds an element to the top of the stack.

**Parameters:**
- `peek` – the element to add to the stack

**Returns:** the added element

---

### `pop`

Removes and returns the element from the top of the stack (TOS).

**Returns:** the element from the top of the stack, or `nil` if the stack is empty

**Note:** Does not raise an exception when called on an empty stack.

---

### `peek`

Returns the current top element without removing it.

**Returns:** the top element, or `nil` if the stack is empty

---

### `size`

Returns the number of elements in the stack.

**Returns:** `Integer` – the current stack size

---

### `is_empty`

Checks whether the stack has no elements.

**Returns:** `true` if the stack is empty, `false` otherwise

---

### `clear`

Removes all elements from the stack, resetting it to an empty state.

**Returns:** `nil`

---

### `contains(value)`

Checks if the stack contains a specific element.

**Parameters:**
- `value` – the element to search for

**Returns:** `true` if the element exists, `false` otherwise

---

### `index(element)`

Returns the distance from the top of the stack to the specified element.

**Parameters:**
- `element` – the element to locate

**Returns:** `Integer` – the position from the top (0-based), or `-1` if not found

---

### `insert(element, index)`

Inserts an element at the specified position in the stack.

**Parameters:**
- `element` – the element to insert
- `index` – the position from the top (0 = top of stack)

**Raises:** `IndexError` if index is out of bounds

---

### `print`

Displays the stack contents showing the top element and all elements below.

---

### `to_a`

Converts the stack to an array, preserving order from bottom to top.

**Returns:** `Array` – a new array containing all stack elements

---

### `to_q`

Converts the stack to a `Collections::Queue` object.

**Returns:** `Queue` – a new queue instance containing the same elements

**Note:** Requires the `Queue` class to be defined and accessible.

---

### `set_peek(new_peek)`

Sets a new top element value for the stack.

**Parameters:**
- `new_peek` – the new top element value

**Note:** Modifies the top element without changing the stack size.

---

### `set_stack(arr)`

Replaces the entire stack contents with elements from an existing array.

**Parameters:**
- `arr` – the array containing new stack elements

**Note:** The last element of the array becomes the top of the stack.

## Attributes

### `peek`

Returns the current top element without modifying the stack.

**Returns:** the top element, or `nil` if the stack is empty

## Notes

- The stack implementation uses an internal array for storage
- `pop` returns `nil` when called on an empty stack (does not raise an exception)
- Element positions in `insert` and `index` methods are measured from the top (0 = top of stack)
- The stack can store any Ruby object
- For large stacks, consider performance implications of operations like `contains` and `index` which require linear search

---

# Collections::Queue

A Queue (FIFO) data structure implementation in Ruby.

## Overview

The `Collections::Queue` class provides a classic queue data structure with First-In-First-Out (FIFO) behavior. Elements are added to the end of the queue and removed from the front.

## Class Methods

### `new`

Creates a new empty queue instance.

**Returns:** a new `Queue` object

## Instance Methods

### `push(element)`

Adds an element to the end of the queue.

**Parameters:**
- `element` – the element to add to the queue

**Returns:** the queue with the new element added

---

### `pop`

Removes and returns the element from the front of the queue (TOP).

**Returns:** the element from the front of the queue

**Note:** Assumes the queue is not empty when called.

---

### `top`

Returns the current front element without removing it.

**Returns:** the front element, or `nil` if the queue is empty

---

### `size`

Returns the number of elements in the queue.

**Returns:** `Integer` – the current queue size

---

### `is_empty`

Checks whether the queue has no elements.

**Returns:** `true` if the queue is empty, `false` otherwise

---

### `clear`

Removes all elements from the queue, resetting it to an empty state.

**Returns:** `nil`

---

### `contains(element)`

Checks if the queue contains a specific element.

**Parameters:**
- `element` – the element to search for

**Returns:** `true` if the element exists, `false` otherwise

---

### `index(element)`

Returns the position of the specified element from the front of the queue.

**Parameters:**
- `element` – the element to locate

**Returns:** `Integer` – the position from the front (0-based), or `-1` if not found

---

### `insert(element, index)`

Inserts an element at the specified position in the queue.

**Parameters:**
- `element` – the element to insert
- `index` – the position from the front (0 = front of queue)

**Raises:** `IndexError` if index is out of bounds

**Note:** When inserting at index 0, the inserted element becomes the new front (TOP) of the queue.

---

### `print`

Displays the queue contents showing the front element and all elements behind it.

---

### `to_a`

Converts the queue to an array, preserving order from front to back.

**Returns:** `Array` – a new array containing all queue elements

---

### `to_s`

Converts the queue to a `Collections::Stack` object.

**Returns:** `Stack` – a new stack instance containing the same elements

**Note:** Requires the `Stack` class to be defined and accessible.

---

### `set_top(new_top)`

Sets a new front element value for the queue.

**Parameters:**
- `new_top` – the new front element value

**Note:** Modifies the front element without changing the queue size.

---

### `set_queue(arr)`

Replaces the entire queue contents with elements from an existing array.

**Parameters:**
- `arr` – the array containing new queue elements

**Note:** The first element of the array becomes the front (TOP) of the queue.

## Attributes

### `top`

Returns the current front element without modifying the queue.

**Returns:** the front element, or `nil` if the queue is empty

## Notes

- The queue implementation uses an internal array for storage
- `pop` assumes the queue is not empty; calling on an empty queue may return unexpected results
- Element positions in `insert` and `index` methods are measured from the front (0 = front of queue)
- The queue can store any Ruby object
- For large queues, consider performance implications of operations like `contains` and `index` which require linear search

---

# Collections::LinkedList

A singly linked list data structure implementation in Ruby.

## Overview

The `Collections::LinkedList` class provides a classic linked list data structure where elements are connected via nodes. Each node contains a value and a reference to the next node.

## Class Methods

### `new(data = nil)`

Creates a new linked list instance, optionally with an initial element.

**Parameters:**
- `data` (optional) – the initial data element for the first node

**Returns:** a new `LinkedList` object

## Instance Methods

### `append(data)`

Adds an element to the end of the list.

**Parameters:**
- `data` – the data to append

**Returns:** void

---

### `prepend(data)`

Adds an element to the beginning of the list.

**Parameters:**
- `data` – the data to prepend

**Returns:** void

---

### `insert_at(index, data)`

Inserts an element at the specified position in the list.

**Parameters:**
- `index` – the position where to insert (0-based)
- `data` – the data to insert

**Raises:** `IndexError` if index is negative or out of bounds

**Returns:** void

---

### `delete_at(index)`

Removes and returns the element at the specified position.

**Parameters:**
- `index` – the position of the element to delete (0-based)

**Returns:** the value of the deleted element

**Raises:** `IndexError` if index is out of bounds or list is empty

---

### `at(index)`

Returns the element at the specified position without removing it.

**Parameters:**
- `index` – the position of the element (0-based)

**Returns:** the value at the specified position

**Raises:** `IndexError` if index is out of bounds or list is empty

---

### `find(data)`

Searches for the first node containing the specified value.

**Parameters:**
- `data` – the value to search for

**Returns:** the Node object if found, or `nil` if not found

---

### `to_a`

Converts the linked list to an array.

**Returns:** `Array` – a new array containing all elements in order

---

### `size`

Returns the number of elements in the list.

**Returns:** `Integer` – the current list size

---

### `empty?`

Checks whether the list has no elements.

**Returns:** `true` if the list is empty, `false` otherwise

---

## Notes

- The list uses a singly linked structure with Node objects
- Operations like `append` and `find` require linear traversal
- The first element is accessed via the head reference
- All elements are stored in insertion order

---

# Collections::Tree

A binary search tree data structure implementation in Ruby.

## Overview

The `Collections::Tree` class provides a binary search tree (BST) implementation. Elements are organized in a tree structure where each node has at most two children (left and right), maintaining the BST property: left child values are less than parent values, and right child values are greater.

## Class Methods

### `new`

Creates a new empty tree instance.

**Returns:** a new `Tree` object

---

### `with_root(value)`

Creates a new tree with a root node containing the specified value.

**Parameters:**
- `value` – the value for the root node

**Returns:** a new `Tree` object with the root initialized

---

### `build(&block)`

Creates a new tree and evaluates a block in the tree's context for DSL-style construction.

**Parameters:**
- `block` – a block to execute in the tree's context for adding elements

**Returns:** a new `Tree` object

---

### `from_values(*values)`

Creates a new tree and populates it with the specified values.

**Parameters:**
- `*values` – variable number of values to add to the tree

**Returns:** a new `Tree` object containing all provided values

---

## Instance Methods

### `add(value)`

Inserts a value into the tree while maintaining BST properties.

**Parameters:**
- `value` – the value to add

**Returns:** void

**Note:** Duplicate values are not inserted (maintains BST uniqueness)

---

### `delete(value)`

Removes a value from the tree while maintaining BST properties.

**Parameters:**
- `value` – the value to delete

**Returns:** void

**Note:** Handles nodes with 0, 1, or 2 children correctly

---

### `display`

Prints the tree structure to the console in a visual format.

**Returns:** void

**Note:** Shows the tree hierarchy with branches and nil nodes

---

## Attributes

### `root`

Direct access to the root node of the tree.

**Type:** `BinaryNode` or `nil`

---

## Notes

- The tree implementation uses `BinaryNode` objects for tree nodes
- BST properties are maintained: left < parent < right
- The `display` method shows the tree structure visually
- All operations use recursive algorithms
- `BinarySearchTree` is an alias for `Tree` (see `Collections::BinarySearchTree`)

---

# See Also

- `Collections::LinkedList` – singly linked list implementation
- `Collections::Tree` / `Collections::BinarySearchTree` – binary search tree implementation
- `Collections::Stack` – LIFO data structure
- `Collections::Queue` – FIFO data structure
