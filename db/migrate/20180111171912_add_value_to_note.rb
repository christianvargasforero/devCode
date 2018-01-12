class AddValueToNote < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :value, :integer
  end
end
