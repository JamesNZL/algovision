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

## Discrete LED Matrix

![Discrete LED Matrix](https://cdn-blog.adafruit.com/uploads/2017/06/3484_iso_kit_ORIG.jpg)

### Part Numbers

> [!todo]

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

## LED Matrix Module/Panel

![LED Matrix Panel](https://chicagodist.com/cdn/shop/products/1484-00_2048x.jpg?v=1594330893)

| Part Number       | `Adafruit 420`                                                    | `Adafruit 607`                                                    |
| ----------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- |
| Image             | ![Adafruit 420](https://cdn-shop.adafruit.com/970x728/420-08.jpg) | ![Adafruit 607](https://cdn-shop.adafruit.com/970x728/607-07.jpg) |
| Supplier Link     | [Adafruit](https://www.adafruit.com/product/420)                  | [Adafruit](https://www.adafruit.com/product/607)                  |
| LED part          | `SMD3528`                                                         |                                                                   |
| Resolution        | 512 LEDs, $16\times 32$ matrix                                    | 1024 LEDs, $32\times 32$ matrix                                   |
| Dimensions        | $192\,\text{mm} \times 96\,\text{mm} \times 12\,\text{mm}$        | $128\,\text{mm} \times 128\,\text{mm} \times 17\,\text{mm}$       |
| Operating Voltage | Regulated $5\,\text{V}$                                           | Regulated $5\,\text{V}$                                           |
| Max Current Draw  | $2.5\,\text{A}$                                                   | $4\,\text{A}$                                                     |
| Driving Method    | $1/8$ scan, $50\sim60\,\text{Hz}$                                 | $1/16$ scan                                                       |
| Data Lines        | 13 GPIO pins                                                      | 13 GPIO pins                                                      |
| Cost              | USD$24.95                                                         | USD$29.95                                                         |
| Remarks           |                                                                   |                                                                   |

### Pros

- Primarily the same as that for a custom-built LED matrix with discrete LEDs
- Probably cheaper than building it myself

### Cons
- Don't get to do the design/layout myself

## Dot Matrix Module

![Dot Matrix Module](https://m.media-amazon.com/images/I/71qBLiOKTHL._AC_UF1000,1000_QL80_.jpg)

> [!todo]

### Pros

- Can daisy chain together
- Is a developed module—less need for heat considerations etc
- No need to implement own driver circuitry

### Cons

- Effectively the same as buying a standard LED matrix
- Larger physical footprint
- Likely more expensive than buying the LEDs myself

## LCD Module

![LCD Module](https://docs.arduino.cc/static/7a7f1f877f04d48236ab166814aab58f/0a47e/lcd_photo.png)

> [!todo]
### Pros

- Cheap

### Cons

- Can only easily display letters
- Must fit to each segment—would not work for the maze/logo
- Single colour

## OLED Module

![OLED Module](https://m.media-amazon.com/images/I/71TyuPDzXVL.jpg)

> [!todo]

### Pros

- Less power draw
- Lighter, thinner
- Higher resolution/pixel density

### Cons

- Small—hard to read
- Can get expensive for larger screens/higher resolutions
- Doesn't look very good, in my opinion

## TFT Display

![TFT Display Module](https://nl.mouser.com/images/marketingid/2020/img/188257339.png?v=070223.0420)

> [!todo]
> https://www.google.com/search?sca_esv=564062611&sxsrf=AB5stBhrVAe-ZPkdDOJhhh3ip1lqiHs85Q:1694307902282&q=tft+display+modules&tbm=isch&source=lnms&sa=X&ved=2ahUKEwiE_J7l7J6BAxWJTWwGHQxNDBUQ0pQJegQICRAB&biw=1548&bih=1145&dpr=1.1#imgrc=D6KcvaiVJFwe1M

### Pros

- Highest resolution?
- Easier to get in larger sizes than OLED modules
- More cost effective

### Cons

- Scope creep?
- Small physical size
- Not as 'interesting' as an LED matrix?
- Requires a backlight—higher power draw