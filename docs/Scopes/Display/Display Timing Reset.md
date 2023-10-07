#5e5ce6/projects 

# Display Timing Repeat

> [!quote] Datasheet Description
> - When disabled, the `GS` counter is not reset and no outputs are forced off even if a `GSLAT` rising edge is input. In this mode, the `XBLNK` signal should be input after the PWM control of all LEDs is finished.
> - When enabled, the `GS` counter is reset to `0` and all outputs are forced off at the `GSLAT` rising edge for a `GS` data write. PWM control starts again from the next input `GSCKR`, `GSCKG`, or `GSCKB` rising edge.

> [!check] Enabled
> - Yes, I do want this, as I will not need to manually input the `XBLNK` pin before latching data—it is one less pin I need to worry about
