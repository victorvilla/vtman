# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Task.any?
  Task.destroy_all
end

tasks = Task.create([{vtn: 'Heidi', cops: 'John', client: 'Facebook', video_title: 'Lorem ipsum dolor sit amet',
                    type_script: 1, number_chapters: 0, notes: 'Maecenas consectetur velit ac metus congue',
                    rush: 0, rate: 180, due_date: '2014-10-13 14:06:46', status: 4,
                    created_at: '2014-10-12 14:06:46', updated_at: '2014-10-12 14:16:01'},
                    {vtn: 'Heidi', cops: 'John', client: 'Facebook', video_title: 'Vestibulum non vestibulum est',
                    type_script: 2, number_chapters: 1, notes: 'Donec vel nisl a sem auctor commodo.',
                    rush: 0, rate: 20, due_date: '2014-10-14 11:06:46', status: 1,
                    created_at: '2014-10-12 12:06:15', updated_at: '2014-10-12 12:18:33'},
                   {vtn: 'Jason', cops: 'Chase', client: 'Adobe', video_title: 'Etiam elementum congue ornare',
                    type_script: 1, number_chapters: 0, notes: 'Morbi hendrerit ligula eu interdum.',
                    rush: 1, rate: 120, due_date: '2014-10-17 11:06:46', status: 2,
                    created_at: '2014-10-16 17:18:15', updated_at: '2014-10-16 17:20:23'},
                   {vtn: 'Chelsea', cops: 'Land', client: 'Better Media Inc', video_title: 'Fusce faucibus, nisi at tempus egestas',
                    type_script: 1, number_chapters: 0, notes: 'Nunc tempus, erat pretium commodo rhoncus, enim risus consequat massa',
                    rush: 1, rate: 140, due_date: '2014-10-25 11:06:46', status: 3,
                    created_at: '2014-10-24 17:18:15', updated_at: '2014-10-24 17:20:23'},
                   {vtn: 'Heidi', cops: 'Land', client: 'Whatever.com Productions', video_title: 'Aliquam sit amet dui odio.',
                    type_script: 3, number_chapters: 0, notes: 'Duis eget commodo mauris.',
                    rush: 0, rate: 0, due_date: '2014-11-09 11:06:46', status: 1,
                    created_at: '2014-11-08 17:18:15', updated_at: '2014-11-08 17:20:23'},
                  ]
  )

ft = tasks.first



Asset.create([{task_id: ft.id, title: "Open Enrollment 2014", file: "scripts/fboe2014.pdf", status: 0},
            {task_id: ft.id, title: "Open Enrollment 2014 voice1", file: "voices/fbv01.pdf", asset_type: 1, status: 0},
            {task_id: ft.id, title: "Open Enrollment 2014 voice2", file: "voices/fbv02.pdf", asset_type: 1, status: 0}
            ]
          )
