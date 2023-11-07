#5e5ce6/projects 

# P-Channel MOSFETs

According to the final [[Layout Design]], I will need 21 transistors—one for each row. Each of these transistors must be capable of passing a maximum of $1.575\,\text{A}$ as calculated in [[Current Amplifier]], and support a $V_\text{DS} \leq -5\,\text{V}$ as per [[Maximum LED Forward Voltage]].

I will use a parametric search on DigiKey for [single FETs](https://www.digikey.co.nz/short/tvbtnvf7) and [FET arrays](https://www.digikey.co.nz/short/3q00dffm).

Ideally, I want to try and avoid `SOT23` packages, as I suspect they will be a tad frustrating to layout & route—as one transistor is needed for each shift register pin. This makes a device like the [SSM6J422TU](https://www.digikey.co.nz/en/products/detail/toshiba-semiconductor-and-storage/SSM6J422TU-LF/10380003) look attractive, but, even this device spans across three pins' worth (with the same $0.65\,\text{mm}$ pitch as my [[SN74HCS594PWR]] shift registers)—such that the $1\,\text{mm}$ of length difference versus a `SOT23` may be negligible.

I could then go for an array like the [`SIL2301-TP`](https://www.digikey.co.nz/en/products/detail/micro-commercial-co/SIL2301-TP/9655969), which packs two MOSFETs into (roughly) the same physical footprint. The pinout also looks quite convenient—I can short the two sources together to $V_\text{LED}$, and the gate input pins are all on opposite sides to the drain output pins.
![[Pasted image 20231107235825.png]]
This `SIL2301-TP` device also has less gate charge & input capacitance of $5.5–10\,\text{nC}$ & $405\,\text{pF}$ versus the slightly lower $R_\text{DS(on)} = 83\,\text{m}\Omega$, more expensive [`PJS6801`](https://www.digikey.co.nz/en/products/detail/panjit-international-inc/PJS6801-S1-00001/15798788), which has $15\,\text{nC}$ gate charge & $644\,\text{pF}$ input capacitance. The `SIL2301-TP` actually has a lower typical $R_\text{DS(on)}=58\,\text{m}\Omega$, but higher maximum of $90\,\text{m}\Omega$.

The [`SSM6P816R`](https://www.digikey.co.nz/en/products/detail/toshiba-semiconductor-and-storage/SSM6P816R-LF/17873890) is a Toshiba dual PMOS device with an exceptionally low typical $R_\text{DS(on)} = 23.0\,\text{m}\Omega$ at $4.5\,\text{V}$, but has a high gate charge & input capacitance, and has an inconvenient pinout.

The [`FDC6318P`](https://www.digikey.co.nz/en/products/detail/onsemi/FDC6318P/979787) is a pin-compatible part with the `SIL2031-TP`, but has *slightly* worse specifications across the board, and is more expensive.

In terms of single-device parts, the most attractive are:
1. [`DMP2165UW-7`](https://www.digikey.co.nz/en/products/detail/diodes-incorporated/DMP2165UW-7/9769986) with $2.5\,\text{A}$, $90\,\text{m}\Omega$, $3.5\,\text{nC}$, and $335\,\text{pF}$;
2. [`SSM3J327R`](https://www.digikey.co.nz/en/products/detail/toshiba-semiconductor-and-storage/SSM3J327R-LF/5403442) with $3.9\,\text{A}$, $93\,\text{m}\Omega$, $4.6\,\text{nC}$, and $290\,\text{pF}$; and
3. [`NXV75UPR`](https://www.digikey.co.nz/en/products/detail/nexperia-usa-inc/NXV75UPR/13898629) with $1.8\,\text{A}$, $90\,\text{m}\Omega$, $6.3\,\text{nC}$, and $330\,\text{pF}$.

> [!success] Preferred Device
> The best device appears to be the [`SIL2301-TP`](https://www.digikey.co.nz/en/products/detail/micro-commercial-co/SIL2301-TP/9655969), with its electrical characteristics & physical package/pinout.
