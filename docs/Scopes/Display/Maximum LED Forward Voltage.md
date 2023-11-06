#5e5ce6/projects 

# Maximum LED Forward Voltage

> [!question]
> What is the maximum LED forward voltage I need to accommodate?
> What should I use as the LED supply voltage?

The maximum forward voltage of my selected [[RS-1515MBAM]] LEDs is $3.4\,\text{V}$.

Consequently, I have the inequality
$$
\begin{align}
V_\text{LED} & > 3.4 + 0.4 \\[0.75em]
& > 3.8\,\text{V}
\end{align}
$$

I suspect it will be easiest to supply
$$
V_\text{LED} = 5\,\text{V}
$$
as I can directly negotiate this voltage from the [[USB Power Delivery]] supply.

> [!todo] Power Supply Regulation
> The $V_\text{LED}$ must be set to the voltage calculated by
> $$
> V_\text{LED} \gt V_\text{F}+0.4\,\text{V}
> $$