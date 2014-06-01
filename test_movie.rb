#!/usr/bin/ruby -w

require 'rexml/document'
include REXML

#xmlfile = File.new("test_movie.xml")
xmlfile = File.new("example_api_out.xml")
xmldoc = Document.new(xmlfile)

# Info for the first movie found
movie = XPath.first(xmldoc, "//TrackSummary")
#p movie["//TrackSummary"]

#movie.each_element_with_text {|e| p e}

#Summary info
  eventtime   =  XPath.first(xmldoc, "//TrackSummary/EventTime").text
  eventdate   = XPath.first(xmldoc, "//TrackSummary/EventDate").text
  event   = XPath.first(xmldoc, "//TrackSummary/Event").text
  eventcity   = XPath.first(xmldoc, "//TrackSummary/EventCity").text
  eventstate   = XPath.first(xmldoc, "//TrackSummary/EventState").text
  eventzipcode   = XPath.first(xmldoc, "//TrackSummary/EventZIPCode").text

      puts "EventTime: #{eventtime}"
      puts "EventDate: #{eventdate}"
      puts "Event: #{event}"
      puts "EventCity: #{eventcity}"
      puts "EventState: #{eventstate}"
      puts "EventZIPCode: #{eventzipcode}"

# Print out all the movie types
#XPath.each(xmldoc, "//TrackDetail/EventTime") { |e| puts e.text }

# Get an array of all of the movie formats.
#names = XPath.match(xmldoc, "//format").map {|x| x.text }
#p names


  # doc.search('//TrackSummary').each do |tracking_info|
  #     eventtime   = tracking_info.at('EventTime').text
  #     eventdate   = tracking_info.at('EventDate').text
  #     event   = tracking_info.at('Event').text
  #     eventcity   = tracking_info.at('EventCity').text
  #     eventstate   = tracking_info.at('EventState').text
  #     eventzipcode   = tracking_info.at('EventZIPCode').text

  #     puts "EventTime: #{eventtime}"
  #     puts "EventDate: #{eventdate}"
  #     puts "Event: #{event}"
  #     puts "EventCity: #{eventcity}"
  #     puts "EventState: #{eventstate}"
  #     puts "EventZIPCode: #{eventzipcode}"
  # end

