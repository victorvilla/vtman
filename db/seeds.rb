require 'digest'

# Drop any Client that exist
if Client.any?
  Client.destroy_all
end

Client.create([
   {name: 'Facebook', email: 'contact@facebook.com', phone: '1111122222'},
   {name: 'Adobe',    email: 'contact@adobe.com',    phone: '3333344444'},
   {name: 'Google',   email: 'contact@google.com',   phone: '5555566666'},
   {name: 'AT & T',     email: 'contact@atandt.com',   phone: '9999900000'},
   {name: 'Ello',     email: 'contact@ello.com',     phone: '7777788888',
    is_active: 0}])

#Drop any Voice Talent User that exist
if VoiceTalentUser.any?
  VoiceTalentUser.destroy_all
end

VoiceTalentUser.create([
    {first_name: 'Esparta', last_name: 'Palma', email: 'esparta@gmail.com',
     nickname: 'esparta', digest: Digest::MD5.hexdigest('esparta'),
     office_phone: '7878787878', full_rate: 175, rush_full_rate: 175,
     partial_rate: 15, rush_partial_rate: 15, correction_rate: 0,
     is_veteran: 1},
    {first_name: 'Heather', last_name: 'Capri', email: 'heather_capri@vt.com',
     nickname: 'Heather', digest: Digest::MD5.hexdigest('Heather'),
     office_phone: '7878787878', full_rate: 175, rush_full_rate: 175,
     partial_rate: 15, rush_partial_rate: 15, correction_rate: 0,
     is_veteran: 1},
    {first_name: 'Steve', last_name: 'Wojitas', email: 'victor.villa.jimenez@gmail.com',
     nickname: 'vvilla', digest: Digest::MD5.hexdigest('vvilla'),
     office_phone: '3434343434', full_rate: 80, rush_full_rate: 130,
     partial_rate: 8, rush_partial_rate: 16, correction_rate: 0,
     is_veteran: 1},
    {first_name: 'Joy', last_name: 'Shaw', email: 'joy_shaw@vt.com',
     nickname: 'Joy', digest: Digest::MD5.hexdigest('Joy'),
     office_phone: '1212121212', full_rate: 80, rush_full_rate: 120,
     partial_rate: 8, rush_partial_rate: 12, correction_rate: 0,
     is_veteran: 1},
    {first_name: 'Heidi', last_name: 'Baker', email: 'heidi_baker@vt.com',
     nickname: 'Heidi', digest: Digest::MD5.hexdigest('Heidi'),
     office_phone: '7878787878', full_rate: 80, rush_full_rate: 120,
     partial_rate: 8, rush_partial_rate: 12, correction_rate: 0,
     is_veteran: 1},
    {first_name: 'Jason', last_name: 'McCoy', email: 'jason_mccoy@vt.com',
     nickname: 'Jason', digest: Digest::MD5.hexdigest('Jason'),
     office_phone: '3434343434', full_rate: 80, rush_full_rate: 120,
     partial_rate: 8, rush_partial_rate: 12, correction_rate: 0,
     is_veteran: 1},
    {first_name: 'Amanda', last_name: 'Sellers', email: 'amanda_sellers@vt.com',
     nickname: 'Amanda', digest: Digest::MD5.hexdigest('Amanda'),
     office_phone: '1212121212', full_rate: 80, rush_full_rate: 120,
     partial_rate: 8, rush_partial_rate: 12, correction_rate: 0,
     is_veteran: 1},
    {first_name: 'Mike', last_name: 'Schurko', email: 'mike_schurko@vt.com',
     nickname: 'Mike', digest: Digest::MD5.hexdigest('Mike'),
     office_phone: '7878787878', full_rate: 80, rush_full_rate: 120,
     partial_rate: 8, rush_partial_rate: 12, correction_rate: 0,
     is_veteran: 1},
    {first_name: 'Andy', last_name: 'Kavanagh', email: 'andy_kavanagh@vt.com',
     nickname: 'Andy', digest: Digest::MD5.hexdigest('Andy'),
     office_phone: '3434343434', full_rate: 80, rush_full_rate: 80,
     partial_rate: 8, rush_partial_rate: 12, correction_rate: 0,
     is_veteran: 1},
    {first_name: 'Simon', last_name: 'Phillips', email: 'simon_phillips@vt.com',
     nickname: 'Simon', digest: Digest::MD5.hexdigest('Simon'),
     office_phone: '1212121212', full_rate: 80, rush_full_rate: 80,
     partial_rate: 8, rush_partial_rate: 12, correction_rate: 0,
     is_veteran: 1},
    {first_name: 'Dawn', last_name: 'Davis', email: 'dawn_davis@vt.com',
     nickname: 'Dawn', digest: Digest::MD5.hexdigest('Dawn'),
     office_phone: '5656565656', full_rate: 80, rush_full_rate: 80,
     partial_rate: 8, rush_partial_rate: 8, correction_rate: 0},
    {first_name: 'Elisabeth', last_name: 'Hunter', email: 'elisabeth_hunter@vt.com',
     nickname: 'Elisabeth', digest: Digest::MD5.hexdigest('Elisabeth'),
     office_phone: '9090909090', full_rate: 80, rush_full_rate: 80,
     partial_rate: 8, rush_partial_rate: 8, correction_rate: 0},
    {first_name: 'Emilio', last_name: 'Rossal', email: 'emilio_rossal@gt.com',
     nickname: 'Emilio', digest: Digest::MD5.hexdigest('Emilio'),
     office_phone: '1313131313', full_rate: 80, rush_full_rate: 80,
     partial_rate: 8, rush_partial_rate: 8, correction_rate: 0},
    {first_name: 'Jon', last_name: 'Weinberg', email: 'jon_weinberg@vt.com',
     nickname: 'Jon', digest: Digest::MD5.hexdigest('Jon'),
     office_phone: '5656565656', full_rate: 80, rush_full_rate: 80,
     partial_rate: 8, rush_partial_rate: 8, correction_rate: 0},
    {first_name: 'Nick', last_name: 'Ralph', email: 'nick_ralph@vt.com',
     nickname: 'Nick', digest: Digest::MD5.hexdigest('Nick'),
     office_phone: '9090909090', full_rate: 80, rush_full_rate: 80,
     partial_rate: 8, rush_partial_rate: 8, correction_rate: 0},
    {first_name: 'Dawn', last_name: 'Hyde', email: 'dawn_hyde@gt.com',
     nickname: 'Dawn', digest: Digest::MD5.hexdigest('Dawn'),
     office_phone: '1313131313', full_rate: 80, rush_full_rate: 80,
     partial_rate: 8, rush_partial_rate: 8, correction_rate: 0},
    {first_name: 'Lauren', last_name: 'McCullough', email: 'lauren_mccullough@vt.com',
     nickname: 'Lauren', digest: Digest::MD5.hexdigest('Lauren'),
     office_phone: '5656565656', full_rate: 80, rush_full_rate: 80,
     partial_rate: 8, rush_partial_rate: 8, correction_rate: 0},
    {first_name: 'Victor', last_name: 'Villa', email: 'victor_villa@vt.com',
     nickname: 'Victor', digest: Digest::MD5.hexdigest('Victor'),
     office_phone: '5656565656', full_rate: 80, rush_full_rate: 80,
     partial_rate: 8, rush_partial_rate: 8, correction_rate: 0,
     is_active: 0}
    ])


