require 'my_admin/foundation'
require 'my_admin/adapter'
require 'my_admin/foundations/addable'
require 'my_admin/foundations/viewable'
require 'my_admin/foundations/editable'
require 'test/test_class'
require 'my_admin/generators/template'
require 'my_admin/engine'
require 'my_admin/helpers/columnizer'
require 'my_admin/classes/models/base'
require 'my_admin/classes/models/user'
require 'my_admin/classes/models/university'
require 'my_admin/classes/models/faculty'
require 'my_admin/classes/models/user_role'
require 'my_admin/classes/fields/model'
require 'my_admin/classes/fields/models/attribute'
require 'my_admin/classes/fields/models/field'

require 'my_admin/classes/records/base'
require 'my_admin/classes/records/university'
require 'my_admin/classes/records/faculty'
require 'my_admin/classes/records/user'

#require 'my_admin/models/attribute'
#require 'my_admin/models/field'

module MyAdmin
  
  mattr_accessor :app_root

  # Yield self on setup for nice config blocks
  def self.setup
    yield self
  end
  
end

ActionController::Base.send(:include, MyAdmin::Adapter::Implementation)