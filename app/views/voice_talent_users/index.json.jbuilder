json.array!(@voice_talent_users) do |voice_talent_user|
  json.extract! voice_talent_user, :id, :first_name, :last_name, :email, :office_phone, :is_veteran, :full_rate, :rush_full_rate, :partial_rate, :rush_partial_rate, :correction_rate, :nickname, :is_active
  json.url voice_talent_user_url(voice_talent_user, format: :json)
end
