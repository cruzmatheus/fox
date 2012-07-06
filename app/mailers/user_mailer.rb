class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def invitation(invite, key)
    @name = invite.name
    @activate_key = key
    mail(:to => invite.email, :subject => "Convite para ingressar no Fox",
    :host => "localhots:3000")
  end
end
