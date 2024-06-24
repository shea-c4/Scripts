<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.imgur.com/6wj0hh6.jpg" alt="Project logo"></a>
</p>

<h3 align="center">Windows Scripts</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/shea-c4/The-Documentation-Compendium.svg)](https://github.com/shea-c4/The-Documentation-Compendium/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/shea-c4/The-Documentation-Compendium.svg)](https://github.com/shea-c4/The-Documentation-Compendium/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> This directory contains various Windows Batch and PowerShell scripts that I've found useful over the years.
    <br> 
</p>

## 📝 Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Deployment](#deployment)
- [Usage](#usage)
- [Built Using](#built_using)
- [TODO](../TODO.md)
- [Contributing](../CONTRIBUTING.md)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)

## 🧐 About <a name = "about"></a>

From adding the date and path to your prompt to executing a custom build of ffmpeg to using whisper.ai to translate a video this repo contains scripts that I've found useful over the years. Error checking is minimal but should improve over time.

## 🏁 Getting Started <a name = "getting_started"></a>

<!--These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.-->

Clone this repo. See [Installing](#Installing) for more details.

### Prerequisites
<!--
What things you need to install the software and how to install them.

```
Give examples
```
-->
PowerShell, Python and various others as indicated in the scripts themselves.

### Installing
<!--A step by step series of examples that tell you how to get a development env running.

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo.
-->
Open a command prompt (or Windows Terminal). Add the directory containing the scripts to your PATH.

``` 
SET PATH=c:\src\github\shea-c4\scripts;%PATH%
```

Any batch file can be executed by name (eg autoexec.bat). PowerShell scripts must be run via PowerShell

```
powershell .\create-libraries.ps1
```
<!--
## 🔧 Running the tests <a name = "tests"></a>

Explain how to run the automated tests for this system.

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## 🎈 Usage <a name="usage"></a>

Add notes about how to use the system.

## 🚀 Deployment <a name = "deployment"></a>

Add additional notes about how to deploy this on a live system.

## ⛏️ Built Using <a name = "built_using"></a>

- [MongoDB](https://www.mongodb.com/) - Database
- [Express](https://expressjs.com/) - Server Framework
- [VueJs](https://vuejs.org/) - Web Framework
- [NodeJs](https://nodejs.org/en/) - Server Environment
-->
## ✍️ Authors <a name = "authors"></a>

- [@shea-c4](https://github.com/shea-c4) - Idea & Initial work

<!--See also the list of [contributors](https://github.com/shea-c4/scripts/contributors) who participated in this project.-->

<!--
## 🎉 Acknowledgements <a name = "acknowledgement"></a>

- Hat tip to anyone whose code was used
- Inspiration
- References
-->