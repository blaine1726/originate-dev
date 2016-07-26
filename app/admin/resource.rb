ActiveAdmin.register Resource do

  permit_params :background, :github, :title, :description, :long_description,
                :readme, :category, :text_color

  index do
    selectable_column
    id_column
    column :title
    column :description
    actions
  end

  filter :title
  filter :description

  form do |f|
    f.inputs "Resource" do
      f.input :background
      f.input :github
      f.input :title
      f.input :description
      f.input :long_description
      f.input :readme
      f.input :category
      f.input :text_color
    end
    f.actions
  end

end
