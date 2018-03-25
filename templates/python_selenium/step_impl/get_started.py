from getgauge.python import step
import os
from step_impl.utils.driver import Driver

@step("Show subtitle <arg1>")
def show_subtitle(arg1):
    assert Driver.driver.find_element_by_class_name("sub-title").text == arg1
  
@step("Go to Get Started page")
def go_to_get_started_page():
  Driver.driver.find_element_by_link_text("Get Started").click()

@step("Go to Gauge homepage at <url>")
def go_to_gauge_homepage_at(arg1):
    Driver.driver.get(arg1)