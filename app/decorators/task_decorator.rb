class TaskDecorator < Draper::Decorator
  delegate_all

  def mdy
    object.due_date.strftime("%m- %d - %Y") unless object.due_date.nil?
  end

  def rate
    h.number_to_currency(object.rate, precision: 2)
  end

  def get_file(property)
    s = object.send(property).last
    return "" if s.nil?
    h.link_to(s.file)
  end

  def script
    self.get_file(:scripts)
  end

  def deliverable
    self.get_file(:uploads)
  end

  def rush_status
    if object.rush
      h.tag(:span, class: "glyphicon glyphicon-ok")
    end
  end

  def show_status
    icon = { notacknowledged: "glyphicon-remove-circle",
           acknowledged: "glyphicon-thumbs-up",
           wip: "glyphicon-time",
           finished: "glyphicon-ok-circle",
           done: "",
           overdue: "glyphicon-exclamation-sign"}

    h.tag(:span, class: "glyphicon #{icon[object.status.to_sym]}")
  end
end
