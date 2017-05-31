class Book < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  has_attached_file :book_thumbnail, styles: { large: "1000*1000>", medium: "500*500>" }
  validates_attachment_content_type :book_thumbnail, content_type: /\Aimage\/.*\Z/
end
