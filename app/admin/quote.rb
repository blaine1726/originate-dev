ActiveAdmin.register Quote do
  permit_params :quote, :route

  index do
    selectable_column
    id_column
    column :quote
    column :route
    actions
  end

  filter :quote
  filter :route

  form do |f|
    f.inputs "Quote" do
      f.input :quote
      f.input :route
    end
    f.actions
  end

end
