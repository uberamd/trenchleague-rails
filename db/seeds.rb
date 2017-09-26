# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create groups
Group.create([
    {
        name: 'A'
    },
    {
        name: 'B'
    },
    {
        name: 'C'
    }
 ])

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
        slug: 'ohgeez',
        group_id: 1
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
        is_league_admin: true,
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

# Create team hail esports id 4
Team.create([
                {
                    is_active: true,
                    name: 'Hail eSports',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'hail-esports',
                    group_id: 1
                }
            ])

# spooky_ghost 14
User.create([
                {
                    steamid: '76561198059806834',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 4,
                    team_admin: true,
                    team_captain: true,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 14
                }
            ])

# suitaloo 15
User.create([
                {
                    steamid: '76561198017704502',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 4,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 14
                }
            ])

# eff1ngham 16
User.create([
                {
                    steamid: '76561197994454042',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 4,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 14
                }
            ])

# patchcable 17
User.create([
                {
                    steamid: '76561198124726591',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 4,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 14
                }
            ])

# cheese 18
User.create([
                {
                    steamid: '76561198267987523',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 4,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 14
                }
            ])

# Create team Ho Ho Ha Ha id 5
Team.create([
                {
                    is_active: true,
                    name: 'Ho Ho Ha Ha',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'ho-ho-ha-ha',
                    group_id: 1
                }
            ])

# potato 19
User.create([
                {
                    steamid: '76561198066711838',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 5,
                    team_admin: true,
                    team_captain: true,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 19
                }
            ])

# themadhatter 20
User.create([
                {
                    steamid: '76561198124812960',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 5,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 19
                }
            ])

# condemn me 21
User.create([
                {
                    steamid: '76561198317914771',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 5,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 19
                }
            ])

# izumi <3 22
User.create([
                {
                    steamid: '76561198353973104',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 5,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 19
                }
            ])

# hocus pocus 23
User.create([
                {
                    steamid: '76561198171061478',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 5,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 19
                }
            ])

# positivity 24
User.create([
                {
                    steamid: '76561198057746614',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 5,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 19
                }
            ])

# a harmless twig 25
User.create([
                {
                    steamid: '76561198025865488',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 5,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 19
                }
            ])

# Create team Team Pokedotes id 6
Team.create([
                {
                    is_active: true,
                    name: 'Team PokeDotes',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'team-pokedotes',
                    group_id: 1
                }
            ])

# kewl dude 26
User.create([
                {
                    steamid: '76561198015329729',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 6,
                    team_admin: true,
                    team_captain: true,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 26
                }
            ])

# na-45 27
User.create([
                {
                    steamid: '76561198019503291',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 6,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 26
                }
            ])

# charizardx 28
User.create([
                {
                    steamid: '76561198047675037',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 6,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 26
                }
            ])

# lazy milonakis 29
User.create([
                {
                    steamid: '76561198176783643',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 6,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 26
                }
            ])

# osomejake 30
User.create([
                {
                    steamid: '76561198035672677',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 6,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 26
                }
            ])

# savvyq 31
User.create([
                {
                    steamid: '76561198121043592',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 6,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 26
                }
            ])

# kung fu hung-su 32
User.create([
                {
                    steamid: '76561197994105558',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 6,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 26
                }
            ])

# Create team iT4 id 7
Team.create([
                {
                    is_active: true,
                    name: 'iT4',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'it4',
                    group_id: 1
                }
            ])

# mubobo 33
User.create([
                {
                    steamid: '76561198112957550',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 7,
                    team_admin: true,
                    team_captain: true,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 33
                }
            ])

# jinqs 34
User.create([
                {
                    steamid: '76561197960290364',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 7,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 33
                }
            ])

# dr.mcbutcheeks 35
User.create([
                {
                    steamid: '76561197961794780',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 7,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 33
                }
            ])

# spooky 36
User.create([
                {
                    steamid: '76561198035662250',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 7,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 33
                }
            ])

# aurora chat mod 37
User.create([
                {
                    steamid: '76561198087909683',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 7,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 33
                }
            ])

