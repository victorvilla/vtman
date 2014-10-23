
# Drop any Client that exist
if Client.any?
  Client.destroy_all
end

clients = Client.create([{name: 'Facebook', email: 'contact@facebook.com', phone: '1111122222'},
   {name: 'Adobe',    email: 'contact@adobe.com',    phone: '3333344444'},
   {name: 'Google',   email: 'contact@google.com',   phone: '5555566666'},
   {name: 'AT & T',     email: 'contact@atandt.com',   phone: '9999900000'},
   {name: 'Ello',     email: 'contact@ello.com',     phone: '7777788888', is_active: 0}])

#Drop any Voice Talent User that exist
if VoiceTalentUser.any?
  VoiceTalentUser.destroy_all
end

talents = VoiceTalentUser.create([{first_name: 'Joy', last_name: 'Shaw', email: 'joy_shaw@vt.com',
    office_phone: '1212121212', full_rate: 80.0, rush_full_rate: 120.0,
    partial_rate: 8.0, rush_partial_rate: 12.0, correction_rate: 0.0, is_veteran: 1},
    {first_name: 'Hiroshi', last_name: 'Lee', email: 'hiroshi_lee@vt.com',
    office_phone: '5656565656', full_rate: 0.0, rush_full_rate: 70.0,
    partial_rate: 0.0, rush_partial_rate: 9.5, correction_rate: 0.0},
    {first_name: 'Steve', last_name: 'Wojitas', email: 'steve_wojitas@vt.com',
    office_phone: '3434343434', full_rate: 80.0, rush_full_rate: 130.0,
    partial_rate: 8.0, rush_partial_rate: 16.0, correction_rate: 0.0, is_veteran: 1},
    {first_name: 'Anna', last_name: 'Smith', email: 'anna_smith@vt.com',
    office_phone: '7878787878', full_rate: 125.0, rush_full_rate: 170.0,
    partial_rate: 6.8, rush_partial_rate: 7.5, correction_rate: 0.0, is_veteran: 1},
    {first_name: 'Theresa', last_name: 'Strong', email: 'theresa_strong@vt.com',
    office_phone: '9090909090', full_rate: 85.0, rush_full_rate: 92.5,
    partial_rate: 9.0, rush_partial_rate: 15.0, correction_rate: 0.0},
    {first_name: 'Victor', last_name: 'Villa', email: 'victor_villa@gt.com',
    office_phone: '1313131313', full_rate: 70.0, rush_full_rate: 80.0,
    partial_rate: 7.0, rush_partial_rate: 10.0, correction_rate: 0.0,
    is_active: 0}])


#Drop any GuideSpark User that exist
if GuidesparkUser.any?
  GuidesparkUser.destroy_all
end

# Profile;
#     1 ... C-Ops
#     2 ... Writer

gs = GuidesparkUser.create([{first_name: 'James', last_name: 'Otto', email: 'james_otto@gs.com',
  profile: 2, office_address: '1350 Willow Road Suite 201', office_phone: '1231231231'},
  {first_name: 'Lynda', last_name: 'Wiggins',
   email: 'lynda_wiggins@gs.com', profile: 1, office_address: '1080 Hamilton Ave',
   office_phone: '4564564564'},
  {first_name: 'Jim', last_name: 'Ruiz', email: 'jim_ruiz@gs.com',
   profile: 1, office_address: '1350 Willow Road Suite 201', office_phone: '7897897897'},
  {first_name: 'Mayra', last_name: 'Jhonson', email: 'mayra_jhonson@gs.com',
  profile: 2, office_address: '1080 Hamilton Ave', office_phone: '0240240240'},
  {first_name: 'Diego', last_name: 'Moore', email: 'diego_moore@gs.com',
  profile: 2, office_address: 'Boston, US', office_phone: '681681681'},
  {first_name: 'Nathan', last_name: 'Stark', email: 'nathan_stark@gs.com',
  profile: 1, office_address: '1350 Willow Road Suite 201', office_phone: '3573573573',
  is_active: 0}
                    ])

if Task.any?
  Task.destroy_all
end


tasks = Task.create([{video_title: "Lorem ipsum dolor sit amet", type_script: Task.type_scripts[:full],
  number_chapters: 0, notes: "Maecenas consectetur velit ac metus congue", rush: false,
  rate: talents.to_a[0].full_rate, due_date: "2014-10-13", status: Task.statuses[:overdue],
  voice_talent_user_id: talents.to_a[0].id, writer_id: gs.to_a[0].id, content_ops_id: gs.to_a[1].id,
  client_id: clients.to_a[0].id },
  {video_title: "Morbi vel dolor malesuada", type_script: Task.type_scripts[:partial], number_chapters: 0,
  notes: "Vestibulum non vestibulum est", rush: false, rate: talents.to_a[0].partial_rate,
  due_date: "2014-10-14", status: Task.statuses[:acknowledged],
  voice_talent_user_id: talents.to_a[0].id, writer_id: gs.to_a[0].id, content_ops_id: gs.to_a[1].id,
  client_id: clients.to_a[0].id },
  {video_title: "Vivamus eleifend", type_script: Task.type_scripts[:full], number_chapters: 0,
  notes: "sit amet pretium neque leo sollicitudin lacus", rush: true, rate: talents.to_a[2].rush_full_rate,
  due_date: "2014-10-17", status: Task.statuses[:wip],
  voice_talent_user_id: talents.to_a[2].id, writer_id: gs.to_a[2].id, content_ops_id: gs.to_a[3].id,
  client_id: clients.to_a[1].id },
  {video_title: "Etiam elementum congue ornare", type_script: Task.type_scripts[:full], number_chapters: 0,
  notes: "In hac habitasse platea dictumst", rush: true, rate: talents.to_a[3].rush_full_rate,
  due_date: "2014-10-25", status: Task.statuses[:finished],
  voice_talent_user_id: talents.to_a[3].id, writer_id: gs.to_a[0].id, content_ops_id: gs.to_a[3].id,
  client_id: clients.to_a[2].id },
  {video_title: "Morbi hendrerit ligula eu interdum", type_script: Task.type_scripts[:full], number_chapters: 0,
  notes: "Pellentesque hendrerit risus", rush: false, rate: talents.to_a[4].full_rate,
  due_date: "2014-11-09", status:  Task.statuses[:acknowledged],
  voice_talent_user_id: talents.to_a[4].id, writer_id: gs.to_a[4].id, content_ops_id: gs.to_a[1].id,
  client_id: clients.to_a[3].id }])
