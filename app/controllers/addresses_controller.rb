class AddressesController < ApplicationController
  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all

    render json: @addresses
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    @address = Address.find(params[:id])

    render json: @address
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(params[:address])

    if @address.save
      render json: @address, status: :created, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    @address = Address.find(params[:id])

    if @address.update(params[:address])
      head :no_content
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    head :no_content
  end
end
