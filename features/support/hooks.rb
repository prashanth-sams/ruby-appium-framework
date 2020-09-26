# frozen_string_literal: true

# executes before each scenario
# logs custom listeners for easy debugging
# starts appium client server
# sets implicit wait
Before do
  # start logging custom listeners
  start_loggers
  if ENV['VIVINO_BS_APP']
    caps = browserstack_device('Google Pixel 3', '9.0')
    Appium::Driver.new({
       'caps' => caps,
       'appium_lib' => {
            server_url: "https://#{ENV['BROWSERSTACK_USERNAME']}:#{ENV['BROWSERSTACK_ACCESS_KEY']}"\
                         '@hub-cloud.browserstack.com/wd/hub'
       }
    }, true)
  else
    caps = local_device('Google Pixel 3')
    Appium::Driver.new(caps, true)
  end
  Appium.promote_appium_methods Object

  $logger.debug('initializing appium driver...')
  driver.start_driver
  implicit_wait
end

# executes after each scenario
# takes screenshots on failure
# quits appium client server
After do |scenario|
  if scenario.failed?
    $logger.debug("scenario: #{scenario} FAILED")
    begin
      Dir.mkdir('./reports/screenshots') unless Dir.exist?('./reports/screenshots')
      file = "#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      driver.save_screenshot("./reports/screenshots/#{file}")
    rescue StandardError
      pass
    end
  end
  driver.driver_quit
end

at_exit do
  # ENV['TITLE'] = "TEST AUTOMATION REPORT" if ENV['TITLE'].nil?
  # begin
  #   report_file = File.absolute_path("report.html", "reports")
  #   doc = File.read(report_file)
  # rescue
  #   report_file = File.absolute_path("test_report.html", "reports")
  #   doc = File.read(report_file)
  # end
  # new_doc = doc.sub("Cucumber Features", "#{ENV['TITLE']}")
  # File.open(report_file, "w") {|file| file.puts new_doc}
end
