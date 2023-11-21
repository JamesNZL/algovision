#5e5ce6/projects 

# Ferrite Beads

As I have not used ferrite beads before, I want to first understand how to use them properly & select an appropriate part.

## Theoretical Analysis

I will begin by using [[LTspice]] to analyse an equivalent model.

![[Pasted image 20231120171100.png]]

I see that the ferrite bead acts as type of band-reject filter, where it attenuates high-frequency signals until the reactance of the parallel capacitor dominates and begins to act as a short circuit.

### Impedance Transfer Function

I will first derive the transfer function for the impedance of the equivalent model in the $s$ domain, to help myself visualise the frequency response of the ferrite bead.

#### Analytical

![[Pasted image 20231120173120.png]]

Taking the circuit into the Laplace domain, I see that I simply have three impedances in parallel, in series with $R_\text{s}$. The equivalent impedance is therefore derived as (assuming steady-state, ie zero initial conditions)
$$
\begin{align}
Z & = R_\text{s} + \left(\frac{1}{sC_\text{par}} \parallel sL_\text{bead} \parallel R_\text{AC}\right) \\[0.75em]
 & = R_\text{s} + \left( \frac{1}{sC_\text{par} + \frac{1}{sL_\text{bead}} + \frac{1}{R_\text{AC}} }\right) \\[0.75em]
 & = R_\text{s} + \left( \frac{sL_\text{bead}R_\text{AC}}{ s^2C_\text{par}L_\text{bead}R_\text{AC} + R_\text{AC} + sL_\text{bead} } \right) \\[0.75em]
 & = R_\text{s} + \frac{sL_\text{bead}R_\text{AC}}{s^2\left(C_\text{par}L_\text{bead}R_\text{AC}\right) + sL_\text{bead} + R_\text{AC}}
\end{align}
$$

Letting $s=j\omega$, I find
$$
\begin{align}
Z &= R_\text{s} + \frac{j\omega L_\text{bead}R_\text{AC}}{j^2\omega^2\left(C_\text{par}L_\text{bead}R_\text{AC}\right) + j\omega L_\text{bead} + R_\text{AC}} \\[0.75em]
&= R_\text{s}+\frac{j\omega L_\text{bead}R_\text{AC}}{-\omega^2\left(C_\text{par}L_\text{bead}R_\text{AC}\right) + j\omega L_\text{bead} + R_\text{AC}} \\[0.75em]
&= R_\text{s} + \frac{j\omega L_\text{bead}R_\text{AC}}{\left(R_\text{AC} - \omega^2C_\text{par}L_\text{bead}R_\text{AC}\right) + j\left(\omega L_\text{bead}\right)}\\[0.75em]
\end{align}
$$

Let $D$ be the denominator term, that is
$$
D = \left(R_\text{AC} - \omega^2C_\text{par}L_\text{bead}R_\text{AC}\right) + j\left(\omega L_\text{bead}\right)

$$

Combining the two terms into a single fraction, I have
$$
\begin{align}
Z &= \frac{R_\text{s}D}{D} + \frac{j\left(\omega L_\text{bead}R_\text{AC}\right)}{D}\\[0.75em]
&= \frac{R_\text{s}D + j\left(\omega L_\text{bead}R_\text{AC}\right)}{D} \\[0.75em]
&= \frac{R_\text{s}D + j\left(\omega L_\text{bead}R_\text{AC}\right)}{\left(R_\text{AC} - \omega^2C_\text{par}L_\text{bead}R_\text{AC}\right) + j\left(\omega L_\text{bead}\right)} \\[0.75em]
\end{align}
$$

