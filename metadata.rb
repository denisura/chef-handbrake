name             'handbrake'
maintainer       'Denis Uraganov'
maintainer_email 'github@uraganov.net'
license          'Apache 2.0'
description      'Installs/Configures HandBrakeCLI'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md')).chomp
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')).chomp rescue '0.1.0'

depends "build-essential"
depends "xml"

%w{ debian ubuntu }.each do |os|
  supports os
end

recipe "handbrake", "Installs HandBrakeCLI from source."
recipe "handbrake::source", "Installs HandBrakeCLI from SVN source."