<!--
.. title: TIL: Energy use per transaction for cryptocurrencies vs Visa
.. slug: til-cryptocurrency-per-transaction-energy-use
.. date: 2021-05-13 16:09:33 UTC-05:00
.. tags: til,cryptocurrency,chia
.. category: 
.. link: 
.. description: 
.. type: text
-->

For my own calibration, approximate current energy use for a single transaction
in various cryptocurrencies, compared with using Visa:

| Currency&nbsp; | Symbol&nbsp; | Energy use<br>per txn(Wh)&nbsp; | Equivalent |
---------------- | ------------ | -------------------------------:| ---
| Bitcoin        | BTC          | 1,000,000&nbsp;                 | Hot tub, 150 hours
| Ethereum       | ETH          |    62,000&nbsp;                 | Nissan Leaf, 1.5 charges
| Litecoin       | LTC          |    19,000&nbsp;                 | Clothes washer, 8 loads
| Chia           | XCH          |     2,000&nbsp;                 | Dishwasher, 1 hour
| Cardano        | ADA          |       500&nbsp;                 | Computer & monitor, 1 hour
| Dogecoin       | DOGE         |       120&nbsp;                 | Humidifier, 1 hour
| Ripple         | XRP          |        79&nbsp;                 | Amazon echo telling 2 jokes
| **Visa**       |              |         1.5&nbsp;               | LED light bulb for 9 minutes
| Nano           | NANO         |         0.1&nbsp;               | LED light bulb for 30 seconds

<br />
Sources

* I got most crypto energy use from
  [this roundup](https://www.benzinga.com/markets/cryptocurrency/21/05/21098323/elon-musk-says-tesla-looking-at-other-cryptos-who-use-less-than-1-of-bitcoins-energy-which).
* For Visa, I used the figures from [this breakdown](https://digiconomist.net/bitcoin-energy-consumption),
  and [this one](https://digiconomist.net/bitcoin-energy-consumption), which agrees.
* For Bitcoin, I took a rounded figure roughly between those quoted on the
  above two sources (710kWh and 1,123kWh). A single figure precision is
  probably most appropriate anyhow. **Update**: The digiconomist article above
  is updated as the bitcoin energy use increases over time with proof
  difficulty, and it's now at almost double the figure I quoted above,
  at 1,800 kWh/txn.
* For Chia, I did my own hacky calculation.
  [Chia Power estimates 6MW](https://chiapower.org/)
  in total is used by the Chia network, at current size of 4EiB.
  Meanwhile, [Chia Explorer shows a hard-to-read graph](https://www.chiaexplorer.com/charts/transaction-volume)
  which I'm eyeballing to get a rough average of 3,000 transactions per hour.
  6 Megawatts divided by 3k per hour gives an energy use per transaction
  of 2kW.
* For Nano, I'm using commonly-cited figures in
  [Reddit posts](https://www.reddit.com/r/nanocurrency/comments/7ucw1a/the_entire_nano_network_is_so_efficient_that/)
  (yuk), but the math seems to hold up as far as I can see.
* For equivalent household energy uses, I used
  [this](https://electricityplans.com/kwh-kilowatt-hour-can-power/) and [this](http://www.wrecc.com/what-uses-watts-in-your-home/).

Notable standout here is NANO, which actually has an order of magnitude *lower*
energy use than Visa. There are other low-energy use cryptocurrencies in this
bracket, such as IOTA and HBAR. They face some criticism from bitcoin
maximalists that reducing energy use undermines the value proposition, or
reduces security. But to my layman's ears, these arguments don't hold water.
Certainly communities like NANO seem much more open to honest discussion of
NANO's shortfalls than most crypto communities, which is a healthy sign, and it
makes me inclined to trust their counter-assertions that NANO's security is
really ok.

Something's not quite right here though. The Chia whitepaper estimates 10,000
times better energy efficiency than Bitcoin, by my figures above only show
1,000.

They probably know how to calculate this better than I do. So perhaps my figure
for Chia is high? I understand the value per transaction will come down as
Chia starts handling more transactions, which seems reasonable. Perhaps the
white paper refers to that future hypothetical efficiency?

On the other hand, many of the other cryptocurrencies listed above will
become more efficient in the future too (e.g. Bitcoin is in the process
of deploying its lightning network, which will reduce per transaction
energy use.)  So I think it's fair to leave the above figures as they are,
as a snapshot of current reality.

