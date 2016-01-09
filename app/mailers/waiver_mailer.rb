class WaiverMailer < ApplicationMailer
  def new_tattoo_waiver(waiver)
    @tattoo_waiver = waiver
    mail to: "vt@deepbluedev.co", subject: "Tattoo waiver for #{@tattoo_waiver.name}"
  end

  def new_piercing_waiver(waiver)
    @piercing_waiver = waiver
    mail to: "vt@deepbluedev.co", subject: "Piercing waiver for #{@piercing_waiver.name}"
  end
end
