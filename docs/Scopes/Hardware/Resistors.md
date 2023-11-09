#5e5ce6/projects 

# Resistors

To select the resistors that I will use for this project, I will again perform a parametric search on DigiKey as in [[P-Channel MOSFETs]].

I will first just select a specific family/product line of resistors, within which I will order the values that I need.

Firstly, applying a search filter to only parts that are:
1. surface mount,
2. in stock,
3. available as Cut Tape,
4. active product status, and
5. have a datasheet,
I narrow down the product selection from over 1 million to 88 thousand.

I further filter the results by looking for resistors that are $\pm1\%$ tolerance or better, and sort by a pricing quantity of $50$ to avoid results where I would not satisfy the minimum order quantity.

In order to narrow down to a specific series, I will apply a further filter for an arbitrary resistance value—say $100\,\Omega$—such that I would get a single result from each product line. This narrows the selection down to just [105 results](https://www.digikey.co.nz/short/rnzd1jrd).

![[Pasted image 20231109174434.png]]

Sorting by price, I see that the top results are all effectively equivalent in their ratings, and all feature a thick film composition—the characteristics of which are definitely suitable for my application. I see that the series with the largest available stock quantity is the `RC_L` General Purpose Chip Resistor series from `YAGEO`, which are available in a wide variety of package sizes.

I intend to primarily use `0402` (imperial) size devices in this project—at least in the display section—which are available as both $1/16\,\text{W}$ and $1/8\,\text{W}$ devices and up to the `E96` series. I may decide to use larger `0603` or `0805` components in other sections of the board, which are available as $1/10\,\text{W}$ & $1/5\,\text{W}$ and $1/8\,\text{W}$ and $1/4\,\text{W}$ devices respectively.

> [!success] Preferred Series
> I will use devices from the YAGEO [`RC_L`](https://www.yageo.com/en/Product/Index/rchip/thick_film_general_purpose) thick film general purpose resistor series.
