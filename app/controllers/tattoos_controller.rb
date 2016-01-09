class TattoosController < ApplicationController
  def new
    @tattoo = Tattoo.new
  end

  def create
    @tattoo = Tattoo.new(tattoo_params)
      if @tattoo.valid?
        WaiverMailer.new_tattoo_waiver(@tattoo).deliver_now
        flash[:success] = "Your waiver was sent"
        redirect_to '/'
      else
        flash[:notice] = "There was a problem sending your waiver"
        render 'waiver'
      end
  end

  private

  def tattoo_params
    params.require(:tattoo).permit(:name, :age, :phone)
  end
end
