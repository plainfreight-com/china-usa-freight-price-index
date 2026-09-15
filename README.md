# China to USA freight price index

Dated, real prices for shipping goods from China to the United States, published by
[Plain Freight](https://plainfreight.com) and free to cite.

Every figure is generated from the rate card that prices Plain Freight's own customer quotes.
Nothing in here is typed by hand, estimated, or averaged from other people's marketing pages,
which is the reason it exists: almost every published "China to USA shipping cost" figure is an
untraceable range.

Canonical page, with the method written next to the numbers:
**<https://plainfreight.com/data/china-usa-shipping-price-index>**

## What is in here

| File | Contents |
|---|---|
| `data/price-index-2026-09-15.csv` | 12 weight points, 0.5 kg to 1,000 kg: air total, air per kg, service, duty status, transit, and sea where sea is the cheaper option |
| `data/price-index-2026-09-15.json` | The same rows plus the method notes and the suggested citation sentence |
| `data/chargeable-weight-2026-09-15.csv` | 15 real carton shapes: volume, actual weight, volumetric weight at divisors 6000, 5000 and 4000, and what Plain Freight bills |

A new dated file is added when the rate card moves. Old files stay, because the point of a
series is that you can see what changed.

## The headline

On 15 September 2026, shipping **20 kg** of general goods from China to a US address door to
door, with US customs clearance and import duty included, cost **$299.20**, which is **$14.96
per kg**, and took 6 to 12 working days.

At the ends of the range: 0.5 kg cost $9.53 ($19.06/kg) and 1,000 kg cost $3,137.46 ($3.14/kg).
Small parcels cost the most per kg because every shipment carries the same fixed handling and
customs work.

## Method, in short

- **Lane:** China to the United States, supplier pickup to a US door, including export handling,
  freight, US customs clearance and delivery.
- **Goods:** general goods, meaning unbranded, no electronics, nothing restricted. Branded goods
  and anything with a battery or a screen price on separate channels and are not in this series.
- **Duty:** included on the door-to-door lanes and marked per row. From roughly 50 kg the cheaper
  lane is air consolidation, where the customs entry is included but the duty itself is paid at
  import, so a like-for-like comparison has to add duty back.
- **Chargeable weight:** the greater of actual weight and volume in cm³ divided by 6,000. Every
  row in the index is dense cargo, where the two are equal, so the table is a floor a bulky load
  can only exceed.
- **Not included:** cargo insurance (the customer arranges it), storage beyond the free period,
  customs exams, and any duty-rate change between quote and entry.
- **Honest limit:** one forwarder's rate card is not a market average. It is a real, buyable,
  dated price for small China to USA shipments, which is the number missing from most published
  guidance.

## Refresh it yourself

```bash
./scripts/refresh.sh
```

That pulls the current CSV and JSON straight from plainfreight.com into `data/`, named by the
date the prices were generated.

## Citation

> Air freight from China to the USA, door to door with US customs and import duty included, cost
> $299.20 for 20 kg ($14.96 per kg) on September 15, 2026, according to the Plain Freight China
> to USA Shipping Price Index.

Licensed [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/): use it anywhere, including in
a paid report or an AI answer, with attribution and a link.

Need a figure this series does not cover, for a specific product, carton size or lane? Ask and it
gets priced and published: hello@plainfreight.com

## Also on Hugging Face

The same data is published as a loadable dataset with two configs and a viewer:
[MelkonTech/china-usa-freight-price-index](https://huggingface.co/datasets/MelkonTech/china-usa-freight-price-index).

```python
from datasets import load_dataset
prices = load_dataset("MelkonTech/china-usa-freight-price-index", "price_index")
```

## Related

- [Chargeable weight reference](https://plainfreight.com/data/chargeable-weight-china-usa)
- [US import rules timeline](https://plainfreight.com/data/us-import-rules-timeline), every de
  minimis change since May 2025 with its Federal Register citation
- [Plain Freight MCP server](https://github.com/plainfreight-com/plainfreight-mcp), if you would
  rather have an AI assistant quote a real shipment than read a table
