class CouriersController < ApplicationController
  def index
    @couriers = Courier.all
  end

  def show
    @courier = Courier.find(params[:id])
  end

  def new
    @courier = Courier.new
  end

  def create
    @courier = Courier.new
    @courier.name = params[:name]

    if @courier.save
      redirect_to "/couriers", :notice => "Courier created successfully."
    else
      render 'new'
    end
  end

  def edit
    @courier = Courier.find(params[:id])
  end

  def update
    @courier = Courier.find(params[:id])

    @courier.name = params[:name]

    if @courier.save
      redirect_to "/couriers", :notice => "Courier updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @courier = Courier.find(params[:id])

    @courier.destroy

    redirect_to "/couriers", :notice => "Courier deleted."
  end
end
