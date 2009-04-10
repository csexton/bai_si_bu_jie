---
title: Using sqlite as a production DB
tags: tech
layout: post
---
I wanted to use sqlite3 as my production DB for a <a href="http://github.com/csexton/cookbook/tree/master">little web app</a> that I am working on.  Wasn't sure exactly what was going to be needed, but turns out if you add the following to your cap recipie you are all set.  Shiny!<br /><br /><pre class="code"><br />  task :after_update_code do <br />    run "ln -s #{deploy_to}/#{shared_dir}/db/production.sqlite3 #{current_release}/db/production.sqlite3" <br />  end <br /></pre><br /><br />You might notice I am using bort as the starting point for cookbook.  They really have done everything I need, in the way I need. Since I am using it with Dreamhost (read: Passenger) and git I really didn't need to undo ANYTHING.
