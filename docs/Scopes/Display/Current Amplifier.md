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

![[Pasted image 20231107200714.png]]

Looking at the power dissipated by the transistor, we see that it is dissipating over $3.6\,\text{W}$ peak, and an average of $1\,\text{W}$ when the row is on. This is undesirable from a PCB perspective, and also exceeds the absolute maximum power dissipation of the device ($0.5\,\text{W}$ from the [datasheet](https://fscdn.rohm.com/en/products/databook/datasheet/discrete/transistor/bipolar/2sb1708tl-e.pdf)).

Although I could look at power transistors for better power dissipation, these will have much smaller DC gains.

### PMOS Common Source Topology

Replacing the PNP BJT transistor with a P-channel MOSFET in a common-source configuration, I have the below circuit:
![[Pasted image 20231107194605.png]]

#### Shift Register Output Current

![[Pasted image 20231107194748.png]]

As expected, we see a maximum current of $4.3\,\text{mA}$ to charge/discharge the gate of the FET, but zero current once the transistor is switched either on/off. This is desirable from a power dissipation perspective, as there is less current constantly being sunk/sourced by the shift registers, though I would expect the effect to be marginal due to the magnitude of the current.

#### LED Current

![[Pasted image 20231107195041.png]]
![[Pasted image 20231107195121.png]]

Once again, we see correct behaviour of this switch, with current passing when the shift register is pulled `LOW` and the driver load sinking current—and current ceasing to flow once the shift register is pulled `HIGH`. We do observe a slower off-transition in this case however, as the gate voltage takes a few microseconds to charge back up—but this effect is negligible.

I am simulating with the `IRF7205` fast switching MOSFET due to its low on resistance of $70\,\text{m}\Omega$, its drain current $I_\text{D} = -4.6\,\text{A}$ being sufficient to pass my $1.575\,\text{A}$, and its logic-level gate threshold voltage.

The low on resistance of this FET gives a power dissipation of
$$
\begin{align}
P_\texttt{M1} & = I^2R \\[0.75em]
& = 1.575^2 \times 0.07 \\[0.75em]
& = 174\,\text{mW}
\end{align}
$$
which should be no issue at all.

![[Pasted image 20231107200323.png]]

This is also verified by the simulation.

I will move forward with this design, and do a parts selection for a suitable [[P-Channel MOSFETs|P-Channel MOSFET]], before verifying the final circuit in [[LTspice]].

### Selected [[SIL2301-TP]] Device

Simulating the selected [[SIL2301-TP]] device with an added gate-source pull-up resistor, I see exactly what I would expect to see.

![[Pasted image 20231108013641.png]]
![[Pasted image 20231108013752.png]]
![[Pasted image 20231108013808.png]]
![[Pasted image 20231108013834.png]]

I will now need to select the part numbers for my gate in-rush limiting and gate pull-up [[resistors]]. As these resistors are used in a low-power, low-precision application, their values/characteristics are not critical.

![[Pasted image 20231109180808.png]]
![[Pasted image 20231109180828.png]]
![[Pasted image 20231109180935.png]]

I will also move the gate pull-up resistor to be on the shift register side, to reduce the pull-up effect when the signal is being driven `LOW`. I see that, without the pull-up resistor, the gate is pulled down to the `LOW`-level output of the shift register of $250\,\text{mV}$, but, the previous arrangement increased this to $300\,\text{mV}$. Moving the pull-up resistor, I see a better `LOW`-level input voltage of $252\,\text{mV}$.

For BOM consolidation reasons, I will reuse the $10\,\text{k}\Omega$ pull-up resistor for the [[Shift Registers]], instead of the $100\,\text{k}\Omega$ resistor.
