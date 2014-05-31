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

  def create
    @package = Package.new
    @package.sender_name = params[:sender_name]
    @package.send_date = params[:send_date]
    @package.notes = params[:notes]
    @package.carrier_id = params[:carrier_id]
    @package.tracking_number = params[:tracking_number]
    @package.delivery_type_id = params[:delivery_type_id]
    @package.user_id = params[:user_id]
    @package.tracking_number_status_id = params[:tracking_number_status_id]

    if @package.save
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
