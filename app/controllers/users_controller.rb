class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

   def create
    @user = User.new(params_user)
    if @user.save(params_user)
      redirect_to users_path, notice: "Usuário cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(params_user)
        format.html { redirect_to users_path, notice: 'Usuário atualizado com sucesso!' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user.destroy(params_user)
      redirect_to users_path, notice: "Usuário excluido com sucesso!"
    else
      render :index
     end
  end

  private
    def params_user
      prm = params.require(:user).permit(:name,:email,:password,:profile_id)
      prm.delete(:password) if prm[:password].blank?
      prm
    end

end
#user.errors.messages