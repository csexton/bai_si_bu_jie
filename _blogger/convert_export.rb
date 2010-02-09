require 'rubygems'
require 'active_support'
i = 0
Dir["blogger_export/**/*.html"].each do |file|
  i=i+1
  y = YAML.load_file file
  d = Date.parse(y['blogger_date']).to_s(:db)
  n = File.basename(file).gsub(".html", '')
  puts "cp #{file} out/#{d}-#{n}.markdown"
end

puts i
