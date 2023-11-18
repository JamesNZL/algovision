#5e5ce6/projects 

# USB-C Configuration Controller

Whilst the [[USB Power Delivery Control Peripheral]] is used to negotiate for [[USB Power Delivery]] 2.0 and 3.0 power rules, a simpler USB Type-C configuration IC like the [`TUSB320`](https://www.digikey.co.nz/en/products/detail/texas-instruments/TUSB320HAIRWBR/296-43141-1-ND/5722620) from TI can be used to make use of the simpler [[USB Power Delivery#USB Type-C 1.2]] specification in a safer manner than just naively attaching pull-down resistors to the $\texttt{CC}$ pins.

As I have concluded in [[USB Power Delivery#Implementation]], I do not actually require the full USB PD specification; rather the $15\,\text{W}$ USB Type-C 1.2 specification is sufficient for my power requirements.

I will therefore need to consider whether I should use an IC like the aforementioned `TUSB320`, or whether I should just select an [[STM32]] [[Microcontroller]] that implements a [[UCPD]] and use that instead.
