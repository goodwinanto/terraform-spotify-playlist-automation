resource "spotify_playlist" "Songs" {
    name = "Cool Playlist"
    tracks = [ "0eCajpR75pDW0r64U6hP2x" , 
                "0TL0LFcwIBF5eX7arDIKxY" ]
}

data "spotify_search_track" "weeknd" {
  artist = "Weeknd"
}

resource "spotify_playlist" "FalseAlarm" {
  
  name = "Cars"
  tracks = [ 
             data.spotify_search_track.weeknd.tracks[0].id, 
             data.spotify_search_track.weeknd.tracks[1].id,
             data.spotify_search_track.weeknd.tracks[2].id 
             ]
}