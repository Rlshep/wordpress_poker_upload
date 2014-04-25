require 'rubygems'

begin
  require 'cucumber'
  require 'cucumber/rake/task'

  namespace :features do
    Cucumber::Rake::Task.new(:default) do |t|
      t.profile = 'default'
    end

    Cucumber::Rake::Task.new(:contests) do |t|
      t.profile = 'contests'
    end
  end

  task :default => 'features:default'
rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end