Multiplying by the conjugate of the denominator $D$, ie $\overline{D}$, I have
$$
\begin{align}
Z &= \frac{R_\text{s}D + j\left(\omega L_\text{bead}R_\text{AC}\right) }{\left(R_\text{AC} - \omega^2C_\text{par}L_\text{bead}R_\text{AC}\right) + j\left(\omega L_\text{bead}\right)} \times \frac{\left(R_\text{AC} - \omega^2C_\text{par}L_\text{bead}R_\text{AC}\right) - j\left(\omega L_\text{bead}\right)}{\left(R_\text{AC} - \omega^2C_\text{par}L_\text{bead}R_\text{AC}\right) - j\left(\omega L_\text{bead}\right)}\\[0.75em]
&= \frac{\Bigl(R_\text{s}D + j\left(\omega L_\text{bead}R_\text{AC}\right) \Bigr) \Bigl(\left(R_\text{AC} - \omega^2C_\text{par}L_\text{bead}R_\text{AC}\right) - j\left(\omega L_\text{bead}\right)\Bigr)}{\left(R_\text{AC} - \omega^2C_\text{par}L_\text{bead}R_\text{AC}\right)^2 - j^2\left(\omega L_\text{bead}\right)^2} \\[0.75em]
&= \frac{   \Bigl(R_\text{s}R_\text{AC}D-\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}D-j\left(\omega L_\text{bead}R_\text{s}D\right)\Bigr)    +    \Bigl( j\left(\omega L_\text{bead}R_\text{AC}^2\right) - j\left( \omega^3C_\text{par}L_\text{bead}^2R_\text{AC}^2 \right)  - j^2\left( \omega^2L_\text{bead}^2R_\text{AC} \right)  \Bigr)     }{\left(R_\text{AC}^2 - 2\omega^2C_\text{par}L_\text{bead}R_\text{AC}^2+\omega^4C_\text{par}^2L_\text{bead}^2R_\text{AC}^2\right) + \left(\omega^2 L_\text{bead}^2\right)} \\[0.75em]
&= \frac{   R_\text{s}R_\text{AC}D-\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}D-j\left(\omega L_\text{bead}R_\text{s}D\right)    +    j\left(\omega L_\text{bead}R_\text{AC}^2\right) - j\left( \omega^3C_\text{par}L_\text{bead}^2R_\text{AC}^2 \right)  + \left( \omega^2L_\text{bead}^2R_\text{AC} \right)  }{\left(R_\text{AC}^2 - 2\omega^2C_\text{par}L_\text{bead}R_\text{AC}^2+\omega^4C_\text{par}^2L_\text{bead}^2R_\text{AC}^2\right) + \left(\omega^2 L_\text{bead}^2\right)} \\[0.75em]
&= \frac{  \Bigl(  \omega^2L_\text{bead}^2R_\text{AC} + R_\text{s}R_\text{AC}D-\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}D    \Bigr)    +   j\Bigl(       \omega L_\text{bead}R_\text{AC}^2  -\omega L_\text{bead}R_\text{s}D     -\omega^3C_\text{par}L_\text{bead}^2R_\text{AC}^2  \Bigr)   }{    \omega^4C_\text{par}^2L_\text{bead}^2R_\text{AC}^2 + \omega^2 L_\text{bead}^2 + R_\text{AC}^2 - 2\omega^2C_\text{par}L_\text{bead}R_\text{AC}^2    }
\end{align}
$$

Substituting $D$ back in, I get
$$
\begin{align}

Z &= \frac{  \Bigl(  \omega^2L_\text{bead}^2R_\text{AC} + R_\text{s}R_\text{AC}\Bigl(\left(R_\text{AC}-\omega^2C_\text{par}L_\text{bead}R_\text{AC}\right)+j\left(\omega L_\text{bead}\right)\Bigr)-\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}\Bigl(\left(R_\text{AC}-\omega^2C_\text{par}L_\text{bead}R_\text{AC}\right)+j\left(\omega L_\text{bead}\right)\Bigr)    \Bigr)    +   j\Bigl(       \omega L_\text{bead}R_\text{AC}^2  -\omega L_\text{bead}R_\text{s}\Bigl(\left(R_\text{AC}-\omega^2C_\text{par}L_\text{bead}R_\text{AC}\right)+j\left(\omega L_\text{bead}\right)\Bigr)     -\omega^3C_\text{par}L_\text{bead}^2R_\text{AC}^2  \Bigr)   }{    \omega^4C_\text{par}^2L_\text{bead}^2R_\text{AC}^2 + \omega^2 L_\text{bead}^2 + R_\text{AC}^2 - 2\omega^2C_\text{par}L_\text{bead}R_\text{AC}^2    } \\[0.75em]

