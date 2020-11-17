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
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/baskethammer/yeodl">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
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

This is a collection of shell scripts intended to build an historical database of stock prices and fundamental data
from eodhistoricaldata.com, and update daily.

Most APIs make it easy to screen stocks, or easy to analyze a handful of equities over long periods of time. Hopefully
YEODL helps interested analysts do both with a minimum of data munging required.

In its current state, this should work quite well on Ubuntu and other 64-bit systemd-driven linuxes (and maybe WSL too).

### Built With

This project has had many false starts. At the end of the day, it was constructed with the simplest things that could 
possibly work, namely:

* [BASH](https://www.gnu.org/software/bash/)
* [Sqlite3](https://www.sqlite.org/index.html)
* [JQ](https://stedolan.github.io/jq/)



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* sqlite3 (from source, linux-64 binaries included in this archive for convenience)
```sh
wget -q https://www.sqlite.org/2020/sqlite-autoconf-3330000.tar.gz
tar xfvz sqlite-auto-conf-3330000.tar.gz
cd sqlite-auto-conf-3330000
[follow directions in folder]
wget https://www.sqlite.org/src/finfo?name=ext/misc/csv.c&ci=54b54f02c66c5aea&m=53b3338d4fa812ed
[compile csv.c, drop into yeodl's lib directory]
```
* jq
```sh
apt-get install jq
```


### Installation

1. Clone the repo
```sh
git clone https://github.com/baskethammer/yeodl.git
```
2. Build directory tree
```sh
cd yeodl
./install.sh
```
3. Create yeodl.conf w/ 
* YEODLDIR="/path/to/yeodl"
* APIKEY="your eodhistoricaldata.com api key"
* START_YEAR="the year your dbs begin"

4. Bootstrap history
```sh
	./bin/bootstraps/US  #[this creates the DB, downloads symbols for AMEX, BATS, NASDAQ, NYSE]
	./bin/bootstraps/US-prices  #[this downloads all history back to start_year for each symbol, loads into db]
```
5. Create systemd timer and service (examples to come) for daily updates.


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

<!-- CONTACT -->
## Contact

Your Name - [@baskethammer](https://twitter.com/baskethammer) - bh@baskethammer.com

Project Link: [https://github.com/baskethammer/yeodl](https://github.com/baskethammer/yeodl)



<!-- ACKNOWLEDGEMENTS -->

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/baskethammer/repo.svg?style=flat-square
[contributors-url]: https://github.com/baskethammer/yeodl/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/baskethammer/repo.svg?style=flat-square
[forks-url]: https://github.com/baskethammer/yeodl/network/members
[stars-shield]: https://img.shields.io/github/stars/baskethammer/repo.svg?style=flat-square
[stars-url]: https://github.com/baskethammer/yeodl/stargazers
[issues-shield]: https://img.shields.io/github/issues/baskethammer/repo.svg?style=flat-square
[issues-url]: https://github.com/baskethammer/yeodl/issues
[license-shield]: https://img.shields.io/github/license/baskethammer/repo.svg?style=flat-square
[license-url]: https://github.com/baskethammer/yeodl/blob/master/LICENSE.txt
[product-screenshot]: images/screenshot.png
