require 'rubygems'
require 'watir'
require 'watir-webdriver'
require 'headless'

# Headless is required for this script to run on Jenkins

headless = Headless.new
headless.start
browser = Watir::Browser.new

# Test web site

url=ENV['SITE']
fail("No site!") if url.nil?

browser.goto url

fail ("Page not found!") if browser.title != 'Acu-Link'
 browser.button(:value => "Log In").wait_until_present
 browser.button(:value => "Log In").click
 Watir::Wait.until { browser.text.include? 'LoginError' }

browser.close
headless.destroy
