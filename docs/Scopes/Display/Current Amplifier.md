#5e5ce6/projects 

# Current Amplifier

## Output Current

The selected [[SN74HCS594PWR]] shift register can only source $\approx 7\,\text{mA}$ per output, which is insufficient to drive a full row of LEDs.

I found in [[Maximum Output Constant-Current]] that the maximum current that may be supplied to each channel is
$$
I_\text{OLCMax} = 15\,\text{mA}
$$
where there are 35 anodes connected to each output of the shift register, as per the final [[Layout Design]]. This corresponds to
$$
\begin{align}
n_\text{channels} &= 35\times 3 \\[0.75em]
& = 105\,\text{channels}
\end{align}
$$
such that each shift register output must be capable of sourcing
$$
\begin{align}
I_\text{max} &= 105\times I_\text{OLCMax} \\[0.75em]
& = 105 \times 0.015\\[0.75em]
& = 1.575\,\text{A}
\end{align}
$$
when all pixels in a row are fully on simultaneously.

I will therefore need to design a current gain stage that can amplify $\sim5\,\text{mA}$ to $> 1.6\,\text{A}$, ie a required gain of $\frac{1.6}{0.005} = 320$.

## Device Technology

I will evaluate both a BJT-based topology and a FET-based topology, but I suspect a FET solution would be desirable due to:

1. Low $R_{\text{ds(on)}}$. Less voltage dropped across the transistor. However, as found in [[Maximum LED Forward Voltage]], a $0.7\,\text{V}$ collector-emitter drop would still be tolerable in a BJT solution.
2. Faster switching speed. As per [[Minimum Data Frequency]], I have a minimum row frequency of $f_\text{row refresh} = 1.2\,\text{kHz}$. This will be easily handled by both device types, but I would expect a FET to have lesser switching losses.
3. Drive current. The zero steady-state gate current of a FET will likely be easier to design for, versus the constant base-emitter current required for a BJT.

### Transistor Type

As my shift registers are being used to supply the common-anode supply of my [[RS-1515MBAM]] LEDs, I am effectively designing a high-side switch between $V_\text{LED}$ and the [[LED Drivers]]. This means that, unless I want to include a bootstrapping stage, I will be looking at PNP transistors and P-channel MOSFETs, else the $V_\text{shift}$ base/gate voltage may not be sufficiently greater than the emitter/source voltage to turn the transistor on.

This produces a basic high-side PNP topology like the following:
![[Pasted image 20231107152804.png]]
where I have a base resistor of $1\,\text{k}\Omega$ and a minimum transistor $h_\text{FE}$ ($\beta$) of $320$.

I also have two active low control signals $\overline{V_\text{shift}}$ and $\overline{V_\text{driver}}$, where I require the following truth table:

| $\overline{V_\text{shift}}$ | $\overline{V_\text{driver}}$ | $V_\text{D}$ |
| --------------------------- | ---------------------------- | ------------ |
| `0`                         | `0`                          | `1`          |
| `0`                         | `1`                          | `0`          |
| `1`                         | `0`                          | `0`          |
| `1`                         | `1`                          | `0`          |

### PNP Common Emitter Topology

First, I will try a simple PNP common-emitter topology, as in the basic high-side topology sketched above. I will simulate this circuit in [[LTspice]].

#### Shift Register Output Current

![[Pasted image 20231107191111.png]]

As expected, we see a constant base current being sunk into the shift register when the signal is active, with a magnitude of $4.0\,\text{mA}$—well within specifications.

#### LED Current

![[Pasted image 20231107191040.png]]
![[Pasted image 20231107191345.png]]

We see that this topology is behaving as expected; sinking current through the LED when both the shift register and driver are `LOW`, and cutting off current when the shift register signal goes `HIGH`.

I am simulating with the `2SB1706` PNP transistor due to its $2\,\text{A}$ current rating and $\beta=463$ (in the SPICE model). We see that this is capable of passing close to the desired $1.575\,\text{A}$ for 105 channels, but is not quite capable of passing the full current.

![[Pasted image 20231107191712.png]]

Switching to the `2SB1708` with a gain $\beta=470.25$ and $I_\text{c} = 3\,\text{A}$, we see the full $1.575\,\text{A}$ alongside a better transient response. This tells me that this circuit should be adequate, but I do not like the high dependence on each transistor's current gain $\beta$. I could use a Darlington pair topology to increase the current gain of the circuit, but I will first try a PMOS topology.
