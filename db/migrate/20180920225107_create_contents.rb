class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.integer :tag, default: 0
      t.string :content
      t.references :extractor, foreign_key: true, index: true

      t.timestamps
    end
  end
end
