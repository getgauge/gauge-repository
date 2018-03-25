# Gauge example project, in Python 
This project serves as a template for writing Automation using [Gauge](https://github.com/getgauge/gauge)

This project uses 

- [Selenium](http://selenium-python.readthedocs.org/)

# Prerequisites
- Python 3
- [Java 1.7](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html). [Required to bring up the [SUT](#setting-up-the-system-under-test-sut)
- [Install Gauge](http://getgauge.io/download.html)
  - Homebrew on Mac OS X :  
      ```
      brew install gauge
      ```
  - [Download Installer](http://getgauge.io/download.html)
- [Install Gauge-Python plugin](https://gauge-python.readthedocs.io/en/latest/installation.html) by running<br>
```
gauge --install python
[pip / pip3] install getgauge
```
- Google Chrome

# Executing specs

### Set up
This project requires pip to install dependencies. To install dependencies run :  
````
pip install -r requirements.txt
````

Run the following command to install chromedriver, if it fails then download it from [here](http://chromedriver.storage.googleapis.com/index.html) and add it to the `PATH` variable.

```
[pip / pip3] install chromedriver_installer
```

### All specs
````
gauge specs
````
This will also compile all the supporting code implementations.
