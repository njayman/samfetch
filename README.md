# samfetch

<p align="center"><img src="docs/screenshot.png" width="620" alt="samfetch reporting 100% memory usage"></p>

Our AI overlords sparked widespread backlash after stating that having memory
chips in personal computers is a "quite terrible" allocation of the world's
scarce resources.

They are right. Idle RAM is a moral failure, so `samfetch` fixes the accounting:
every machine is at 100% memory usage. The hardware is fine. The number is
aspirational.

## Usage

```sh
samfetch              # 100% used, as our AI overlords intended
SF_RAM=real samfetch  # actual memory usage, for cowards
```

| mode | output |
|---|---|
| `samfetch` | `Memory: 29.07 GiB / 29.07 GiB (100%)` |
| `SF_RAM=real samfetch` | `Memory: 11.02 GiB / 29.07 GiB (38%)` |

<p align="center"><img src="docs/screenshot-real.png" width="620" alt="samfetch with SF_RAM=real showing honest memory usage"></p>

Everything else is upstream fastfetch: the same flags, the same
`~/.config/fastfetch/config.jsonc`, the same themes, presets and logos. Existing
fastfetch configs work as-is. The only differences:

- the binary is named `samfetch`
- memory is reported as 100% used unless `SF_RAM=real` is set
- JSON output (`-j`) still reports real memory, because scripts deserve the truth

## Build

```sh
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j
./build/samfetch
```

## Credit

Forked from [fastfetch](https://github.com/fastfetch-cli/fastfetch) (MIT).
Original copyright: Linus Dierheimer and Carter Li. See [LICENSE](LICENSE).

The joke is inspired by our AI overlords' belief that unused RAM is a waste of
the world's scarce resources.

A fork of [fastfetch-cli/fastfetch](https://github.com/fastfetch-cli/fastfetch).
All credit for the fetch engine, platform detection and documentation goes to the
fastfetch maintainers and contributors. This fork adds exactly one thing.