&= \frac{  \Bigl(  \omega^2L_\text{bead}^2R_\text{AC} + R_\text{s}R_\text{AC}^2-\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}^2+j\left(\omega L_\text{bead}R_\text{s}R_\text{AC}\right)-\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}^2 + \omega^4C_\text{par}^2L_\text{bead}^2R_\text{s}R_\text{AC}^2-j\left(\omega^3C_\text{par} L_\text{bead}^2R_\text{s}R_\text{AC}\right)  \Bigr)  +   j\Bigl(       \omega L_\text{bead}R_\text{AC}^2  -\omega L_\text{bead}R_\text{s}      R_\text{AC}+\omega^3C_\text{par}L_\text{bead}^2R_\text{s}R_\text{AC}-j\left(\omega^2 L_\text{bead}^2R_\text{s}\right)     -\omega^3C_\text{par}L_\text{bead}^2R_\text{AC}^2  \Bigr)   }{    \omega^4C_\text{par}^2L_\text{bead}^2R_\text{AC}^2 + \omega^2 L_\text{bead}^2 + R_\text{AC}^2 - 2\omega^2C_\text{par}L_\text{bead}R_\text{AC}^2    } \\[0.75em]

&= \frac{  \Bigl(  \omega^2L_\text{bead}^2R_\text{AC} + R_\text{s}R_\text{AC}^2-\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}^2-\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}^2 + \omega^4C_\text{par}^2L_\text{bead}^2R_\text{s}R_\text{AC}^2  \Bigr) +   j\Bigl(       \omega L_\text{bead}R_\text{AC}^2 +\omega L_\text{bead}R_\text{s}R_\text{AC} -\omega L_\text{bead}R_\text{s}      R_\text{AC}+\omega^3C_\text{par}L_\text{bead}^2R_\text{s}R_\text{AC}  - \omega^3C_\text{par} L_\text{bead}^2R_\text{s}R_\text{AC}   -\omega^3C_\text{par}L_\text{bead}^2R_\text{AC}^2  \Bigr)  -j^2\left(\omega^2 L_\text{bead}^2R_\text{s}\right) }{    \omega^4C_\text{par}^2L_\text{bead}^2R_\text{AC}^2 + \omega^2 L_\text{bead}^2 + R_\text{AC}^2 - 2\omega^2C_\text{par}L_\text{bead}R_\text{AC}^2    } \\[0.75em]

&= \frac{  \Bigl(  \omega^2L_\text{bead}^2R_\text{AC} +\omega^2 L_\text{bead}^2R_\text{s} + R_\text{s}R_\text{AC}^2-\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}^2-\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}^2 + \omega^4C_\text{par}^2L_\text{bead}^2R_\text{s}R_\text{AC}^2  \Bigr) +   j\Bigl(       \omega L_\text{bead}R_\text{AC}^2 +\omega L_\text{bead}R_\text{s}R_\text{AC} -\omega L_\text{bead}R_\text{s}      R_\text{AC}+\omega^3C_\text{par}L_\text{bead}^2R_\text{s}R_\text{AC}  - \omega^3C_\text{par} L_\text{bead}^2R_\text{s}R_\text{AC}   -\omega^3C_\text{par}L_\text{bead}^2R_\text{AC}^2  \Bigr)   }{    \omega^4C_\text{par}^2L_\text{bead}^2R_\text{AC}^2 + \omega^2 L_\text{bead}^2  + R_\text{AC}^2 - 2\omega^2C_\text{par}L_\text{bead}R_\text{AC}^2    }



\end{align}
$$

Collecting like terms and simplifying, I have
$$
\begin{align}

Z &= \frac{  \Bigl(  \omega^4C_\text{par}^2L_\text{bead}^2R_\text{s}R_\text{AC}^2  + \omega^2L_\text{bead}^2R_\text{AC} +\omega^2 L_\text{bead}^2R_\text{s} + R_\text{s}R_\text{AC}^2-2\omega^2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}^2  \Bigr) +   j\Bigl(       \omega L_\text{bead}R_\text{AC}^2  -\omega^3C_\text{par}L_\text{bead}^2R_\text{AC}^2  \Bigr)   }{    \omega^4C_\text{par}^2L_\text{bead}^2R_\text{AC}^2 + \omega^2 L_\text{bead}^2 + R_\text{AC}^2 - 2\omega^2C_\text{par}L_\text{bead}R_\text{AC}^2    } \\[0.75em]

