<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
***
***
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** github_username, repo_name, twitter_handle, email
-->





<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
<!--[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
-->



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/baskethammer/yeodl">
    <!--img src="images/logo.png" alt="Logo" width="80" height="80"-->
  </a>

  <h3 align="center">YEODL</h3>

  <p align="center">
    YOUR End-Of-Day Loader
    <br />
    <a href="https://github.com/baskethammer/yeodl"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/baskethammer/yeodl">View Demo</a>
    ·
    <a href="https://github.com/baskethammer/yeodl/issues">Report Bug</a>
    ·
    <a href="https://github.com/baskethammer/yeodl/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

This is a collection of shell scripts to build an historical
database of stock prices and fundamental data from
[EODhistoricaldata](https://www.eodhistoricaldata.com), and update
daily. Current capabilities include:

* Initial bulk download of major US exchanges (AMEX, BATS, NASDAQ, NYSE)
* Daily updates:
  * Open High Low Close (OHLC), Volume, adjusted price
  * Dividends and Splits
	* New entries trigger re-download of historical adjusted_closes
* As-necessary data from EODhistoricaldata's fundamentals API:
  * Descriptive info (sector, industry, industry, etc.)
  * Highlights (typical screen values)
  * Valuation info (PEs, EV, P/S, P/B, EV, EV/EBITDA)
  * Technicals (52w H/L, moving averages, short ratio)
  * Share stats (# outstanding, insiders %, etc.)
  * EPS for the previous 20 quarters (5 years)


Most APIs make it easy to screen stocks, or easy to analyze a handful of equities over long periods of time. Hopefully
YEODL helps interested analysts do both with a minimum of data munging
required. YEODL's simplicity is intended to encourage the development
of APIs in several languages.


### Built With

YEODL was constructed with the simplest things that could 
possibly work, namely:

* [bash](https://www.gnu.org/software/bash/)
* [Sqlite3](https://www.sqlite.org/index.html)
* [jq](https://stedolan.github.io/jq/)

You can get surprisingly far with shell scripts and a few
well-selected utilities.  In an era when the instructions for many new
projects assume the use of cloud services, docker, and a bunch of
other frameworks, it can be refreshing to use simpler tools that are
as fast (or faster).

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

YEODL was developed on Ubuntu 18.04, but should be compatible with any
sane unix-alike environment.

You will need an account for access to financial data. It is not free.

* [EODHistoricaldata.com](https://www.eodhistoricaldata.com) Current
  prices range from USD $20/mo for end-of-day data from 60+
  exchanges (and indices, forex pairs) to $50/mo for everything.
```sh
$ vi ~/.config/yeodl/yeodl.config
# [ edit to set APIKEY with your key]
# file could be elsewhere if your $XDG_CONFIG_HOME is set
```

* jq
```sh
$ sudo apt-get install jq
```
On some platforms, you will need to compile sqlite3:

* sqlite3 (from source, linux-64 binaries included in this archive for convenience)
```sh
~/yeodl$ wget -q https://www.sqlite.org/2020/sqlite-autoconf-3330000.tar.gz
~/yeodl$ tar xfvz sqlite-auto-conf-3330000.tar.gz
~/yeodl$ cd sqlite-auto-conf-3330000

# [follow directions in folder]

~/yeodl$ wget https://www.sqlite.org/src/finfo?name=ext/misc/csv.c&ci=54b54f02c66c5aea&m=53b3338d4fa812ed

#[compile csv.c, drop the resulting lib into yeodl's lib directory]
```


### Installation

1. Clone the repo
```sh
~/$ git clone https://github.com/baskethammer/yeodl.git
```
2. Build directory tree
```sh
~/$ cd yeodl
~/yeodl$ ./install.sh
```
3. Create yeodl.conf w/ 
* YEODLDIR="/path/to/yeodl"
* APIKEY="your eodhistoricaldata.com api key"
* START_YEAR="the year your dbs begin"

4. Bootstrap history
```sh
~/yeodl$ ./bin/bootstraps/US  #[this creates the DB, downloads symbols for AMEX, BATS, NASDAQ, NYSE]
~/yeodl$ ./bin/bootstraps/US-prices  #[this downloads all history back to start_year for each symbol, loads into db]
```
5. Create systemd timer and service for daily updates.
```sh
# Example contents of ~/.config/systemd/user/yeodl-us-daily.service
[Unit]
Description= (Y2) YEODL Daily US downloader

[Service]
WorkingDirectory=/home/<your username>/yeodl/bin
ExecStart=/home/<your username>/yeodl/bin/US-daily


# Example contents of ~/.config/systemd/user/yeodl-us-daily.timer
[Unit]
Description=Run YEODL's daily US price downloader
Requires=yeodl-us-daily.service

[Timer]
OnCalendar=Mon..Fri 19:45

[Install]
WantedBy=multi-user.target

```
6. Enable systemd timer
```sh
~/$ systemctl --user daemon-reload
~/$ systemctl enable yeodl-us-daily.timer
~/$ systemctl start yeodl-us-daily.timer
```


<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/baskethammer/yeodl/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License
YEODL is licensed for use under
[GPLv3](https://github.com/nevir/readable-licenses/blob/master/markdown/GPLv3-LICENSE.md). Please
contact bh@baskethammer.com for a commercial license in the unlikely
event it is necessary to you.
<!-- CONTACT -->
## Contact

BasketHammer - [@baskethammer](https://twitter.com/baskethammer) - bh@baskethammer.com

Project Link: [https://github.com/baskethammer/yeodl](https://github.com/baskethammer/yeodl)



<!-- ACKNOWLEDGEMENTS -->

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/baskethammer/yeodl.svg?style=flat-square
[contributors-url]: https://github.com/baskethammer/yeodl/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/baskethammer/yeodl.svg?style=flat-square
[forks-url]: https://github.com/baskethammer/yeodl/network/members
[stars-shield]: https://img.shields.io/github/stars/baskethammer/yeodl.svg?style=flat-square
[stars-url]: https://github.com/baskethammer/yeodl/stargazers
[issues-shield]: https://img.shields.io/github/issues/baskethammer/yeodl.svg?style=flat-square
[issues-url]: https://github.com/baskethammer/yeodl/issues
[license-shield]: https://img.shields.io/github/license/baskethammer/yeodl.svg?style=flat-square
[license-url]: https://github.com/baskethammer/yeodl/blob/master/LICENSE.txt
[product-screenshot]: images/screenshot.png
	
