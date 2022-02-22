path = Dir.pwd
Dir.entries('.').each do |file| 
    next if ['.git', '.', '..', 'set_shortcuts.rb'].include?(file)

    puts "What will the shortcut be for: #{file} ? (Enter to skip) \n"
    shortcut = gets.chomp
    if shortcut.length > 0
        string = "alias #{shortcut}=\"#{path}/#{file}\""
        open("#{Dir.home}/.zshrc", 'a') do |zshrc|
            zshrc << "\n" + string + "\n"
        end
    
        puts "'#{shortcut}' is now the alias for #{file}\n\n"
    else
        puts "Skipping #{file}\n\n"
    end
end
