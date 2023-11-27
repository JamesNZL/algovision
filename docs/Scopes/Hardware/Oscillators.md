#5e5ce6/projects 

# Oscillators

I will need to select two oscillators in this project:

1. [[TLC5951DAP]] [[LED Drivers|LED Driver]] greyscale clock, and
2. [[STM32U575CIT6Q]] `HSE` clock.

## Greyscale Clock

I calculated in [[Minimum Data Frequency]] that my greyscale reference clock should be at least $5.16\,\text{MHz}$ for the full 12-bit resolution [[Pixel Brightness]] control.

I also know that the [[TLC5951DAP]] can accept a maximum greyscale clock frequency of $33\,\text{MHz}$, and, owing to the [[Auto Display Repeat]] functionality, I will aim to select a clock frequency nearer to the upper-end of this, for greater granularity/smooth persistence-of-vision in my LED pixel brightnesses.

I will select an oscillator by primarily considering cost, stock, temperature stability, accuracy, power consumption, and jitter, and just making sure that the selected oscillator has a frequency $5.2\,\text{MHz} \ll f_\text{osc} < 33\,\text{MHz}$.

Performing a parametric search on DigiKey, to filter for only part numbers that are:
1. surface mount,
2. in stock,
3. active product status, and
4. have a datasheet,
I narrow down the product selection from over 440 thousand to 171 thousand.

I see that I have an option between crystal-type oscillators and MEMS-type oscillators,

### Microcontroller `HSE` Clock

For my microcontroller `HSE` clock, I will simply re-use the same $32\,\text{MHz}$ oscillator that I selected for my greyscale clock above, for purposes of BOM consolidation. This selected oscillator is equally fit-for-purpose for this application, for the reasons discussed in [[Microcontroller#`HSE` Clock]].