&= \frac{  \omega^4\left(C_\text{par}^2L_\text{bead}^2R_\text{s}R_\text{AC}^2\right)  + \omega^2\Bigl(L_\text{bead}^2\left(R_\text{AC} + R_\text{s}\right) - 2C_\text{par}L_\text{bead}R_\text{s}R_\text{AC}^2 \Bigr) + R_\text{s}R_\text{AC}^2    }{    \omega^4\left(C_\text{par}^2L_\text{bead}^2R_\text{AC}^2\right) + \omega^2\left( L_\text{bead}^2 - 2C_\text{par}L_\text{bead}R_\text{AC}^2 \right)   + R_\text{AC}^2   }  + \frac{ j\Bigl(       \omega L_\text{bead}R_\text{AC}^2  -\omega^3C_\text{par}L_\text{bead}^2R_\text{AC}^2  \Bigr) }{    \omega^4\left(C_\text{par}^2L_\text{bead}^2R_\text{AC}^2\right) + \omega^2\left( L_\text{bead}^2 - 2C_\text{par}L_\text{bead}R_\text{AC}^2 \right)   + R_\text{AC}^2   } \\[0.75em]


\end{align}
$$

![[Pasted image 20231121153742.png]]

![Figure 2 of Analog Dialogue 50-02](https://www.analog.com/-/media/images/analog-dialogue/en/volume-50/number-1/articles/ferrite-beads-demystified/ferrite-beads-fig02.png?imgver=2)

Plotting the magnitude response in [Desmos](https://www.desmos.com/calculator/2eojibsjul), I see a plot that is very similar to `Figure 2` of [Analog Dialogue 50-02](https://www.analog.com/media/en/analog-dialogue/volume-50/number-1/articles/ferrite-beads-demystified.pdf), which is quite encouraging. I do see that although exact values are wrong (the $y$-axis value is off by *many* orders of magnitude), the general shape of the response is correct. Interestingly, if I reduce the order of the $-\omega^3$ term in the imaginary term to $-\omega^2$, the plot becomes *much* closer to the 'expected' value, as seen in the screenshot below.

![[Pasted image 20231121153827.png]]

I am not fully certain whether this is an algebraic error in my working, or what else it may be—but I do not think it is valuable to spend too much time on this topic.

> [!summary]
> I see in this plot (where the $x$-axis is frequency, in $\text{MHz}$) that the ferrite bead presents a very low impedance at low frequencies, whilst the inductive reactance dominates. As the frequency increases, I see a resonant peak where the $R_\text{AC}$ resistive component dominates, where the ferrite bead impedance increases significantly—which would lead to a larger voltage drop and power dissipated across the ferrite bead as heat energy. As the frequency continues to increase further however, the capacitive reactance dominates, such that the ferrite bead returns to presenting a low impedance.
> 
> Again, I see the band-reject characteristic of the ferrite bead.

#### MATLAB

```matlab
%%% FerriteImpedance.m
% A MATLAB script to model the impedance response of a ferrite bead.
%
% Author: James Bao

%% Sanitise Workspace
clear;
close all;
clc;

fprintf("FerriteBead.m\n\n");

%% Model Parameters

% Series Resistance
Rs = 0.3;

% Parasitic Capacitance
Cpar = 1.678e-12;

% Bead Inductance
Lbead = 1.208e-6;

% AC Resistance
Rac = 1.082e3;

%% Transfer Function

X_Cpar = tf(1, [Cpar 0]);
X_Lbead = tf([Lbead 0], 1);

Z = Rs + (1 / ((1/X_Cpar) + (1/X_Lbead) + (1/Rac)));

%% Plot Frequency Response

[mag, phase, w] = bode(Z, {0.1e6, 100e9});

w = w / (2 * pi * 1e6); % Convert w to f

semilogx(w, squeeze(mag));

xlabel('Frequency (MHz)', 'FontSize', 24);
ylabel('Impedance (Ohms)', 'FontSize', 24);
title('Impedance Response of Ferrite Bead Model', 'FontSize', 28);
```

![[Pasted image 20231121153407.png]]

Using [[MATLAB]] to plot the impedance response of my ferrite bead model with respect to frequency in order to validate my [[Ferrite Beads#Analytical|analytical]] working, I see that I reproduce the exact plot seen in the [Analog Dialogue 50-02](https://www.analog.com/media/en/analog-dialogue/volume-50/number-1/articles/ferrite-beads-demystified.pdf) article, and very similar to my Desmos plots.

### Frequency Response

#### Inductance

![[Pasted image 20231120171814.png]]

![[Pasted image 20231121014847.png]]

I see that increasing the inductance will pull the crossover frequency lower, whilst decreasing it will push it higher.

#### Capacitance

![[Pasted image 20231121014944.png]]

![[Pasted image 20231121014954.png]]

I see identical behaviour when changing the capacitance; the crossover frequency is inversely proportional to the parasitic capacitance $C_\text{par}$.

#### Resistance

![[Pasted image 20231121015122.png]]

![[Pasted image 20231121015132.png]]

Finally, I see that the AC loss resistance $R_\text{AC}$ does not have an effect on the crossover frequency, but does affect the amount of attenuation within the rejection band. This is as I would expect, as I would expect the crossover frequency to be dependent only on the reactive elements—whilst $R_\text{AC}$ captures the impedance presented to signals within the reject-band—and consequently the voltage drop & power dissipated.

![[Pasted image 20231121015443.png]]

![[Pasted image 20231121015458.png]]

Finally, I see a similar scaling behaviour when changing the series resistor $R_\text{s}$, but this is applied to the entire response, rather than just within the rejection band. This is again as I would expect, as this series resistor cannot be reduced by a parallel reactive element; it always contributes to the total impedance regardless of frequency.

### $LC$ Filter

#### Undamped

![[Pasted image 20231121132001.png]]

Modelling a simple $LC$ filter network in [[LTspice]] with a somewhat arbitrarily selected ferrite bead connected to my [[Microcontroller#Decoupling]] capacitors, I see a frequency response with a significant resonant peak at $\approx 47\,\text{kHz}$. This immediately tells me to expect a significant overshoot/ringing when looking at the time-domain step response of this filter, such as if there were to be some switching noise at the input.

![[Pasted image 20231121131701.png]]

![[Pasted image 20231121132933.png]]

Adjusting the source to model some (very arbitrary, and very exaggerated) switching noise and performing a transient analysis, I see exactly that ringing at the output of my filter.

Simplifying the ferrite bead to be a pure inductor of reactance $sL$, I can derive the transfer function of the filter to be a simple impedance divider with gain
$$
\begin{align}
G=\frac{V_\text{o}}{V_\text{s}}&=\frac{\frac{1}{sC}}{\frac{1}{sC}+sL}\\[0.75em]
&= \frac{1}{1+s^sLC}
\end{align}
$$

Considering the general form of a second-order transfer function
$$
G(s)=\frac{\omega_\text{n}^2}{s^2+2\zeta\omega_\text{n}s+\omega_\text{n}^2}=\frac{1}{1+(\frac{2\zeta}{\omega_\text{n}})s+(\frac{1}{\omega_\text{n}^2})s^2}
$$
I immediately see that I have a system with a natural frequency $w_\text{n}$ where
$$
\omega_\text{n}=\sqrt{\frac{1}{LC}}
$$
and a damping ratio $\zeta$
$$
\zeta=0
$$

This tells me that this models an undamped system, which helps to explain why I see so much oscillation. Of course, I see that the real system is, in fact, damped, but I still see value in this idealised understanding. As explained in the Analog Dialogue article, this is because the resistive component $R_\text{AC}$ does not become significant until a certain frequency, below which the ferrite bead does indeed behave as an ideal inductor.

This also tells me that the resonant frequency occurs at the natural frequency $\omega_\text{n}$, that is
$$
\begin{align}
\omega &= 2\pi f \\[0.75em]
f_\text{resonance} &= \frac{\sqrt{\frac{1}{LC}}}{2\pi}
\end{align}
$$
Applying this to my model, I calculate a resonant frequency $f_\text{resonance}=43\,\text{kHz}$—which is very close to the observed resonant frequency in my simulations. I would indeed expect a slight deviation due to the inaccuracies of my idealised model.

#### Damped

I know from control theory that, in order to reduce the magnitude of the resonant peak in the frequency domain, I must increase the damping ratio $\zeta$. I can do this by inserting an additional resistive element to dissipate energy, which I will add in series with the inductor.

This gives me a new gain $G'$
$$
\begin{align}
G'&=\frac{\frac{1}{sC}}{\frac{1}{sC}+\left(sL+R\right)} \\[0.75em]
&=\frac{1}{1+s^2LC+sCR}
\end{align}
$$

I see that I now have a damping ratio given by
$$
\begin{align}
\frac{2\zeta}{\omega_\text{n}}&=CR\\[0.75em]
\zeta &= \frac{CR\sqrt{\frac{1}{LC}}}{2}
\end{align}
$$
such that
$$
\zeta \propto R
$$

Therefore, for my original circuit with parameters
$$
\begin{align}
L &= 12.4\,\micro\text{H} \\[0.75em]
C &= 1.1\,\micro\text{F} \\[0.75em]
\end{align}
$$
and a desired damping ratio
$$
\zeta = 0.7
$$
I compute a necessary resistance
$$
\begin{align}
R &= \frac{2\zeta}{C\sqrt{\frac{1}{LC}}} \\[0.75em]
& = 4.7\,\Omega
\end{align}
$$

![[Pasted image 20231121174348.png]]

![[Pasted image 20231121174420.png]]

Simulating the response of this damped $RLC$ filter in [[LTspice]], I indeed see that the resonant peak and ringing has been eliminated, and the overshoot significantly reduced. Great!

#### Cut-Off Frequency

I do however still see that the switching noise is still present—this tells me that the roll-off frequency of my filter is too high, and is not attenuating the frequencies of interest. I know that my arbitrary, artificial switching pulse has an on-time of $100\,\micro\text{s}$ with edges of $10\,\text{ns}$. I will first try to filter out the fundamental frequency of
$$
\begin{align}
f_\text{fundamental} &= \frac{1}{2\times 100\,\micro\text{s}} \\[0.75em]
& = 5\,\text{kHz}
\end{align}
$$

I will therefore try to place my new roll-off frequency $f_\text{roll-off}'$ one decade lower than this, that is
$$
\begin{align}
f_\text{roll-off}' = f_\text{resonance} & = \frac{\sqrt{\frac{1}{LC'}}}{2\pi} \\[0.75em]
& =1\,\text{kHz} 
\end{align}
$$
Assuming a fixed inductor value, I will derive an expression for the new capacitance $C'$ as
$$
\begin{align}
C'&= \frac{1}{L\left(2\pi f_\text{roll-off}'\right)^2} \\[0.75em]
& = 2.04\,\text{mF}
\end{align}
$$
and a new damping resistor
$$
R'=109\,\text{m}\Omega
$$

Although these component values (ie $C'$) are not necessarily realistic (stemming from the arbitrary simulation setup), I am mostly interested in learning the process and developing an intuition around such resonant systems, and particularly the importance of damping elements—as I have not really had to deal with this before.

![[Pasted image 20231121174703.png]]

![[Pasted image 20231121174609.png]]

I see that these new $C'$ and $R'$ values do indeed pull the roll-off frequency to the left, and lead to an *much* cleaner transient response.

#### Conclusions

> [!summary]
> From this exploration, I have learnt:
> - The $LC$ filter formed with a ferrite bead and capacitor produces a low-pass characteristic
> - Without sufficient damping, the filter can exhibit a resonant peak and cause significant ringing
> - The cut-off frequency must be carefully chosen to actually attenuate the high-frequency noise of interest, where the cut-off frequency is dependent on the ferrite bead

![[Pasted image 20231121191229.png]]

I see that, if I choose to implement a ferrite bead in my design, I should make sure to fit a DNP zero-ohm jumper across the ferrite bead (and potentially the damping resistor, depending on its magnitude), in case I find that it actually negatively impacts the circuit. This will produce a simple first-order $RC$ low-pass filter with a reduced $-20\,\text{dB/dec}$ roll-off, but no risk of resonance.

## Implementation

### References

- [Ferrite Beads Demystified | Analog Devices](https://www.analog.com/en/analog-dialogue/articles/ferrite-beads-demystified.html)
- [How Do Ferrite Beads Work and How Do You Choose the Right One? | PCB Design Blog | Altium](https://resources.altium.com/p/how-do-ferrite-beads-work-and-how-do-you-choose-right-one)
- [Everything You Need to Know About Ferrite Beads | Altium](https://resources.altium.com/p/everything-you-need-to-know-about-ferrite-beads)

> [!note]
> A *great* video about using an $LC$ filter network on an analogue supply pin—[Shall We Use a Ferrite Bead in Power Rail or Not? | Explained by Eric Bogatin - YouTube](https://www.youtube.com/watch?v=HaLMjVkKYMw)

