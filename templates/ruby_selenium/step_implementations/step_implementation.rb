require 'test/unit'
require_relative './driver'

include Test::Unit::Assertions
include ::Driver

step 'Navigate to Gauge homepage <url>' do |url|
  driver.navigate.to url
  assert_equal driver.title, 'Gauge | ThoughtWorks'
end

step 'Go to Gauge Get Started Page' do
  get_started_btn = driver.find_element(:link_text, 'Get Started')
  get_started_btn.click
end
