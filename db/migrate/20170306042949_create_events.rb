class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

      t.integer :provider_id
      t.integer :site_id
      #t.datetime :date
      t.string :title
      t.datetime :start
      t.datetime :end
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
      t.string :color

      t.timestamps
    end
  end
end
