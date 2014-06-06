class DeliveryTypesController < ApplicationController
  def index
    @delivery_types = DeliveryType.all
  end

  def show
    @delivery_type = DeliveryType.find(params[:id])
  end

  def new
    @delivery_type = DeliveryType.new
  end

  def create
    @delivery_type = DeliveryType.new
    @delivery_type.courier_id = params[:courier_id]
    @delivery_type.delivery_type = params[:delivery_type]
    @delivery_type.tracking_number_format = params[:tracking_number_format]
    @delivery_type.tracking_number_checksum = params[:tracking_number_checksum]

    if @delivery_type.save
      redirect_to "/delivery_types", :notice => "Delivery type created successfully."
    else
      render 'new'
    end
  end

  def edit
    @delivery_type = DeliveryType.find(params[:id])
  end

  def update
    @delivery_type = DeliveryType.find(params[:id])

    @delivery_type.courier_id = params[:courier_id]
    @delivery_type.delivery_type = params[:delivery_type]
    @delivery_type.tracking_number_format = params[:tracking_number_format]
    @delivery_type.tracking_number_checksum = params[:tracking_number_checksum]

    if @delivery_type.save
      redirect_to "/delivery_types", :notice => "Delivery type updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @delivery_type = DeliveryType.find(params[:id])

    @delivery_type.destroy

    redirect_to "/delivery_types", :notice => "Delivery type deleted."
  end
end
