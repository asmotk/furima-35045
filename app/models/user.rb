class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true
  validates :last_name, presence: true,
                        format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
                        }
  validates :first_name, presence: true,
                         format: { with: /\A[ァ-ヶー－]+\z/
                         }
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true

  validates :email, inclusion: { in: %w{@} }
  validates :encrypted_password, confirmation: true,
                                 format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
                                 }

end
