class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :edit, :update, :destroy, :allot_periods]

  # GET /timetables
  # GET /timetables.json
  def index
    @timetables = Timetable.all
  end

  # GET /timetables/1
  # GET /timetables/1.json
  def show
  end

  # GET /timetables/new
  def new
    @timetable = Timetable.new
  end

  # GET /timetables/1/edit
  def edit
  end

  # POST /timetables
  # POST /timetables.json
  def create
    @timetable = Timetable.new(timetable_params)
    @timetable.term_structure_entry = @timetable.batch.current_term

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to @timetable, notice: 'Timetable was successfully created.' }
        format.json { render :show, status: :created, location: @timetable }
      else
        format.html { render :new }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timetables/1
  # PATCH/PUT /timetables/1.json
  def update
    respond_to do |format|
      @timetable.term_structure_entry = @timetable.batch.current_term
      if @timetable.update(timetable_params)
        format.html { redirect_to @timetable, notice: 'Timetable was successfully updated.' }
        format.json { render :show, status: :ok, location: @timetable }
      else
        format.html { render :edit }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timetables/1
  # DELETE /timetables/1.json
  def destroy
    @timetable.destroy
    respond_to do |format|
      format.html { redirect_to timetables_url, notice: 'Timetable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def allot_periods
    respond_to do |format|
      format.html do
        @timetable_entries = TimetableEntry.where(timetable: @timetable)
      #end

      #format.js do
        if(params[:timetable_entries])
          for timetable_entry in params[:timetable_entries]
            entry_det = timetable_entry.split("_")
            wday = entry_det[0]
            period_id = entry_det[1]
            TimetableEntry.new(timetable_id: params[:id], period_id: period_id, wday: wday, teacher_id: params[:teacher_id], paper_id: params[:paper_id], default: true, created_by: current_user).save
          end
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timetable_params
      params.require(:timetable).permit(:class_timing_id, :batch_id, :term_structure_entry_id, :start_date, :end_date)
    end
end
