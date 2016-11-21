class Step2 < ApplicationMailer
  def step2(id)
    @id = id
    mail(to: "riadmegh@gmail.com", subject: 'Sample Email')
  end
end
