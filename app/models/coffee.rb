class Coffee < ApplicationRecord
  belongs_to :user
  has_many :purchases, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :user_id, presence: true
  validates :price_per_unit, presence: true, numericality: { only_float: true }
  validates :intensity, presence: true, inclusion: { in: ["morning", "noon", "night"] }
  validates :machine, presence: true, inclusion: { in: ["Bean expresso", "French press", "Filter", "Italian", "Aeropress"] }
  validates :flavour, presence: true, inclusion: { in: ["Sweet", "Fruity", "Bitter", "Citric"] }
  validates :provenance, presence: true
  validates :stock, presence: true, numericality: { only_integer: true }
  validates :blend_name, presence: true, uniqueness: true
  validates :tree, presence: true, inclusion: { in: ["Arabica", "Robusta", "Blend"] }
  mount_uploader :picture, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_machine_and_intensity,
    against: [:machine, :intensity],
    using: {
      tsearch: { prefix: true }
    }
end
