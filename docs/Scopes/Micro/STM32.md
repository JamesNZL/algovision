#5e5ce6/projects 

# STM32

Having narrowed down on a STM32 microcontroller for this project after having considered (and decided against) a [[PSoC 6]], [[ESP8266]], and [[ESP32]], I will use the [STM32 MCU product selector](https://www.st.com/content/st_com/en/stm32-mcu-product-selector.html) to narrow down to a specific microcontroller that satisfies my [[Requirements|requirements]].

I also found in [[ARM Cortex Processors]] that any Cortex-M will suffice for my processor requirements, where M4/M7 cores may be nicer for their greater hardware features/memory caches, but I may also wish to prioritise the lower power consumption of the M0/M0+ cores.

Although I already have prior experience with the `STM32U575`/`STM32U585`/`STM32F779`, I will start the selection process from the beginning to get a better familiarity with the breadth of product offerings.

## STM32 Microcontrollers

![[Pasted image 20231118002949.png]]

From the above brochure image, I see that there are four primary categories of STM32 microcontrollers—high performance, mainstream, ultra-low-power, and wireless.

### High Performance

- Industrial
	- PLCs
	- Motor control
	- Pumps and compressors
 
- Smart home
	- Smart appliances
	- Central alarm system

- Personal electronics
	- Keyboards
	- Smartphones
	- IoT tags and tracking devices
 
- Smart city
	- Industrial communication
	- Lighting controls
	- Digital power

- Medical and healthcare
	- CPAP and respirators
	- Dialysis machines

| Series    | Processor | Maximum Clock Frequency | Remarks                                                                              |
| --------- | --------- | ----------------------- | ------------------------------------------------------------------------------------ |
| `STM32H5` | M33       | $250\,\text{MHz}$       | 'Best combination of performance, security, and affordability'                       |
| `STM32F4` | M4        | $180\,\text{MHz}$       | 'Industry's highest benchmark scores for Cortex-M-based microcontrollers'            |
| `STM32F2` | M3        | $120\,\text{MHz}$       | 'Unprecedented trade-off between price and performance'                              |
| `STM32F7` | M7        | $216\,\text{MHz}$       | 'Deliver the maximum theoretical performance of the Cortex-M7 core'                  |
| `STM32H7` | M7        | $550\,\text{MHz}$       | Dual-core, 'Industry's highest benchmark scores for Cortex-M-based microcontrollers' |

![[Pasted image 20231118004617.png]]

### Mainstream

| Series    | Processor | Maximum Clock Frequency | Remarks                                                                                                                               |
| --------- | --------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `STM32C0` | M0+       | $48\,\text{MHz}$        | 'Most cost-effective'                                                                                                                 |
| `STM32G0` | M0+       | $64\,\text{MHz}$        | 'Address cost-sensitive applications and bring better performance while lowering power consumption'                                   |
| `STM32F0` | M0        | $48\,\text{MHz}$        | 'Ideal for engineers looking to future proof their product platform'                                                                  |
| `STM32F1` | M3        | $72\,\text{MHz}$        | 'Pioneer of the STM32 family', 'high performance with first-class peripherals'                                                        |
| `STM32F3` | M4        | $72\,\text{MHz}$        | 'Enables the most demanding real-time control for consumer and industrial applications', 'rich choice of advanced analog peripherals' |
| `STM32G4` | M4        | $170\,\text{MHz}$       | 'Addresses all applications that require an advanced and/or rich analog peripheral set combined with a high-performance CPU'          |

![[Pasted image 20231118004851.png]]

### Ultra Low Power

- Industrial
	- Advanced HMI
	- POS machines
	- Metering
	- Sensors
	- Medical and healthcare

- Smart home
	- Home applicances
	- Whiteware

- Personal electronics
	- e-Bikes
	- EV charging
	- Wearables
	- Audio

| Series     | Processor | Maximum Clock Frequency | Remarks |
| ---------- | --------- | ----------------------- | ------- |
| `STM32U5`  | M33       | $160\,\text{MHz}$       |         |
| `STM32L5`  | M33       | $110\,\text{MHz}$       |         |
| `STM32L4`  | M4        | $80\,\text{MHz}$        |         |
| `STM32L4+` | M4        | $120\,\text{MHz}$       |         |
| `STM32L0`  | M0+       | $32\,\text{MHz}$        |         |

![[Pasted image 20231118005601.png]]

### Wireless

- 'Enable wireless connectivity'
- Dual-core architecture—MCU and a radio transceiver

- Industrial
- Smart home
- IoT

| Series     | Processor  | Maximum Clock Frequency               | Remarks                                                                                     |
| ---------- | ---------- | ------------------------------------- | ------------------------------------------------------------------------------------------- |
| `STM32WBA` | M33        | $100\,\text{MHz}$                     | [[Bluetooth Low Energy]] 5.4                                                                |
| `STM32WB`  | M4 and M0+ | $64\,\text{MHz}$ and $32\,\text{MHz}$ | [[Bluetooth Low Energy]] 5.4, [[IEEE 802.15.4]] ([[Zigbee]] and [[Thread]]) with [[Matter]] |
| `STM32WB0` | M0+        | $64\,\text{MHz}$                      | Low-power [[Bluetooth Low Energy]] 5.3                                                      |
| `STM32WL`  | M4 and M0+ | $48\,\text{MHz}$                      | [[LoRa]]                                                                                    |

![[Pasted image 20231118010006.png]]

### Evaluation

Before looking into the product selector, it looks as though I could find suitable microcontrollers in the [[STM32#Mainstream|Mainstream]], [[STM32#Ultra Low Power|Ultra Low Power]], or [[STM32#Wireless|Wireless]] categories—with the two former requiring some external [[Connectivity|connectivity]] module to meet my wireless [[Requirements|requirements]].

Of all the series, the `STM32WB` looks to be the most initially attractive, as this appears to fully satisfy my connectivity & processor requirements without requiring an external module. I will need to investigate further to see whether it satisfies the other microcontroller (ie peripheral) [[Requirements|requirements]] however.

## Product Selector

Using the [STM32 MCU product selector](https://www.st.com/content/st_com/en/stm32-mcu-product-selector.html), I have applied the following filters:

| Filter                  | Applied                                                             | Remarks                                                                                                                                                                                                                      |
| ----------------------- | ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Status & Availability   | Active                                                              |                                                                                                                                                                                                                              |
| Package                 | All SO-type and QFP-type packages                                   |                                                                                                                                                                                                                              |
| RAM Size ($\text{kiB}$) | Minimum $(8.7\,\text{kiB}\times 4)$, ie minimum of $36\,\text{kiB}$ | Safety factor                                                                                                                                                                                                                |
| Timers                  | Minimum 5                                                           | Added safety factor                                                                                                                                                                                                          |
| Other timer functions   | Dual watchdog, HR, SysTick, WWDG                                    | Want a high-resolution timer in case I need higher duty cycle resolution for a [[Buck Converter]]; Want SysTick in case I choose to run an [[RTOS]] layer; Want a window [[Watchdog Timer]] to ensure correct display timing |
| I/Os                    | 30                                                                  | Added safety factor                                                                                                                                                                                                          |
| SPI typ                 | Minimum 3                                                           | One for my [[LED Drivers]] column control, 2 for a safety factor                                                                                                                                                             |
| USB Type                | USB Type-C                                                          | [[UCPD]]                                                                                                                                                                                                                     |

### Safety Factor

I have ensured to add a sufficient safety factor atop each of [[Requirements|requirements]] in my applied filters, as I am still in the process of/yet to design many aspects of this project—including the [[Interface]] and [[Power]] circuits. I have consequently made sure to budget for enough surplus peripherals/GPIOs/resources such that I have sufficient room to grow, in case my requirements grow once I have settled on a microcontroller.

As I am only intending to produce a small handful of these boards (ie only enough prototyping/development boards to produce a final design/revision), and am not looking to commercialise/mass-manufacture these boards, I can afford to adopt a prototyping approach and over-specify my microcontroller, rather than strictly optimising my selection.

### USB-C/Power Delivery Peripheral

I will need to consider my [[USB Power Delivery]] [[USB Power Delivery Control Peripheral|controller peripheral]]—there are indeed [STM32 microcontrollers with this feature](https://www.st.com/content/st_com/en/ecosystems/stm32-usb-c.html), but I will need to consider whether it would be in fact better to delegate this to an external IC that is communicated with over SPI/I2C. My primary concern in this regard is my need for two [[USB Type-C Connectors]], where I want to be able to have a [[Power Connector]] plugged into a USB PD source, and another [[Data Connector]] separately plugged in to my computer. I will need to ensure that this dual-connector application is supported by the microcontroller's peripherals, and that it is implemented safely.

Although full details can be found in [[USB Power Delivery#Implementation]], I have decided to indeed apply a further filter for only microcontrollers with a [[UCPD]] peripheral. This will allow me to safely & reliably negotiate for my extended current sink requirements from the source, without requiring an external IC. This additional filter also does not box me in too heavily, as it narrows the available products (without the inclusion of QFN-type packages in the filter) from 521 to (still) 121 options.

### Connectivity (and Packaging)

I note that the `STM32WB` wireless microcontrollers I identified earlier are only available in QFN/BGA/CSP packages—so I will either need to settle for an alternative non-wireless enabled microcontroller and use an external module, or accept that I will need to use the QFN package. My primary concern here is that these are not easily hand-solderable, and I am trying to choose parts which I *can* assemble myself. With that said however, I have already:

1. Chosen [[Discrete Non-Addressable RGB LEDs]] ([[RS-1515MBAM]]) that will be too hard to hand-solder (not to mention the 735x quantity); and
2. Chosen [[LED Drivers]] ([[TLC5951DAP]]) with an exposed pad, which I will not be able to hand-solder.

The [[RS-1515MBAM]] LEDs are less concerning as they are ordered from LCSC—so I can put them through [[JLCPCB]]'s assembly service. The [[TLC5951DAP]] drivers are more of a problem, as these are not available through LCSC—such that I *will* need to find access to a hot-plate/hot-air station to assemble them.

*At that point*, what is to stop me from using a QFN package? LCSC even has `STM32WB` microcontrollers in stock, so I could also have these assembled on the board for me. I will still stick with my SO-type [[TLC5951DAP]] devices however, as I suspect these two-sided packages will be easier to route nicely than a quad-flat package.

With the above considerations, I will include QFN-type packages in my search filter, and see whether STM32WBs will be suitable.

> [!warning]
> Despite the above, I must still remember that these wireless-enabled chips require an external antenna with a suitable matching network—if I choose to use one of these microcontrollers, I may be forced to use [[JLCPCB]]'s more expensive controlled impedance process.

> [!fail] 
> I see that none of the `STM32WB` microcontrollers include a [[UCPD]] peripheral—meaning that I will need to choose between a microcontroller with wireless connectivity or with an in-built USB-C/USB PD controller peripheral.
> 
> 

Applying my filters to the [STM32WB product selector](https://www.st.com/en/microcontrollers-microprocessors/stm32wb-series/products.html), I see that there a number of problematic filters that cannot be met—

1. The maximum number of [[Requirements#SPI]]s available is 2. I suspect this should be fine however, as SPI is a *bus* architecture after all—hopefully the [[LED Drivers]] will be the only peripheral that I need to talk to without a chip select line.

2. There are no microcontrollers with a [[UCPD]] peripheral.

Conceding the above, I narrow the selection down to five microcontrollers—with the only meaningful differences being their packages, flash/RAM, and whether they support Zigbee. These five microcontrollers are:

1. [`STM32WB35CC`](https://www.st.com/en/microcontrollers-microprocessors/stm32wb35cc.html)
2. [`STM32WB35CE`](https://www.st.com/en/microcontrollers-microprocessors/stm32wb35ce.html)
3. [`STM32WB55RC`](https://www.st.com/en/microcontrollers-microprocessors/stm32wb55rc.html)
4. [`STM32WB55RE`](https://www.st.com/en/microcontrollers-microprocessors/stm32wb55re.html)
5. [`STM32WB55RG`](https://www.st.com/en/microcontrollers-microprocessors/stm32wb55rg.html)

Looking further at these microcontrollers, I think that I would rather choose a mainstream microcontroller and use an [[ESP32]] or similar as an external connectivity module. This is due to a number of factors:

1. I would rather avoid the extra development associated with designing my own PCB antenna, and the need for [[JLCPCB]]'s controlled impedance process.
2. I would rather have a microcontroller in an 'accessible' package/footprint.
3. Wireless connectivity is very much an auxiliary requirement—it is not listed in the project [[1 —  Goals|goals]] nor [[2 — Specifications|specifications]].
4. By using an external [[ESP32]] module, I can get more exposure & experience with *both* an [[STM32]] *and* an [[ESP32]].

> [!fail] Decided Against
> Having made the above considerations, I will dismiss the `STM32WB` series of microcontrollers for this project, and look towards using an [external module](https://pcbartists.com/design/embedded/stm32-wifi-options/) for wireless connectivity.

### Microcontroller Selection

With my final filters applied as per the table above in [[STM32#Product Selector]], I am brought to a final short-list of 121 options.

I see that these options comprise the following series:

| Series    | Category                                     | Processor  |
| --------- | -------------------------------------------- | ---------- |
| `STM32G4` | [[STM32#Mainstream\|Mainstream]]             | Cortex-M4  |
| `STM32H5` | [[STM32#High Performance\|High Performance]] | Cortex-M33 |
| `STM32L5` | [[STM32#Ultra Low Power\|Ultra Low Power]]   | Cortex-M33 |
| `STM32U5` | [[STM32#Ultra Low Power\|Ultra Low Power]]   | Cortex-M33 |

I will further narrow my short-list by filtering out options with more than 40 [[Requirements#GPIO]] pins, as I will definitely not need more than that. This narrows the options down from 121 to 22—perfect!

At a glance, it looks like the [[STM32#Ultra Low Power|Ultra Low Power]] microcontrollers are significantly better than the mainstream `STM32G4` options—more flash/RAM, better processor, comparable clock speed, at just the cost of less analogue peripherals.

I see that even the option with the most flash & RAM, the [`STM32U585CI`](https://www.digikey.co.nz/en/products/detail/stmicroelectronics/STM32U585CIT6/18085481), is available for NZD\$11.07—in my quantities, this is not a significant from the cheaper options at ~NZD\$7. I will therefore select the variants of each series with the most flash & RAM available for comparison against each other—this reduces the number of options from 22 to 10.

Taking a quick look at ST's product naming convention, I see that they take the form
![[Pasted image 20231119124528.png]]
such that I would expect my final part number to be an `STM32abbbcdTe` for a QFP-type part.

| Microcontroller                                                                          | Processor       | Operating Frequency | Flash              | RAM               | Has HR Timer | ADCs | OPAMPs | SMPS     | I2Cs | SPIs | Supply Voltage         |
| ---------------------------------------------------------------------------------------- | --------------- | ------------------- | ------------------ | ----------------- | ------------ | ---- | ------ | -------- | ---- | ---- | ---------------------- |
| [`STM32G491CE`](https://www.st.com/en/microcontrollers-microprocessors/stm32g491ce.html) | Cortex-M4 + FPU | $170\,\text{MHz}$   | $512\,\text{kiB}$  | $112\,\text{kiB}$ | No           | 3    | 4      | -        | 3    | 3    | $1.71\to3.6\,\text{V}$ |
| [`STM32G4A1CE`](https://www.st.com/en/microcontrollers-microprocessors/stm32g4a1ce.html) | Cortex-M4 + FPU | $170\,\text{MHz}$   | $512\,\text{kiB}$  | $112\,\text{kiB}$ | No           | 3    | 4      | -        | 4    | 3    | $1.71\to3.6\,\text{V}$ |
| [`STM32G473CE`](https://www.st.com/en/microcontrollers-microprocessors/stm32g473ce.html) | Cortex-M4 + FPU | $170\,\text{MHz}$   | $512\,\text{kiB}$  | $128\,\text{kiB}$ | No           | 5    | 6      | -        | 4    | 3    | $1.71\to3.6\,\text{V}$ |
| [`STM32G483CE`](https://www.st.com/en/microcontrollers-microprocessors/stm32g483ce.html) | Cortex-M4 + FPU | $170\,\text{MHz}$   | $512\,\text{kiB}$  | $128\,\text{kiB}$ | No           | 5    | 6      | -        | 4    | 3    | $1.71\to3.6\,\text{V}$ |
| [`STM32G474CE`](https://www.st.com/en/microcontrollers-microprocessors/stm32g474ce.html) | Cortex-M4 + FPU | $170\,\text{MHz}$   | $512\,\text{kiB}$  | $128\,\text{kiB}$ | Yes          | 5    | 6      | -        | 4    | 3    | $1.71\to3.6\,\text{V}$ |
| [`STM32G484CE`](https://www.st.com/en/microcontrollers-microprocessors/stm32g484ce.html) | Cortex-M4 + FPU | $170\,\text{MHz}$   | $512\,\text{kiB}$  | $128\,\text{kiB}$ | Yes          | 5    | 6      | -        | 4    | 3    | $1.71\to3.6\,\text{V}$ |
| [`STM32L552CE`](https://www.st.com/en/microcontrollers-microprocessors/stm32l552ce.html) | Cortex-M33      | $110\,\text{MHz}$   | $512\,\text{kiB}$  | $256\,\text{kiB}$ | No           | 2    | 2      | External | 4    | 3    | $1.71\to3.6\,\text{V}$ |
| [`STM32L562CE`](https://www.st.com/en/microcontrollers-microprocessors/stm32l562ce.html) | Cortex-M33      | $110\,\text{MHz}$   | $512\,\text{kiB}$  | $256\,\text{kiB}$ | No           | 2    | 2      | External | 4    | 3    | $1.71\to3.6\,\text{V}$ |
| [`STM32U575CI`](https://www.st.com/en/microcontrollers-microprocessors/stm32u575ci.html) | Cortex-M33      | $160\,\text{MHz}$   | $2048\,\text{kiB}$ | $786\,\text{kiB}$ | No           | 2    | 2      | Internal | 4    | 3    | $1.71\to3.6\,\text{V}$ |
| [`STM32U585CI`](https://www.st.com/en/microcontrollers-microprocessors/stm32u585ci.html) | Cortex-M33      | $160\,\text{MHz}$   | $2048\,\text{kiB}$ | $786\,\text{kiB}$ | No           | 2    | 2      | Internal | 4    | 3    | $1.71\to3.6\,\text{V}$ |

Looking at the table of options above, I see that the primary difference is indeed the number of analogue peripherals available on the mainstream (`G4`) vs ultra low power (`L5` and `U5`) series of microcontrollers.

#### Ultra Low Power `L5` and `U5` Options

Other than the additional ADC peripheral available on the `STM32L5` microcontrollers, I cannot see a good enough reason to choose one of them over the newer, faster, more efficient, $40\,\text{nm}$ `STM32U5` options, if I were to select one of the [[STM32#Ultra Low Power|Ultra Low Power]] microcontrollers.

The decision then comes down to be between the `STM32G4` and `STM32U5` options, where the `U5` options have a faster Cortex-M33 processor at a *slightly* slower clock speed, and with fewer analogue peripherals.

![[Pasted image 20231119153346.png]]

Looking at the portfolio for the [`STM32U5`](https://www.st.com/en/microcontrollers-microprocessors/stm32u5-series.html) family, I see that the main difference between the [`STM32U575`/`STM32U585`](https://www.st.com/en/microcontrollers-microprocessors/stm32u575-585.html) microcontrollers are the added cryptographic & on-the-fly decryption of the `U585`, which does not make a difference to me. I will therefore just choose which one is cheaper/most available, if I decide to proceed with these series.

> [!summary] Potential Device
> If I choose to go with a microcontroller from the [[STM32#Ultra Low Power|Ultra Low Power]] [`U5` series](https://www.st.com/en/microcontrollers-microprocessors/stm32u5-series.html) of Cortex-M33 processors, either of the [`STM32U575`](https://www.st.com/en/microcontrollers-microprocessors/stm32u575ci.html)/[`STM32U585`](https://www.st.com/en/microcontrollers-microprocessors/stm32u585ci.html) will be suitable.

#### Mainstream `G4` Options

![[Pasted image 20231119154114.png]]

Looking closer at the mainstream [`STM32G4`](https://www.st.com/en/microcontrollers-microprocessors/stm32g4-series.html) options, it looks like any of the `G4x1`, `G4x3`, or `G4x4` will be suitable. 

Looking at pricing on DigiKey, I see that the access line [`G491`](https://www.digikey.co.nz/en/products/detail/stmicroelectronics/STM32G491CET6/13592600) is available for NZD\$8.96, and the hi-resolution line [`G474`](https://www.digikey.co.nz/en/products/detail/stmicroelectronics/STM32G474CET6/10326773) for NZD\$10.24—a difference of NZD\$1.28, which, at my quantities, is not significant. Consequently, for my project, I will choose the [`STM32G474`](https://www.st.com/en/microcontrollers-microprocessors/stm32g474ce.html) if I proceed with a general-purpose microcontroller.

Similarly with the `U575`/`U585`, the main difference between the `G474` and `G484` is the hardware crypto on the `G484`—which does not make a difference to me, so I will simply choose whichever is easier to source/cheaper.

> [!summary] Potential Device
> If I choose to go with a microcontroller from the [[STM32#Mainstream|Mainstream]] [`G4` series](https://www.st.com/en/microcontrollers-microprocessors/stm32g4-series.html) of Cortex-M4 processors, either of the [`STM32G474`](https://www.st.com/en/microcontrollers-microprocessors/stm32g474ce.html)/[`STM32G484`](https://www.st.com/en/microcontrollers-microprocessors/stm32g484ce.html) will be suitable.

#### Final Selection

In terms of my [[Requirements#ADC|ADC]] requirements, I can absolutely just share a single ADC peripheral with different channels for my various signals, so the lesser peripherals available on the `STM32U5` series is not a deal-breaker. Similarly, although the `G474` has five 12-bit ADC (up to 16-bit with hardware oversampling), the 12- and 14-bit ADCs on the `U575` will more-than-suffice for my [[Brightness Control]] and [[Current Sensing]] applications.

The `U575` also doesn't actually have less SPI peripherals—it has less 'basic' SPIs, but has two additionally OCTOSPI peripherals—which can be operated as basic SPIs.

Therefore, there is nothing that stands out to me to dismiss either of these microcontrollers.

Some more considerations are:

- I have already used the `U575`/`U585` in my internship last year—perhaps it would be good to get experience with the `G474`?
- The `U575` is newer and faster.
- The `U575` is lower power—which is a project [[2 — Specifications|specification]].
- Both the `U575` and `G474`'s TTL output ports have a logic `HIGH` $V_\text{OH}>2.4\,\text{V}$.
	- This is insufficient for the maximum required positive switching threshold $V_\text{T+}=3.15\,\text{V}$ of the [[SN74HCS594PWR]] when powered off $5\,\text{V}$.
	- The [[TLC5951DAP]] can be driven on the same supply voltage as the microcontroller without a problem, but the shift register must be powered off a voltage that is similar enough to $V_\text{LED}=5\,\text{V}$ that the output `HIGH` voltage is sufficient to switch my [[Current Amplifier]]s.
	- As seen in [[Current Amplifier#Iteration Two]], my initial implementation is, in reality, not robust enough if I have a microcontroller that cannot drive a sufficient $V_\text{OH}$.
- Regarding the maximum frequency of I/Os in `OSPEEDRy[1:0] = 01`:
	- The `U575` is able to drive a $C_\text{L}=30\,\text{pF}$ load at $55\,\text{MHz}$—sufficient for my [[TLC5951DAP]].
	- The `G474` does not provide a specification for this—only that a $C_\text{L}=50\,\text{pF}$ load can only be driven at $25\,\text{MHz}$ (which should suffice), and a $C_\text{L}=10\,\text{pF}$ load can be driven at $50\,\text{MHz}$.
 - Both microcontrollers satisfy the rise/fall time requirements in `OSPEEDRy[1:0] = 01`.
 - The [`STM32G474CET6`](https://www.digikey.co.nz/en/products/detail/stmicroelectronics/STM32G474CET6/10326773) is available from DigiKey with 1112 in stock at NZD\$10.24.
 - The [`STM32U575CIT6Q`](https://www.digikey.co.nz/en/products/detail/stmicroelectronics/STM32U575CIT6Q/18085454) is available from DigiKey with 2424 in stock at NZD\$10.82.

> [!success] Selected Device
> Having made the above considerations, and, acknowledging that my project is, admittedly, hardly 'mixed-signal', I feel the best decision to proceed with will be the [`STM32U575CIT6Q`](https://www.digikey.co.nz/en/products/detail/stmicroelectronics/STM32U575CIT6Q/18085454).
> 
> Although I would have liked to have played with the `G474` for the first time, the `U575` is the better selection for this application.
