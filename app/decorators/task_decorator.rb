class TaskDecorator < Draper::Decorator
  delegate_all

@@info = {notacknowledged: {color: "text-normal",
                             icon: "glyphicon glyphicon-remove-circle",
                             text:  "Not Acknowledged"},
          acknowledged: {color: 'text-primary',
                         icon: "glyphicon glyphicon-thumbs-up",
                         text: 'Acknowledged'},
          wip: {color: 'text-info',
                icon: "glyphicon glyphicon-time",
                text: 'Work in Progress'},
          finished: {color: 'text-sucess',
                     icon: "glyphicon glyphicon-ok-circle",
                     text: 'Finished'},
          done: {color: '', text: '', icon: ''},
          overdue: {color: 'text-danger',
                    icon: 'glyphicon glyphicon-exclamation-sign',
                    text: 'Overdue'}}

  def mdy
    object.due_date.strftime("%m-%d-%Y") unless object.due_date.nil?
  end

  def rate
    h.number_to_currency(object.rate, precision: 2)
  end

  def get_file(property)
    s = object.send(property).last
    return nil if s.nil?
    "/uploads/#{s.file}"
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

  def get_(property)
     @@info[object.status.to_sym][property]
  end

  def upload_icon
    "glyphicon glyphicon-open #{ %w[wip finished].include?(object.status) ? 'text-primary' : 'text-muted' }"
  end

    def download_icon
    "glyphicon glyphicon-save #{ object.status =='notacknowledged' ?  'text-muted' : 'text-primary'}"
  end
end
