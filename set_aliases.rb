# Run this the first time to set your aliases. 

# Exit if aliases file in this folder (i.e. if we already ran this)
return if Dir["#{Dir.pwd}/.aliases"].length === 0 || Dir["#{Dir.home}/.aliases"] > 0

require 'fileutils'
# Move the .aliases file from this folder to your home directory
FileUtils.mv("#{Dir.pwd}/.aliases", "#{Dir.home}/.aliases")

# Put aliases line in the zshrc file
open("#{Dir.home}/.zshrc", 'a') do |zshrc|
    zshrc << "\n" + '[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"' + "\n"
end
