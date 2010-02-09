Dir["blogger_export/*.html"].each do |file|
  puts "Punching #{file}"
  f = File.open(file,'r+')
  buffer = f.read
  f.close

  buffer.gsub!("http://fuzzymonk.com/photos", "http://photos.fuzzymonk.com")
  buffer.gsub!("http://www.fuzzymonk.com/photos", "http://photos.fuzzymonk.com")
  buffer.gsub!(/^Labels: <.*$/, "")
  #DONT WORKbuffer.gsub!(/^title: (.*)$/, "title: \"#{$1}\"")
  buffer.gsub!(/<hr ?[^>]*>/, "\n------\n")
  #buffer.gsub!('<script type="text/javascript" src="http://www.blogger.com/static/v1/common/js/1499043574-csitaillib.js"></script>', '')
  #buffer.gsub!("<script>if (typeof(window.attachCsiOnload) != 'undefined' && window.attachCsiOnload != null) { window.attachCsiOnload('ext_blogspot'); }</script>", "\n")
  #buffer.gsub!(/\r/, "")
  #buffer.gsub!(/<span ?[^>]*>/, '')
  #buffer.gsub!(/<\/span>/, '')
  #buffer.gsub!(/<p ?[^>]*>/, "\n")
  #buffer.gsub!(/<\/p>/, "\n")
  #buffer.gsub!(/<o:?[^>]*>/, '')
  #buffer.gsub!(/<\/o:?[^>]>/, '')
  #buffer.gsub!(/<st1:?[^>]*>/, '')
  #buffer.gsub!(/<\/st1:?[^>]>/, '')
  #buffer.gsub!(/<br ?\/?>/, "\n\n")
  #buffer.gsub!(/<\?xml:?[^>]*>/, '')
  #buffer.gsub!(/\357\277\275/, "'")
  #buffer.gsub!("*", "\\*")
  #buffer.gsub!("[", "(")
  #buffer.gsub!("]", ")")
  ## buffer.gsub!(/<b>/, '**')
  ## buffer.gsub!(/<\/b>/, '**')
  ##buffer.gsub!(/<i>/, '_')
  ##buffer.gsub!(/<\/i>/, '_')
  #buffer.gsub!(/<ul ?[^>]*>/, "\n")
  #buffer.gsub!(/<\/ul>/, '')
  #buffer.gsub!(/<li ?[^>]*>/, "\n * ")
  #buffer.gsub!(/<\/li>/, '')
  #buffer.gsub!(/^ \\\* /, " * ")
  f = File.open(file,'w')
  f.write buffer
  f.close
end


