class AddressesController < ApplicationController
  include AddressParams

  before_action :authenticate_regular_client

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
      head :no_content
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end
end
