
class PackageService

  def self.create_package(params)
    self.new.create_package(params)
  end

  def create_package(params)
    @params = params
    check_params_formatting

    package = Package.new(package_params)
    package.status = 'New'
    package.token = SecureRandom.hex

    package.sender = find_sender
    package.build_sender_address(package.sender.address.dup.attributes)

    package.receiver = find_or_create_receiver
    package.build_receiver_address(receiver_address_params)
    
    package
  end

  private

    def check_params_formatting
      raise "receiver not found in parameters" unless @params[:receiver].present?
    end

    def package_params
      @params.require(:package).permit(:category, :charge_amount, :insurance, :info)
    end

    def find_sender
      User.find(@params[:sender_id])
    end

    def find_or_create_receiver
      receiver = User.find_by(:email => @params[:receiver][:email])
      
      if receiver.blank?
        receiver = User.new(receiver_params)
        receiver.registered = false
      end

      receiver
    end

    def receiver_params
      @params.require(:receiver).permit(:first_name, :last_name, :email, :nip)
    end

    def receiver_address_params
      @params.require(:receiver_address).permit(:first_line,
                                      :second_line,
                                      :city, 
                                      :postal_code, 
                                      :phone_number)
    end
end