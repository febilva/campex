class TermDatesController < ApplicationController
  before_action :set_batch, except: [:show, :edit, :update, :destroy]
  before_action :set_term_date, only: [:show, :edit, :update, :destroy]

  # GET /term_dates
  # GET /term_dates.json
  def index
    @term_structure_entries = @batch.course.term_structure_entries
    @term_dates = TermDate.where(batch: @batch)
  end

  # GET /term_dates/1
  # GET /term_dates/1.json
  def show
  end

  # GET /term_dates/new
  def new
    @term_date = TermDate.new
  end

  # GET /term_dates/1/edit
  def edit
  end

  # POST /term_dates
  # POST /term_dates.json
  def create
    @term_date = TermDate.new(term_date_params)

    respond_to do |format|
      if @term_date.save
        format.html { redirect_to @term_date, notice: 'Term date was successfully created.' }
        format.json { render :show, status: :created, location: @term_date }
      else
        format.html { render :new }
        format.json { render json: @term_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /term_dates/1
  # PATCH/PUT /term_dates/1.json
  def update
    respond_to do |format|
      if @term_date.update(term_date_params)
        format.html { redirect_to @term_date, notice: 'Term date was successfully updated.' }
        format.json { render :show, status: :ok, location: @term_date }
      else
        format.html { render :edit }
        format.json { render json: @term_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /term_dates/1
  # DELETE /term_dates/1.json
  def destroy
    @term_date.destroy
    respond_to do |format|
      format.html { redirect_to batch_term_dates_url(@term_date.batch), notice: 'Term date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:batch_id])
    end

    def set_term_date
      @term_date = TermDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def term_date_params
      params.require(:term_date).permit(:batch_id, :term_structure_entry_id, :start_date, :end_date)
    end
end
