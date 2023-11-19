#5e5ce6/projects 

# Requirements

## Peripherals

### RAM

To get a ball-park estimate, I will consider just my [[Frame Buffers]]—assuming that I have two rotating frame buffers for my [[Display]], this gives me a minimum of $8.7\,\text{kiB}$ of RAM required.

### Timers

I will need a timer for:

1. Row control [[Shift Registers]] timing
2. Column control [[LED Drivers]] greyscale reference clock

As per my [[Minimum Data Frequency]] calculations, I must clock my shift registers at least at $1260\,\text{Hz}$, or a period of $0.8\,\text{ms}$. This will be easily achievable with a 8- or 16-bit timer with a clock prescaler applied to the system clock. I also calculated that my greyscale reference clock should be at least $5.16\,\text{MHz}$ for the full 12-bit resolution [[Pixel Brightness]] control.

> [!todo]
> Decide whether to drive the greyscale reference clock with an external [[Crystals|crystal]] oscillator

### SPI

For my [[Display]], I must select a microcontroller that is capable of transferring serial data to my [[LED Drivers]] at the required [[Minimum Data Frequency]] of at least $f_\text{clk, SPI} > 18.2\,\text{MHz}$.

I note that this is separate from the microcontroller's operating frequency; as there is no inherent synchronisation between the [[Frame Buffers]] and the matrix timing constraints—as long as I can shift the data out from the read-only frame buffer in time with enough left-over instructions to slowly compute the contents of the write-only frame buffer, everything should be fine.

### GPIO

| Purpose                    | Pins Required | Remarks                                                                                                  |
| -------------------------- | ------------- | -------------------------------------------------------------------------------------------------------- |
| [[Display]] row control    | 3             | Shift register clear, clock, serial input                                                                |
| [[Display]] column control | 8            | LED driver `GSSIN`, `DCSIN`, `GSSCK`, `GSLAT`, `DCSCK`, `~XBLNK`, `GSCK`, flags input |
| [[Debug LEDs]]             | 4+            | Heartbeat LED, status, `TX`, `RX`—assuming a single GPIO per LED                                         |
| [[User Pushbuttons]]       | 1+            |                                                                                                          |
| [[Brightness Control]]     | 1+            |                                                                                                          |

For my [[Display|display]] [[Shift Registers|shift register]] row control, I intend on bit-banging the serial output using a GPIO pin and a timer interrupt. For my [[LED Drivers|LED driver]] column control however, I intend on using a serial SPI peripheral to transfer the data, and a separate timer interrupt for the greyscale reference clock pin.

This gives a total minimum of 17 available GPIO pins.

### ADC

At minimum, I will need one channel for my [[Brightness Control]] knob, and another channel for my [[Current Sensing]] signal.

### USB-UART

I would prefer to have a microcontroller that can be directly [[Programming|programmed]] with a [[USB Type-C Connectors|USB-C]] connection, without requiring an external [[Scopes/Micro/USB to Serial|USB-to-serial]] chip.

This will require further research to see whether this would still allow a debugger to be attached, though.

### Watchdog Timer

I will need at least one [[Watchdog Timer]]. Preferably, this will be a window watchdog—I can then perhaps configure it to require a refresh within a window around my row-refresh timing, to help ensure that my display is being driven with correct timing.

### USB PD PHY

It would be desirable to have in-built [[USB Power Delivery]] [[USB-C Configuration Controller]] or [[USB Power Delivery Control Peripheral]], such that I do not require an external USB-C/PD controller IC.

### Connectivity

I would like to have the option to implement wireless Bluetooth Low Energy/WiFi [[Connectivity|connectivity]] in the future.
