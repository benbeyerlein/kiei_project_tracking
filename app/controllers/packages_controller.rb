  # require 'active_shipping'
  # include ActiveMerchant::Shipping

class PackagesController < ApplicationController

  def index
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def new
    @package = Package.new
  end

  def track
    @package = Package.new
  end


  def create
    @package = Package.new
    @package.sender_name = params[:sender_name]
    @package.send_date = params[:send_date]
    @package.notes = params[:notes]
    @package.carrier_id = params[:carrier_id]
    @package.tracking_number = params[:tracking_number]
    @package.delivery_type_id = params[:delivery_type_id]
    @package.user_id = current_user.id #params[:user_id]
    @package.tracking_number_status_id = params[:tracking_number_status_id]

    if @package.save

      # Get tracking Detail and put it into the Tracking_Detail table
      # usps = USPS.new(:login => '956INDEP1007', :password => '270MX72FS959')
      # tracking_info = usps.find_tracking_info("#{@package.tracking_number}")

      # package_id = Package.find_by(:tracking_number => "#{@package.tracking_number}").id
      # puts package_id

      # tracking_info.shipment_events.each do |event|
      # puts "#{event.name} at #{event.location.city}, #{event.location.state} #{event.location.zip} on #{event.time}. #{event.message}"

      #   @tracking_detail = TrackingDetail.new
      #   @tracking_detail.package_id = package_id
      #   @tracking_detail.activity_datetime = event.time
      #   @tracking_detail.city = event.location.city
      #   @tracking_detail.state = event.location.state
      #   @tracking_detail.zip = event.location.zip
      #   @tracking_detail.activity_note = event.name
      #   @tracking_detail.save

      # end


      redirect_to "/packages", :notice => "Package created successfully."
    else
      render 'new'
    end
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])

    @package.sender_name = params[:sender_name]
    @package.send_date = params[:send_date]
    @package.notes = params[:notes]
    @package.carrier_id = params[:carrier_id]
    @package.tracking_number = params[:tracking_number]
    @package.delivery_type_id = params[:delivery_type_id]
    @package.user_id = params[:user_id]
    @package.tracking_number_status_id = params[:tracking_number_status_id]

    if @package.save
      redirect_to "/packages", :notice => "Package updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @package = Package.find(params[:id])

    @package.destroy

    redirect_to "/packages", :notice => "Package deleted."
  end
end
