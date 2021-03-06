class TrackingDetailsController < ApplicationController
  def index
    @tracking_details = TrackingDetail.all
  end

  def show
    @tracking_detail = TrackingDetail.find(params[:id])
  end

  def new
    @tracking_detail = TrackingDetail.new
  end

  def create
    @tracking_detail = TrackingDetail.new
    @tracking_detail.shipment_id = params[:shipment_id]
    @tracking_detail.activity_datetime = params[:activity_datetime]
    @tracking_detail.city = params[:city]
    @tracking_detail.state = params[:state]
    @tracking_detail.zip = params[:zip]
    @tracking_detail.activity_note = params[:activity_note]

    if @tracking_detail.save
      redirect_to "/tracking_details", :notice => "Tracking detail created successfully."
    else
      render 'new'
    end
  end

  def edit
    @tracking_detail = TrackingDetail.find(params[:id])
  end

  def update
    @tracking_detail = TrackingDetail.find(params[:id])

    @tracking_detail.shipment_id = params[:shipment_id]
    @tracking_detail.activity_datetime = params[:activity_datetime]
    @tracking_detail.city = params[:city]
    @tracking_detail.state = params[:state]
    @tracking_detail.zip = params[:zip]
    @tracking_detail.activity_note = params[:activity_note]

    if @tracking_detail.save
      redirect_to "/tracking_details", :notice => "Tracking detail updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @tracking_detail = TrackingDetail.find(params[:id])

    @tracking_detail.destroy

    redirect_to "/tracking_details", :notice => "Tracking detail deleted."
  end


  require 'active_shipping'
  include ActiveMerchant::Shipping

  def update_tracking

       # Get tracking Detail and put it into the Tracking_Detail table
      usps = USPS.new(:login => '956INDEP1007', :password => '270MX72FS959')
      tracking_info = usps.find_tracking_info("#{params[:tracking_number]}")

      shipment_id = Shipment.find_by(:tracking_number => "#{params[:tracking_number]}").id
      puts shipment_id

      tracking_info.shipment_events.each do |event|
      puts "#{event.name} at #{event.location.city}, #{event.location.state} #{event.location.zip} on #{event.time}. #{event.message}"

        @tracking_detail = TrackingDetail.new
        @tracking_detail.shipment_id = shipment_id
        @tracking_detail.activity_datetime = event.time
        @tracking_detail.city = event.location.city
        @tracking_detail.state = event.location.state
        @tracking_detail.zip = event.location.zip
        @tracking_detail.activity_note = event.name
        @tracking_detail.save

      end

      redirect_to "/my_shipments"
  end

end

# another USPS 9274899998442501326173


