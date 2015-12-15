require 'rake'
desc 'send reminder email'
task send_reminder_email: :environment do
  # ... set options if any
  EventOccurence.where(:date => 1.day.from_now.beginning_of_day..1.day.from_now.end_of_day ). each { |event_occurrence|
	event_occurrence.attends.each{ |attend|
		UserMailer.reminder_email(attend.user, event_occurrence).deliver!
	}
  }
end