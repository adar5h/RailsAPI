class User < ApplicationRecord
  has_many :articles
  validates :name, presence:true, length: {in: 3..25}, uniqueness: true
  validates :age, presence:true
  validates :hobby, presence:true

  before_save :convert_lowercase

  def convert_lowercase #Callback
    self.hobby.downcase!
  end

end
