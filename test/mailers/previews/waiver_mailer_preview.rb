# Preview all emails at http://localhost:3000/rails/mailers/waiver_mailer
class WaiverMailerPreview < ActionMailer::Preview
  def new_tattoo_waiver
    WaiverMailer.new_tattoo_waiver(@tattoo)
  end
end
