p system("git config user.email >/dev/null 2>/dev/null || git config user.email $(whoami)@localhost")
puts `git config user.email`
