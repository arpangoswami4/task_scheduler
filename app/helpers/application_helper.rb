module ApplicationHelper
  def action_availability(record, method)
    availability = policy(record).public_send(method)
    if block_given?
      availability ? yield : "Action Not Available"
    end
  end
end
