class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :prescriptions
  has_many :medicationorders
  has_many :donations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  GENDER = ['Feminino', 'Masculino', 'Outro']
  USER_TYPE = ['Doador', 'Paciente', 'Médico']

  has_one_attached :photo
  # endereço, latitude/long no model
  validates :first_name, :last_name, :gender, :birthday, :user_type, :street, :number, :city, presence: true
  validates :user_type, inclusion: { in: USER_TYPE }
  validates :gender, inclusion: { in: GENDER }
end
