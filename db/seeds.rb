# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.create([
    {
        is_active: true,
        name: 'OhGeez',
        created_at: '2017-09-22 22:37:36.496592',
        updated_at: '2017-09-22 22:37:36.496592',
        logo_file_name: 'eglogo.png',
        logo_content_type: 'image/png',
        logo_updated_at: '2017-09-22 22:37:36.135115',
        slug: 'ohgeez'
    }
            ])
User.create([
    {
        steamid: '76561197972716110',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/9f/9fd38f7e02d1b110773b8703b8f5e7be9a586d98_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'Feeder Magoo',
        loccountrycode: 'US',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 1,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/id/uberamd/',
        team_join_approved: false
    },
    {
      steamid: '76561198109226644',
      avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/fa/fa4e9e7130479d4cdb279102d005d7becb2a04fb_medium.jpg',
      is_active: true,
      is_deleted: false,
      is_banned: false,
      personaname: 'Oscar Gamble',
      loccountrycode: 'US',
      created_at: '2017-09-22 22:40:07.398089',
      updated_at: '2017-09-22 22:40:07.398089',
      team_id: 1,
      team_admin: true,
      team_captain: true,
      profileurl: 'http://steamcommunity.com/id/uberamd/',
      team_join_approved: true,
      team_join_date: '2017-09-22 22:37:38.288592',
      team_join_approved_by: 1
    }
            ])