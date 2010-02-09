Dir["_posts/*.markdown"].each do |file|
  puts "Punching #{file}"
  f = File.open(file,'r+')
  buffer = f.read
  f.close

  buffer.gsub!("http://fuzzymonk.com/photos", "http://photos.fuzzymonk.com")
#  buffer.gsub!(/\r/, "")
#  buffer.gsub!(/<span ?[^>]*>/, '')
#  buffer.gsub!(/<\/span>/, '')
#  buffer.gsub!(/<p ?[^>]*>/, "\n")
#  buffer.gsub!(/<\/p>/, "\n")
#  buffer.gsub!(/<o:?[^>]*>/, '')
#  buffer.gsub!(/<\/o:?[^>]>/, '')
#  buffer.gsub!(/<st1:?[^>]*>/, '')
#  buffer.gsub!(/<\/st1:?[^>]>/, '')
#  buffer.gsub!(/<br ?\/?>/, "\n\n")
#  buffer.gsub!(/<\?xml:?[^>]*>/, '')
#  buffer.gsub!(/\357\277\275/, "'")
#  buffer.gsub!(/\*/, "\\*")
#  buffer.gsub!(/<b>/, '**')
#  buffer.gsub!(/<\/b>/, '**')
#  buffer.gsub!(/<i>/, '_')
#  buffer.gsub!(/<\/i>/, '_')
#  buffer.gsub!(/<ul ?[^>]*>/, "\n")
#  buffer.gsub!(/<\/ul>/, '')
#  buffer.gsub!(/<li ?[^>]*>/, "\n * ")
#  buffer.gsub!(/<\/li>/, '')

  buffer.gsub!(/^ \\\* /, " * ")
  f = File.open(file,'w')
  f.write buffer
  f.close
end

