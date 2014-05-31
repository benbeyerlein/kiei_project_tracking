class CarriersController < ApplicationController
  def index
    @carriers = Carrier.all
  end

  def show
    @carrier = Carrier.find(params[:id])
  end

  def new
    @carrier = Carrier.new
  end

  def create
    @carrier = Carrier.new
    @carrier.name = params[:name]

    if @carrier.save
      redirect_to "/carriers", :notice => "Carrier created successfully."
    else
      render 'new'
    end
  end

  def edit
    @carrier = Carrier.find(params[:id])
  end

  def update
    @carrier = Carrier.find(params[:id])

    @carrier.name = params[:name]

    if @carrier.save
      redirect_to "/carriers", :notice => "Carrier updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @carrier = Carrier.find(params[:id])

    @carrier.destroy

    redirect_to "/carriers", :notice => "Carrier deleted."
  end
end
