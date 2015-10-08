module CourseHelper

	def can_edit_course?
		user_signed_in? && (current_user.admin? || current_user.tutor?)
	end

	def can_delete_course?
		user_signed_in? && current_user.admin?
	end

	def can_create_course?
		user_signed_in? && current_user.admin?
	end

	def can_view_course?
		current_user.grade == course.grade
	end

end