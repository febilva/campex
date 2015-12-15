Time::DATE_FORMATS[:default] = ->(time) { time.strftime("%I:%M %p") }
Date::DATE_FORMATS[:default] = "%d/%m/%Y"