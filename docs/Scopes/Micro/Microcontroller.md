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



> [!todo]
> [Choosing the right Arm Cortex-M processor for your biomedical smart product: a practical guide - ASN Home (advsolned.com)](https://www.advsolned.com/choosing-the-right-arm-cortex-m-processor-for-your-biomedical-smart-product-a-practical-guide/)
> Look at https://documentation-service.arm.com/static/61bb37962183326f2176f8cc?token= and figure out which ones I need

