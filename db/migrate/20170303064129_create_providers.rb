class CreateProviders < ActiveRecord::Migration[5.0]
  def up
    if table_exists?(:providers)
    else
      create_table :providers do |t|
        t.integer :rails
        #t.string :pd_options ,limit:5
        t.string :last_name ,limit:32
        t.string :first_name ,limit:32
        t.string :preferred_name ,limit:32
        t.string :middle_name ,limit:32
        t.string :salutation ,limit:32
        t.string :address   ,limit: 64
        t.string :email ,limit:32
        t.text :phone_number
        t.text :status
        t.integer :ssn
        t.datetime   :date_birth
        t.string :gender ,limit: 16
        t.string :spouse_name  ,limit:32
        t.string :place_birth   ,limit:32
        #t.string :skills      ,limit:16
        t.string :superviser  ,limit:32
        #t.text :miscellaneous_info
        t.datetime :hiredate
        t.datetime :termination_date

        #t.string :contract_info ,limit:16
        #t.date :contract_begin
        #t.date :contract_end
        #t.date :contract_signed
        #t.string :view_contract  ,limit:16
        #t.string :insurance  ,limit:16
        #t.string :incarrier_options ,limit:16
        #t.string :incoverage_options ,limit:16
        #t.date :insurance_expiration_date
        #t.string :insurance_policy_number  ,limit:16
        #t.string :insurser_address     ,limit:16
        #t.string :ecfmg      ,limit:16
        #t.integer :medicare
        #t.string :npi     ,limit:16
        #t.integer :caqh
        #t.integer :caqh
        #t.string :caqh_password_login ,limit:16
        #t.string :atls   ,limit:8
        #t.string :acls   ,limit:8
        #t.string :pals   ,limit:8
        #t.string :also   ,limit:8
        #t.string :nrp    ,limit:8
        #t.string :bls    ,limit:8
        #t.string :state_licensure   ,limit:8
        #t.string :board_certification  ,limit:8
        #t.string :dea  ,limit:8
        #t.string :st_narcotic ,limit:8
        #t.date :atls_date
        #t.date :acls_date
        #t.date :pals_date
        #t.date :also_date
        #t.date :nrp_date
        #t.date :bls_date
        #t.date :state_licensure_date
        #t.date :board_certification_date
        #t.date :dea_date
        #t.date :st_narcotic_date
        #t.string :atls_state   ,limit:8
        #t.string :acls_state   ,limit:8
        #t.string :pals_state   ,limit:8
        #t.string :also_state   ,limit:8
        #t.string :nrp_state    ,limit:8
        #t.string :bls_state    ,limit:8
        #t.string :state_licensure_state   ,limit:8
        #t.string :board_certification_state  ,limit:8
        #t.string :dea_state   ,limit:8
        #t.string :st_narcotic_state   ,limit:8
        #t.string :atls_image   ,limit:8
        #t.string :acls_image   ,limit:8
        #t.string :pals_image   ,limit:8
        #t.string :also_image   ,limit:8
        #t.string :nrp_image   ,limit:8
        #t.string :bls_image   ,limit:8
        #t.string :state_licensure_image     ,limit:8
        #t.string :board_certification_image   ,limit:8
        #t.string :dea_image   ,limit:8
        #t.string :st_narcotic_image  ,limit:8
        #t.integer :medicaid
        t.string :regidency     ,limit:32
        t.string :regidency_address  ,limit:32
        t.string :regidency_degree   ,limit:32
        t.datetime :regidency_dates
        t.string :medical_education    ,limit:32
        t.string :medical_education_city   ,limit:32
        t.string :pre_med_education   ,limit:32
        t.string :pre_med_education_city   ,limit:32
        t.string :pre_med_degree   ,limit:32
        t.datetime :pre_med_dates
        t.datetime :initial_contact_date

        #t.string :staff_contact   ,limit:8
        t.datetime :application_received_date
        t.datetime :cv_received_date
        t.datetime :interview_date
        t.datetime :date_verification
        t.datetime :verification_completion_date
        t.datetime :recertification_request_date
        t.datetime :recertification_completion_date

        #t.string :priviliges   ,limit:8
        #t.string :note    ,limit:8
        #t.string :dept   ,limit:8
        #t.string :author  ,limit:8
        #t.date :date
        #t.string :initial_shift_evaluation_complete   ,limit:8
        #t.datetime :shift_date
        #t.string :location    ,limit:8
        #t.string :request_charts_sent_site  ,limit:8
        #t.string :charts_received_from_site  ,limit:8
        #t.string :charts_sent_reviewer   ,limit:8
        #t.string :reviewer_name    ,limit:8
        #t.string :results_returned_from_reviewer    ,limit:8
        #t.integer :average_rating
        #t.string :letter_sent  ,limit:8
        #t.string :cst_reviewer  ,limit:8
        #t.string :comments    ,limit:8

        t.string :active_referral_options  ,limit:32
        t.datetime :date_hired
        t.string :referredby  ,limit:32
        t.datetime :first_shift_date
        t.datetime :referral_paid_date
        t.integer :amount
        t.text :notes
        t.text :referral_code
        #t.string :mid_level_agreement_descripttion_options   ,limit:8
        #t.string :mid_level_supervising_collaborating_physician_options  ,limit:8
        #t.string :mid_level_substitute_supervising_physician   ,limit:8
        #t.string :mid_level_practice_location   ,limit:8
        #t.string :mid_level_practice_setting_options   ,limit:8
        #t.string :mid_level_submit_ksbha_options ,limit:8
        #t.string :mid_level_termination_ksbha ,limit:8
        #t.text :mid_comments
        #t.date :last_modified_by_x_on_date
        #t.string :tags  ,limit:8
        #t.string :if_inquiry ,limit:8
        #t.string :status_options  ,limit:8
        #t.string :rd_meeting ,limit:8
        #t.string :show_on_report  ,limit:8
        #t.string :additional_skills_array ,limit: 16
        #t.string :reminder_rpt ,limit: 8
        #t.string :date_available  ,limit: 8
        #t.string :cultural_book   ,limit: 16
        #t.string :gm_book   ,limit:16
        #t.string :portfolio   ,limit:16
        #t.string :referral   ,limit:16
        #t.date :pre_date
        #t.string :staff_dropdown ,limit:16
        #t.string :note_longstring   ,limit:16
        t.integer :access_id
        t.integer :microstaffer_id
        t.timestamps null: false
      end
    end
    def down
    end
  end
 end

