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
          finished: {color: 'text-success',
                     icon: "glyphicon glyphicon-ok-circle",
                     text: 'File Uploaded'},
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
    return object.send(property).last
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

  def can_upload?
    %w[wip finished].include?(object.status)
  end

  def get_(property)
     @@info[object.status.to_sym][property]
  end

  def get_type
     {full: "Full",
      partial: "Partial",
      correction: "Correction"
        }[object.type_script.to_sym]
  end

  def upload_icon
    "glyphicon glyphicon-open #{ self.can_upload? ? 'text-primary' : 'text-muted' }"
  end

    def download_icon
    "glyphicon glyphicon-save #{ object.status =='notacknowledged' ?  'text-muted' : 'text-primary'}"
  end
end
