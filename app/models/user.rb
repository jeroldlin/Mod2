class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants_users
  has_many :restaurants, through: :restaurants_users
  validates :email, :uniqueness => true, :email_format => true
  ROLES = %w[admin owner patron].freeze
end
