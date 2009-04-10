---
title: ICU Gem on fresh OS X Install
tags: 
layout: post
---
I was just helping our graphic deigner set up Rails on his shiny new mac, and was using the built in Ruby plus MacPorts for gettext and ICU. Everything was cake until ICU didn't install, which was because it wasn't looking for it in /opt/local.  So to fix this:<br /><br /><pre>$ sudo gem install icu -- --with-icu-dir=/opt/local/<br /></pre><br />Huzzah!
