#5e5ce6/projects 

# ESP32

## References

 - [ESP32 Wi-Fi & Bluetooth SoC | Espressif Systems](https://www.espressif.com/en/products/socs/esp32)
 - [ESP32 - Wikipedia](https://en.wikipedia.org/wiki/ESP32)
 - [The Internet of Things with ESP32](http://esp32.net/)

## Notes

- Tensilica LX6, Tensilica LX7, or RISC-V microprocessor
- Includes on-chip [[IEEE 802.11]] `b/g/n` WiFi and BLE through SPI/SDIO or I2C/UART
- Successor to [[ESP8266]]

- 32-bit
- Up to $240\,\text{MHz}$
- $520\,\text{kiB}$ RAM
- $448\,\text{kiB}$ ROM

- $3.3\,\text{V}$
- 1x 12-bit SAR ADC with 18 channels
- 34 GPIO pins

## Conclusions

> [!fail]
> Similarly to the [[ESP8266]], although these look like a great family of microcontrollers for an IoT application, I think the better decision would be to take the opportunity to dive deeper into an ARM-architecture [[STM32]], perhaps exploring the CMSIS layer/APIs.
