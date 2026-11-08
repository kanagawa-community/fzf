# Contributing to Kanagawa for fzf

Thanks for helping. This port follows the
[Kanagawa community contributing guide](https://github.com/kanagawa-community/.github/blob/main/.github/CONTRIBUTING.md),
which explains conventional commits, the checks every pull request runs, and how
changes are reviewed. This page covers only what is specific to this port.

## Where to report what

- Problems with the theme in fzf, such as wrong colors, poor
  contrast, or a missing variant, belong in this repository's
  [issue tracker](https://github.com/kanagawa-community/fzf/issues).
- Problems in fzf itself belong with its maintainers, not here. Start
  from the [application's page](https://github.com/junegunn/fzf).
- Changes to the colors themselves belong in the
  [shared palette](https://github.com/kanagawa-community/.github/blob/main/docs/PALETTE.md),
  not in this port. Open an issue in the
  [.github repository](https://github.com/kanagawa-community/.github/issues)
  so every port stays in step.

## Colors

Take colors from the shared [palette](https://github.com/kanagawa-community/.github/blob/main/docs/PALETTE.md)
and follow the [style guide](https://github.com/kanagawa-community/.github/blob/main/docs/STYLE-GUIDE.md).
Do not sample colors from screenshots or add new ones. Every change must work in
Wave, Dragon, and Lotus.

To read the colors from a script, use the machine-readable
[palette.json](https://raw.githubusercontent.com/kanagawa-community/.github/main/palette.json).

## Working on this port

The themes in `themes/` are plain fzf options files, one per variant. Each
`--color` line sets one fzf color to a palette color, chosen by role. The README
lists the mapping. To try a change, run
`FZF_DEFAULT_OPTS_FILE=themes/kanagawa-wave.opts fzf` (or `kanagawa-dragon`,
`kanagawa-lotus`).

The images in `assets/` are rendered, not captured by hand. After changing a
theme, run this from the repository root and commit the new images:

```sh
bash <(curl -fsSL https://raw.githubusercontent.com/kanagawa-community/.github/main/scripts/render-previews.sh)
```

It fetches the shared preview scripts from the
[.github repository](https://github.com/kanagawa-community/.github). `scripts/preview.sh` holds the fzf-specific part
and needs `fzf` and `tmux`. See the
[preview standard](https://github.com/kanagawa-community/.github/blob/main/docs/PREVIEWS.md)
for the rest.

## Pull requests

- Keep each pull request to one change, and include a screenshot of each variant
  it affects.
- Update the README when installation or usage changes.
