CONFIG_VERSION = 5.25

plugin.remove('tv')
plugin.activate('image.apod', args=('/root/images'))
plugin.activate('audio.coversearch', args=('12E8SKQVKJRM4V8YHE82',))
plugin.activate('audio.detach')
plugin.activate('audio.lastfm')
plugin.activate('video.youtube')
plugin.activate('video.cinemovies_trailers')
plugin.activate('video.imdb')
plugin.activate('headlines', level=45)
plugin.activate('idlebar.weather', level=30, args=('EIKN',))
plugin.activate('buttonbar')
plugin.activate('command', level=45)
# Global configuration
AUDIO_ITEMS = [ ('Music Pool', '/data/music'),('Webradio','/etc/freevo/webradio.fxd') ]
VIDEO_ITEMS = [ ('Movies Pool', '/data/movies') ]
IMAGE_ITEMS = [ ('Pictures Pool', '/data/images') ]
COMMANDS_DIR = '/data/commands'

# Headlines plugin configuration
HEADLINES_LOCATIONS = [
    ('LeMonde','http://www.lemonde.fr/rss/une.xml'),
    ('Le blog de johan','http://johmathe.nonutc.fr/wordpress/feed/'),
]

# Youtube plugin configuration
YOUTUBE_VIDEOS = [
   ('user1', 'description1')
]
YOUTUBE_DIR = '/tmp/Youtube'
YOUTUBE_DL = "/usr/share/freevo/htdocs/youtube-dl"

# Imdb plugin configuration
# list of regexp to be ignored on a disc label
IMDB_REMOVE_FROM_LABEL = ('season[\._ -][0-9]+', 'disc[\._ -][0-9]+',
                         'd[\._ -][0-9]+', 'french')

# list of words to ignore when searching based on a filename
IMDB_REMOVE_FROM_SEARCHSTRING = ('the', 'a')

# When searching for a movie title in imdb, should the result be
# autoaccepted if it is only one hit?
# 0 = show menu even if it is only one hit (gives you an opportunity to cancel)
# 1 = autoaccept
IMDB_AUTOACCEPT_SINGLE_HIT = True
MIXER_MAJOR_CTRL   = 'VOL'

# Last FM plugin configuration
LASTFM_USER = 'johmathe'
LASTFM_PASS = 'xxxx'
LASTFM_SESSION = ' ' 

# Button bar configuration
KEYMAP[key.K_F7] = 'RED'
KEYMAP[key.K_F8] = 'GREEN'
KEYMAP[key.K_F11] = 'YELLOW'
KEYMAP[key.K_F12] = 'BLUE'

# Detach plugin configuration
DETACH_KEY = 'ENTER'
EVENTS['video']['PREV'] = Event(VIDEO_SEND_MPLAYER_CMD, arg='seek -600')
EVENTS['video']['NEXT'] = Event(VIDEO_SEND_MPLAYER_CMD, arg='seek 600')
