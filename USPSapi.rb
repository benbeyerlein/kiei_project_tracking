require "temboo"
require "Library/USPS"
require 'nokogiri'
require 'open-uri'


require "rexml/document"
require "rexml/xpath"

require "Library/Yahoo"


class XMLExample

    def initialize()
        @session = TembooSession.new("benbeyerlein", "myFirstApp", "3a9aa8a73a024709babe31c21aec28fe")
    end

    def trackstuff

      # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
      #session = TembooSession.new("benbeyerlein", "myFirstApp", "3a9aa8a73a024709babe31c21aec28fe")
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

      #puts trackConfirmFieldsResults

      document = REXML::Document.new(trackConfirmFieldsResults.get_Response())
      #puts document

      result = REXML::XPath.each(document, "//TrackSummary") { |info| puts info.text }
      # Salient information about the condition are stored in its attributes. Get a hash of them.
      #attributes = condition.attributes()
      puts result


    end

    def parse_data()
        weather_choreo = Yahoo::Weather::GetWeatherByAddress.new(@session)

        # Get an InputSet object for the choreo
        weather_inputs = weather_choreo.new_input_set()

        # Set inputs
        weather_inputs.set_Address("104 Franklin St, New York, NY")

        # Execute Choreo
        weather_results = weather_choreo.execute(weather_inputs)

        document = REXML::Document.new(weather_results.get_Response())
puts document

        condition = REXML::XPath.first(document, '//ytweather:condition', {'ytweather' => 'http://xml.weather.yahoo.com/ns/rss/1.0'})
        # Salient information about the condition are stored in its attributes. Get a hash of them.
        attributes = condition.attributes()
        # Using the fields of your condition attribute hash, get some info about the weather.
        printf("Conditions are %s with a temperature of %s.\n", attributes['text'], attributes['temp'])
    end

end

instance = XMLExample.new()
instance.trackstuff()












def parsexml(data)
  doc = Nokogiri::XML(data)

  puts doc

  doc.search('//TrackSummary').each do |tracking_info|
      eventtime   = tracking_info.at('EventTime').text
      eventdate   = tracking_info.at('EventDate').text
      event   = tracking_info.at('Event').text
      eventcity   = tracking_info.at('EventCity').text
      eventstate   = tracking_info.at('EventState').text
      eventzipcode   = tracking_info.at('EventZIPCode').text

      puts "EventTime: #{eventtime}"
      puts "EventDate: #{eventdate}"
      puts "Event: #{event}"
      puts "EventCity: #{eventcity}"
      puts "EventState: #{eventstate}"
      puts "EventZIPCode: #{eventzipcode}"
  end



end

# get XML
#tracking_xmlsimple

# write file

# File.open('usps.xml', 'w') { |file| file.write(trackstuff.all) }

# parse file/XML
#parsexml()



=begin

require "rexml/document"
require "rexml/xpath"

require "temboo"
require "Library/Yahoo"

class XMLExample

    def initialize()
        @session = TembooSession.new("benbeyerlein", "myFirstApp", "3a9aa8a73a024709babe31c21aec28fe")
    end

    def parse_weather_data()
        weather_choreo = Yahoo::Weather::GetWeatherByAddress.new(@session)

        # Get an InputSet object for the choreo
        weather_inputs = weather_choreo.new_input_set()

        # Set inputs
        weather_inputs.set_Address("340 E. Superior St. Chicago IL 60611")

        # Execute Choreo
        weather_results = weather_choreo.execute(weather_inputs)

        document = REXML::Document.new(weather_results.get_Response())
        condition = REXML::XPath.first(document, '//ytweather:condition', {'ytweather' => 'http://xml.weather.yahoo.com/ns/rss/1.0'})
        # Salient information about the condition are stored in its attributes. Get a hash of them.
        attributes = condition.attributes()
        # Using the fields of your condition attribute hash, get some info about the weather.
        printf("Conditions are %s with a temperature of %s.\n", attributes['text'], attributes['temp'])
    end

end

instance = XMLExample.new()
instance.parse_weather_data()
=end

