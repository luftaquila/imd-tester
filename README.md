# IMD Tester

Insulation-fault simulator for verifying Insulation Monitoring Devices (IMD): switches a known resistance between an HV rail and chassis to confirm the IMD trips at its rated threshold. Uses a FNIRSI LCR-ST1 as the ohmmeter.

## Threshold

```
R_th = 250 Ω/V × U_max
```

## Bill of materials

| # | Item | Spec | Qty |
| - | ---- | ---- | --- |
| 1 | LA42DWQ-22 pot | 200 kΩ, 22 mm panel | 1 |
| 2 | Banana jack, 4 mm | red + black, Ø8 mm hole | 2 |
| 3 | Banana cable | red/black pair, clip leads | 1 |
| 4 | MTS-203 toggle | DPDT, ON-OFF-ON, 6 mm bushing | 1 |
| 5 | FNIRSI LCR-ST1 | tweezer LCR meter | 1 |
| 6 | 3D-printed housing | shell + baseplate + button (`housing.scad`) | 1 set |
| 7 | M2 self-tapping screw | ~6 mm, pan/cap head | 4 |

## Circuit

- Pot as rheostat (W + CCW; CW tied to W).
- DPDT toggle routes both pot terminals to one destination:
  - **MEASURE** — LCR-ST1 terminals (set R, HV-isolated)
  - **OFF** (centre) — all open
  - **TEST** — banana jacks (to system)

| Toggle | Net |
| ------ | --- |
| COM A / COM B | pot W / pot CCW |
| MEASURE | LCR pad 1 / pad 2 |
| TEST | banana RED / BLACK |

Verify lever→lug mapping and that centre is fully open with a multimeter.

## Procedure

1. **OFF**, cable disconnected.
2. **MEASURE** — set knob to R_th, read on LCR-ST1.
3. **OFF**.
4. Connect RED → HV, BLACK → chassis/GLV.
5. **TEST** briefly; observe IMD response.
6. **OFF**, then disconnect.

## Safety

- Set the resistance in MEASURE (HV-isolated); only TEST connects to the system.
- TEST applies the resistance across live HV — follow HV work procedures.

## Housing (`housing.scad`)

Parametric, 3 printed parts. The LCR-ST1 docks face-up (screen through the top window), inserted from the open bottom; the baseplate closes it with 4 corner M2 self-tapping screws.

- **shell** — top panel + walls; holes for pot (Ø22.5 + anti-rotation notch), toggle (Ø6.2), 2 banana jacks (Ø8, 30 mm pitch), USB-C, display window (bezel + lip); captive-button pocket; 2 banana-plug parking sockets embedded in the front (−Y) face, bottom-right (grip the Ø9×12 plug body + Ø4 pin).
- **baseplate** — fits inside the walls; central LCR support post; 4 recessed M2 clearance holes (Ø1.75 pilot in the shell bosses).
- **button** — captive plunger pressing the LCR power button.

```bash
openscad -D 'part="shell"'     -o shell.stl     housing.scad
openscad -D 'part="baseplate"' -o baseplate.stl housing.scad
openscad -D 'part="button"'    -o button.stl    housing.scad
```

Other `part` values: `preview`, `assembly`, `interference`. Edit the parameter block to match measured parts before printing.
