class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  # GET /providers
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  def show



  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to @provider, notice: 'Provider was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /providers/1
  def update
    if @provider.update(provider_params)
      redirect_to @provider, notice: 'Provider was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /providers/1
  def destroy
    @provider.destroy
    redirect_to providers_url, notice: 'Provider was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def provider_params
      params.require(:provider).permit(:id,:last_name, :first_name, :preferred_name, :middle_name, :salutation, :address, :email, :phone_number, :status, :ssn, :date_birth, :gender, :spouse_name, :place_birth,  :superviser,  :hiredate, :termination_date, :regidency, :regidency_address, :regidency_degree, :regidency_dates, :medical_education, :medical_education_city,  :pre_med_education, :pre_med_education_city, :pre_med_degree, :pre_med_dates, :initial_contact_date,  :application_received_date, :cv_received_date, :interview_date, :date_verification, :verification_completion_date,  :recertification_request_date, :recertification_completion_date,  :active_referral_options,  :date_hired, :referredby, :first_shift_date, :referral_paid_date, :amount, :notes, :referral_code,  :access_id, :microstaffer_id)
    end
end
