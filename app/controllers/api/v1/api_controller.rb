# frozen_string_literal: true

module Api::V1
  class ApiController < ApplicationController
    include SerializerResourceHelper
    include JSONAPI::Utils
  end
end
