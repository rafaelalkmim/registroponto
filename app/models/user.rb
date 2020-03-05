class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #
  devise :database_authenticatable, :authentication_keys => [:cpf]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :cpf, uniqueness: true

  belongs_to :profile
  belongs_to :area

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
