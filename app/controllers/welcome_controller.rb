class WelcomeController < ApplicationController
  def index
    if !current_user.nil? && current_user.primeiro_acesso
      redirect_to edit_usuario_path(current_user.id)
    end
  end
end
