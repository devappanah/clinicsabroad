class ClinicRequestsController < ApplicationController

 def new
  @clinic_request = ClinicRequest.new
 end

 def create
  @clinic_request = ClinicRequest.new(clinic_request_params)
  @clinic_request.body = build_body
  if @clinic_request.save
   redirect_to root_path
  end
 end

private
 def clinic_request_params
  params.require(:clinic_request).permit(:name, :phone, :body, :scheduled_at, :service_id, *ClinicRequest::REQUEST_DATA)
 end

  def build_body
    combined_body = ""
    ClinicRequest::REQUEST_DATA.each do |f|
      combined_body << ClinicRequest::QUESTIONS[f] + "\n"
      combined_body << (@clinic_request.send(f) rescue "-") + "\n\n"
    end
    combined_body
  end

end
