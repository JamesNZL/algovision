#5e5ce6/projects 

# PSoC 6

## Reference

- [32-bit PSoC™ 6 Arm® Cortex®-M4 / M0+ | Microcontrollers Purpose-Built for the IoT - Infineon Technologies](https://www.infineon.com/cms/en/product/microcontroller/32-bit-psoc-arm-cortex-microcontroller/psoc-6-32-bit-arm-cortex-m4-mcu/)
- [Infineon-PSoC_6_MCU_The_New_Standard_for_the_Internet_of_Things-ProductBrochure-v05_00-EN.pdf](https://www.infineon.com/dgdl/Infineon-PSoC_6_MCU_The_New_Standard_for_the_Internet_of_Things-ProductBrochure-v05_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0f64f95450c7)
- [PSoC 6 Microcontroller - Infineon Technologies | Mouser](https://nz.mouser.com/new/infineon/cypress-psoc-6-soc/)
- [Cypress PSoC - Wikipedia](https://en.wikipedia.org/wiki/Cypress_PSoC)

## Notes

| Variant   | Remarks     |
| --------- | ----------- |
| `PSoC 61` | Entry-level |
| `PSoC 62` | Performance |
| `PSoC 63` | BLE         |
| `PSoC 64` | Secured MCU | 

- Programmable analogue and digital blocks
- Programmable routing/interconnect—GPIOs/pin functions can be routed anywhere (this was very useful in COMPSYS 301!)
- Must be configured at power-up, similar to an FPGA

- ARM Cortex-M4 core with additional Cortex-M0+ core in certain variants
- Includes variants with BLE/Bluetooth 5
- Full-speed USB 2.0 host/device

- 32-bit
- Up to $150\,\text{MHz}$ on the M4, and up to $100\,\text{MHz}$ on the M0+
- $512\,\text{kiB}$ to $2048\,\text{kiB}$ flash
- $128\,\text{kiB}$ to $512\,\text{kiB}$ SRAM, expandable with QSPI

- 1x 12-bit SAR ADC at $1\,\text{MSa/sec}$
- Up to 104 GPIO (84 on the `PSoC 63` with BLE)

## Conclusions

> [!fail]
> Although this series of microcontrollers are really neat, I don't think they're the best option for this project:
> 1. I don't need the programmable digital/analogue, and I can live without the programmable GPIO.
> 2. These are not as common/widespread in industry as [[STM32]]s.
> 3. I would prefer not to have the vendor lock-in with regards to programming software; ie PSoC Creator.
