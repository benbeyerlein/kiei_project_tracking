# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Address.create(address_line1: '340 E Superior St.', address_line2: '', city: 'Chicago', state: 'IL', zip: '60611')
Carrier.create(name: 'USPS')
DeliveryType.create(carrier_id: 1, delivery_type: 'Priority Two-Day', tracking_number_format: '123456789', tracking_number_checksum: 'pattern')
Package.create(sender_name: 'Amazon.com', send_date: Date.strptime('05/19/2014','%m/%d/%Y'), notes: 'from seed file', carrier_id: 1, tracking_number: '9405510200986253264474', delivery_type_id: 1, user_id: 1, tracking_number_status_id: 1)

TrackingDetail.create(package_id: 1, activity_datetime: DateTime.strptime("05/19/2014 12:27", "%m/%d/%Y %H:%M"), city: 'Milton', state: 'WI', zip: '53563', activity_note: 'Acceptance')
TrackingDetail.create(package_id: 1, activity_datetime: DateTime.strptime("05/19/2014 17:27", "%m/%d/%Y %H:%M"), city: 'Milton', state: 'WI', zip: '53563', activity_note: 'Depart Post Office')
TrackingDetail.create(package_id: 1, activity_datetime: DateTime.strptime("05/20/2014 11:08", "%m/%d/%Y %H:%M"), city: 'Elk Grove Village', state: 'IL', zip: '60007', activity_note: 'Processed through USPS Sort Facility')
TrackingDetail.create(package_id: 1, activity_datetime: DateTime.strptime("05/21/2014 08:04", "%m/%d/%Y %H:%M"), city: 'CHicago', state: 'IL', zip: '60610', activity_note: 'Out for Delivery')
TrackingDetail.create(package_id: 1, activity_datetime: DateTime.strptime("05/21/2014 16:57", "%m/%d/%Y %H:%M"), city: 'CHicago', state: 'IL', zip: '60611', activity_note: 'Delivered')

TrackingNumberStatus.create(status: 'Active')
