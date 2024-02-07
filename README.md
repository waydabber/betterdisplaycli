# betterdisplaycli

A simple command line app to interact with [BetterDisplay](https://betterdisplay.pro).

BetterDisplay must be running and configured to accept CLI commands (this is the default setting).

> [!NOTE]
> You can use the installed app itself to send CLI commands:
> 
> `/Applications/BetterDisplay.app/Contents/MacOS/BetterDisplay help`

## Installation and usage

### Prerequisites

- Swift must be installed for installation (enter `xcode-select --install`).
- [BetterDisplay](https://betterdisplay.pro) v2.2.0 or later must be installed.
- Source package should be downloaded.

### Automated installation

1. Enter `sudo make install`. This will compile the app and install it under `/usr/local/bin`.

### Manual installation

1. Compile by entering: `swiftc betterdisplaycli.swift`
1. Move the compiled `betterdisplaycli` binary to a location where it's easily available in `$PATH`.

### Usage

1. Make sure BetterDisplay 2.2.x and newer is running and is configured to accept CLI/notification requests.
1. Run `betterdisplaycli` for help.

## CLI and integration documentation

More info and other integration options:

- https://github.com/waydabber/BetterDisplay/wiki/Integration-features,-CLI

This app also serves as a demonstration of how to integrate your app with BetterDisplay using notification dispatch.
