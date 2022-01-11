module ApplicationHelper
	def icon(answer, correct)
		if answer == correct
			fa_icon "check 2x", class: "text-success"
		else
			fa_icon "times 2x", class: "text-danger"
		end
	end
end
