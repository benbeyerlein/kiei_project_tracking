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
p ''
p "new stuff"
p ''

    testXML = "<?xml version=\"1.0\"?><TrackResponse><TrackInfo ID=\"01805213907042762274\"><TrackSummary><EventTime>12:12 pm</EventTime>
    <EventDate>May 21, 2001</EventDate><Event>DELIVERED</Event><EventCity>NEWTON</EventCity>
    <EventState>IA</EventState><EventZIPCode>50208</EventZIPCode><EventCountry/><FirmName></FirmName><Name></Name><AuthorizedAgent></AuthorizedAgent></TrackSummary><TrackDetail><EventTime>9:24 pm</EventTime><EventDate>March 28, 2001</EventDate><Event>ENROUTE</Event><EventCity>DES MOINES</EventCity><EventState>IA</EventState><EventZIPCode>50395</EventZIPCode><EventCountry/><FirmName/><Name/><AuthorizedAgent/></TrackDetail><TrackDetail><EventTime>10:00 pm</EventTime><EventDate>March 27, 2001</EventDate><Event>ACCEPTANCE</Event><EventCity>BLAINE</EventCity><EventState>WA</EventState><EventZIPCode>98231</EventZIPCode><EventCountry/><FirmName/><Name/><AuthorizedAgent/></TrackDetail></TrackInfo></TrackResponse>"

        document = REXML::Document.new(testXML)
        document.elements.each("TrackResponse/TrackInfo/TrackSummary/Event") {
           |e| puts "Event: " + e.text
        }
