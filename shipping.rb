require 'active_shipping'
include ActiveMerchant::Shipping

usps = USPS.new(:login => '956INDEP1007', :password => '270MX72FS959')
tracking_info = usps.find_tracking_info('9405510200986253264474')

tracking_info.shipment_events.each do |event|
  puts "#{event.name} at #{event.location.city}, #{event.location.state} on #{event.time}. #{event.message}"
end
    # trackConfirmFieldsInputs.set_Password("270MX72FS959");
    # trackConfirmFieldsInputs.set_UserId("956INDEP1007");
    # trackConfirmFieldsInputs.set_TrackID("9405510200986253264474");
    # trackConfirmFieldsInputs.set_Endpoint("testing");
