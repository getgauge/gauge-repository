require 'selenium-webdriver'

module Driver
    def driver
        @@driver
    end
    
    before_suite do
        # init driver from DriverFactory
        @@driver = Selenium::WebDriver.for :firefox
    end

    after_suite do
        # quit driver
        @@driver.quit
    end
end