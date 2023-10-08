#5e5ce6/projects 

# Logos

| Filename                                   | Preview                                                                                                     | Remarks                                                                                                                   |
| ------------------------------------------ | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| [`logo.svg`](./logo.svg)                   | ![`logo.svg`](https://raw.githubusercontent.com/JamesNZL/algovision/main/assets/logo.svg)                   | The full original [[Illustrator]] design file.                                                                                            |
| [`logo-animated.svg`](./logo-animated.svg) | ![`logo-animated.svg`](https://raw.githubusercontent.com/JamesNZL/algovision/main/assets/logo-animated.svg) | An animated variant.                                                                                                      |
| [`logo-paths.svg`](./logo-paths.svg)       | ![`logo-paths.svg`](https://raw.githubusercontent.com/JamesNZL/algovision/main/assets/logo-paths.svg)       | A simplified monochrome variant with stroked paths instead of outlined compound clipping paths. Necessary for animations. |
| [`logo-cropped.svg`](./logo-cropped.svg)   | ![`logo-cropped.svg`](https://raw.githubusercontent.com/JamesNZL/algovision/main/assets/logo-cropped.svg)   | A cropped variant with no padding.                                                                                        |
| [`logo-simple.svg`](./logo-simple.svg)     | ![`logo-simple.svg`](https://raw.githubusercontent.com/JamesNZL/algovision/main/assets/logo-simple.svg)     | A simplified variant with a non-stylised logomark.                                                                        |

> [!note]  
> All (non-animated) `.svg` images within the `~/assets/` directory are automatically minified and optimised (`-min.svg`) using [`SVGO`](https://github.com/svg/svgo) by the [`Optimise SVG`](https://github.com/JamesNZL/algovision/actions/workflows/optimise-logo.yml) Actions workflow.

## Animated Logo

The animated logo is created using [SVG Artista](https://svgartista.net/).

1. Create the simplified `logo-paths` file from the full logo file in [[Illustrator]]—ie skip the outline stroke/compound path steps

2. Optimise with [`SVGOMG`](https://jakearchibald.github.io/svgomg/)
	![SVGOMG settings](https://user-images.githubusercontent.com/44986932/265682440-dfbd9949-acd8-4a5c-adf7-0dca10159ca3.png)

> [!warning]
> To prevent import errors, I must change the default settings of:
> - [ ] Remove unknowns & defaults
> - [ ] Remove hidden elements
> - [ ] Round/rewrite paths

3. Import to [`SVG Artista`](https://svgartista.net/), using the below settings
	![Animation settings](https://user-images.githubusercontent.com/44986932/265895236-1c76de41-b347-4c02-aaeb-08505089d204.png)

> [!note]
> Requires a manual time-delay to be applied to the wordmark animation.
 
> [!warning]
> `Transition` animation types do not seem to work, I must use the `Animation` option.
 
4. Copy the markup and save it as `logo-animated.svg`

5. Manually insert the `<g>` groups from `logo-min.svg`, and add the CSS transitions to fade in/out from animated to full gradient
