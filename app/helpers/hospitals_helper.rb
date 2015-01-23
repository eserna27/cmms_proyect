module HospitalsHelper

	def current_hospital
    @hospital = Hospital.find(current_user.hospital_id)
 	end

 	def floors_hospital
 		#Array.new(current_hospital.floors) {|i| i+1 } 	
 		1.upto current_hospital.floors
 	end
end
