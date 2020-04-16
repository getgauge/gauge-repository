import os
from getgauge.python import before_suite, after_suite, step
from selenium import webdriver
from selenium.webdriver.chrome.options import Options  
from selenium.webdriver.common.keys import Keys

@before_suite
def init():
    global driver
    options = Options()
    #  By default the chrom instance is launched in
    #  headless mode. Do not pass this option if
    #  you want to see the browser window
    options.add_argument("--headless")
    driver = webdriver.Chrome(chrome_options=options)

@after_suite
def close():
    driver.close()

@step("Search for <query>")
def go_to_get_started_page(query):
  textbox = driver.find_element_by_xpath("//input[@name='q']")
  textbox.send_keys(query)
  textbox.send_keys(Keys.RETURN)

@step("Go to Google homepage at <url>")
def go_to_gauge_homepage_at(url):
    driver.get(url)
