class Content < ApplicationRecord
  belongs_to :extractor

  enum tag: { link: 1, h_family: 0 }
  validates :tag, presence: true
  validates :content, presence: true
end
