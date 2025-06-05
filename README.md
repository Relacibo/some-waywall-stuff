# some-waywall-stuff
## Instructions
- git clone `https://github.com/Relacibo/some-waywall-stuff`

- Use `<full path of this repo>/libglfw.so` for custom glfw in prism which is needed for waywall to work
- Use `<full path of this repo>/wayland wrap --` as your wrapper command in prism

For both see https://tesselslate.github.io/waywall/00_setup.html#instance-setup

Waywall docs: https://tesselslate.github.io/waywall/index.html

Also take a look at my config: [init.lua](init.lua) which belongs in the folder `~/config/waywall/`. I use the `razer-cli` to set my dpi. That might be different in your case. Ninjabrain bot does not really work so well yet though...

I was inspired by this script: https://github.com/sathya-pramodh/dotfiles/blob/main/waywall/init.lua

See https://tesselslate.github.io/waywall/01_basics.html
Waywall source code: https://github.com/tesselslate/waywall

## Licenses:
[GWJGL](LWJGL-LICENSE.md) for libglfw.so
[waywall](waywall-LICENSE) for waywall

Everything else: [LICENSE](LICENSE)
