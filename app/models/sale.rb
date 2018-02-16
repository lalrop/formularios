class Sale < ApplicationRecord
  validates :cod, uniqueness:true
  validates :detail, presence:true
  validates :category, inclusion:{in:%w(uno dos tres cuatro cinco)}
  validates :value, :discount, numericality:{
    greater_than_or_equal_to: 0,
    only_integer: true                      }
  validates :discount, numericality:{less_than_or_equal_to: 40}
end
