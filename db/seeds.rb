unless User.where(profile_type: "Admin").count > 0
  User.create(first_name: 'mentor', last_name: 'performance', 
    email: 'info@mentorperformance.in', password: 'mentor123', profile_type: 'Admin')
end