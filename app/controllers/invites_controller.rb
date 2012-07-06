class InvitesController < ApplicationController
  
  #pagina de envio de convites
  def send_invites
    @invite = Invite.new
  end
  
  #acao de enviar convites
  def send_invite
    # self.generate_manager_key
    @invite = Invite.new
    
    invite = Invite.new(params[:invite])
    
    self.encrypt_word(invite.email)
    
    if !Invite.find_by_email(invite.email).nil?
      flash[:notice] = "Esse email ja foi cadastrado, tente outro."
      render :action => :send_invites
    elsif UserMailer.invitation(invite, @encrypted_word).deliver
      self.create
    else 
      render :action => :send_invites
    end
  end
  
  #salvar novo convite
  def create
    @invite = Invite.new(params[:invite])
    @invite.activate_key = @encrypted_word
    if @invite.save
      flash[:notice] = "Convite enviado com sucesso"
      redirect_to :controller => :home, :action => :index
    else
      render :action => :send_invites
    end
  end
  
  def encrypt_word(word)
    @encrypted_word = Digest::SHA1.hexdigest(word)
  end
  
  #gera a chave para cadastrar um coordenador/professor
  def generate_manager_key
    @key = ""
    5.times do |f|
      @key << rand(1000).to_s
    end    
  end
  
end
