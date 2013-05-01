module MyAdmin
  module Foundations
    
    module Editable
      
      def edit(id)
        @model.find(id)
      end
      
      def save(params)
        if not params[:id] or params[:id].empty?
          #throw new Exception
        end
        
        
        object = @model.find(params[:id])
        
        if object
          object.update_attributes(params)
        else
          false
        end
      end
      
      
    end
  end
end