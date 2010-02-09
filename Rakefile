require 'rubygems'

desc "Build the website"
task :build do
  sh %{~/src/ext/jekyll/bin/jekyll}
end
desc "Publish the website"
task :publish => :build do
  sh %{rsync -arvuz _site/ fuzzymonk_blog@fuzzymonk.com:dev.fuzzymonk.com/}
end
