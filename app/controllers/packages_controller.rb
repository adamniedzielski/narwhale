class PackagesController < ApplicationController

  before_action :authenticate_regular_client, :only => [:show, :create]
  before_action :authenticate_admin_client, :only => [:index, :update, :delete]

  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all

    render json: @packages
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    @package = Package.find(params[:id])

    render json: @package
  end

  # TODO: if the receiver is not found, create its record together with address
  #       else copy receiver address to package
  #       copy sender address to package
  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(params[:package])

    if @package.save
      render json: @package, status: :created, location: @package
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    @package = Package.find(params[:id])

    if @package.update(params[:package])
      head :no_content
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package = Package.find(params[:id])
    @package.destroy

    head :no_content
  end
end
