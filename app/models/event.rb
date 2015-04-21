class Event < ActiveRecord::Base
  belongs_to :house
  has_many :issues, as: :issuable

  validates :name, presence: true
  validates :date, presence: true
  validates :description, :length => { :minimum => 6 }
end
