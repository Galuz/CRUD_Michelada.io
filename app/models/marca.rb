class Marca < ApplicationRecord
  has_many :productos
  validates_presence_of :nombre
  
  scope :sorted, lambda { order("marcas.position ASC") }
  scope :newest_first, lambda { order("marcas.created_at DESC")}
  scope :search, lambda {|query|
    where(["nombre LIKE ?", "%#{query}"])
  }
end
