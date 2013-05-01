module MyAdmin
  module Models
    class Faculty
      include MyAdmin::Foundations::Viewable
      include MyAdmin::Foundations::Editable
      include MyAdmin::Models::Base
    	
    end
  end
end
