module PatientsHelper
	def remember_patient(patient)
      cookies[:patient_id] = patient.id
      self.current_patient = patient
      redirect_to patient
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
end
