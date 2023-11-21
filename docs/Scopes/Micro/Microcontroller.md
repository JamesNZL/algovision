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

> [!info] Application Note `AN5373`
> [Getting started with STM32U5 MCU hardware development](https://www.st.com/resource/en/application_note/an5373-getting-started-with-stm32u5-mcu-hardware-development-stmicroelectronics.pdf)

I will then begin with adding my power decoupling capacitors, following the guidance provided in `Figure 25` of the [datasheet](https://www.st.com/resource/en/datasheet/stm32u575ag.pdf) to place:
- a $100\,\text{nF}=0.1\,\micro\text{F}$ capacitor at each $V_\text{DD}$ pin, alongside a bulk $10\,\micro\text{F}$ capacitor for the IC.
- a $100\,\text{nF}$ capacitor parallel to a bulk $1\,\micro\text{F}$ capacitor across $V_\text{DDA}$ for the analogue domain.
	- as the $V_\text{REF}$ reference voltage pin is not exposed on my package, I do not need to worry about its capacitors.
- a $100\,\text{nF}$ capacitor at each $V_\text{DD11}$ pin.

As I am not using the $V_\text{BAT}$ backup domain functionality, I will treat this as another $V_\text{DD}$ pin and attach its own $100\,\text{nF}$ decoupling capacitor as directed in `AN5373` para `2.1.4`.

I will also apply some additional filtering to the $V_\text{DDA}$ analogue supply pin, as suggested in Section `2.2` of `AN5373`. I will do this by adding a ferrite bead between $V_\text{DD}$ and $V_\text{DDA}$ to stop high-frequency switching transients from coupling through to my analogue domain. As I am not very familiar with ferrite beads, I will first use [[LTspice]] to characterise the behaviour of their equivalent model, then select an appropriate part. I will document this process in [[Ferrite Beads]].

> [!warning]
> I still need to select a FB part / calculate the $CLC$ filters/damping—once I know more about the system characteristics

### SMPS

> [!info] Application Note `AN5373`
> [Getting started with STM32U5 MCU hardware development](https://www.st.com/resource/en/application_note/an5373-getting-started-with-stm32u5-mcu-hardware-development-stmicroelectronics.pdf)

For the internal switched-mode power supply, I will place the components as specified in the datasheet/`AN5373` sect `2.2`, namely:
- a $2.2\,\micro\text{H}$ ceramic coil between $V_\text{LXSMPS}$ and $V_\text{DD11}$.
- two $2.2\,\micro\text{F}$ capacitors between $V_\text{DD11}$ and $V_\text{SSSMPS}$.
- a $10\,\micro\text{F}$ capacitor between $V_\text{DDSMPS}$ and $V_\text{SSSMPS}$.

> [!warning]
> I still need to select these parts

As per the datasheet, the external $2.2\,\micro\text{F}$ capacitors must be:
- $\pm 20\%$ tolerance or better
- $\text{ESR} < 20\,\text{m}\Omega$ at $3\,\text{MHz}$
- $\geq 10\,\text{V}$ voltage rating

The $10\,\micro\text{F}$ capacitor must be:
- $\pm20\%$ tolerance or better
- $\text{ESR} < 10\,\text{m}\Omega$ at $3\,\text{MHz}$
- $\geq 10\,\text{V}$ voltage rating

The $2.2\,\micro\text{H}$ inductor must be:
- $\pm 20\%$ tolerance or better
- $I_\text{SAT} > 0.5\,\text{A}$
- $\text{DCR} < 200\,\text{m}\Omega$

### Crystal Oscillators

> [!info] Application Note `AN2867`
> [Oscillator design guide for STM8AF/AL/S, STM32 MCUs and MPUs](https://www.st.com/resource/en/application_note/an2867-oscillator-design-guide-for-stm8afals-stm32-mcus-and-mpus-stmicroelectronics.pdf)

#### `LSE` Clock

I already know that I must fit an `HSE` high-speed clock, but I am not certain whether I will need to fit a $32\,\text{kHz}$ low-speed `LSE` clock. I suspect that this may be useful if I can use it to drive a timer peripheral, as this will mean that I will not need a large prescaler on the `HSE` clock to drive my [[Minimum Data Frequency|row timing]], for example.

![[Pasted image 20231121231756.png]]

I see from the clock tree in the datasheet that the only timers connected to `LSE` are the low power timers, or to the regular timers through the main `HCLK` and `ABP1`/`ABP2` prescalers—with a maximum factor of $1/16$.

Assuming that I want to drive my `HCLK` at its maximum $160\,\text{MHz}$, this gives me a minimum timer clock of
$$
\begin{align}
f_\text{TIM, min} &= \frac{160\,\text{MHz}}{16}\times 2 \\[0.75em]
&= 20\,\text{MHz}
\end{align}
$$
The general purpose timers `TIM[2..5]` are 32-bit timers with any prescaler down to $1/(2^{16})$, giving me a minimum frequency of
$$
\begin{align}
f_\text{min} &= \frac{20\,\text{MHz}}{(2^{16})\times (2^{32}-1)} \\[0.75em]
& = 71.05\,\text{nHz}
\end{align}
$$

The low power timers are 16-bit timers with a prescaler down to $1/128$, giving me a minimum frequency (with an `LSE`) of
$$
\begin{align}
f_\text{min} &= \frac{32.768\,\text{kHz}}{128\times (2^{16}-1)} \\[0.75em]
& = 3.906\,\text{mHz}
\end{align}
$$

As it does not look like I will need the `LSE` to drive any of my timers, and I do not intend on using the $V_\text{BAT}$ backup domain, I will omit an `LSE` in this design.

#### `HSE` Clock



### [[USB Power Delivery]]

> [!info] Application Note `AN5225`
> [Introduction to USB Type-C® Power Delivery for STM32 MCUs and MPUs](https://www.st.com/resource/en/application_note/an5225-introduction-to-usb-typec-power-delivery-for-stm32-mcus-and-mpus-stmicroelectronics.pdf)

### USB [[Data Connector]]

> [!info] Application Note `AN4879`
> [Introduction to USB hardware and PCB guidelines using STM32 MCUs](https://www.st.com/resource/en/application_note/an4879-introduction-to-usb-hardware-and-pcb-guidelines-using-stm32-mcus-stmicroelectronics.pdf)

> [!warning]
> Filter the $V_\text{BUS}$ input rail with a ferrite!

### ESD and [[Input Protection]]

> [!info] Application Note `AN5612`
> [ESD protection of STM32 MCUs and MPUs](https://www.st.com/resource/en/application_note/an5612-esd-protection-of-stm32-mcus-and-mpus-stmicroelectronics.pdf)

### [[STM32CubeMX]] Pinout


