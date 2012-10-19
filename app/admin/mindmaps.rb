#encoding: UTF-8
ActiveAdmin.register Mindmap do

  menu :label => "Mindmaps", :priority => 4

  form :partial => "form"

  index do
    column :id
    column :title
    column :created_at
    column :updated_at
    default_actions
  end
  
end
