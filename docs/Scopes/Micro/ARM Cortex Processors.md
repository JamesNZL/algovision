#5e5ce6/projects 

# ARM Cortex Processors

## Cortex-M

- 32-bit RISC ARM processor cores
- Optimised for cost and energy-efficient microcontrollers
- Variety of applications including IoT, industrial, and everyday consumer devices
- Based on the M-Profile Architecture that provides low-latency and a highly deterministic operation, for deeply embedded systems

> [!cite]
> Above is from the [ARM Cortex-M Processor Comparison Table](https://developer.arm.com/documentation/102787/latest).

> [!success] Selected Family
> The Cortex-M series of processors will be the family most suitable for this project.

Using the comparison table linked above, I will try to identify the specific Cortex-M processors that will be most suitable.

I will start by duplicating the comparison table features alongside my requirements.

| Feature                             | Evaluation                   | Remarks                                                                                                                                        |
| ----------------------------------- | ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Instruction Set Architecture        | Don't care                   |                                                                                                                                                |
| TrustZone for Armv8-M               | Not needed                   | Reduces the potential for attack by isolating the critical security firmware, assets, and private information from the rest of the application |
| Helium (M-Profile Vector Expansion) | Not needed                   | Significant performance uplift for ML and DSP applications                                                                                     |
| PACBTI Extension                    | Not needed                   | Pointer Authentication and Branch Target Identification—designed to mitigate Return- and Jump-Oriented Programming security exploit attacks    |
| FPU                                 | Would be nice; not essential | I don't expect to be doing much (if any) floating-point arithmetic                                                                             |
| DSP Extension                       | Not needed                   |                                                                                                                                                |
| Hardware Divide                     | Would be nice; not essential |                                                                                                                                                |
| Arm Custom Instructions             | Not needed                   | Framework to add custom hardware acceleration                                                                                                  |
| Coprocessor Interface               | Not needed                   |                                                                                                                                                |
| DMIPS/MHz                           | -                            | Measure of the number of Dhrystone benchmark operations that can be executed in a single clock cycle                                           |
| CoreMark/MHz                        | -                            |                                                                                                                                                |
| Maximum External Interrupts         | -                            | This will not be something I need to worry about (lowest number in the family is 32)                                                           |
| Maximum MPU Regions                 | Don't care                   | MPU is not essential                                                                                                                           |
| Main Bus                            | Don't care                   |                                                                                                                                                |
| Instruction Cache                   | Would be nice; not essential |                                                                                                                                                |
| Data Cache                          | Would be nice; not essential |                                                                                                                                                |
| Instruction TCM                     | Would be nice; not essential | Tightly-Coupled Memory—effectively the fastest non-cache memory                                                                                |
| Data TCM                            | Would be nice; not essential |                                                                                                                                                |
| Dual Core Lock-Step Configuration   | Not needed                   | DCLS—two identical processor cores running in parallel & executing the same instructions simultaneously—safety-critical systems                |
| Common Criteria Certification       | Not needed                   | Security certification                                                                                                                         | 

From the above table, I see that effectively any Cortex-M processor should suffice for my application, provided the specific microcontroller satisfies the rest of my [[Requirements]]. Noting the non-essential criterion however, I see that (at least for the non-secure cores) the M4 and M7 are most suitable, as these feature a FPU, hardware divide (the M3 also has hardware divide, but no FPU). The M7 additionally features an I- and D-cache and TCM, which may be appreciated for my [[Display]] [[Frame Buffers|frame buffers]], but I am sure are not *necessary*.

## Cortex-A

- 32-bit and 64-bit RISC ARM processor cores
- For devices undertaking complex compute tasks, such as hosting a rich operating system platform, and supporting multiple software applications
- Includes a memory management unit

> [!cite] Above is from the [ARM Cortex-A Processor Comparison Table](https://developer.arm.com/documentation/102826/latest).

## Cortex-R

- 32-bit and 64-bit RISC ARM processor cores
- Deliver fast and deterministic processing and high performance, while meeting challenging real-time constraints
- Optimised for hard real-time and safety-critical applications

> [!cite]
> Above is from the [ARM Cortex-R Processor Comparison Table](https://developer.arm.com/documentation/102788/latest/).
