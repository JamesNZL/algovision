#5e5ce6/projects 

# USB Power Delivery

- Will almost definitely be able to provide sufficient power (up to $20\,\text{V}$, $5\,\text{A}$)
- Gives users the freedom to power from any USB PD supply (which I can reasonably expect them to have)
- Can be used portably with a USB PD [[Batteries|power bank]]
- User friendly [[USB Type-C Connectors|USB C interface]]

## Implementation

As calculated in [[Current Amplifier]], I will require up to $1.6\,\text{A}$ at $5\,\text{V}$ at any given instant if the current [[Display]] row is fully on. 

> [!todo]
> ...
> 
> Which tier is this?

This will require a [[USB Power Delivery Control Peripheral]], or UCPD controller to negotiate the power requirements from the USB PD source (such as a [[Batteries|power bank]]).

This power input will need to be connected to a dedicated [[Power Connector]], such that I am able to power the board from a capable USB PD source, whilst simultaneously flashing and debugging application firmware through the [[Data Connector]].
