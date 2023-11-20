#5e5ce6/projects 

# Ferrite Beads

As I have not used ferrite beads before, I want to first understand how to use them properly & select an appropriate part.

## Theoretical Analysis

I will begin by using [[LTspice]] to analyse an equivalent model.

![[Pasted image 20231120171100.png]]

I see that the ferrite bead acts as type of band-reject filter, where it attenuates high-frequency signals until the reactance of the parallel capacitor dominates and begins to act as a short circuit.

### Impedance

I will first derive the impedance of the equivalent model in the $s$ domain, to help myself visualise the frequency response of the ferrite bead.

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

### Frequency Response

![[Pasted image 20231120171814.png]]

I see that increasing the inductance will pull the 
