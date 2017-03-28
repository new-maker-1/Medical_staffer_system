class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
    @arrayList=params[:total_changes];
    if params[:search]
      @reports = Report.search(params[:search]).order("created_at DESC")
    else
      @reports=Report.all.order("created_at DESC")
    end

  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    @modeltable=Modeltable.all
    @arrayList=params[:total_changes];
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    if @report.save
      flash[:success] = "Report was successfully created."
      redirect_to report_path(@report)
      #redirect_to @provider, notice: 'Provider was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update

      @report=Report.find_by_id(params[:id])
      if @report.update(report_params)
        flash[:success] = "Report was successfully updated."
        redirect_to report_path(@report)
        #redirect_to @provider, notice: 'Provider was successfully updated.'
      else
        render :edit
      end
  end

  def undo
    @report_version = PaperTrail::Version.find_by_id(params[:id])

    begin
      if @report_version.reify
        @report_version.reify.save
      else
        # For undoing the create action
        @report_version.item.destroy
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
  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    flash[:success] = "Report was successfully destroyed."
    redirect_to reports_url
    #redirect_to providers_url, notice: 'Provider was successfully destroyed.'
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end


  def make_undo_link
    view_context.link_to 'Undo that plz!', undo_path(@report.versions.last), method: :report
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:name, :creator, :typed,:module ,:representation)
    end
end
