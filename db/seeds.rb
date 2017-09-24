# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create team EG
Team.create([
    {
        is_active: true,
        name: 'EG',
        created_at: '2017-09-22 22:37:36.496592',
        updated_at: '2017-09-22 22:37:36.496592',
        logo_file_name: 'eglogo.png',
        logo_content_type: 'image/png',
        logo_updated_at: '2017-09-22 22:37:36.135115',
        slug: 'eg'
    }
])

# Create team OhGeez
Team.create([
    {
        is_active: true,
        name: 'OhGeez',
        created_at: '2017-09-22 22:37:36.496592',
        updated_at: '2017-09-22 22:37:36.496592',
        logo_file_name: 'dump_garbage_litter_trash_trashcan_eco_ecology-512.png',
        logo_content_type: 'image/png',
        logo_updated_at: '2017-09-22 22:37:36.135115',
        slug: 'ohgeez'
    }
])

# Create team EG
Team.create([
    {
        is_active: true,
        name: 'OG',
        created_at: '2017-09-22 22:37:36.496592',
        updated_at: '2017-09-22 22:37:36.496592',
        logo_file_name: '600px-OG_RB_Logo.png',
        logo_content_type: 'image/png',
        logo_updated_at: '2017-09-22 22:37:36.135115',
        slug: 'og'
    }
])

# Add steam accounts to OhGeez
User.create([
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
        team_id: 2,
        team_admin: true,
        team_captain: true,
        profileurl: 'http://steamcommunity.com/id/scrodes/',
        team_join_approved: true,
        team_join_date: '2017-09-22 22:37:38.288592',
        team_join_approved_by: 1
    },
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
        team_id: 2,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/id/uberamd/',
        team_join_approved: false
    },
    {
        steamid: '76561198372571398',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/82/82f23d5e4eeabc5fa4fc11fcf5709a0890d75cd3_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'SUPP0RT',
        loccountrycode: '',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 2,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/profiles/76561198372571398/',
        team_join_approved: false
    },
    {
        steamid: '76561198167803846',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/f9/f9e18e19f0aa0db2905c706679623e593c837c29_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'Dankey Kang',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 2,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/profiles/76561198167803846/',
        team_join_approved: false
    },
    {
        steamid: '76561198080576242',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/5a/5af1ba4eb2333dde2d183c122cc76b3a874e119b_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'TryHard.CaptainCrunch',
        loccountrycode: 'US',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 2,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/id/76561198080576242/',
        team_join_approved: false
    },
    {
        steamid: '76561197961741130',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/f0/f0d9ad50777728e5a0a2c95f56010719fd691dc1_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'Dos Cadenas',
        loccountrycode: 'US',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 2,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/id/FatHeezy/',
        team_join_approved: false
    },
    {
        steamid: '76561198078387060',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/d2/d2cea6521d6a1c2503b19d4aa969e98aa4ffd414_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'IceMyr',
        loccountrycode: 'US',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 2,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/id/IceMyr/',
        team_join_approved: false
    },
    {
        steamid: '76561198088101370',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/d5/d5352b60e229969ad7bc662b14aabfb9c3caee19_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'RxDealer',
        loccountrycode: 'US',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 2,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/id/RxDealer/',
        team_join_approved: false
    }
])

# Add Steam Accounts to EG
User.create([
    {
        steamid: '76561198047443319',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/68/68d8d3754aee2395bd277f3348b886cdb42206c1_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'Fear',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 1,
        team_admin: true,
        team_captain: true,
        profileurl: 'http://steamcommunity.com/profiles/76561198047443319/',
        team_join_approved: true,
        team_join_approved_by: 8
    },
    {
        steamid: '76561198047011640',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/4d/4d99a1b514d5cb312a66344e0bed3b09922f8962_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'Kise~rtz',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 1,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/profiles/76561198047011640/',
        team_join_approved: true,
        team_join_approved_by: 8
    },
    {
        steamid: '76561198071885769',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/02/02cb0267ac5ce1b9ef49fbec2ac10e69a036d032_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'Dang3r',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 1,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/id/SUMAyLLL/',
        team_join_approved: true,
        team_join_approved_by: 8
    },
    {
        steamid: '76561198047542075',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/42/42a99b0bd414201ad7030be776e6e680ebf55b0d_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'Universe',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 1,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/id/universe112/',
        team_join_approved: true,
        team_join_approved_by: 8
    },
    {
        steamid: '76561197986172872',
        avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/ba/ba50378efbecb46128e11d0b7039062e0c36f124_medium.jpg',
        is_active: true,
        is_deleted: false,
        is_banned: false,
        personaname: 'Cr1t-',
        created_at: '2017-09-22 22:40:07.398089',
        updated_at: '2017-09-22 22:40:07.398089',
        team_id: 1,
        team_admin: false,
        team_captain: false,
        profileurl: 'http://steamcommunity.com/profiles/76561197986172872/',
        team_join_approved: true,
        team_join_approved_by: 8
    },
])

User.all.each do |user|
    OpendotaMmrRefreshJob.perform_now user
end