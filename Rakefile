require "bundler/gem_helper"
require "rspec/core/rake_task"

Bundler::GemHelper.install_tasks(name: "periscope")
Bundler::GemHelper.install_tasks(name: "periscope-activerecord")

ADAPTERS = %w(active_record)

ADAPTERS.each do |adapter|
  desc "Run RSpec code examples for #{adapter} adapter"
  RSpec::Core::RakeTask.new(adapter => "#{adapter}:adapter") do |t|
    t.pattern = "spec/periscope/adapters/#{adapter}_spec.rb"
  end

  namespace adapter do
    task :adapter do
      ENV["ADAPTER"] = adapter
    end
  end
end

RSpec::Core::RakeTask.new(spec: ADAPTERS + [:adapter]) do |t|
  t.pattern = "spec/periscope_spec.rb"
end

task :adapter do
  ENV["ADAPTER"] = nil
end

task default: :spec
