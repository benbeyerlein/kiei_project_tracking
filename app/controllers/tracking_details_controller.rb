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
    @tracking_detail.package_id = params[:package_id]
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

    @tracking_detail.package_id = params[:package_id]
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
end
