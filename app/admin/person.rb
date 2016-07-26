ActiveAdmin.register Person do
  permit_params :name, :description, :title, :picture, :slack_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :title
    column :picture
    column :slack_id
    actions
  end

  filter :name
  filter :slack_id

  form do |f|
    f.inputs "People" do
      f.input :name
      f.input :description
      f.input :title
      f.input :picture
      f.input :slack_id
    end
    f.actions
  end

end
