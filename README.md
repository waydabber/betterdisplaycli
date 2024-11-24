# betterdisplaycli

A simple command line app to interact with [BetterDisplay](https://betterdisplay.pro).

BetterDisplay must be running and configured to accept CLI commands (this is the default setting).

## Installation and usage

### Prerequisites

- [BetterDisplay](https://betterdisplay.pro) v2.2.0 or later must be installed.

### Automated installation via Homebrew

1. Install XCode.
1. Enter `brew install waydabber/betterdisplay/betterdisplaycli`

### Compiled version available from download

1. Download the compiled, signed, notarized version from [Releases](https://github.com/waydabber/betterdisplaycli/releases).
1. Optionally move the downloaded binary to its permanent location (recommended: `/usr/local/bin`).

### Manual installation from source

1. Download source package `git clone https://github.com/waydabber/betterdisplaycli`
2. Enter the downloaded folder: `cd ./betterdisplaycli`
3. Install XCode.
4. Enter `sudo make install`. This will compile the app and install it under `/usr/local/bin`.

... or instead of the last step you can continue like this:

5. Compile by entering: `swiftc betterdisplaycli.swift`
6. Move the compiled `betterdisplaycli` binary to a location where it's easily available in `$PATH`.

### Usage

1. Make sure BetterDisplay 2.2.x and newer is running and is configured to accept CLI/notification requests.
1. Run `betterdisplaycli` for help.
1. Try `betterdisplaycli set --brightness=80%` to set the brightness level of all displays to 80% (note: you can use both single and double hyphen style for parameters).

> [!NOTE]
> You can use the installed app itself to send CLI commands as well - the following prints help:
> 
> `/Applications/BetterDisplay.app/Contents/MacOS/BetterDisplay help`

## CLI and integration documentation

More info and other integration options:

- https://github.com/waydabber/BetterDisplay/wiki/Integration-features,-CLI

This app also serves as a demonstration of how to integrate your app with BetterDisplay using notification dispatch.
