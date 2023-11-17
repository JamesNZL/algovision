#5e5ce6/projects 

# Frame Buffers

I intend to have two rotating frame buffers for my [[Display]]—one being displayed, and one being written-to/modified.

For my $35\times 21\times 3$ LED channels as per my final [[Layout Design]], this gives me $2205$ individual sub-pixels that I must represent within my frame buffers.

Assuming that I want the full 12-bits of [[Pixel Brightness]] resolution for each channel as supported by my [[TLC5951DAP]] [[LED Drivers]], this requires:

- `uint16_t` for each sub-pixel
- 2205 individual sub-pixels in each frame
- $\therefore 2205\times 2\,\text{B} = 4410\,\text{B}$
- Two frame buffers
- $\therefore 4410\,\text{B}\times 2 = 8820\,\text{B} = 8.61328125\,\text{kiB}$

Therefore, to fit my two frame buffers in RAM, I require *at least* $8.7\,\text{kiB}$ of RAM.
