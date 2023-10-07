#5e5ce6/projects 

# Display

## Features

- Ideally want RGB support—want to have RGB rainbows etc
	- This only really works with an LED matrix though, an RGB rainbow on an LCD/OLED display is boring
- Should have sufficient resolution to display the logo
	- Minimum size of $20\times15$ LEDs to effectively show pathfinding
 
## Component Selection

I will need to consider, among other things:
	1. Operating voltages;
	2. Typical current draw;
	3. Communication/driving protocol (data lines required, [[Scopes/Micro/Microcontroller]] peripherals needed); and
	4. Cost.

First, I will begin by doing a [[Parts Selection]] by comparing different options, and selecting the device(s) that I think will be the most suitable.

Having evaluated the different options I can elect to go with, I have decided to proceed with a [[Discrete LED Matrix]], and specifically the preferred devices identified in [[Discrete Non-Addressable RGB LEDs]].

Having done my parts selection, I will move on to a [[Layout Design]] using my selected devices to design the matrix layout and topology itself.

After choosing my [[Shift Registers]] and [[LED Drivers]] to drive my matrix, I will work through determining the [[Design Parameters]] that I will need to know in order to use the selected LED driver.

The final task will be to design a simply [[Components/Display/Current Amplifier]] stage for the common-anode input of each LED, as the shift register can only source $\approx 7\,\text{mA}$ per output.
