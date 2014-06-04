require "rexml/document"
require "rexml/xpath"

require "temboo"
require "Library/USPS"

class XMLExample

<<<<<<< HEAD
    def initialize()
        @session = TembooSession.new("benbeyerlein", "myFirstApp", "3a9aa8a73a024709babe31c21aec28fe")
    end

    def parse_usps_data()
    trackConfirmFieldsChoreo = USPS::DeliveryInformationAPI::TrackConfirmFields.new(@session)

    # Get an InputSet object for the choreo
    trackConfirmFieldsInputs = trackConfirmFieldsChoreo.new_input_set()

    # Set inputs
    trackConfirmFieldsInputs.set_Password("270MX72FS959");
    trackConfirmFieldsInputs.set_UserId("956INDEP1007");
    trackConfirmFieldsInputs.set_TrackID("9405510200986253264474");
    trackConfirmFieldsInputs.set_Endpoint("testing");

    # Execute Choreo
    trackConfirmFieldsResults = trackConfirmFieldsChoreo.execute(trackConfirmFieldsInputs)

    # printf(trackConfirmFieldsResults.get_Response())
    xml = trackConfirmFieldsResults.get_Response()

    puts xml
=======
    # def initialize()
    #     @session = TembooSession.new("benbeyerlein", "myFirstApp", "3a9aa8a73a024709babe31c21aec28fe")
    # end

    def parse_usps_data()
    # trackConfirmFieldsChoreo = USPS::DeliveryInformationAPI::TrackConfirmFields.new(@session)

    # # Get an InputSet object for the choreo
    # trackConfirmFieldsInputs = trackConfirmFieldsChoreo.new_input_set()

    # # Set inputs
    # trackConfirmFieldsInputs.set_Password("270MX72FS959");
    # trackConfirmFieldsInputs.set_UserId("956INDEP1007");
    # trackConfirmFieldsInputs.set_TrackID("9405510200986253264474");
    # trackConfirmFieldsInputs.set_Endpoint("testing");

    # # Execute Choreo
    # trackConfirmFieldsResults = trackConfirmFieldsChoreo.execute(trackConfirmFieldsInputs)

    # # printf(trackConfirmFieldsResults.get_Response())
    # xml = trackConfirmFieldsResults.get_Response()
>>>>>>> 162d8530daf8c5f6877890297518b5b0da423143

    # I'm just hard-coding an XML sample here for testing, but normally you'll use trackConfirmFieldsResults.get_Response().
    testXML = "<?xml version=\"1.0\"?><TrackResponse><TrackInfo ID=\"01805213907042762274\"><TrackSummary><EventTime>12:12 pm</EventTime>
    <EventDate>May 21, 2001</EventDate><Event>DELIVERED</Event><EventCity>NEWTON</EventCity>
    <EventState>IA</EventState><EventZIPCode>50208</EventZIPCode><EventCountry/><FirmName></FirmName><Name></Name><AuthorizedAgent></AuthorizedAgent></TrackSummary><TrackDetail><EventTime>9:24 pm</EventTime><EventDate>March 28, 2001</EventDate><Event>ENROUTE</Event><EventCity>DES MOINES</EventCity><EventState>IA</EventState><EventZIPCode>50395</EventZIPCode><EventCountry/><FirmName/><Name/><AuthorizedAgent/></TrackDetail><TrackDetail><EventTime>10:00 pm</EventTime><EventDate>March 27, 2001</EventDate><Event>ACCEPTANCE</Event><EventCity>BLAINE</EventCity><EventState>WA</EventState><EventZIPCode>98231</EventZIPCode><EventCountry/><FirmName/><Name/><AuthorizedAgent/></TrackDetail></TrackInfo></TrackResponse>"

<<<<<<< HEAD
     #   xmlfile = File.new("example_api_out.xml")

        # document = REXML::Document.new(xml)
        # #document.elements.each("TrackResponse/TrackInfo/TrackSummary/Event") {
        # document.elements.each("TrackResponse/TrackInfo/TrackSummary") do |e|

        #     e.elements.each do |e2|

        #         puts e2.elements.first.text
        #     end
=======
        xmlfile = File.new("example_api_out.xml")

        document = REXML::Document.new(xmlfile)
        #document.elements.each("TrackResponse/TrackInfo/TrackSummary/Event") {
        document.elements.each("TrackResponse/TrackInfo/TrackSummary") do |e|

            e.elements.each do |e2|

                puts e2.elements.first.text
            end
>>>>>>> 162d8530daf8c5f6877890297518b5b0da423143

            #eventtime = document.elements.first("TrackResponse/TrackInfo/TrackSummary/#{e.name}")
            # => p eventtime
            # eventtime   =  document.elements.first(xmldoc, "//TrackSummary/EventTime").text
            # eventdate   = XPath.first(xmldoc, "//TrackSummary/EventDate").text
            # event   = XPath.first(xmldoc, "//TrackSummary/Event").text
            # eventcity   = XPath.first(xmldoc, "//TrackSummary/EventCity").text
            # eventstate   = XPath.first(xmldoc, "//TrackSummary/EventState").text
            # eventzipcode   = XPath.first(xmldoc, "//TrackSummary/EventZIPCode").text


        end


    # eventtime   =  document.elements.first(xmldoc, "//TrackSummary/EventTime").text
    # eventdate   = XPath.first(xmldoc, "//TrackSummary/EventDate").text
    # event   = XPath.first(xmldoc, "//TrackSummary/Event").text
    # eventcity   = XPath.first(xmldoc, "//TrackSummary/EventCity").text
    # eventstate   = XPath.first(xmldoc, "//TrackSummary/EventState").text
    # eventzipcode   = XPath.first(xmldoc, "//TrackSummary/EventZIPCode").text

    # puts "EventTime: #{eventtime}"
    # puts "EventDate: #{eventdate}"
    # puts "Event: #{event}"
    # puts "EventCity: #{eventcity}"
    # puts "EventState: #{eventstate}"
    # puts "EventZIPCode: #{eventzipcode}"


<<<<<<< HEAD
    # end
=======
    end
>>>>>>> 162d8530daf8c5f6877890297518b5b0da423143

end

instance = XMLExample.new()
instance.parse_usps_data()
