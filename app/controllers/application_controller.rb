class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :check_primeiro_acesso

  def check_primeiro_acesso
    if current_user.primeiro_acesso
  end

end
