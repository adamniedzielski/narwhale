class UsersController < ApplicationController
  include AddressParams

  before_action :authenticate_regular_client,
                :only => [:show, :create, :update, :authenticate, :packages]
  before_action :authenticate_admin_client, :only => [:index, :destroy]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.includes(:address)

    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.address = Address.new(address_params)
    @user.registered = true

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end

  def authenticate
    @user = User.find_by(:email => params[:email])
    return email_not_found if @user.blank?

    if @user.password == params[:password]
      render :json => @user
    else
      password_invalid
    end
  end

  def packages
    @user = User.includes(:sent_packages, :received_packages).find(params[:id])

    render :json => @user, :serializer => UserPackagesSerializer
  end

  private

    def email_not_found
      render :json => 
             {:error => "Email not found"}.to_json,
             :status => 500
    end

    def password_invalid
      render :json => 
             {:error => "Password invalid"}.to_json,
             :status => 500
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :nip)
    end
end
