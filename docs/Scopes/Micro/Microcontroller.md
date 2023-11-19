#5e5ce6/projects 

# Microcontroller

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
