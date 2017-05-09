class Tag < ApplicationRecord
  belongs_to :url

  validates :name, :content, presence: true
end
