class Coffee < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_many :reviews

  validates :user_id, presence: true
  validates :price_per_unit, presence: true, numericality: { only_float: true }
  validates :intensity, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }, numericality: { only_integer: true }
  validates :machine, presence: true, inclusion: { in: ["Bean expresso", "French press", "Filter", "Italian", "Aeropress"] }
  validates :flavour, presence: true, inclusion: { in: ["Sweet", "Fruity", "Bitter", "Citric"] }
  validates :provenance, presence: true
  validates :stock, presence: true, numericality: { only_integer: true }
  validates :blend_name, presence: true
  validates :tree, presence: true, inclusion: { in: ["Arabica", "Robusta"] }
  mount_uploader :picture, PhotoUploader
end
