class ExampleMailer < ApplicationMailer
  default from: "lapoubellede42@gmail.com"
  def sample_email(id)
    @id = id
    mail(to: "riadmegh@gmail.com", subject: 'Sample Email')
  end
end
