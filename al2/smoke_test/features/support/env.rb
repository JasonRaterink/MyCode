require 'rubygems'
require 'watir'
require 'watir-webdriver'
#require 'headless'

Before do |scenario|
		@browser = Watir::Browser.new
		#headless = Headless.new
		#headless.start
end

After do |scenario|
		@browser.close
		#headless.destroy
end
