ActiveAdmin.register Page do

controller do
  def permitted_params
    params.permit(:page => [:name, :title, :body, :visible])
  end
end

form do |f|
  f.inputs do 
    f.input :name
    f.input :title
    f.input :body, :input_html => { :class => "tinymce_editor" }
    f.input :visible
    f.buttons
  end
end

end
