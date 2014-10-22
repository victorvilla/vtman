# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Drop any Client that exist
if Client.any?
  Client.destroy_all
end

Client.create(name: 'Facebook', email: 'contact@facebook.com', phone: '1111122222')
Client.create(name: 'Adobe',    email: 'contact@adobe.com',    phone: '3333344444')
Client.create(name: 'Google',   email: 'contact@google.com',   phone: '5555566666')
Client.create(name: 'At&t',     email: 'contact@atandt.com',   phone: '9999900000')
Client.create(name: 'Ello',     email: 'contact@ello.com',     phone: '7777788888', is_active: 0)

#Drop any Voice Talent User that exist
if VoiceTalentUser.any?
  VoiceTalentUser.destroy_all
end

VoiceTalentUser.create(first_name: 'Joy', last_name: 'Shaw', email: 'joy_shaw@vt.com', office_phone: '1212121212', full_rate: 80.0, rush_full_rate: 120.0, partial_rate: 8.0, rush_partial_rate: 12.0, correction_rate: 0.0, is_veteran: 1)
VoiceTalentUser.create(first_name: 'Hiroshi', last_name: 'Lee', email: 'hiroshi_lee@vt.com', office_phone: '5656565656', full_rate: 0.0, rush_full_rate: 70.0, partial_rate: 0.0, rush_partial_rate: 9.5, correction_rate: 0.0)
VoiceTalentUser.create(first_name: 'Steve', last_name: 'Wojitas', email: 'steve_wojitas@vt.com', office_phone: '3434343434', full_rate: 80.0, rush_full_rate: 130.0, partial_rate: 8.0, rush_partial_rate: 16.0, correction_rate: 0.0, is_veteran: 1)
VoiceTalentUser.create(first_name: 'Anna', last_name: 'Smith', email: 'anna_smith@vt.com', office_phone: '7878787878', full_rate: 75.0, rush_full_rate: 70.0, partial_rate: 6.8, rush_partial_rate: 7.5, correction_rate: 0.0)
VoiceTalentUser.create(first_name: 'Theresa', last_name: 'Strong', email: 'theresa_strong@vt.com', office_phone: '9090909090', full_rate: 85.0, rush_full_rate: 92.5, partial_rate: 9.0, rush_partial_rate: 15.0, correction_rate: 0.0, is_veteran: 1)
VoiceTalentUser.create(first_name: 'Victor', last_name: 'Villa', email: 'victor_villa@gt.com', office_phone: '1313131313', full_rate: 70.0, rush_full_rate: 80.0, partial_rate: 7.0, rush_partial_rate: 10.0, correction_rate: 0.0, is_veteran: 1, is_active: 0)

#Drop any GuideSpark User that exist
if GuidesparkUser.any?
  GuidesparkUser.destroy_all
end

# Profile;
#     1 ... C-Ops
#     2 ... Writer
GuidesparkUser.create(first_name: 'James', last_name: 'Otto', email: 'james_otto@gs.com', profile: 2, office_address: '1350 Willow Road Suite 201', office_phone: '1231231231')
GuidesparkUser.create(first_name: 'Lynda', last_name: 'Wiggins', email: 'lynda_wiggins@gs.com', profile: 1, office_address: '1080 Hamilton Ave', office_phone: '4564564564')
GuidesparkUser.create(first_name: 'Jim', last_name: 'Ruiz', email: 'jim_ruiz@gs.com', profile: 1, office_address: '1350 Willow Road Suite 201', office_phone: '7897897897')
GuidesparkUser.create(first_name: 'Mayra', last_name: 'Jhonson', email: 'mayra_jhonson@gs.com', profile: 2, office_address: '1080 Hamilton Ave', office_phone: '0240240240')
GuidesparkUser.create(first_name: 'Diego', last_name: 'Moore', email: 'diego_moore@gs.com', profile: 2, office_address: 'Boston, US', office_phone: '681681681')
GuidesparkUser.create(first_name: 'Nathan', last_name: 'Stark', email: 'nathan_stark@gs.com', profile: 1, office_address: '1350 Willow Road Suite 201', office_phone: '3573573573', is_active: 0)