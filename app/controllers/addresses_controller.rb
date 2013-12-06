class AddressesController < ApplicationController

  before_action :authenticate_regular_client

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
end
