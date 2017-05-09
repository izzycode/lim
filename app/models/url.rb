class Url < ApplicationRecord
  has_many :tags

  validates :value, presence: true, uniqueness: true
  validates_format_of :value, with: URI::regexp(%w(http https))
end
