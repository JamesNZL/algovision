#5e5ce6/projects 

# Minimum Data Frequency

> [!question]
> What is the minimum drive for a $60\,\text{Hz}$ refresh rate?

For a display refresh frequency of $f_{\text{refresh}} \geq 60\,\text{Hz}$, I must scan through all $21$ rows $60$ times a second. This gives me a minimum row frequency of
$$
\begin{align}
f_\text{row refresh} & \geq f_\text{refresh}\times n_\text{rows} \\[0.5em]
& \geq 60\times 21 \\[0.5em]
& \geq 1260\,\text{Hz}
\end{align}
$$

This tells me that I must display a new row at least $1260$ times a second, or, taking the reciprocal for the maximum period that each row may be on
$$
\begin{align}
t_{row} & \lt \frac{1}{f_\text{refresh} \times n_\text{rows}} \\[0.75em]
& \lt \frac{1}{1260}\\[1em]
& \lt 0.7937\,\text{ms}
\end{align}
$$

I am interested in finding both a reasonable minimum data drive frequency for my LED drivers, as well as a reasonable minimum PWM greyscale frequency. I will first focus on the data drive frequency, by making the assumption that, within the $0.8\,\text{ms}$ I have for each row before progressing to the next, the time taken to configure the output for that row should be significantly less than the on time for the pixels—ie $t_\text{row setup} \ll t_\text{row}$. Making the assumption that this 'significantly less than' is an order of magnitude (acknowledging that this setup can be done whilst the previous row is still being shown), we find that
$$
\begin{align}
t_\text{row setup} & \lt \frac{t_\text{row}}{10} \\[0.75em]
& \lt \frac{\frac{1}{f_\text{refresh}\times n_\text{rows}}}{10} \\[0.75em]
& \lt \frac{1}{10\times f_\text{refresh}\times n_\text{rows}} \\[0.75em]
& \lt \frac{1}{12600}\\[1em]
& \lt 79.37\,\micro\text{s}
\end{align}
$$

This tells us that all serial data to configure each row before it can be displayed must be completed in less than $80\,\micro\text{s}$. Consulting the datasheet for the `TLC5951`, we see in the timing diagram below that, for five drivers, it takes
$$
\begin{align}
t_{\text{row setup}} & = \left(\left(288\times n_\text{drivers}\right)\times \frac{1}{f_\text{clk}}\right) + T_\text{SU3} + t_\text{D6} \\[0.75em]
& = \frac{288 \times n_\text{drivers}}{f_\text{clk}} + 100\,\text{ns} + 140\,\text{ns}
\end{align}
$$
![tim_gs_bvs127.gif (979×811)](https://www.ti.com/ods/images/SBVS127E/tim_gs_bvs127.gif)

This gives the inequality
$$
\begin{align}
\frac{1}{10\times f_\text{refresh}\times n_\text{rows}} & \gt t_\text{row setup}\\[0.75em]
\frac{1}{10\times f_\text{refresh}\times n_\text{rows}} & \gt \frac{288\times n_\text{drivers}}{f_\text{clk}} + 240\,\text{ns} \\[0.75em]
\frac{1}{10\times f_\text{refresh}\times n_\text{rows}} - 240\,\text{ns} & \gt \frac{288\times 5}{f_\text{clk}} \\[0.75em]
f_\text{clk} & \gt \frac{1440}{\frac{1}{10 \times f_\text{refresh} \times n_\text{rows}} - \left(240\times 10^{-9}\right)} \\[1em]
& \gt 18.200\,\text{MHz}
\end{align}
$$

This tells me that, in order to achieve a refresh rate of $f_\text{refresh} \geq 60\,\text{Hz}$ with my $1:21$ scan rate, I will need a `GSSCK` data frequency of at least $18.200\,\text{MHz}$. This is encouraging, as the selected `TLC5951` driver supports up to $30\,\text{MHz}$, affording me roughly a factor of $2$ within which to find an optimal balance between refresh rate/visual flicker and signal integrity/computational demand.

Taking this maximum $30\,\text{MHz}$ data drive frequency to find the maximum achievable refresh rate $f_\text{refresh}$, we find
$$
\begin{align}
\frac{1}{10\times f_\text{refresh}\times n_\text{rows}} & \gt \frac{288 \times n_\text{drivers}}{f_\text{clk}} + 240\,\text{ns} \\[0.75em]
\frac{1}{10\times n_\text{rows}\times \left(\frac{288 \times n_\text{drivers}}{f_\text{clk}}+240\,\text{ns}\right)} & \gt f_\text{refresh} \\[0.75em]
f_\text{refresh} & \lt \frac{1}{10\times 21 \times \left(\frac{1440}{30\times 10^6}+\left(240\times 10^{-9}\right)\right)}\\[1em]
& \lt 98.71\,\text{Hz}
\end{align}
$$

This is encouraging, as it tells me that my matrix topology/scan regime should be practical to produce a flicker-free display. I should also remember that I can make my data transmission into the common shift register as soon as I have latched the previous data. Assuming that the data transmission can instead take half of the time that each row is displayed instead of $\frac{1}{10}$, we find the corresponding maximum refresh rate to be
$$
\begin{align}
f_\text{refresh} & \lt \frac{1}{2\times 21 \times \left(\frac{1440}{30\times 10^6}+\left(240\times 10^{-9}\right)\right)}\\[1em]
& \lt 493.56\,\text{Hz}
\end{align}
$$
with a corresponding data drive frequency of
$$
\begin{align}
f_\text{clk} & \gt \frac{1440}{\frac{1}{2 \times f_\text{refresh} \times n_\text{rows}} - \left(240\times 10^{-9}\right)} \\[1em]
& \gt 3.631\,\text{MHz}
\end{align}
$$

For completeness, to find a reasonable minimum PWM greyscale frequency, I will make the assumption that I want at least an `8-bit` ($256$ counts) resolution to my PWM counter. This requires $256$ intervals over the period for which each row is on, ie
$$
\begin{align}
t_\text{greyscale} & \lt \frac{t_\text{row}}{256} \\[0.75em]
& \lt \frac{\frac{1}{f_\text{refresh}\times n_\text{row}}}{256} \\[0.75em]
& \lt \frac{1}{256\times f_\text{refresh} \times n_\text{row}} \\[0.75em]
f_\text{greyscale} & \geq \frac{1}{t_\text{greyscale}} \\[1em]
& \geq 256 \times f_\text{refresh} \times n_\text{row} \\[0.5em]
& \geq 256\times 60\times 21 \\[0.5em]
& \geq 322.56\,\text{kHz}
\end{align}
$$

This is again encouraging, and suggests to me that I am likely to be able to make use of the auto display repeat mode as I am likely to be driving the PWM greyscale clock at a significantly faster rate.