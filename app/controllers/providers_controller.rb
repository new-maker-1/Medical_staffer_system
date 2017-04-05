class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  # GET /providers
  def index
    @providers=Provider.all

    if params[:search]
      @providers = Provider.search(params[:search]).order("created_at DESC")
    else
      @providers=Provider.all.order("created_at DESC")
    end

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="all_providers.xlsx"'
      }
    end
  end

  # GET /providers/1
  def show
  end

  def import
    begin
      Provider.import(params[:file])
      redirect_to providers_path, notice: "Products imported."
    rescue
      redirect_to providers_path, notice: "Invalid CSV file format."
    end
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edi
  def edit
  end

  # POST /providers
  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      @user = User.new(:email =>@provider.email, :password => "111111", :password_confirmation => "111111")
      @user.save
      flash[:success] = "Provider was successfully created.  #{make_undo_link}"
      redirect_to provider_path(@provider)
      #redirect_to @provider, notice: 'Provider was successfully created.'
    else
      render :new
    end
  end

  def undo
    @provider_version = PaperTrail::Version.find_by_id(params[:id])

    begin
      if @provider_version.reify
        @provider_version.reify.save
      else
        # For undoing the create action
        @provider_version.item.destroy
      end
      flash[:success] = "Undid that! #{make_redo_link}"
    rescue
      flash[:alert] = "Failed undoing the action..."
    ensure
      redirect_to root_path
    end
  end

  def history
    @versions = PaperTrail::Version.order('created_at DESC')
  end

  # PATCH/PUT /providers/1
  def update
    @provider=Provider.find_by_id(params[:id])
    if @provider.update(provider_params)
      flash[:success] = "Provider was successfully updated.  #{make_undo_link}"
      redirect_to provider_path(@provider)
      #redirect_to @provider, notice: 'Provider was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /providers/1
  def destroy
    @provider.destroy
    flash[:success] = "Provider was successfully destroyed.  #{make_undo_link}"
    redirect_to providers_url
    #redirect_to providers_url, notice: 'Provider was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

  def make_undo_link
    view_context.link_to 'Undo that plz!', undo_path(@provider.versions.last), method: :provider
  end
  # Only allow a trusted parameter "white list" through.
  def provider_params
    params.require(:provider).permit(:id,:last_name, :first_name, :preferred_name, :middle_name, :salutation, :address, :email, :phone_number, :status, :ssn, :date_birth, :gender, :spouse_name, :place_birth,  :superviser,  :hiredate, :termination_date, :regidency, :regidency_address, :regidency_degree, :regidency_dates, :medical_education, :medical_education_city,  :pre_med_education, :pre_med_education_city, :pre_med_degree, :pre_med_dates, :initial_contact_date,  :application_received_date, :cv_received_date, :interview_date, :date_verification, :verification_completion_date,  :recertification_request_date, :recertification_completion_date,  :active_referral_options,  :date_hired, :referredby, :first_shift_date, :referral_paid_date, :amount, :notes, :referral_code,  :access_id, :microstaffer_id)
  end
end
