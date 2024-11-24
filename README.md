# betterdisplaycli

A simple command line app to interact with [BetterDisplay](https://betterdisplay.pro).

BetterDisplay must be running and configured to accept CLI commands (this is the default setting).

## Installation and usage

### Prerequisites

- [BetterDisplay](https://betterdisplay.pro) v2.2.0 or later must be installed.

### Installation

#### Method 1 - Direct download

1. Download the compiled, signed, notarized, universal binary version:
   [betterdisplaycli-v1.0.1.zip](https://github.com/waydabber/betterdisplaycli/releases/download/v1.0.1/betterdisplaycli-v1.0.1.zip)
1. Optionally move the downloaded binary to its permanent location (recommended: `/usr/local/bin`).

#### Method 2 -  Automated compile and installation using Homebrew

1. Install [XCode](https://developer.apple.com/xcode).
1. Enter `brew install waydabber/betterdisplay/betterdisplaycli`

#### Method 3 -  Manual compile and installation from source

1. Install [XCode](https://developer.apple.com/xcode).
2. Download source package `git clone https://github.com/waydabber/betterdisplaycli`
3. Enter the downloaded folder: `cd ./betterdisplaycli`
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
