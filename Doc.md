# Collections

A collection of classic data structures for Ruby, providing Stack and Queue implementations.

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

# See Also

- `Collections::LinkedList` – doubly linked list implementation