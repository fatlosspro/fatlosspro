ActiveAdmin.register Article do


controller do
  def permitted_params
    params.permit(:article => [:title, :body])
  end
end

form do |f|
  f.inputs do 
    f.input :title
    f.input :body, :input_html => { :class => "tinymce_editor" }
    f.buttons
  end
end

end
