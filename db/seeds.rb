unless User.where(profile_type: "Admin").count > 0
  #Create role for users

  #Student Role
  Role.create(name: 'Student', activities: ["examinations_menu", "exam_registrations:index", 
    "exam_registrations:new", "exam_registrations:create", "exam_registrations:show"])

  #Admin Role
  @admin_role = Role.create(name: 'Admin', activities: ["teachers_menu", "students_menu", "settings_menu"])

  #Teacher Role
  Role.create(name: 'Teacher', activities: ["attendance_menu", "student_attendance_registers:index", 
    "student_attendance_registers:new", "student_attendance_registers:create", 
    "student_attendance_registers:show", "teachers:period_list"])

  #Admin user
  @admin_user = User.new(username: 'admin', first_name: 'mentor', last_name: 'performance', 
    email: 'info@mentorperformance.in', password: 'mentor123', profile_type: 'Admin')
  @admin_user.roles << @admin_role
  @admin_user.save

  states = [
    'Kerala', 'Tamilnadu', 'Andaman and Nicobar Islands', 'Andhra Pradesh',
    'Arunachal Pradesh', 'Assam', 'Bihar', 'Chandigarh', 'Chhattisgarh', 
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jammu and Kashmir', 
    'Jharkhand', 'Lakshadweep', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 
    'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Puducherry', 'Punjab',
    'Rajasthan', 'Sikkim', 'Telangana', 'Tripura', 'Uttar Pradesh',
    'Uttarakhand', 'West Bengal', 'Karnataka'
  ]

  districts = {
    'Kerala' => ['Alappuzha', 'Ernakulam', 'Idukki', 'Kannur', 'Kasaragod',
      'Kollam', 'Kottayam', 'Kozhikode', 'Malappuram', 'Palakkad',
      'Pathanamthitta', 'Thiruvananthapuram', 'Thrissur', 'Wayanad']
  }

  states.each do |state|
    @state = State.new(name: state)
    success = @state.save
    if success
      unless districts[state].nil?
        districts[state].each do |district|
          @district = District.new(state: @state,
            name: district)
          @district.save
        end
      end
    end
  end
end