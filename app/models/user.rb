class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  has_and_belongs_to_many :assets
  has_and_belongs_to_many :skills

  def admin?
    role == 'admin'
  end

  def name
    first_name + " " + last_name
  end

end