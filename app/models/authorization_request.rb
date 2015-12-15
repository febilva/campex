class AuthorizationRequest < ActiveRecord::Base
  before_create :generate_request_id
  belongs_to :request_user, class_name: "User"
  belongs_to :approval_user, class_name: "User"

  private
    def generate_request_id
      today = Date.today
      todays_request_count = sprintf('%03d', 
        AuthorizationRequest.where('created_at::date = ?', today).count + 1)
      today = today.strftime('%Y %b%d').upcase.split
      today[0] = today.first.chars.each_slice(2).map { |slice| ("A".ord + (slice.join.to_i % 25)).chr }

      self.request_id = today.join + todays_request_count
      self.status = "REQUESTED"
    end
end