# simpletom 38
User.create([
                {
                    steamid: '76561197993367747',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 7,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 33
                }
            ])

# dayman 39
User.create([
                {
                    steamid: '76561198053764824',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 7,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 33
                }
            ])

# Create team tilted gaming id 8
Team.create([
                {
                    is_active: true,
                    name: 'Tilted Gaming',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'tilted-gaming',
                    group_id: 1
                }
            ])

# broterin 40
User.create([
                {
                    steamid: '76561198039647776',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 8,
                    team_admin: true,
                    team_captain: true,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 40
                }
            ])

# mc7 41
User.create([
                {
                    steamid: '76561198071969681',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 8,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 40
                }
            ])


# tim 42
User.create([
                {
                    steamid: '76561198004438873',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 8,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 40
                }
            ])

# el 43
User.create([
                {
                    steamid: '76561197997052778',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 8,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 40
                }
            ])

# kadmixx 44
User.create([
                {
                    steamid: '76561198289284744',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 8,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 40
                }
            ])

# chet 45
User.create([
                {
                    steamid: '76561198216189135',
                    is_active: true,
                    is_deleted: false,
                    is_banned: false,
                    created_at: '2017-09-22 22:40:07.398089',
                    updated_at: '2017-09-22 22:40:07.398089',
                    team_id: 8,
                    team_admin: false,
                    team_captain: false,
                    team_join_approved: true,
                    team_join_date: '2017-09-22 22:37:38.288592',
                    team_join_approved_by: 40
                }
            ])

# Create team boys without toys id 9
Team.create([
                {
                    is_active: true,
                    name: 'Boys without toys',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'boys-without-toys',
                    group_id: 2
                }
            ])

# Create team We have a tree player id 10
Team.create([
                {
                    is_active: true,
                    name: 'We have a tree player',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'we-have-a-tree-player',
                    group_id: 2
                }
            ])

# Create team Alliance.youth id 11
Team.create([
                {
                    is_active: true,
                    name: 'Alliance.Youth',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'alliance-youth',
                    group_id: 2
                }
            ])

# Create team Jingle ballers id 12
Team.create([
                {
                    is_active: true,
                    name: 'Jingle Ballers',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'jingle-ballers',
                    group_id: 2
                }
            ])

# Create team Top Flight Security id 13
Team.create([
                {
                    is_active: true,
                    name: 'Top Flight Security',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'top-flight-security',
                    group_id: 2
                }
            ])

# Create team making new meta id 14
Team.create([
                {
                    is_active: true,
                    name: 'Making New Meta',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'making-new-meta',
                    group_id: 2
                }
            ])

# Create team twice id 15
Team.create([
                {
                    is_active: true,
                    name: 'Twice',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'twice',
                    group_id: 3
                }
            ])

# Create team collective 5 id 16
Team.create([
                {
                    is_active: true,
                    name: 'Collective 5',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'collective-5',
                    group_id: 3
                }
            ])

# Create team please be gentler this time id 17
Team.create([
                {
                    is_active: true,
                    name: 'Please Be Gentler This Time',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'please-be-gentler-this-time',
                    group_id: 3
                }
            ])

# Create team Misty Mountains id 18
Team.create([
                {
                    is_active: true,
                    name: 'Misty Mountains',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'misty-mountains',
                    group_id: 3
                }
            ])

# Create team the norsemen id 19
Team.create([
                {
                    is_active: true,
                    name: 'The Norsemen',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'the-norsemen',
                    group_id: 3
                }
            ])

# Create team nexus id 20
Team.create([
                {
                    is_active: true,
                    name: 'Nexus',
                    created_at: '2017-09-22 22:37:36.496592',
                    updated_at: '2017-09-22 22:37:36.496592',
                    logo_file_name: 'd2logo.jpg',
                    logo_content_type: 'image/jpeg',
                    logo_updated_at: '2017-09-25 14:44:27.339747',
                    slug: 'nexus',
                    group_id: 3
                }
            ])

User.all.each do |user|
    OpendotaMmrRefreshJob.perform_now user
end