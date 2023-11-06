#5e5ce6/projects 

# Maximum Output Constant-Current

> [!question]
> What is the maximum output constant-current per channel?
> What should I use as $R_\text{IREF}$?

I know that the maximum output constant-current per channel will be when that channel is full brightness, ie the [[uniformity]] dot correction bits are set to maximum, as well as the [[pixel brightness]] greyscale bits are set to maximum.

My selected [[RS-1515MBAM]] LEDs can sink an absolute maximum of $20\,\text{mA}$ forward current on the red channel, and $15\,\text{mA}$ on each of the green and blue channels.

I will not consider the maximum forward current of alternative LED packages here, as it will be trivial to change a single $R_\text{IREF}$ resistor in the event that I need to change 735 LEDs.

I will therefore design for a maximum per-channel constant sink-current of $I_\text{OLCMax} = 20\,\text{mA}$, such that the LED drivers implicitly aid in ensuring that the LED absolute maximum forward current limit is not violated. I additionally do not expect this to cause a range error, as I am doubtful that I will need to drive the LEDs near their maximum brightness.
$$
\begin{equation}
I_\text{OLCMax} = 20\,\text{mA}
\end{equation}
$$

As per the [[TLC5951DAP]] datasheet, this requires an external resistor given by
$$
\begin{align}
R_\text{IREF} & = \frac{V_\text{IREF}}{I_\text{OLCMax}} \times 40 \\[0.75em]
& = \frac{1.2}{0.020} \times 40 \\[1em]
& = 2.4\,\text{k}\Omega
\end{align}
$$
where $V_\text{IREF}$ is the internal reference voltage on the `IREF` pin, typically $1.2\,\text{V}$.

> [!todo] Maximum Current `IREF`
> Select the maximum constant sink-current value to be greater than the maximum continuous output current of each channel.