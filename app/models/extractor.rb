# frozen_string_literal: true

class Extractor < ApplicationRecord
  has_many :contents
  accepts_nested_attributes_for :contents

  validates :url, presence: true, url: true
end
