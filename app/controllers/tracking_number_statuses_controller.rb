class TrackingNumberStatusesController < ApplicationController
  def index
    @tracking_number_statuses = TrackingNumberStatus.all
  end

  def show
    @tracking_number_status = TrackingNumberStatus.find(params[:id])
  end

  def new
    @tracking_number_status = TrackingNumberStatus.new
  end

  def create
    @tracking_number_status = TrackingNumberStatus.new
    @tracking_number_status.status = params[:status]

    if @tracking_number_status.save
      redirect_to "/tracking_number_statuses", :notice => "Tracking number status created successfully."
    else
      render 'new'
    end
  end

  def edit
    @tracking_number_status = TrackingNumberStatus.find(params[:id])
  end

  def update
    @tracking_number_status = TrackingNumberStatus.find(params[:id])

    @tracking_number_status.status = params[:status]

    if @tracking_number_status.save
      redirect_to "/tracking_number_statuses", :notice => "Tracking number status updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @tracking_number_status = TrackingNumberStatus.find(params[:id])

    @tracking_number_status.destroy

    redirect_to "/tracking_number_statuses", :notice => "Tracking number status deleted."
  end
end
