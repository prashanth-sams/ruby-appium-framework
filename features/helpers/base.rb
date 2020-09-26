# frozen_string_literal: true

module VIVINO
  def element(name, locator)
    send(:define_method, name) do
      wait = Selenium::WebDriver::Wait.new(timeout: 0.5)
      begin
        $elem_locator = locator
        wait.until { @driver.find_element(locator) }
      rescue Selenium::WebDriver::Error::TimeoutError
        raise "Unable to find element with key #{locator.first.key}" if error
      end
    end
  end

  def elements(name, locator)
    send(:define_method, name) do
      wait = Selenium::WebDriver::Wait.new(timeout: 0.5)
      begin
        wait.until { !@driver.find_elements(locator).empty? }
        @driver.find_elements(locator)
      rescue Selenium::WebDriver::Error::TimeoutError
        raise "Unable to find elements with key #{locator.first.key}"
      end
    end
  end

  def assert_text(_locator, expected, loop = 30, secs = 0.5)
    while loop > 1
      begin
        instance_variable_set("@locator#{loop}", $elem_locator)
        expect(@driver.find_element(eval("@locator#{loop}")).text).to eq(expected)
        break
      rescue RSpec::Expectations::ExpectationNotMetError
        loop -= 1
        sleep secs
        expect(@driver.find_element(eval("@locator#{loop}")).text).to eq(expected) if loop == 1
      end
    end
  end

  def is_exist?(locator)
    @driver.find_element(locator[1]).displayed?
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  rescue Selenium::WebDriver::Error::TimeoutError
    false
  end

  def swipe_until(locator, count = 10)
    implicit_wait(0.5)

    count.to_i.times.each do
      @driver.find_element(locator[1]).displayed?
      break
    rescue Selenium::WebDriver::Error::NoSuchElementError
      Appium::TouchAction.new.swipe(start_x: 144, start_y: 434).perform
    rescue Selenium::WebDriver::Error::TimeoutError
      Appium::TouchAction.new.swipe(start_x: 144, start_y: 434).perform
    end
    implicit_wait
  end

  def implicit_wait(secs = 20)
    driver.set_wait(secs)
  end

  def pseudo_element(name, locator)
    send(:define_method, name) do
      [name, locator]
    end
  end

  def start_loggers
    Dir.mkdir('./logs') unless File.exist?('./logs')
    Dir['./logs/*.log'].map { |junk_file| File.delete(junk_file) }

    now = (Time.now.to_f * 1000).to_i
    $logger = Logger.new(STDOUT)
    $logger.datetime_format = '%Y-%m-%d %H:%M:%S'

    $logger = Logger.new(File.new("logs/vivino_#{now}.log", 'w'))
    $logger.level = Logger::DEBUG
  end
end
