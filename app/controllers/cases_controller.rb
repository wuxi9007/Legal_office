class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy]

  # GET /cases
  # GET /cases.json
  def index
    @cases = Case.all
  end

  # GET /cases/1
  # GET /cases/1.json
  def show
  end

  # GET /cases/new
  def new
    @case = Case.new
    @personnels = Personnel.all
  end

  # GET /cases/1/edit
  def edit
    @personnels = Personnel.all
  end

  # POST /cases
  # POST /cases.json
  def create
    @case = Case.new(case_params)
    @personnels = Personnel.all
    respond_to do |format|
      if @case.save
        @case.case_id = @case.id
        @case.save
        format.html { redirect_to cases_path, notice: 'Case was successfully created.' }
        format.json { render :show, status: :created, location: @case }
      else
        format.html { render :new }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end
  def filter_personnel
    if params[:c2].present?
      ids = []
      Case.where(c1_id: params[:c2].to_i).each do |c|
        ids << c.personnel_id
      end
      @personnels = Personnel.where.not(id: ids)
      @denied_personnels = Personnel.where(id: ids)
    end
    respond_to do |format|
      format.js {}
    end
  end
  # PATCH/PUT /cases/1
  # PATCH/PUT /cases/1.json
  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to cases_path, notice: 'Case was successfully updated.' }
        format.json { render :show, status: :ok, location: @case }
      else
        format.html { render :edit }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    @case.destroy
    respond_to do |format|
      format.html { redirect_to cases_url, notice: 'Case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_params
      params.require(:case).permit(:case_id, :c1_id, :c2_id, :start_time, :completion, :personnel_id)
    end
end
