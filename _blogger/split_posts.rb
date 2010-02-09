require 'rubygems'

def write_file(file, buffer, file_no)
  new_name = File.basename file 
  new_name.gsub! "_", "-"
  new_name.gsub! "archive", "blog" if file_no == 0
  new_name.gsub! "archive", "#{file_no.to_s}-blog" if file_no > 0
  File.open("blogger_export/"+new_name, 'w') {|f| f.write(buffer) }
  puts new_name
end

Dir["_blogger_archive/*.html"].each do |file|
  buffer = ""
  n = 0
  line_no = 0
  file_no = 0
  File.open(file, 'r') do |infile|
    while (line = infile.gets)
      line_no = line_no+1
      if line =~ /^---$/
        n = n+1
        if n == 3
          puts "Split #{file} at #{line_no}"
          write_file(file, buffer, file_no)
          n = 1
          file_no = file_no+1
          buffer = ""
        end
      end
      buffer << line
    end
    write_file(file, buffer, file_no)
  end
end

