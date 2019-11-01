(* Get the current song from iTunes or Spotify *)
if application "Music" is running then
  tell application "Music"
    if exists current track then
      set theName to the name of the current track
      set theArtist to the artist of the current track
      try
        return "♫  " & theName & " - " & theArtist
      on error err
      end try
    end if
  end tell
end if
