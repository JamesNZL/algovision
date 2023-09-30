#5e5ce6/projects 

> [!NOTE]  
> This document contains any engineering or design considerations surrounding specific features.

> [!IMPORTANT]  
> See also [[Goals]] and [[Specifications]]

---

# Power

- Batteries
	- How am I going to get the required voltage to drive my display? A boost converter can only do so much—especially if I require high current draw
  
- Reverse polarity protection
- Voltage regulator(s) for supply rails

- Boost converter for LEDs?

- Battery voltage sensing
- Power LED
- Auto-shutdown circuit
	- MOSFET power switch circuit
	- Can this be done with a latch instead?
		- Latch on button press, use micro to write reset—this might actually be more reliable?
		- How would the latch be powered when the circuit is first turned on?

# User Input

- User pushbuttons
	- How is the user expected to select each mode/algorithm?
		- Have 'mode' LEDs that indicate the current mode?
		- Or display on the main matrix instead of the logo?

# Display

- LED matrix/display
	- Ideally want RGB support—want to have RGB rainbows etc
		- This only really works with an LED matrix though, an RGB rainbow on an LCD/OLED display is boring
	- Should have sufficient resolution to display the logo
		- Minimum size of $20\times15$ LEDs to effectively show pathfinding
- Shift registers if required
 
# Microcontroller/Programming

- Microcontroller
- USB connector
- USB to serial interface chip
- Debug LEDs

# Algorithms

## Pathfinding

- Maze generation should be pseudorandom
	- Floating ADC pin?
	- Linear feedback shift register?

1. BFS
2. DFS
3. Dijkstra's
4. A*
5. Greedy best-first search

## Sorting

1. Selection sort
2. Insertion sort
3. Bubble sort
4. Quick sort
5. Merge sort
6. Heap sort

## Search

1. Sequential
2. Binary
3. Interpolation
