#5e5ce6/projects 

# Capacitors

I will approach my capacitor selection similarly as to that for my [[Resistors]]—I will use a DigiKey parametric search.

I know that the primary application in this project will be for decoupling capacitors, and not much filtering/analogue. Consequently, I expect that my requirements are fairly relaxed, as I do not require extreme tolerances/stability/accuracy.

I would also expect the operating profile to be fairly low-calibre, as I do not expect this board to be used in extreme temperatures or otherwise demanding environments. With that said however, I will likely still need to consider operating temperatures due to the power dissipation of the components on the board.

With this considerations in mind, I will primarily focus on Class II MLCC capacitors, and specifically `X7R` type MLCCs. Due to the nature of my application, I will need to carefully consider capacitance degradation with respect to the applied DC bias voltage. For any filters/oscillator load capacitances, I will look at Class I `C0G` or `NP0` capacitors for their constant DC voltage and temperature response.

Unlike my search for [[Resistors]] however, in this case I will place less direct emphasis on a specific family of devices, in order to facilitate more application-specific decisions.

Applying a basic search filter to only parts that are:
1. surface mount,
2. in stock,
3. available as Cut Tape,
4. active product status, and
5. have a datasheet,
I narrow down the product selection from over 800 thousand to 36 thousand.

Sorting by stock quantity in descending order, I see that the most stocked manufacturers are:
- Murata
- Samsung
- YAGEO
- KYOCERA AVX
- Walsin

I see that the YAGEO [Commodity Multilayer Ceramic Capacitor](https://www.digikey.co.nz/en/product-highlight/y/yageo/commodity-multilayer-ceramic-capacitors-cc-series) series includes `NP0`, `X7R`, `X5R`, and `Y5V` type capacitors, such that I may just be able to stay within this one family. For purely aesthetic reasons, I also note that these YAGEO capacitors are the only black/grey devices compared to the typical brown/orange of the other manufacturers, which may look better on my black [[PCB]], and also means that I can have all my resistors/capacitors from one manufacturer.

Looking at Samsung's line of [MLCCs]([Multi-Layer Capacitors - Samsung Electro-Mechanics | DigiKey](https://www.digikey.co.nz/en/product-highlight/s/samsung-electromech/multi-layer-ceramic-capacitors)), I see that this series only includes Class II type capacitors, and no Class I offerings—unlike the YAGEO series—but *does* include capacitances up to $200\,\micro\text{F}$, unlike the maximum capacitance of $100\,\micro\,\text{F}$ from YAGEO—but I do not expect this to be a problem as I do not expect to need capacitances this high (at least from an MLCC).

> [!success] Preferred Series
> I will use devices from the YAGEO [`CC`](https://www.yageo.com/en/Product/Index/mlcc) general purpose multi-layer ceramic capacitor series.
