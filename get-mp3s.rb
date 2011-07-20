require 'nokogiri'
require 'open-uri'
require 'net/http'

[
  'http://www.xlr8r.com/mp3',
  'http://www.thedownplayer.com/'
].each { |pagepath|
	doc = Nokogiri::HTML(open(pagepath))
	doc.xpath('//a').each do |link|
	  linkpath = link['href']  
	  if linkpath.end_with?('.mp3') 
		  filename = linkpath.split('/')[-1]  
		  puts linkpath + ' filename ' + filename
		  
		  resp = Net::HTTP.get_response(URI.parse(linkpath))
		  open(filename, 'wb') { |file|
			file.write(resp.body)
		  }
	  end
	end
}