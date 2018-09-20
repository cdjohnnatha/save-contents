# frozen_string_literal: true

class Extractor < ApplicationRecord
  url_regex = /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)/ix
  validates :url, presence: true, format: { with: url_regex, message: 'You provided invalid URL' }
end
