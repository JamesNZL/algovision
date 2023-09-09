#5e5ce6/projects 

> [!NOTE]  
> This document records any engineering or design considerations surrounding component selection.

---

# Power

- Batteries
	- Want something low-profile, preferably mountable directly to the PCB
		- Coin cells/button batteries, but these are likely to be too low voltage/capacity to drive the LEDs/displays
		- Standard AA(A)/9V?
		- Li-Po batteries?
			- Could get bulky/difficult to charge/less user-friendly (as less common/readily available than alternatives)
	- USB Power Delivery could be the play
		- Will almost definitely be able to provide sufficient power (up to $20\,\text{V}$, $5\,\text{A}$)
		- Gives users the freedom to power from any USB PD supply (which I can reasonably expect them to have)
		- Can be used portably with a USB PD power bank
		- User friendly USB C interface
		- Reverse polarity etc probably isn't needed?
  
# Display

Potential options include an LED matrix, an LCD/OLED/other display, ...

## LED Matrix

### Pros
- Likely the simplest to implement in hardware/firmware (without external libraries)
- Can easily understand/communicate how it works
- Would have the prettiest RGB rainbow animations

### Cons
- Lots of individual components for a medium-large matrix...
- Cost?
- Power draw—unsure of how power-hungry the other options are, but I expect this to be more power-hungry than a off-the-shelf display module
- Far inferior pixel density/resolution

## LCD



## OLED


