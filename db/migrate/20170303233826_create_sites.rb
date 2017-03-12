class CreateSites < ActiveRecord::Migration[5.0]
  def up
    if table_exists?(:sites)
    else
      create_table :sites do |t|
        #t.integer :rails_id
        #t.integer  "rails_id"
        t.string :hospital_name,limit: 32
        t.string :address,limit: 32
        t.text   :phone_number,limit: 65535
        t.text   :fax_number ,limit: 65535
        t.text   :po_box ,limit: 65535
        #t.string   main_phone",                 limit: 16
        #t.string   "main_fax",                   limit: 16
        #t.string   "po_box",                     limit: 16
        t.string   :contacts_name,              limit: 16
        t.string   :contacts_description,       limit: 16
        t.string   :contacts_phone_number,      limit: 16
        t.string   :contacts_email,             limit: 16
        t.string   :contacts_send,              limit: 16
        t.string   :contacts_schedule,          limit: 16

        t.text     :certification_requirements, limit: 65535
        t.text     :notes,                  limit: 65535
        #t.text     "misc_info",                  limit: 65535
        t.text   :housing_info,               limit: 65535
        t.string   :status_options,             limit: 32
        t.text   :dwc_contact_staff,              limit: 65535
        t.text   :affiliation
        t.text   :billing_address
        # t.string   "billto",                     limit: 16
        #t.string   "city",                       limit: 16
        #t.string   "state",                      limit: 8
        #t.integer  "zip"
        #t.string   "last_modified_by_x_on_y",    limit: 16
        #t.string   "area_picklist",              limit: 16
        #t.string   "shift_name",                 limit: 8
        #t.datetime "shift_start_name"
        #t.datetime "shift_end_time"
        #t.string   "type",                       limit: 8
        #t.string   "color",                      limit: 8
        #t.string   "bill_rate",                  limit: 16
        #t.string   "tags",                       limit: 16
        t.integer  :access_id
        t.integer  :microstaffer_id
      end
    end

  end
  def down
  end
end