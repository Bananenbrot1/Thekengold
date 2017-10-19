class AddScannedToBarcode < ActiveRecord::Migration[5.1]
  def change
    add_column :barcodes, :scan, :boolean, default: false
  end
end