#Drop any GuideSpark User that exist
if GuidesparkUser.any?
  GuidesparkUser.destroy_all
end

# Profile;
#     1 ... C-Ops
#     2 ... Writer

GuidesparkUser.create([
  {first_name: 'voice_request_alias_list',
   last_name: 'Villa', email: 'vvilla@guidespark.com',
   profile: 1, office_address: '1350 Willow Road Suite 201',
   office_phone: '1231231231',
   password: "Victor", password_confirmation: "Victor"},
  {first_name: 'E', last_name: 'Palma',
   email: 'epmwgs@gmail.com',
   profile: 1, office_address: '1350 Willow Road Suite 201',
   office_phone: '1231231231',
   password: "Esparta", password_confirmation: "Esparta"},
  {first_name: 'Nathan', last_name: 'Stark',
   email: 'nathan_stark@gs.com',
   profile: 1, office_address: '1350 Willow Road Suite 201',
   office_phone: '3573573573',
   is_active: 0, password: "Natham", password_confirmation: "Natham"},
  {first_name: 'James', last_name: 'Otto', email: 'james_otto@gs.com',
   profile: 2, office_address: '1350 Willow Road Suite 201',
   office_phone: '1231231231',
   password: "James", password_confirmation: "James"},
  {first_name: 'Mayra', last_name: 'Jhonson', email: 'mayra@gs.com',
   profile: 2, office_address: '1080 Hamilton Ave', office_phone: '0240240240',
   password: "Mayra", password_confirmation: "Mayra"},
  {first_name: 'Diego', last_name: 'Moore', email: 'diego_moore@gs.com',
   profile: 2, office_address: 'Boston, US', office_phone: '681681681',
   password: "Diego", password_confirmation: "Diego"}
  ])
