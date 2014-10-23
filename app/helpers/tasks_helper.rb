module TasksHelper
  
  def type_script_options
    {:'Full script' => "full",
     :'Partial script' => "partial",
     :'Correction' => "correction"}
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
