#macro g global
#macro player obj_Player

audio_play_sound(snd_Music, 1, true)
g.Mute = false

g.Talking = false
g.Goodbye = false
g.Inspect = false

g.FrameCount = 0
g.Flash = 0

g.Code = 0
g.Seen = -1

g.Hearts = 2
g.Kills = 0
g.Gold = 0

g.Die = false
g.Shutdown = false