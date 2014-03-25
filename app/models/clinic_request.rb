class ClinicRequest < Message
  REQUEST_DATA = [:staff_info, :location, 
                  :name, :email, 
                  :shop_info, :legal,
                  :clinic_name]

  attr_accessor *REQUEST_DATA

  QUESTIONS = 
    { 
      staff_info: "How many doctors do you have?",
      location: "What is your address?",
      name: "Contact Person's Name",
      phone: "Contact Phone Number",
      email: "Email Address",
      shop_info: "What kind of services do you provide?",
      legal: "Have you or your staff encountered any legal problems/issues?",
      clinic_name: "What is the name of your clinic/hospital?"
    }

end