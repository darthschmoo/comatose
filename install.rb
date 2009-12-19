require 'fileutils'

RAILS_ROOT = File.expand_path( File.join(File.dirname(__FILE__), '../../../') )

# Copy the images (*.gif) into RAILS_ROOT/public/images/comatose
unless FileTest.exist? File.join(RAILS_ROOT, 'public', 'images', 'comatose')
  FileUtils.mkdir( File.join(RAILS_ROOT, 'public', 'images', 'comatose') )
end

FileUtils.cp(
  Dir[File.join(File.dirname(__FILE__), 'resources', 'public', 'images', '*.gif')],
  File.join(RAILS_ROOT, 'public', 'images', 'comatose'),
  :verbose => true
)

# Copy the comatose admin javascripts (*.js) into RAILS_ROOT/public/javascripts
unless FileTest.exist? File.join(RAILS_ROOT, 'public', 'javascripts')
  FileUtils.mkdir( File.join(RAILS_ROOT, 'public', 'javascripts') )
end

FileUtils.cp(
  Dir[File.join(File.dirname(__FILE__), 'resources', 'public', 'javascripts', '*.js')],
  File.join(RAILS_ROOT, 'public', 'javascripts'),
  :verbose => true
)

# Copy the comatose admin stylesheets (*.css) into RAILS_ROOT/public/stylesheets
unless FileTest.exist? File.join(RAILS_ROOT, 'public', 'stylesheets')
  FileUtils.mkdir( File.join(RAILS_ROOT, 'public', 'stylesheets') )
end

FileUtils.cp(
  Dir[File.join(File.dirname(__FILE__), 'resources', 'public', 'stylesheets', '*.css')],
  File.join(RAILS_ROOT, 'public', 'stylesheets'),
  :verbose => true
)

# Show the INSTALL text file
puts IO.read(File.join(File.dirname(__FILE__), 'INSTALL'))
