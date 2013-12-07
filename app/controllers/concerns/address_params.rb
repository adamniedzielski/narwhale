
module AddressParams
  extend ActiveSupport::Concern

  def address_params
    params.require(:address).permit(:first_line,
                                    :second_line,
                                    :city, 
                                    :postal_code, 
                                    :phone_number)
  end
end