module UsuariosHelper

  def perfil(profile)
    return profile == 1 ? "Administrador" : "Usuário"
  end

end
