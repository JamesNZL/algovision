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

![[Pasted image 20231121012136.png]]

![Figure 2 of Analog Dialogue 50-02](https://www.analog.com/-/media/images/analog-dialogue/en/volume-50/number-1/articles/ferrite-beads-demystified/ferrite-beads-fig02.png?imgver=2)

Plotting the magnitude response in [Desmos](https://www.desmos.com/calculator/2eojibsjul), I see a plot that is very similar to `Figure 2` of [Analog Dialogue 50-02](https://www.analog.com/media/en/analog-dialogue/volume-50/number-1/articles/ferrite-beads-demystified.pdf), which is quite encouraging. I do see that although exact values are wrong (the $y$-axis value is off by many orders of magnitude), the general shape of the response is correct. Interestingly, if I reduce the order of the $-\omega^3$ term in the imaginary term to $-\omega^2$, the plot becomes *much* closer to the 'expected' value, as seen in the screenshot below.

![[Pasted image 20231121012434.png]]

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

semilogx(w, squeeze(mag));
```

![[Pasted image 20231121011719.png]]

Using [[MATLAB]] to plot the impedance response of my ferrite bead model with respect to frequency in order to validate my [[Ferrite Beads#Analytical|analytical]] working, I again see a plot that is very similar to that of the [Analog Dialogue 50-02](https://www.analog.com/media/en/analog-dialogue/volume-50/number-1/articles/ferrite-beads-demystified.pdf) article, and to my Desmos plots.

### Frequency Response

![[Pasted image 20231120171814.png]]

I see that increasing the inductance will pull the 

> [!todo]

## Implementation

### References

- [Ferrite Beads Demystified | Analog Devices](https://www.analog.com/en/analog-dialogue/articles/ferrite-beads-demystified.html)
- [How Do Ferrite Beads Work and How Do You Choose the Right One? | PCB Design Blog | Altium](https://resources.altium.com/p/how-do-ferrite-beads-work-and-how-do-you-choose-right-one)
- [Everything You Need to Know About Ferrite Beads | Altium](https://resources.altium.com/p/everything-you-need-to-know-about-ferrite-beads)


