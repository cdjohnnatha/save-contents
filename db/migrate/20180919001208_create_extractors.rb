# frozen_string_literal: true

class CreateExtractors < ActiveRecord::Migration[5.2]
  def change
    create_table :extractors do |t|
      t.string :url

      t.timestamps
    end
  end
end
