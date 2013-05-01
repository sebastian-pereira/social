module MyAdmin
  module Models
    class User
      include MyAdmin::Foundations::Viewable
      include MyAdmin::Foundations::Editable
      include MyAdmin::Models::Base
      
      def index
        ActiveRecord::Base::User.all
      end
    end
  end
end