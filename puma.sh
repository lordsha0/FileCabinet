cd ~/atelier/ruby/rails/FileCabinet
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')" && export PATH="$PATH:$GEM_HOME/bin"
bundle exec puma -p 6600
