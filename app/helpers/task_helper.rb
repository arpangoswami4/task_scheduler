module TaskHelper
  def format_date(due_date)
    due_date.strftime("%d-%m-%Y %H:%M:%S")
  end

  def toggle_direction(direction = "asc")
    direction == "asc" ? "desc" : "asc"
  end
end
