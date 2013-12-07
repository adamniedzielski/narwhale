class DeliveryMenController < ApplicationController

  before_action :authenticate_admin_client

  # GET /delivery_men
  # GET /delivery_men.json
  def index
    @delivery_men = DeliveryMan.all

    render json: @delivery_men, :each_serializer => ShortDeliveryManSerializer
  end

  # GET /delivery_men/1
  # GET /delivery_men/1.json
  def show
    @delivery_man = DeliveryMan.find(params[:id])

    render json: @delivery_man
  end

  # POST /delivery_men
  # POST /delivery_men.json
  def create
    @delivery_man = DeliveryMan.new(delivery_man_params)

    if @delivery_man.save
      render json: @delivery_man, status: :created, location: @delivery_man
    else
      render json: @delivery_man.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /delivery_men/1
  # PATCH/PUT /delivery_men/1.json
  def update
    @delivery_man = DeliveryMan.find(params[:id])

    if @delivery_man.update(delivery_man_params)
      head :no_content
    else
      render json: @delivery_man.errors, status: :unprocessable_entity
    end
  end

  # DELETE /delivery_men/1
  # DELETE /delivery_men/1.json
  def destroy
    @delivery_man = DeliveryMan.find(params[:id])
    @delivery_man.destroy

    head :no_content
  end

  private

    def delivery_man_params
      params.require(:delivery_man).permit(:symbol)
    end
end
