class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  def index
    @sites=Site.all
    if params[:search]
      @sites = Site.search(params[:search]).order("created_at DESC")
    else
      @sites=Site.all.order("created_at DESC")
    end
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="all_sites.xlsx"'
      }
    end
  end

  # GET /sites/1
  def show
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  def import
    begin
      Site.import(params[:file])
      redirect_to sites_path, notice: "Products imported."
    rescue
      redirect_to sites_path, notice: "Invalid CSV file format."
    end
  end
  # POST /sites
  def create
    @site = Site.new(site_params)

    if @site.save
      flash[:success] = "Site was successfully created.  #{make_undo_link}"
      redirect_to site_path(@site)
      #redirect_to @site, notice: 'Site was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sites/1
  def update
    @site=Site.find_by_id(params[:id])
    if @site.update(site_params)
      flash[:success] = "Site was successfully updated.  #{make_undo_link}"
      redirect_to site_path(@site)
      #redirect_to @site, notice: 'Site was successfully updated.'
    else
      render :edit
    end
  end


  def history
    @versions = PaperTrail::Version.order('created_at DESC')
  end

  def undo
    @site_version = PaperTrail::Version.find_by_id(params[:id])

    begin
      if @site_version.reify
        @site_version.reify.save
      else
        # For undoing the create action
        @site_version.item.destroy
      end
      flash[:success] = "Undid that! #{make_redo_link}"
    rescue
      flash[:alert] = "Failed undoing the action..."
    ensure
      redirect_to root_path
    end
  end
  # DELETE /sites/1
  def destroy
    @site.destroy
    redirect_to sites_url, notice: 'Site was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    def make_undo_link
      view_context.link_to 'Undo that plz!', undo_path(@site.versions.last), method: :site
    end
    # Only allow a trusted parameter "white list" through.
    def site_params
      params.require(:site).permit(:id, :hospital_name, :address,:city, :phone_number, :fax_number, :po_box, :contacts_name, :contacts_description, :contacts_phone_number, :contacts_email, :contacts_send, :contacts_schedule, :certification_requirements,  :housing_info, :status_options, :dwc_contact_staff, :affiliation, :billing_address,:access_id, :microstaffer_id)
    end
end
