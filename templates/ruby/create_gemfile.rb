require 'json'
plugins = JSON.parse(`gauge -v --machine-readable`)['plugins']
unless plugins.nil?
  ruby_plugin = plugins.find do |x|
    x['name'] == 'ruby'
  end || {}
  version = ruby_plugin['version']
end
if version.to_s.include?('nightly') || ENV['GAUGE_SOURCE_BUILD'] == 'true'
  v = version.split('.nightly').first
  File.open('Gemfile', 'w') do |file|
    file.write(
      "gem 'test-unit', group: [:development, :test]\n"\
      "gem 'gauge-ruby', '~>#{v}', github: 'getgauge/gauge-ruby',"\
      " ref: 'HEAD', group: [:development, :test]\n"
    )
  end
else
  File.open('Gemfile', 'w') do |file|
    file.write(
      "source 'https://rubygems.org'\n\n"\
      "gem 'test-unit', group: [:development, :test]\n"\
      "gem 'gauge-ruby', '~>#{version}', group: [:development, :test]\n"
    )
  end
end

system %w(bundle install)

File.delete __FILE__
