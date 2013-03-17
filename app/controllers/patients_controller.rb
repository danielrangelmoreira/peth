class PatientsController < ApplicationController
  helper_method :sort_column, :sort_direction, :remember_patient
  # GET /patients
  # GET /patients.json
  def index
    if params[:search].blank?
      @patients = Patient.paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
    else 
      @patients = Patient.search_by_name(params[:search]).paginate(:page => params[:page])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])
    @appointments = @patient.appointments.paginate(:page => params[:page], :per_page => 5).order('ap_date DESC')
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  private
    def remember_patient(patient)
      cookies[:patient_id] = patient.id
      self.current_patient = patient
      
    end
    
    def forget_patient
      cookies.delete(:patient_id)
    end
    
    def current_patient=(patient)
      @current_patient = patient
    end
    
    def current_patient?(patient)
      patient == current_patient
    end
    
    def current_patient
      @current_patient ||= Patient.find_by_id(cookies[:patient_id])  
    end

  def sort_column
    Patient.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

