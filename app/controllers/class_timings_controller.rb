class ClassTimingsController < ApplicationController
  before_action :set_class_timing, only: [:show, :edit, :update, :destroy]

  # GET /class_timings
  # GET /class_timings.json
  def index
    @class_timings = ClassTiming.all
  end

  # GET /class_timings/1
  # GET /class_timings/1.json
  def show
  end

  # GET /class_timings/new
  def new
    @class_timing = ClassTiming.new
  end

  # GET /class_timings/1/edit
  def edit
  end

  # POST /class_timings
  # POST /class_timings.json
  def create
    @class_timing = ClassTiming.new(class_timing_params)

    respond_to do |format|
      if @class_timing.save
        format.html { redirect_to @class_timing, notice: 'Class timing was successfully created.' }
        format.json { render :show, status: :created, location: @class_timing }
      else
        format.html { render :new }
        format.json { render json: @class_timing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_timings/1
  # PATCH/PUT /class_timings/1.json
  def update
    respond_to do |format|
      if @class_timing.update(class_timing_params)
        format.html { redirect_to @class_timing, notice: 'Class timing was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_timing }
      else
        format.html { render :edit }
        format.json { render json: @class_timing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_timings/1
  # DELETE /class_timings/1.json
  def destroy
    @class_timing.destroy
    respond_to do |format|
      format.html { redirect_to class_timings_url, notice: 'Class timing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_timing
      @class_timing = ClassTiming.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_timing_params
      params.require(:class_timing).permit(:name)
    end
end
