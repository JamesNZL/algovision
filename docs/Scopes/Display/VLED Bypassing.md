#5e5ce6/projects 

# $V_\text{LED}$ Bypasing

The datasheets for the [`TLC5947`](https://www.ti.com/lit/ds/symlink/tlc5947.pdf) and [`TLC5955`](https://www.ti.com/lit/ds/symlink/tlc5955.pdf) (both TI parts related to my selected [[TLC5951DAP]]) state that
> [!quote]
> several electrolytic capacitors must be placed on the board equally distributed to get a well regulated LED supply voltage ($V_\text{LED}$). The $V_\text{LED}$ voltage ripple must be less than $5\%$ of its nominal value.

I will hence need to select the correct value of electrolytic [[Capacitors]] to bypass this LED supply voltage.

As with my [[Current Amplifier]] design, I will use [[LTspice]] to help me validate my design.

I know that
- each row is conducting with [[Minimum Data Frequency]]
- it charges back up when the row is not conducting? In reality, it is a DC supply? If PD, should not drop??
