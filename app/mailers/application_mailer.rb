class ApplicationMailer < ActionMailer::Base
  default from: 'lembreteaquilatech@aquila.com.br'
  layout 'mailer'

  def send_new_user(nome, email, cpf, password)
    @nome = nome
    @email = email
    @password = password
    @cpf = cpf
    mail(to: @email, subject: "Portal SER - Novo Usuário", template_path: "usuarios/mailer", template_name: "new_user")
  end

end