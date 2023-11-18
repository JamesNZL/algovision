#5e5ce6/projects 

# USB Power Delivery

- Will almost definitely be able to provide sufficient power (up to $20\,\text{V}$, $5\,\text{A}$)
- Gives users the freedom to power from any USB PD supply (which I can reasonably expect them to have)
- Can be used portably with a USB PD [[Batteries|power bank]]
- User friendly [[USB Type-C Connectors|USB C interface]]

## Specification

### References

- [Here is why USB Type-C is AWESOME and how you can use Power Delivery for your electronics! - YouTube](https://www.youtube.com/watch?v=OwAZqJ4wpJg)
- [USB-C Power Delivery Hardware Design - Phil's Lab #104 - YouTube](https://www.youtube.com/watch?v=W13HNsoHj7A)
- [Powering your projects using USB-C Power Delivery - YouTube](https://www.youtube.com/watch?v=iumAnPiQSj8&t=10s)
- [STM32 solutions for USB Type-C and Power Delivery - STMicroelectronics](https://www.st.com/content/st_com/en/ecosystems/stm32-usb-c.html)
- [Introduction to USB Power Delivery with STM32 - stm32mcu](https://wiki.st.com/stm32mcu/wiki/Introduction_to_USB_Power_Delivery_with_STM32)
- [Introduction to USB Type-C® Power Delivery for STM32 MCUs and MPUs - Application note AN5225](https://www.st.com/resource/en/application_note/dm00536349.pdf)
- [Simple way to use USB Type-C to get 5V at up to 3A (15W) - Power - Electronic Component and Engineering Solution Forum - TechForum │ Digi-Key (digikey.com)](https://forum.digikey.com/t/simple-way-to-use-usb-type-c-to-get-5v-at-up-to-3a-15w/7016)
- [Designing In USB Type-C and Using Power Delivery | DigiKey](https://www.digikey.co.nz/en/articles/designing-in-usb-type-c-and-using-power-delivery-for-rapid-charging)
- [USB Type-C & USB Power Delivery ICs | TI.com](https://www.ti.com/interface/usb/type-c-and-power-delivery/overview.html)

### Notes

#### USB 2.0

- 4 mandatory pins
- $V_\text{BUS} = 5\,\text{V}$, $\texttt{D}^+$, $\texttt{D}^-$, and $\texttt{GND}$
- USB-OTG also includes a fifth $\texttt{ID}$ pin

- Data pins are a differential half-duplex signal
- Maximum $480\,\text{Mbits/s}$

#### USB 3.0

- 9 pins
- Added an extra 2 pairs of differential TX and RX signals, for full-duplex operation

- Maximum $5\,\text{Gbits/s}$
- Maximum $10\,\text{Gbits/s}$ with USB 3.1
- Maximum of $20$ and $40\,\text{Gbits/s}$ with USB 3.2 and USB 4.0, but these require a [[USB Type-C Connectors|USB Type-C connector]]

#### USB Type-C Connectors

- Fully backwards-compatible
- Added configuration channel $\texttt{CC}$
	- Communication channel to determine host/device
	- Negotiate power
	- Select alternate modes

##### Alternate Modes

- Reusing/re-assignment of pins for other functions, such as
	- HDMI
	- DisplayPort
	- etc.

##### Power Delivery

- Source and sink device communicate over the configuration channel $\texttt{CC}$ to negotiate the $V_\text{BUS}$ voltage

| USB PD $V_\text{BUS}$ Voltages |
| ------------------------------ |
| $5\,\text{V}$                  |
| $9\,\text{V}$                  |
| $15\,\text{V}$                 |
| $20\,\text{V}$                 | 

- Up to $5\,\text{A}$ of current—ie $20\,\text{V}\times 5\,\text{A}=100\,\text{W}$

###### PD PHY and PD Manager

- Devices that look after the communication across the $\texttt{CC}$ lines between the DFP and UFP
- The PD physical layer (PHY) drives the communication across the $\texttt{CC}$ lines, but is not capable of negotiation
- The negotiation is performed by the PD manager, which implements the required state machine and drives the PHY to perform the necessary actions

#### USB Power Specifications

| Specification                 | Maximum Voltage | Maximum Current  | Maximum Power   |
| ----------------------------- | --------------- | ---------------- | --------------- |
| USB 2.0                       | $5\,\text{V}$   | $500\,\text{mA}$ | $2.5\,\text{W}$ |
| USB 3.0 and USB 3.1           | $5\,\text{V}$   | $900\,\text{mA}$ | $4.5\,\text{W}$ |
| USB BC 1.2 (Battery Charging) | $5\,\text{V}$   | $1.5\,\text{A}$  | $7.5\,\text{W}$ |
| USB Type-C 1.2                | $5\,\text{V}$   | $3\,\text{A}$    | $15\,\text{W}$  |
| USB PD 3.0                    | $20\,\text{V}$  | $5\,\text{A}$    | $100\,\text{W}$ | 

Where the USB Type-C 1.2 specification does not require special negotiation, such as with a [[USB Power Delivery Control Peripheral]]—the additional current can be simply negotiated with two $5.1\,\text{k}\Omega$ pull-down resistors on the $\texttt{CC1}$ and $\texttt{CC2}$ pins.

> [!important]
> This $15\,\text{W}$ specification actually looks like it would suffice for my needs—my display only draws a maximum of $1.6\,\text{A}$ at any given instant!
> 
> This would mean that I do not actually require a [[USB Power Delivery Control Peripheral]] chip.
> 
> I will need to investigate [how this implementation handles supplies that are not capable of sourcing the PD power](https://forum.digikey.com/t/simple-way-to-use-usb-type-c-to-get-5v-at-up-to-3a-15w/7016), however.

### USB Type-C 1.2

Although I do not require a [[USB Power Delivery Control Peripheral|PD control]] chip for this specification, I should not just naively attach pull-down resistors and assume that the source is capable of sourcing $15\,\text{W}$.

I could either follow the specification and read the voltages at the centre tap of the downstream-facing port (DFP) and upstream-facing port (UFP) using an ADC in my [[Microcontroller]] to determine the advertised current capability and subsequently enable/disable a [[Load Switch]], or use a [[USB-C Configuration Controller]] IC like the [`TUSB320`](https://www.digikey.co.nz/en/products/detail/texas-instruments/TUSB320HAIRWBR/296-43141-1-ND/5722620) from TI.

Of course, if I select a [[STM32]] microcontroller that has a built-in UCPD, I can simply use that to negotiate for the $5\,\text{V}$, $3\,\text{A}$, $15\,\text{W}$ power rule.

According to the [STM32 USB PD wiki](https://wiki.st.com/stm32mcu/wiki/Introduction_to_USB_Power_Delivery_with_STM32#Getting_started_with_STM32_and_USB_Power_Delivery) however, I do not even a UCPD peripheral in this case—I will need to refer to [`AN5225`](https://www.st.com/resource/en/application_note/dm00536349.pdf) to see if this is meaning that they would recommend that I just attach the pull-down resistors without a configuration IC. I will add further notes below under the [[USB Power Delivery#Implementation]] heading.

## Implementation

As calculated in [[Current Amplifier]], I will require up to $1.6\,\text{A}$ at $5\,\text{V}$ at any given instant if the current [[Display]] row is fully on. 

As noted above, this means that the standard USB Type-C 1.2 power delivery specification would suffice for this project, as it is capable of $5\,\text{V}$ at $3\,\text{A}$. As I do not anticipate anything to require another $1.5\,\text{A}$ of current, and my [[Maximum LED Forward Voltage]] and supply voltages for my [[SN74HCS594PWR]] [[Shift Registers|shift registers]] and [[TLC5951DAP]] [[LED Drivers|LED drivers]] all work on $5\,\text{V}$, I do not see a compelling reason to use a special [[USB Power Delivery Control Peripheral|PD controller]] to negotiate the power requirements from a USB PD source instead of a simple [[USB-C Configuration Controller]].

Regardless of the final USB power specification, my power input will need to be connected to a dedicated [[Power Connector]], such that I am able to power the board from a capable source whilst simultaneously flashing and debugging application firmware through the [[Data Connector]].

Expanding on the notes above under the [[USB Power Delivery#USB Type-C 1.2]] heading, I see in [`AN5225`](https://www.st.com/resource/en/application_note/dm00536349.pdf) that Chapter 10 is of most interest to me—*Type-C with no Power Delivery*. In this chapter however, I see that the provided guidance is to simply attach the $5.1\,\text{k}\Omega$ pull-down resistors and walk-away—which will not be good if the source is incapable of supplying the required current draw.
