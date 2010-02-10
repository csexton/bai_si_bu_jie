require 'rubygems'
require "active_support"

desc "Build the website"
task :build do
  sh %{~/src/ext/jekyll/bin/jekyll}
end

desc "Rsync the files"
task :rsync do
  sh %{rsync -arvuz _site/ fuzzymonk_blog@fuzzymonk.com:fuzzymonk.com/}
end

desc "Publish the website"
task :publish => [:build, :rsync] do
  puts "Published!"
end

desc "Creates a new _posts file using TITLE='the title' and today's date. JEKYLL_EXT=markdown by default"
task :post do
  ext = ENV['JEKYLL_EXT'] || "markdown"
  unless title = ENV['TITLE']
    puts "USAGE: rake post TITLE='the post title'"
    exit(1)
  end
  post_title = "#{Date.today.to_s(:db)}-#{title.downcase.gsub(/[^\w]+/, '-')}"
  post_file = File.dirname(__FILE__) + "/_posts/#{post_title}.#{ext}"
  File.open(post_file, "w") do |f|
    f << <<-EOS.gsub(/^    /, '')
    ---
    layout: post
    title: #{title}
    ---
    
    EOS
  end
  if (ENV['EDITOR'])
    system ("#{ENV['EDITOR']} #{post_file}") 
    system ("git add #{post_file}") 
  end
end


