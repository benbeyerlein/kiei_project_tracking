class ShipmentsController < ApplicationController

  def my_shipments
    @shipment = Shipment.new
    @shipments = Shipment.where(:user_id => current_user.id)
  end

  def index
    @shipments = Shipment.all
  end

  def show
    @shipment = Shipment.find(params[:id])

    @origin_zip = @shipment.tracking_details.first.zip
    @last_zip = @shipment.tracking_details.last.zip

    size = @shipment.tracking_details.count
    puts size

    if size > 2
      @waypoint_zips = "&waypoints="

      @shipment.tracking_details.each_with_index do |tracking_detail, index|
        if index > 1 && index < (size - 1)
          @waypoint_zips = @waypoint_zips + tracking_detail.zip + "|"
        end
      end
      len = @waypoint_zips.length - 1
      @waypoint_zips = @waypoint_zips.truncate(len, omission: "")
    else
      @waypoint_zips = ""
    end

  end

  def new
    @shipment = Shipment.new
  end

  def track
    @shipment = Shipment.new
  end

  require 'active_shipping'
  include ActiveMerchant::Shipping

  def create
    @shipment = Shipment.new
    @shipment.sender_name = params[:sender_name]
    @shipment.send_date = params[:send_date]
    @shipment.notes = params[:notes]
    @shipment.courier_id = params[:courier_id]
    @shipment.tracking_number = params[:tracking_number]
    @shipment.delivery_type_id = params[:delivery_type_id]
    @shipment.user_id = current_user.id #params[:user_id]
    @shipment.tracking_number_status_id = params[:tracking_number_status_id]

    if @shipment.save
      #ALLOW DETAILS TO BE RETRIEVED EVEN IF PACKAGE ALREADY EXISTS OR GET UPDATED INFO?

      # Get tracking Detail and put it into the Tracking_Detail table
      usps = USPS.new(:login => '956INDEP1007', :password => '270MX72FS959')
      tracking_info = usps.find_tracking_info("#{@shipment.tracking_number}")

      shipment_id = Shipment.find_by(:tracking_number => "#{@shipment.tracking_number}").id
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


      redirect_to "/my_shipments", :notice => "Shipment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @shipment = Shipment.find(params[:id])
  end

  def update
    @shipment = Shipment.find(params[:id])

    @shipment.sender_name = params[:sender_name]
    @shipment.send_date = params[:send_date]
    @shipment.notes = params[:notes]
    @shipment.courier_id = params[:courier_id]
    @shipment.tracking_number = params[:tracking_number]
    @shipment.delivery_type_id = params[:delivery_type_id]
    @shipment.user_id = params[:user_id]
    @shipment.tracking_number_status_id = params[:tracking_number_status_id]

    if @shipment.save
      redirect_to "/shipments", :notice => "Shipment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @shipment = Shipment.find(params[:id])

    @shipment.destroy

    redirect_to "/shipments", :notice => "Shipment deleted."
  end
end
