#encoding: UTF-8
ActiveAdmin.register Book do

  menu :label => "Источники", :priority => 2

  form :partial => "form"

  index do
    column :id
    column :title
    column :created_at
    column :updated_at
    default_actions
  end
  
end
