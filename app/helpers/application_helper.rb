module ApplicationHelper
  def display_errors(model)
    html = ""
    if model and !model.errors.blank?
      html << "<div class='alert alert-error'>"
      model.errors.each_with_index do |msg,i|
        if msg[0] != :image
          html << "#{msg[1]}<br/>"
        end
      end
         html << "</div>"
       end
     html.html_safe
   end
end
