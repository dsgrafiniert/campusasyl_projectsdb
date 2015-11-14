# == Schema Information
#
# Table name: schedules
#
#  id               :integer          not null, primary key
#  schedulable_id   :integer
#  schedulable_type :string
#  date             :date
#  time             :time
#  rule             :string
#  interval         :string
#  day              :text
#  day_of_week      :text
#  until            :datetime
#  count            :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Schedule < Schedulable::Model::Schedule
end
