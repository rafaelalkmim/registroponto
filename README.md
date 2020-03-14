# README

Webapp para Registro de Ponto de Trabalho

* Versão do Ruby: Ruby 2.6.3

****** Preparando a aplicação ******

* Depois de clonar o repositório, execute o comando bundle install no terminal, no diretório raiz da aplicação para instalar as gems necessárias.

* Ainda no terminal, restaure a database com o comando:
mysql -u [usernamedosql] -p registro_ponto_dev < registroponto-backup-2020-03-14.sql

* Caso tenha problemas de acesso ao database, execute no Mysql:
mysql> GRANT ALL PRIVILEGES ON registro_ponto_dev.* TO '[usernamedosql]'@'localhost';
mysql> FLUSH PRIVILEGES;

* Certifique-se de que todas as migrates estão atualizadas, executando o comando:
rake db:migrate

* Compile todos os assets com o comando:
rake assets:precompile

* Inicie a aplicação com o comando:
rails s

****** Dados sobre o Webapp ******

* Aplicação desenvolvida em Ruby on Rails para lançamento de ponto de trabalho. 

* Existem dois tipos de perfis de usuário no app: Administrador e Usuário.

* Os administradores do sistema podem criar, visualizar, editar e excluir todos os registro de horário de todos os usuários, e também gerenciam os cadastros de usuário.

* Os usuários comuns têm acesso somente aos seus próprios lançamentos, e não editam cadastros de usuários terceiros, podendo alterar somente sua própria senha, se assim desejar.

****** Usuários de acesso ******

* Usuário administrador já cadastrado no database dump. 

Email: admin@gmail.com
Senha: 123456

* Usuários comuns já cadastrados no database dump. 

Email: renato@gmail.com
Senha: 123456


Email: ana@gmail.com
Senha: 123456




