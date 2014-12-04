class VoicetalentsDatatable
  delegate :params, :link_to, :h, :content_tag, :button_to, to: :@view
  delegate :url_helpers, to: 'Rails.application.routes'


  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      #iTotalDisplayRecords: voicetalents.total_entries,
      aaData: data
    }
  end

private

  def data
    voicetalents.map do |vt|
      [
        vt.id,
        "#{vt.first_name} #{vt.last_name}",
        vt.is_veteran == true ? "Y" : "N",
        vt.full_rate,
        vt.rush_full_rate,
        vt.partial_rate,
        vt.rush_partial_rate,
        vt.correction_rate,
        link_to("Edit", "/edit")
        #link_to(company.name, url_helpers.admin_company_path(company)),

      ]
    end
  end

  def voicetalents
    @voicetalents ||= VoiceTalentUser.actives
  end

end
