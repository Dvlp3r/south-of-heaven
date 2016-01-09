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
    params.require(:piercing).permit(:name, :age, :phone)
  end
end
