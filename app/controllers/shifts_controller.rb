class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.all
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
    @shift=Shift.find(params[:id])
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
    @providers=Provider.all
    @sites=Site.all
  end

  # GET /shifts/1/edit
  def edit
    @shift=Shift.find(params[:id])
    @providers=Provider.all
    @sites=Site.all
  end

  # POST /shifts
  # POST /shifts.json
  def create
    puts "ksdjkfjldfdlsf"
    @shift = Shift.new(shift_params)
    puts "ksdjkfjldfdlsf"
    puts @shift.provider_id
    puts @shift.shift
    if @shift.save
      redirect_to :action => 'index'
    else
      @providers=Provider.all
      @sites=Site.all
      render :action => 'new'
    end

    #respond_to do |format|
     # if @shift.save
      #  format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
       # format.json { render :show, status: :created, location: @shift }
      #else
       # @providers=Provider.all
        #@sites=Site.all
        #format.html { render :new }
        #format.json { render json: @shift.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        @providers=Provider.all
        @sites=Site.all
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:provider_id,:site_id , :date, :shift, :start_time, :start_end, :status, :hide_from_schedule, :custom_pay_rate, :custom_bill_rate, :area, :note, :filledon, :access_id, :last_modified_by_x_on_y)
    end


end
