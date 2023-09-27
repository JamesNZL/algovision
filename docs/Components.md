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

#### RGBW, Non-Addressable

| Part Number              | `CSPM1411RGBW-IC-6`                                                                                                | `IN-P55QSTGRGBW`                                                                                         | `QLSP08RGBW`                                                                                         | `IN-P55QDTRGBW`                                                                                        | `QBLP679-RGBCW`                                                                                            |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------- |
| Image                    | ![CSPM1411RGBW-IC-6](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/5059/MFG_CSPM1411RGBW-IC-6.jpg) | ![IN-P55QSTGRGBW](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/3701/IN-P55QSTGRGBW.JPG) | ![QLSP08RGBW](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/3954/MFG_QLSP08RGBW.jpg) | ![IN-P55QDTRGBW](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/3794/IN-P55QDTRGBW.JPG) | ![QBLP679-RGBCW](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/4499/MFG_QBLP679-RGBXW.jpg) |
| Supplier Link            | [DigiKey](https://www.digikey.com/en/products/detail/chromeled/CSPM1411RGBW-IC-6/17289300)                         | [DigiKey](https://www.digikey.com/en/products/detail/inolux/IN-P55QSTGRGBW/14555727)                     | [DigiKey](https://www.digikey.com/en/products/detail/quelighting-corp/QLSP08RGBW/15848755)           | [DigiKey](https://www.digikey.com/en/products/detail/inolux/IN-P55QDTRGBW/14555746)                    | [DigiKey](https://www.digikey.com/en/products/detail/qt-brightek-qtb/QBLP679-RGBCW/13278847)               |
| Colour                   | RGBW                                                                                                               | RGBW                                                                                                     | RGBW                                                                                                 | RGBW                                                                                                   | RGBW                                                                                                       |
| Lens                     | Clear                                                                                                              | Clear                                                                                                    | Clear                                                                                                | Clear                                                                                                  | Clear RGB, Diffused W                                                                                      |
| Package/Dimensions       | $3.7\,\text{mm} \times 3.5\,\text{mm}$                                                                             | $5.4\,\text{mm} \times 5\,\text{mm} \times 1.1\,\text{mm}$                                               | $5\,\text{mm} \times 5\,\text{mm} \times 1.6\,\text{mm}$                                             | $5.5\,\text{mm} \times 5\,\text{mm} \times $1.65\,\text{mm}$                                           | $5\,\text{mm} \times 5\,\text{mm} \times 1.65\,\text{mm}$                                                  |
| Absolute Maximum Voltage | $3.7 \sim 5.5\,\text{V}$                                                                                           | $3.6\,\text{V}$                                                                                          | $3.4\,\text{V}$                                                                                      | $3.6\,\text{V}$                                                                                        | $3.7\,\text{V}$                                                                                            |
| Average Forward Current  | $45\,\text{mA}$                                                                                                    | $600\,\text{mA}$                                                                                         | $120\,\text{mA}$                                                                                     | $90\,\text{mA}$                                                                                        | $80\,\text{mA}$                                                                                            |
| Frequency                | $800\,\text{kHz}$                                                                                                  | -                                                                                                        | -                                                                                                    | -                                                                                                      | -                                                                                                          |
| Driving Method           | Serial, detailed in datasheet                                                                                      | Direct connection to A/K                                                                                 | Direct connection to A/K                                                                             | Direct connection to A/K                                                                               | Direct connection to A/K                                                                                   |
| Data Lines               | 1 GPIO pin                                                                                                         | $\geq 3$ GPIO pins                                                                                       | $\geq 3$ GPIO pins                                                                                   | $\geq 3$ GPIO pins                                                                                     | $\geq 3$ GPIO pins                                                                                         |
| Cost (for 256)           | USD$74.24                                                                                                          | USD$138.73                                                                                               | USD$55.60                                                                                            | USD$77.82                                                                                              | USD$81.05                                                                                                  |
| Remarks                  |                                                                                                                    |                                                                                                          |                                                                                                      |                                                                                                        |                                                                                                            |

> [!success] Preferred Device
> `IN-P55QDTRGBW` is looking the most desirable, `IN-P55QSTGRGBW` is too high power

#### RGB, Non-Addressable

| Part Number              | `CLMVC-FKA-CL1D1L71BB7C3C3`                                                                                                       | `IN-S66TBTRGB`                                                                                      | `IN-P32TATRGB`                                                                                      | `150141M173100`                                                                                       | `IN-S128TATRGB`                                                                                       | `ASMB-LTB2-0A333`                                                                                                  | `ASMB-KTF0-0A306`                                                                                             | `LTST-C19HE1WT`                                                                                               | `ASMB-TTF0-0A20B`                                                                                         |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| Image                    | ![CLMVC-FKA-CL1D1L71BB7C3C3](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/902/MFG_CLMVC-FKA-CL1D1L71BB7C3C3.jpg) | ![IN-S66TBTRGB](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/925/IN-S66TBTRGB.JPG) | ![IN-P32TATRGB](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/951/IN-P32TATRGB.JPG) | ![150141M173100](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/536/150141M173100.jpg) | ![IN-S128TATRGB](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/731/IN-S128TATRGB.JPG) | ![ASMB-LTB2-0A333](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/202/2121-TRICOLOR-PLCC-4-LED.JPG) | ![ASMB-KTF0-0A306](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/785/MFG_ASMB-KTF0-0A306.jpg) | ![LTST-C19HE1WT](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/2465/160-LED%200605%20SMD.jpg) | ![ASMB-TTF0-0A20B](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/333/ASMB-TTF0-0A20B.JPG) |
| Supplier Link            | [DigiKey](https://www.digikey.com/en/products/detail/creeled-inc/CLMVC-FKA-CL1D1L71BB7C3C3/4794065)                               | [DigiKey]([DigiKey](https://www.digikey.com/en/products/detail/inolux/IN-S66TBTRGB/7604944))        | [DigiKey]([DigiKey](https://www.digikey.com/en/products/detail/inolux/IN-P32TATRGB/7604884))        | [DigiKey](https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/150141M173100/4489960)     | [DigiKey](https://www.digikey.com/en/products/detail/inolux/IN-S128TATRGB/7604911)                    | [DigiKey](https://www.digikey.com/en/products/detail/broadcom-limited/ASMB-LTB2-0A333/9740374)                     | [DigiKey](https://www.digikey.com/en/products/detail/broadcom-limited/ASMB-KTF0-0A306/7915692)                | [DigiKey](https://www.digikey.com/en/products/detail/liteon/LTST-C19HE1WT/3198710)                            | [DigiKey](https://www.digikey.com/en/products/detail/broadcom-limited/ASMB-TTF0-0A20B/7915694)            |
| Colour                   | RGB                                                                                                                               | RGB                                                                                                 | RGB                                                                                                 | RGB                                                                                                   | RGB                                                                                                   | RGB                                                                                                                | RGB                                                                                                           | RGB                                                                                                           | RGB                                                                                                       |
| Lens                     | Clear                                                                                                                             | Clear                                                                                               | Clear                                                                                               | Clear                                                                                                 | Clear                                                                                                 | Diffused                                                                                                           | Diffused                                                                                                      | Diffused                                                                                                      | Diffused                                                                                                  |
| Package/Dimensions       | $2\,\text{mm} \times 2\,\text{mm} \times 1\,\text{mm}$                                                                            | $1.6\,\text{mm} \times 1.5\,\text{mm} \times 0.55\,\text{mm}$                                       | $3.5\,\text{mm} \times 2.8\,\text{mm} \times 1.9\,\text{mm}$                                        | $3.5\,\text{mm} \times 2.8\,\text{mm} \times 1.9\,\text{mm}$                                          | $3.2\,\text{mm} \times 2.7\,\text{mm} \times 1.1\,\text{mm}$                                          | $2.1\,\text{mm} \times 2.1\,\text{mm} \times 1\,\text{mm}$                                                         | $2.2\,\text{mm} \times 2\,\text{mm} \times 1.9\,\text{mm}$                                                    | $1.6\,\text{mm} \times 1.6\,\text{mm} \times 0.35\,\text{mm}$                                                 | $3.7\,\text{mm} \times 3.5\,\text{mm} \times 2.8\,\text{mm}$                                              |
| Absolute Maximum Voltage | $3.7\,\text{V}$                                                                                                                   | $3.6\,\text{V}$                                                                                     | $3.6\,\text{V}$                                                                                     | $3.6\,\text{V}$                                                                                       | $3.6\,\text{V}$                                                                                       | $3.4\,\text{V}$                                                                                                    | $3.3\,\text{V}$                                                                                               | $3.9\,\text{V}$                                                                                               | $3.6\,\text{V}$                                                                                           |
| Average Forward Current  | $51\,\text{mA}$                                                                                                                   | $75\,\text{mA}$                                                                                     | $90\,\text{mA}$                                                                                     | $90\,\text{mA}$                                                                                       | $75\,\text{mA}$                                                                                       | $55\,\text{mA}$                                                                                                    | $60\,\text{mA}$                                                                                               | $70\,\text{mA}$                                                                                               | $110\,\text{mA}$                                                                                          |
| Frequency                | -                                                                                                                                 | -                                                                                                   | -                                                                                                   | -                                                                                                     | -                                                                                                     | -                                                                                                                  | -                                                                                                             | -                                                                                                             | -                                                                                                         |
| Configuration            | Common anode                                                                                                                      | Common anode                                                                                        | Common anode                                                                                        | Common anode                                                                                          | Common anode                                                                                          | Common anode                                                                                                       | Common anode                                                                                                  | Common anode                                                                                                  | Direct connection to A/K                                                                                  |
| Data Lines               | $\geq 3$ GPIO pins                                                                                                                | $\geq 3$ GPIO pins                                                                                  | $\geq 3$ GPIO pins                                                                                  | $\geq 3$ GPIO pins                                                                                    | $\geq 3$ GPIO pins                                                                                    | $\geq 3$ GPIO pins                                                                                                 | $\geq 3$ GPIO pins                                                                                            | $\geq 3$ GPIO pins                                                                                            | $\geq 3$ GPIO pins                                                                                        |
| Cost (for 256)           | USD$50.20                                                                                                                         | USD$41.63                                                                                           | USD$44.60                                                                                           | USD$109.06                                                                                            | USD$47.56                                                                                             | USD$65.05                                                                                                          | USD$41.63                                                                                                     | USD$46.80                                                                                                     | USD$55.91                                                                                                 |
| Remarks                  |                                                                                                                                   |                                                                                                     |                                                                                                     |                                                                                                       |                                                                                                       |                                                                                                                    | Designed specifically for a fine   pitch                                                                      |                                                                                                               |                                                                                                           |

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

| Part Number       | `TS0230`                                                                                     |
| ----------------- | -------------------------------------------------------------------------------------------- |
| Image             | ![TS0230](https://mm.digikey.com/Volume0/opasdata/d220001/medias/images/4108/MFG_TS0230.jpg) |
| Supplier Link     | [DigiKey](https://www.digikey.com/en/products/detail/sunfounder/TS0230/16612468)             |
| LED part          | -                                                                                            |
| Resolution        | 64 LEDs, $8\times 8$ matrix                                                                  |
| Dimensions        | $80\,\text{mm} \times 70\,\text{mm} \times 25\,\text{mm}$                                    |
| Operating Voltage | $5\,\text{V}$                                                                                |
| Max Current Draw  | Unknown                                                                                      |
| Driving Method    | I2C                                                                                          |
| Data Lines        | Unknown, necessarily $\geq 2$                                                                |
| Cost              | USD$26.85                                                                                    |
| Remarks           | No datasheet                                                                                 |

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

![TFT Display Module](https://nl.mouser.com/images/marketingid/2020/img/188257339.png)

### Pros

- Highest resolution?
- Easier to get in larger sizes than OLED modules
- More cost effective

### Cons

- Scope creep?
- Small physical size
- Not as 'interesting' as an LED matrix?
- Requires a backlight—higher power draw