#5e5ce6/projects 

# Requirements

## Peripherals

### RAM

To get a ball-park estimate, I will consider just my [[Frame Buffers]]—assuming that I have two rotating frame buffers for my [[Display]], this gives me a minimum of $8.7\,\text{kiB}$ of RAM required.

### GPIO

For my [[Display]], I must select a microcontroller that is capable of transferring serial data at the required [[Minimum Data Frequency]] of at least $f_\text{clk} > 18.2\,\text{MHz}$.

| Purpose                    | Pins Required | Remarks                                                                                                  |
| -------------------------- | ------------- | -------------------------------------------------------------------------------------------------------- |
| [[Display]] row control    | 3             | Shift register clear, clock, serial input                                                                |
| [[Display]] column control | 8            | LED driver `GSSIN`, `DCSIN`, `GSSCK`, `GSLAT`, `DCSCK`, `~XBLNK`, `GSCK`, flags input |
| [[Debug LEDs]]             | 4+            | Heartbeat LED, status, `TX`, `RX`—assuming a single GPIO per LED                                         |
| [[User Pushbuttons]]       | 1+            |                                                                                                          |
| [[Brightness Control]]     | 1+            |                                                                                                          |

This gives a total minimum of 17 available GPIO pins.

### ADC

For my [[Brightness Control]] knob.

### USB-UART

I would prefer to have a microcontroller that can be directly [[Programming|programmed]] with a [[Scopes/Micro/USB Connector|USB-C]] connection, without requiring an external [[Scopes/Micro/USB to Serial|USB-to-serial]] chip.

This will require further research to see whether this would still allow a debugger to be attached, though.

### Watchdog Timer

I will need at least one [[Watchdog Timer]].

### USB PD PHY

It would be desirable to have in-built [[USB Power Delivery]] PHY support, such that I do not require an external PD controller IC.

> [!todo]
> - [power supply - Implementing USB-C PD PHY directly into micro-controller - Electrical Engineering Stack Exchange](https://electronics.stackexchange.com/questions/649227/implementing-usb-c-pd-phy-directly-into-micro-controller)
> - [STM32 solutions for USB Type-C and Power Delivery - STMicroelectronics](https://www.st.com/content/st_com/en/ecosystems/stm32-usb-c.html?icmp=tt18626_gl_lnkon_nov2020)

### Connectivity

I would like to have the option to implement wireless Bluetooth Low Energy/WiFi [[Connectivity|connectivity]] in the future.
