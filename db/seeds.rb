unless User.where(profile_type: "Admin").count > 0
  #Create role for users

  #Student Role
  Role.create(name: 'Student', activities: ["examinations_menu", "exam_registrations:index", 
    "exam_registrations:new", "exam_registrations:create", "exam_registrations:show"])

  #Admin Role
  @admin_role = Role.create(name: 'Admin', activities: ["students_menu", "settings_menu"])

  #Admin user
  @admin_user = User.new(username: 'admin', first_name: 'mentor', last_name: 'performance', 
    email: 'info@mentorperformance.in', password: 'mentor123', profile_type: 'Admin')
  @admin_user.roles << @admin_role
  @admin_user.save
end