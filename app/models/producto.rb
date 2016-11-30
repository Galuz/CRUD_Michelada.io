class Producto < ApplicationRecord
  belongs_to :marca
  validates_presence_of :nombre
  
  scope :sorted, lambda { order("productos.position ASC") }
  scope :newest_first, lambda { order("productos.created_at DESC")}
end
