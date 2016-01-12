class PiercingsController < ApplicationController
  def new
    @piercing = Piercing.new
  end

  def create
    @piercing = Piercing.new(piercing_params)
      if @piercing.valid?
        WaiverMailer.new_piercing_waiver(@piercing).deliver_now
        flash[:success] = "Your waiver was sent"
        redirect_to '/'
      else
        flash[:notice] = "There was a problem sending your waiver"
        render 'waiver'
      end
  end

  private

  def piercing_params
    params.require(:piercing).permit(:name, :contact_number, :address, :city, :state,
                                     :zipcode, :date_of_birth, :gender, :doc_name,
                                     :doc_address, :doc_city, :doc_phone, :contact_name,
                                     :contact_address, :contact_city, :allergies, :disorder,
                                     :body_part, :placement, :implications, :sign )
  end
end
