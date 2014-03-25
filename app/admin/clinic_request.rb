ActiveAdmin.register ClinicRequest do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  index do 
    column :body
    default_actions
  end

  show do |m|
    attributes_table do 
      row "Body" do 
        simple_format m.body
      end
    end
  end
  
end
