class TaskDecorator < Draper::Decorator
  delegate_all

  
  def mdy
    object.due_date.strftime("%m - %d - %Y")
  end

  def rate
    h.number_to_currency(object.rate, precision: 2)
  end

  def rush_status
    if object.rush 
      h.tag(:span, class: "glyphicon glyphicon-ok")
    end
  end

  def show_status
    case object.status 
    when 0
      h.tag(:span, class: "glyphicon glyphicon-remove-circle")
    when 1
      h.tag(:span, class: "glyphicon glyphicon-thumbs-up")
    when 2
      h.tag(:span, class: "glyphicon glyphicon-time")
    when 3
      h.tag(:span, class: "glyphicon glyphicon-ok-circle")
    when 4
      h.tag(:span, class: "glyphicon glyphicon-exclamation-sign")
    end
  end
end
