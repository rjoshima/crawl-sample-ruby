require 'selenium-webdriver'

driver =  Selenium:WebDriver.for :firefox

driver.manage.timeouts.page_load = 10

driver.navigate.to 'https://twitter.co./seach-home'

elements = driver.find_elements(
  :xpath, "//ul[@class='trend-items js-trends']/li/a")
elements.each do |element|

  puts elements.text
end

driver.quit
