#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'

#This will iterate through a list of websites, pull the text from the html
#and scan the text for occurences of words defined in a separate list

#I would also like to eventually implement a separate method for scanning
#for card tags and identifying hot-topic cards
counter = Hash.new(0)
isIndexed = ""
doc = Nokogiri::HTML(open("http://www.gatheringmagic.com/carlosgutierrez-091812september-2012-cmdr-ba/"))
doc.xpath('//p/a').each do |node|
	counter.each_pair do |index,value|
		if index == node.content
			isIndexed = "true"
		else
			isIndexed = "false"
		end
	end
	if isIndexed == "true"
		counter[node.content] = counter[node.content] + 1
	else
		counter[node.content] = 1
	end
end
counter.each_pair do |index,value|
	puts index 
	puts value
end
