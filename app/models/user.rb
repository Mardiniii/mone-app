# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  last_name              :string
#  role                   :integer
#  state_id               :string
#  city_id                :string
#  age                    :integer
#  genre_id               :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:Estudiante, :Aportante, :Administrador]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :last_name, :role, :state_id, :city_id, :age,:cellphone, :genre_id, presence: true
  has_one :mone
  has_many :transactions
  belongs_to :state
  belongs_to :city
  belongs_to :genre
  after_create :assign_mone

  def assign_mone
    if self.role == "Estudiante"
      self.mone = Mone.create(quantity:"0")
    end
  end
end
