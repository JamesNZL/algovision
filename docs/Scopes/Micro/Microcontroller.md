#5e5ce6/projects 

# Microcontroller

## Selection

To choose my microcontroller, I will first start by clearly defining the various [[Requirements|requirements]] that I must satisfy in order to drive my [[Display|display]] and control the various [[Interface|interface]] components.

I know that I will want to consider at least the various ESP devices like the [[ESP32]] and [[ESP8266]], and also the [[PSoC 6]] after having used a PSoC 5 in [COMPSYS 301](https://docs.jamesnzl.xyz/compsys301-pathfinding-robot). I will also want to consider a few [[STM32]] microcontrollers, so I can become more familiar with these for industry.

In my decision making, I will want to primarily consider, amongst other things:

- Required peripherals,
- Core widths,
- Cost,
- Stock availability (likely a *big* factor!), and
- Clock frequency.

Regarding [[Connectivity|connectivity]], I think it would be nice to have Bluetooth/WiFi options available, but this is a primary goal of the project. It may be nice if I could develop some [software application/webpage to connect to the display](https://github.com/JamesNZL/algovision/issues/6#issuecomment-1748501046), but this may be too much scope creep and outside the [[1 —  Goals|goals]] of the project. This would heavily favour the [[ESP8266]]/[[ESP32]] or [[PSoC 6]] with BLE. Alternatively, I may choose to use an [[STM32]] with an ESP purely as a connectivity module—but I think this will need to be well justified.

Further, *preferably*, I would like if the microcontroller I choose did not require a vendor-specific IDE, but rather could be configured to work with [[PlatformIO]]. I already know that the [[ESP32]] and [[ESP8266]] are compatible with this workflow, but I will need to investigate further for other microcontroller families.

---

After considering the various families listed above, I have come to the conclusion as detailed within [[ESP8266#Conclusions]] and [[ESP32#Conclusions]] that I feel it would be best if I took this opportunity to gain a firmer grounding in an ARM-architecture microprocessor, and particularly something as common in industry as an [[STM32]].

I also already have some experience with the ST system from my internship last year, such that I am already familiar with the STM32Cube family of software packages, and the experience of developing using ST support resources/application notes etc.

As noted above, I still wish to incorporate WiFi and BLE into this project, so I will need to investigate whether something like the STM32W line is best, or perhaps another STM32 device family with an external module.

I will start with familiarising myself further with the various [[ARM Cortex Processors]], and using the [ARM Cortex-M Processor Comparison Table](https://developer.arm.com/documentation/102787/latest) to determine the processor that is most suitable for my needs.

Having performed the above evaluation in [[ARM Cortex Processors#Cortex-M]] to learn that any Cortex-M core will be suitable, I will then use the [STM32 MCU product selector](https://www.st.com/content/st_com/en/stm32-mcu-product-selector.html) to select a specific [[STM32]] microcontroller that satisfies my other [[Requirements|requirements]].

> [!success] Selected Device
> Following a thorough selection process as documented in [[STM32#Product Selector]], I have decided to proceed with the [`STM32U575CIT6Q`](https://www.digikey.co.nz/en/products/detail/stmicroelectronics/STM32U575CIT6Q/18085454).

## Implementation

Having selected my [[STM32U575CIT6Q]] microcontroller, I will now need to perform a schematic capture in [[Altium]]—starting by creating my own library component as per my [[Schematic Guidelines]].

### Decoupling

I will then begin with adding my power decoupling capacitors, following the guidance provided in `Figure 25` of the [datasheet](https://www.st.com/resource/en/datasheet/stm32u575ag.pdf) to place:
- a $100\,\text{nF}=0.1\,\micro\text{F}$ capacitor at each $V_\text{DD}$ pin, alongside a bulk $10\,\micro\text{F}$ capacitor for the IC.
- a $100\,\text{nF}$ capacitor parallel to a bulk $1\,\micro\text{F}$ capacitor across $V_\text{DDA}$ for the analogue domain.
	- as the $V_\text{REF}$ reference voltage pin is not exposed on my package, I do not need to worry about its capacitors.
- a $100\,\text{nF}$ capacitor at each $V_\text{DD11}$ pin.

As I am not using the $V_\text{BAT}$ backup domain functionality, I will treat this as another $V_\text{DD}$ pin.

I will also apply some additional filtering to the $V_\text{DDA}$ analogue supply pin, **APPLICATION NOTE**

### SMPS



### Crystal Oscillators



### [[STM32CubeMX]] Pinout
