module TasksHelper
  
  def type_script_options
    {:'Full script' => :full, :'Partial script' => :partial, :'Correction' => :correction}
  end
  
  def client_options
    Client.actives.collect { |u| [u.name.titleize, u.id] }
  end
  
  def voice_talent_options
    VoiceTalentUser.actives.collect { |u| [u.first_name.titleize + ' ' + u.last_name.titleize, u.id] }
  end
  
  def content_ops_options
    GuidesparkUser.active_voice_request_alias.collect { |u| [u.first_name.titleize + ' ' + u.last_name.titleize, u.id]}
  end
  
  def next_work_date
    next_date = Date.today + 1
    if next_date.wday == 6 then
      next_date + 2 
    elsif next_date.wday == 0 then 
      next_date + 1 
    else 
      next_date
    end
  end
    
  def rush_options
    {:'No' => :false, :'Yes' => :true}
  end
  
  def type_script_format(gender)
    case gender
      when '1' ; 'Full script'
      when '2' ; 'Partial script'
      when '3' ; 'Urgent script'
      else ''
    end
  end
end
