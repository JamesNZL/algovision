#5e5ce6/projects 

# USB Power Delivery Control Peripheral

> [!todo]
> - [power supply - Implementing USB-C PD PHY directly into micro-controller - Electrical Engineering Stack Exchange](https://electronics.stackexchange.com/questions/649227/implementing-usb-c-pd-phy-directly-into-micro-controller)
> - [STM32 solutions for USB Type-C and Power Delivery - STMicroelectronics](https://www.st.com/content/st_com/en/ecosystems/stm32-usb-c.html?icmp=tt18626_gl_lnkon_nov2020)

> [!fail] Not Needed
> After investigating the [[USB Power Delivery#Specification]] further, I realise that the [[USB Power Delivery#USB Type-C 1.2|USB Type-C 1.2]] specification is sufficient to supply this project.
> 
> Consequently, I will not actually need this additional hardware in the power system.

Of course, I should consider whether it is better to simply select an [[STM32]] [[Microcontroller]] that includes a [[UCPD]], and use that to negotiate for my required power rule.
