class ApplicationMailer < ActionMailer::Base
  add_template_helper(SampleEmailHelper)
  default from: "from@example.com"
  layout 'mailer'
end
