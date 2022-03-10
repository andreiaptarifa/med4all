class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :medicationorders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  GENDER = ['Feminino', 'Masculino', 'Outro']
  USER_TYPE = ['Doador', 'Paciente', 'Médico']

  # endereço, latitude/long no model 
end
