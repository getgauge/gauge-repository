require 'selenium-webdriver'
require 'test/unit'
require_relative './driver/driver.rb'

include Test::Unit::Assertions

driver = Selenium::WebDriver.for :firefox

step 'Navigate to Gauge homepage <url>' do |url|
    driver.navigate.to url

    assert_equal driver.title(), 'Gauge | ThoughtWorks'
end

step 'Go to Gauge Get Started Page' do
    getStartedBtn = driver.find_element(:link_text, "Get Started")
    getStartedBtn.click()
end
