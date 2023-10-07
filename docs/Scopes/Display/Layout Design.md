#5e5ce6/projects 

# Layout Design

> [!todo] Requirements
> - [x] Minimum resolution of $20\times 15$

- Assuming I select the $1.6\,\text{mm}\times 1.5\,\text{mm}$ devices and a pitch of $3\,\text{mm}$, this produces a $24\times 16=384$ matrix that looks like the following:
	![1615 3mm logo](images/1615-3mm-logo.png)
	![1615 3mm odd maze](images/1615-3mm-odd.png)
	![1615 3mm even maze](images/1615-3mm-even.png)

- I learn that, although I can double up for an even maze, I would need many more pixels (and similarly matrix size) to have enough paths
- I do notice however that the odd maze is quite hard to read, perhaps a smaller pitch will make this better
- I will plan on moving forward with a single-pixel line width, and design for an odd-dimensioned matrix such that gaps work out as desired

- With a pitch of $2.5\,\text{mm}$, I have a $27\times 15=405$ matrix that produces
	![1615 2.5mm logo](images/1615-2.5mm-logo.png)
	![1615 2.5mm odd maze](images/1615-2.5mm-odd.png)
	![1615 2.5mm even maze](images/1615-2.5mm-even.png)
 
- This definitely looks better, but I think the maze could/should still be more readable than what it is
- I chose to keep the row count to $15$, as this allows me to to use a single 48-channel LED driver to drive a whole $\frac{48}{3}=16$ LED column at once, where I can then multiplex through
- As these are not addressable LEDs (ie incorporate a controller within the LED device), they do not require local decoupling—so I do not need to account for this in designing the pitch

- Reducing the pitch to $1.6\,\text{mm}$, I have a $35\times21=735$ matrix
	![1615 1.6mm logo](images/1615-1.6mm-logo.png)
	![1615 1.6mm odd maze](images/1615-1.6mm-odd.png)
	![1615 1.6mm even maze](images/1615-1.6mm-even.png)
 
 - I am happy with this, I think this pitch is a good balance between being realistic (assembly, pixel count—price), and being readable with a decent resolution
 - The row/column counts of 21 and 35 have also been deliberately chosen as I can use three 36-channel (ie 12 RGB LED) drivers to drive the full row, or two 36-channel drivers to drive a full column

 - In terms of the driving mechanism, my first idea would be to use the below topology, with three 36-channel drivers to drive all the columns at once, and scan through the 21 rows with a set of three 8-bit shift registers chained together
	 ![12-11-12 by 21](images/12-11-12-by-21.png)

- My next step will be to part out the [[LED Drivers]] and [[Shift Registers]] that I want to use
- A potential improvement (scan-wise) would be to add three more drivers such that I can split the rows in half, and display two whole rows at once (ie scanning through two lines at once), which would improve the refresh/scan rate of the display, at a cost of component count/cost/driver frequency

- As I am just wanting to scan through the rows one after another and do not need to load some arbitrary data into the shift register before enabling the output all at once, I will not need an output storage register
	- I can simply write the next bit into the shift register once I am ready to scan to the next row, as I only expect the shift register to contain a single `1` at any given instant
 - I also do not need a tri-state output, as the shift register output will be the only thing connected to the common anode pins (probably through a buffer transistor)

- From the LED driver perspective—I may want to use more drivers simply such that each driver is controlling less than 32 channels, so that I can represent it using a `uint32_t` rather than needing to use a whole `uint64_t` and wasting 28 bits (for a total of 87 wasted bits)
```c
#define DISPLAY_TOTAL_ROWS 35  
#define DISPLAY_TOTAL_COLUMNS 21  
#define DISPLAY_PIXEL_TOTAL_CHANNELS 3  
  
typedef uint128_t row_t;  
typedef uint32_t column_t;  
  
#define DISPLAY_DRIVER_TOTAL_ONE 12 * DISPLAY_PIXEL_TOTAL_CHANNELS  
#define DISPLAY_DRIVER_TOTAL_TWO 11 * DISPLAY_PIXEL_TOTAL_CHANNELS  
#define DISPLAY_DRIVER_TOTAL_THREE 12 * DISPLAY_PIXEL_TOTAL_CHANNELS  
  
typedef uint64_t driver_t; // !
  
row_t currentRow = 0b010/* ... */001;  
  
driver_t driverOne = (currentRow <<= DISPLAY_DRIVER_TOTAL_ONE);  
driver_t driverTwo = (currentRow <<= DISPLAY_DRIVER_TOTAL_TWO);  
driver_t driverThree = (currentRow <<= DISPLAY_DRIVER_TOTAL_THREE);
```
- Another option I have is to reduce the column count from 35 to 31, producing a more square matrix
	![1615 1.6mm reduced logo](images/1615-1.6mm-reduced-logo.png)
	- I'm not sure how I feel about this, I think I will pursue the alternative of simply using more drivers for the time being
	- This may work out to be the better decision regardless, as I would expect 24-channel drivers to be easier to source than 48-channel drivers
	- Furthermore, a quick cursory search on DigiKey suggests that 24-channel drivers can be found that sink significantly more ($60\,\text{mA}$ vs $30\,\text{mA}$) current than 48-channel drivers
	- Also, although I can find 36-channel drivers, I can only find them in quad flat packages (and with less current capability), whilst I'd prefer a SOP package for routing/aesthetics

Having selected my [[Shift Registers]] and [[LED Drivers]], I will now work through the following design tasks to determine my matrix [[Design Parameters]]:
> [!todo]
> - [x] Work out the minimum data frequency if I want a refresh rate of $\geq 60\,\text{Hz}$
> - [ ] Work out the worst-case current if all LEDs in a row are at full brightness white—this cannot be sourced by the shift register, so I must design a current amplifier stage
> - [ ] Refer to the [`TLC5955`](https://www.digikey.co.nz/en/products/detail/texas-instruments/TLC5955DCAR/5181329) and [`TLC5947`](https://www.digikey.co.nz/en/products/detail/texas-instruments/TLC5947DAPR/2047743) datasheets for guidance on design procedure/power supply recommendations etc.

