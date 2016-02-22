class TattoosController < ApplicationController
  def new
    @tattoo = Tattoo.new
  end

  def create
    @piercing = Piercing.new
    @tattoo = Tattoo.new(tattoo_params)
      if @tattoo.valid?
        WaiverMailer.new_tattoo_waiver(@tattoo).deliver_now
        flash[:success] = "Your waiver was sent"
        redirect_to '/'
      else
        flash[:danger] = "There was a problem sending your waiver"
        render 'pages/waiver'
      end
  end

  private

  def tattoo_params
    params[:tattoo][:health_conditions] ||= []
    params.require(:tattoo).permit(:name, :reaction, :drugs, :permanent, :infection, :email,
                  :harmless, :verified, :age, :bday, :contact, :emergency_contact, :emergency_phone, health_conditions: [])
  end
end
