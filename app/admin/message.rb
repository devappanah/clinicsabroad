ActiveAdmin.register Message do

  
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
    column :shop
    column :service
    column :user
    column :type
    default_actions
  end

  controller do 
    def scoped_collection                                                                                                                                                                                                                                                
      Message.where.not(type: "ClinicRequest")
    end
  end
  
end
