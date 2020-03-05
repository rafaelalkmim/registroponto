class UsuariosController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new(password: 'newUser')
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new
    @user.password = params_user[:cpf] rescue "novousuario"
    @user.update(params_user)

    respond_to do |format|
      if @user.save
        # Mandando o email para o usuario criado
        ApplicationMailer.send_new_user(@user.name, @user.email, @user.cpf, @user.password).deliver!
        format.html { redirect_to usuarios_url, notice: 'Usuário criado com sucesso.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    new_password = current_user.primeiro_acesso && !params_user[:password_confirmation].present?

    if new_password
      @user.primeiro_acesso = false
      @user.save
    end

    respond_to do |format|
      if (new_password || !current_user.primeiro_acesso) && @user.update(params_user)
        format.html { redirect_to usuarios_url, notice: 'Usuário atualizado com sucesso.' }
        format.json { render :index, status: :ok, location: @user }
      else
        @user.errors.add(:password, :blank, message: "As senhas digitadas não são semelhantes!") if current_user.primeiro_acesso
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuário excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def params_user
    prm = params.require(:user).permit(:name,:cpf,:email,:password,:password_confirmation,:profile_id,:area_id,:active)
    prm.delete(:password) if prm[:password].blank?
    prm.delete(:password_confirmation) if prm[:password] == prm[:password_confirmation]
    prm.delete(:cpf) if prm[:cpf].blank? || prm[:cpf].length != 14
    prm
  end
end