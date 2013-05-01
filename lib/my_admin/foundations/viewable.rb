module MyAdmin
  module Foundations
    
    module Viewable
      
      mattr_accessor :model
      
      def index
        @model.all
      end
      
    end
  end
end