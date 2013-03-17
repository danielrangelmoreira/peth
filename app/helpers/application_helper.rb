module ApplicationHelper
	
	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}, {:class => css_class} 
	end

	def record_content(appointment)
		record = appointment.record
			return content_tag(:td, record.content,:colspan => "3" )
	end

	def format_date(date)
		date.strftime("%d\/%m\/%Y")
	end
	

end
