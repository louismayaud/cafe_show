class Coffee < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_many :reviews

end
