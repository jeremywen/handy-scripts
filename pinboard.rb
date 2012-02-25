 require 'pinboard'
 require 'awesome_print'
 posts = Pinboard::Post.all(:username => ENV['PINBOARD_UN'], :password => ENV['PINBOARD_PW'])
 ap posts