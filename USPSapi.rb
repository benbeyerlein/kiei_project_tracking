require "temboo"
require "Library/USPS"

def trackstuff

  # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
  session = TembooSession.new("benbeyerlein", "myFirstApp", "3a9aa8a73a024709babe31c21aec28fe")
  trackConfirmFieldsChoreo = USPS::DeliveryInformationAPI::TrackConfirmFields.new(session)

  # Get an InputSet object for the choreo
  trackConfirmFieldsInputs = trackConfirmFieldsChoreo.new_input_set()

  # Set inputs
  trackConfirmFieldsInputs.set_Password("270MX72FS959");
  trackConfirmFieldsInputs.set_UserId("956INDEP1007");
  trackConfirmFieldsInputs.set_TrackID("9405510200986253264474");
  trackConfirmFieldsInputs.set_Endpoint("testing");

  # Execute Choreo
  trackConfirmFieldsResults = trackConfirmFieldsChoreo.execute(trackConfirmFieldsInputs)
  puts trackConfirmFieldsResults

end

require "Library/Google"

def test
  # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
  session = TembooSession.new("benbeyerlein", "myFirstApp", "3a9aa8a73a024709babe31c21aec28fe")
  geocodeByAddressChoreo = Google::Geocoding::GeocodeByAddress.new(session)

  # Get an InputSet object for the choreo
  geocodeByAddressInputs = geocodeByAddressChoreo.new_input_set()

  # Set inputs
  geocodeByAddressInputs.set_Address("340 E Superior St. Chicago IL 60611");

  # Execute Choreo
  geocodeByAddressResults = geocodeByAddressChoreo.execute(geocodeByAddressInputs)
  printf("Latitude: %s\n", geocodeByAddressResults.get_Latitude())
  printf("Longitude: %s\n", geocodeByAddressResults.get_Longitude())
end

trackstuff



#{}`connect': SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed (OpenSSL::SSL::SSLError)
