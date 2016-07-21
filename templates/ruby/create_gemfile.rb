require 'json'
version=JSON.parse(`gauge -v --machine-readable`)['plugins'].find {|x| x['name'] == 'ruby'}['version'] rescue nil
if !version.nil? && version.include?("nightly")
    v=version.split('.nightly').first
    File.open("Gemfile", 'w') { |file| file.write("gem 'test-unit', :group => [:development, :test]\ngem 'gauge-ruby', '~>#{v}', :github => 'getgauge/gauge-ruby', :ref => 'HEAD', :group => [:development, :test]\n") }
end
