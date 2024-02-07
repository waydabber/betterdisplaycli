# betterdisplaycli

A simple command line app to interact with [BetterDisplay](https://betterdisplay.pro).

BetterDisplay must be running and configured to accept CLI commands (this is the default setting).

> [!NOTE]
> You can use the installed app itself to send CLI commands:
> 
> `/Applications/BetterDisplay.app/Contents/MacOS/BetterDisplay help`

## Usage

1. Compile by entering: `swiftc betterdisplaycli`
1. Make sure BetterDisplay 2.2.x and newer is running and is configured to accept CLI/notification requests.
1. Run `./betterdisplaycli` for help.

You can move the compiled `betterdisplaycli` binary to a location where it's easily available in `$PATH`. Feel free to shorten the binary's name as well.

## CLI and integration documentation

More info and other integration options:

- https://github.com/waydabber/BetterDisplay/wiki/Integration-features,-CLI

This app also serves as a demonstration of how to integrate your app with BetterDisplay using notification dispatch.
