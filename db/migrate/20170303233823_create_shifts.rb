class CreateShifts < ActiveRecord::Migration[5.0]
  def self.up
    create_table :shifts do |t|
      t.integer :provider_id
      t.integer :site_id
      t.datetime :date
      t.text :shift
      t.datetime :start_time
      t.datetime :start_end
      t.text :status
      t.text :hide_from_schedule
      t.float :custom_pay_rate
      t.float :custom_bill_rate
      t.string :area    ,limit:32
      t.text :note
      t.string :filledon  ,limit:32
      t.string :create_on, limit: 32
      t.integer :access_id
      t.string :last_modified_by_x_on_y ,limit:32
      t.timestamps null: false
    end
  end
  def self.down
    drop_table :shifts
  end
end
