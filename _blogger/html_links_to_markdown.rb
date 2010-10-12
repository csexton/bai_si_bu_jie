#!/usr/bin/env ruby
# Convert HTML links to Markdown links
#
# This will not:
#
#  * replace multi line links 
#  * replace links with nested tags 
#    e.g. like images <a href="#"><imr src="fail.png" /></a>
#  * match any links that have an atribue that starts with 'h' before href. I
#    don't think this is a very high use case.  
#    e.g.: <a height="4" href="#">fail</a>
#
# Those cases should just result in the original *ugly* links remaining in the
# document, which can be manually fixed.
#
# Usage:
#
#   ruby html_links_to_markdown.rb <file.html> > file.markdown
ARGF.each do |line|
    puts line.gsub /<a [^h]*href=["']([^"']*)["'][^>]*>([^<]*)<\/a>/, "[\\2](\\1)"
end

