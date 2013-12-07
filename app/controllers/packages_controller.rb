class PackagesController < ApplicationController

  before_action :authenticate_regular_client, :only => [:show, :create, :find_by_token]
  before_action :authenticate_admin_client, :only => [:index, :update, :delete]

  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all

    render json: @packages, :each_serializer => ShortPackageSerializer
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    @package = Package.find(params[:id])

    render json: @package
  end

  def find_by_token
    @package = Package.find_by!(:token => params[:token])

    render json: @package
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = PackageService.create_package(params)

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

    if @package.update(package_params)
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

  private

    def package_params
      params.require(:package).permit(:category, :charge_amount, :insurance, :info, :status)
    end
end
