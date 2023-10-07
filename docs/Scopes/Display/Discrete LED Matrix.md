#5e5ce6/projects 

# Discrete LED Matrix

![Discrete LED Matrix](https://cdn-blog.adafruit.com/uploads/2017/06/3484_iso_kit_ORIG.jpg)

### Part Numbers

As part of this family of devices, I have a few options as to the type of discrete LED:
- [[Discrete Non-Addressable RGBW LEDs]]
- [[Discrete Non-Addressable RGB LEDs]]
- [[Discrete Addressable LEDs]]

### Pros

- Likely the simplest to implement in hardware/firmware (without external libraries)
- Can easily understand/communicate how it works
- Would have the prettiest RGB rainbow animations
- Largest physical size
- Can implement from scratch myself, without needing to buy a module

### Cons
- Lots of individual LEDs for a medium-large matrix...
- Cost?
- Power draw—unsure of how power-hungry the other options are, but I expect this to be more power-hungry than a off-the-shelf display module
- Far inferior pixel density/resolution
- Heat dissipation—may require me to produce my *own* LED matrix module on an aluminium board—at which point I might want to just buy a commercial product?