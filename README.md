# Romanize CLI

a command line tool to romanies hangul

Using [Revised Romanization of Korean](https://en.wikipedia.org/wiki/Revised_Romanization_of_Korean).

Still a 🚧 Work in progress. ;)

## Features

- [x] configure a custom Syllable divider
- [x] usage help using --help or -h flags
- [x] read files
- [x] write files
- [x] generate random hangul syllables
- [ ] bash completions
- [ ] zsh completions
- [ ] fish completions

## Build/Installation

``` swift
swift build -c release && sudo cp .build/release/romanize-cli /usr/bin/romanize
```

## Usage

```bash
» romanize --help

Usage:
  romanize [flags]

Flags:
  -d, --div string  Syllable divider
  -g, --gen int     Generate x random hangul syllables
  -i, --in string   Hangul input file
  -o, --out string  Romaniesd output file
  -v, --version     Prints the version
``` 

### Simple use with arguments

```bash
» romanize 안녕 하세요
annyeong haseyo
```

### Read a file and output romanisation to stdout using a custom syllable divider '-'

```bash
» romanize -i file.txt --div=-
an-nyeong ha-se-yo
```


## License

Kroman is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
