require 'capybara'

Capybara.default_driver = :selenium_chrome_headless

browser = Capybara.current_session
browser.driver.maximize_window(browser.driver.current_window_handle)
browser.visit 'http://google.com'
search_bar = browser.find(:xpath, '//*[@title="Search"]')
search_bar.fill_in with: 'ruby on rails'
search_bar.send_keys :enter

first_result = browser.find(:xpath, '((//*[@class="g"])[1]//a)[1]')
first_result.click

browser.assert_current_path('https://rubyonrails.org/', url: true)
