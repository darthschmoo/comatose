
module Comatose

  # DEPRECATED
  # Loads extensions from RAILS_ROOT/lib/comatose/*.rb
  def self.load_extensions
    Dir[File.join(RAILS_ROOT, 'lib', 'comatose', '*.rb')].each do |path|
      require "comatose/#{File.basename(path)}"
    end
  end

end

begin
  require 'active_record/acts/list'
rescue MissingSourceFile => ex
  require 'acts_as_list'
end
begin
  require 'active_record/acts/tree'
rescue MissingSourceFile => ex
  require 'acts_as_tree'
end

require 'acts_as_versioned'
require 'redcloth' unless defined?(RedCloth)
require 'liquid' unless defined?(Liquid)

require 'support/class_options'
require 'text_filters'

require 'comatose/configuration'
require 'comatose/comatose_drop'
require 'comatose/processing_context'
require 'comatose/page_wrapper'
require 'comatose/version'

require 'support/inline_rendering'
require 'support/route_mapper'

require 'dispatcher' unless defined?(::Dispatcher)
::Dispatcher.to_prepare :comatose do
    Comatose.config.after_setup.call
end

module Comatose
  def self.create_root_page(options ={})
    raise "Root page already exists" if ComatosePage.root
    root = ComatosePage.create({:title=>'root page', :body=>"Welcome to comatose", :author=>'System', :parent_id=>nil}.merge(options))
    root.save(false)
    raise "Failed to save root page" if root.new_record?
  end
end
