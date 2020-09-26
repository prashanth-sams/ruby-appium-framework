# frozen_string_literal: true

require 'cucumber/rake/task'
require 'json'

namespace :vivino do
  desc 'Vivino task scheduler #allure'
  task :run, :platform do |_task, args|
    ENV['PLATFORM'] = args.platform.downcase

    Cucumber::Rake::Task.new(:local) do |t|
      if ENV['BROWSERSTACK'] && ENV['BROWSERSTACK'] == 'ON'
        response = `curl -u '#{ENV['BROWSERSTACK_USERNAME']}:#{ENV['BROWSERSTACK_ACCESS_KEY']}' -X POST 'https://api.browserstack.com/app-automate/upload' -F 'file=@app/app-world-beta.apk' -F 'custom_id=VivinoApp'`
        ENV['VIVINO_BS_APP'] = JSON.parse(response)['app_url']
      end
      t.cucumber_opts = 'features/scenarios/**.feature'
    end
    Rake::Task[:local].invoke
  end

  desc 'Vivino task scheduler #generic'
  task :html do
    Cucumber::Rake::Task.new(:html) do |t|
      t.cucumber_opts = 'features/scenarios/**.feature -p html'
    end
  end
end
