class SimulationsController < ApplicationController
  before_action :set_simulation, only: [:show, :edit, :update, :destroy]

  # GET /simulations
  # GET /simulations.json
  def index
    @audits = Audit.all.reverse
    @companies = Company.all
    @personnels = Personnel.all
  end

  def assign_test
    if params[:role].present?
      case params[:role]
      when "0"
        from = params[:personnel_from].to_i
        from_personnel_name = Personnel.find(from).name
        from_cases = Case.where(personnel_id: from)
        if params[:type].include?("Retrieving")
          @box = "02"
          doc_id = params[:doc_id].to_i
          @result = true
          from_cases.each do |fc|
            Case.where(c1_id: fc.c2_id).each do |c|
              if c.documents.first.id == doc_id
                @result = false
                break
              end
            end
          end
          message = from_personnel_name + " (Personnel ID: #{from})" + " has attempted to retrieve " + Document.find(doc_id).name + "!"
          Audit.create(details: message, result: @result)
        else
          @box = "01"
          to = params[:personnel_to].to_i
          if from == to
            @message = "Don't contact yourself!"
          else
            from_new_cases = Case.where(personnel_id: from).where("completion is NULL or completion = ''")
            from_old_cases = Case.where(personnel_id: from).where.not("completion is NULL or completion = ''")
            @result = true
            from_new_cases.each do |fnc|
              if Case.where(c1_id: fnc.c2_id).present?
                if Case.where(c1_id: fnc.c2_id, personnel_id: to).present?
                  @result = false
                  p Case.where(c1_id: fnc.c2_id).where(personnel_id: to)
                  break
                end
              end
            end
            from_old_cases.each do |foc|
              if Case.where("completion is NULL or completion = ''").where(c2_id: foc.c1_id, personnel_id: to).present?
                @result = false
                p Case.where("completion is NULL or completion = ''").where(c2_id: foc.c1_id, personnel_id: to)
                break
              end
            end
            to_personnel_name = Personnel.find(to).name
            to_cases = Case.where(personnel_id: to)
            message = from_personnel_name + " (Personnel ID: #{from})" + " has attempted to contact " + to_personnel_name + " (Personnel ID: #{to})" + "!"
            Audit.create(details: message, result: @result)
          end
        end
      when "1"
      when "2"
        def_comp = params[:officer_def].to_i
        opp_comp = params[:officer_off].to_i
        if def_comp == opp_comp
          @message = "Companies can't be the same!"
        else
          per = params[:officer_per].to_i
          @result = true
          if Case.where(c1_id: opp_comp, personnel_id: per).present?
            @result = false
          end
          @box = "3"
        end
      end
      respond_to do |format|
        format.js { @denied_audits = Audit.where(result: false).reverse
          @audits = Audit.all.reverse
        }
      end
    end
  end

  def choose_audit_section
    if params[:type].present?
      case params[:type]
      when "denied"
        @audits = Audit.where(result: false).reverse
      when "accepted"
        @audits = Audit.where(result: true).reverse
      when "all"
        @audits = Audit.all.reverse
      end
    end
  end

  # GET /simulations/1
  # GET /simulations/1.json
  def show
  end

  # GET /simulations/new
  def new
    @simulation = Simulation.new
  end

  # GET /simulations/1/edit
  def edit
  end

  # POST /simulations
  # POST /simulations.json
  def create
    @simulation = Simulation.new(simulation_params)

    respond_to do |format|
      if @simulation.save
        format.html { redirect_to @simulation, notice: 'Simulation was successfully created.' }
        format.json { render :show, status: :created, location: @simulation }
      else
        format.html { render :new }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simulations/1
  # PATCH/PUT /simulations/1.json
  def update
    respond_to do |format|
      if @simulation.update(simulation_params)
        format.html { redirect_to @simulation, notice: 'Simulation was successfully updated.' }
        format.json { render :show, status: :ok, location: @simulation }
      else
        format.html { render :edit }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulations/1
  # DELETE /simulations/1.json
  def destroy
    @simulation.destroy
    respond_to do |format|
      format.html { redirect_to simulations_url, notice: 'Simulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simulation
      @simulation = Simulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simulation_params
      params.fetch(:simulation, {})
    end
end
