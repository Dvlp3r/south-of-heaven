class WaiverMailer < ApplicationMailer
  def new_tattoo_waiver(waiver)
    @tattoo_waiver = waiver
    mail to: "#{@tattoo_waiver.email}", subject: "Tattoo waiver for #{@tattoo_waiver.name}"
  end

  def new_piercing_waiver(waiver)
    @piercing_waiver = waiver
    mail to: "#{@piercing_waiver.email}", subject: "Piercing waiver for #{@piercing_waiver.name}"
  end
end
