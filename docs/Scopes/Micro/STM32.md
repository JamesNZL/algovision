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
