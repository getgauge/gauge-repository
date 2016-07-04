require 'selenium-webdriver'

module Driver
    def driver
        @@driver
    end
    
    before_suite do
        # init driver from DriverFactory
        # set the "browser" env variable in one of the properties files. check env/default/default.properties
        @@driver = Selenium::WebDriver.for ENV["browser"]
    end

    after_suite do
        # quit driver
        @@driver.quit
    end
end