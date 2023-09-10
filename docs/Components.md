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

- Need to consider:
	1. Operating voltages;
	2. Typical current draw;
	3. Communication/driving protocol (data lines required, uC peripherals needed); and
	4. Cost.

## LED Matrix

![LED Matrix](https://chicagodist.com/cdn/shop/products/1484-00_2048x.jpg?v=1594330893)

### Pros
- Likely the simplest to implement in hardware/firmware (without external libraries)
- Can easily understand/communicate how it works
- Would have the prettiest RGB rainbow animations
- Largest physical size
- Can implement from scratch myself, without needing to buy a module

### Cons
- Lots of individual components for a medium-large matrix...
- Cost?
- Power draw—unsure of how power-hungry the other options are, but I expect this to be more power-hungry than a off-the-shelf display module
- Far inferior pixel density/resolution
- Heat dissipation—may require me to produce my *own* LED matrix module on an aluminium board—at which point I might want to just buy a commercial product?

## Dot Matrix Module

![Dot Matrix Module](https://m.media-amazon.com/images/I/71qBLiOKTHL._AC_UF1000,1000_QL80_.jpg)

### Pros

- Can daisy chain together
- Is a developed module—less need for heat considerations etc
- No need to implement own driver circuitry

### Cons

- Effectively the same as buying a standard LED matrix
- Larger physical footprint
- Likely more expensive than buying the LEDs myself

## LCD Module

![LCD Module](https://www.jaycar.co.nz/medias/sys_master/images/images/9944545165342/QP5520-dot-matrix-liquid-crystal-display-modules-alphanumeric-large-displayImageMain-515.jpg)

### Pros

- Cheap

### Cons

- Can only easily display letters
- Must fit to each segment—would not work for the maze/logo
- Single colour

## OLED Module

![OLED Module](https://m.media-amazon.com/images/I/71TyuPDzXVL.jpg)

### Pros

- Less power draw
- Lighter, thinner
- Higher resolution/pixel density

### Cons

- Small—hard to read
- Can get expensive for larger screens/higher resolutions
- Doesn't look very good, in my opinion

## TFT Display

![TFT Display Module](https://www.mouser.in/images/displaytechltd/lrg/DT022CTFT_SPL.jpg)

### Pros

- Highest resolution?
- Easier to get in larger sizes than OLED modules
- More cost effective

### Cons

- Scope creep?
- Small physical size
- Not as 'interesting' as an LED matrix?
- Requires a backlight—higher power draw