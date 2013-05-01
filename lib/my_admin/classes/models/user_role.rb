module MyAdmin
  module Models
    class UserRole
      include MyAdmin::Foundations::Viewable
      include MyAdmin::Foundations::Editable
      include MyAdmin::Models::Base
      
      def index
        ActiveRecord::Base::UserRole.all
      end
    end
  end
end