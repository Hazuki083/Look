class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :items, through: :likes  #throughを使ってモデル同士のアソシエーション（多：多）

end
