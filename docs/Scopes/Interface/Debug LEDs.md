#5e5ce6/projects 

# Debug LEDs

- Want some collection of LEDs to aid in debugging/act as status indicators

- At a minimum, I will want:
	1. [[Scopes/Power/Power Indicator|Power LED]]
	2. [[Heartbeat LED]]
	3. [[Scopes/Interface/Fault code LED]] (maybe with colour?)
	4. [[Scopes/Interface/TX and RX LEDs]]

- How do I plan on driving these?
	- Ideally I want these to be as simple as possible (ie directly to a GPIO, rather than through even an IO expander like a shift register)
	- This is to make debugging as easy as possible/as informative as possible—the LED will come on as soon as I toggle the GPIO
	- This is the advantage of dedicated debug/status LEDs, rather than using some subset of the [[display]]
	- Perhaps I can use the left-over bits in the [[Shift Registers|shift registers]]/[[LED drivers]]?
	- Maybe have some direct-debug LEDs/test points, and some more 'complex' full-colour LEDs routed through the spare bits in the [[Layout Design|display layout]]?

- Do I want them to be single-colour, or RGB?
	- If they are RGB, I can reuse the same [[Discrete Non-Addressable RGB LEDs|BOM component]] as for my matrix—part consolidation & order quantity advantages
	- But, if they are RGB, then they will require more data lines (if I want a simple drive method)
	- I will also need individual current-limiting resistors, and I will only be able to produce the few colour permutations of pure R/G/B
	- If I use a single-colour LED, I only require a single GPIO pin
	- But I will need to have a whole extra part number