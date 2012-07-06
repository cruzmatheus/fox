class UsersController < ApplicationController
  
  def new
    @user = User.new
    @@invite = Invite.find_by_activate_key(params[:email])
  end

  #cria novo usuario e atualiza o convite para 'usuario ativo'
  def create
    @user = User.new(params[:user])
    
    puts "#{@user.name} - #{@user.email}"
    
    if !@@invite.nil? && self.encrypt_word(@user.email).eql?(encrypt_word(@@invite.email))
          @user.active = true
          if @user.save
            @@invite.update_attributes(:active => true)
            flash[:notice] = "Usuario cadastrado com sucesso."
            render :action => :show
          end
    else
      flash[:notice] = "Email invalido."
      render :action => :new
    end
  end
  
  def show
  end
  
  def activate
    User.find(params[:user]).update_attributes(:active => true)
    redirect_to :controller => :home, :action => :index
  end

  def deactivate
    User.find(params[:user]).update_attributes(:active => false)
    redirect_to :controller => :home, :action => :index
  end
  
  def encrypt_word(word)
    Digest::SHA1.hexdigest(word)
  end
end
