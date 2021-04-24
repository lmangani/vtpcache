[![Build Status][travis-shield]][travis-url]
[![GitHub tag][tag-shield]][tag-url]

# `vtpcache`: Tiny, Persistent Cache for V

<img src="new-01.svg" height="230px" align="right"/>

`vtpcache` is a key-value, time-based cache with data persistence for [V][vlang].

- **Tiny.** Implemented in less than 150 SLOC
- **Simple.** Easily embeddable on any V program with few LOC (see [example.v][example])
- **Persistent.** Saved data can be retrieved at any given point
- **As fast as your IO rates.** `vtpcache` can be very performant on SSDs

[vlang]: https://vlang.io
[example]: /example.v

[travis-shield]: https://img.shields.io/travis/caian-org/vtpcache.svg?logo=travis-ci&logoColor=FFF&style=flat-square
[travis-url]: https://travis-ci.org/caian-org/vtpcache

[tag-shield]: https://img.shields.io/github/tag/caian-org/vtpcache.svg?logo=git&logoColor=FFF&style=flat-square
[tag-url]: https://github.com/caian-org/vtpcache/releases


## Installation

Via VPM:

```
v install caiertl.vtpcache
```


## How It Works

*TODO*


## License

To the extent possible under law, [Caian Rais Ertl][me] has waived __all
copyright and related or neighboring rights to this work__. In the spirit of
_freedom of information_, I encourage you to fork, modify, change, share, or do
whatever you like with this project! [`^C ^V`][kopimi-url]

[![License][cc-shield]][cc-url]

[me]: https://github.com/caiertl
[cc-shield]: https://forthebadge.com/images/badges/cc-0.svg
[cc-url]: http://creativecommons.org/publicdomain/zero/1.0

[kopimi-url]: https://kopimi.com
