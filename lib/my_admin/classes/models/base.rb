module MyAdmin
  module Models
    module Base
      
      attr_reader :model_relations, :objects
      
      def initialize
        @objects = []
        @model_name = self.class.name.split('::')[-1]
        
        
        @model = ActiveRecord::Base.const_get(@model_name )
        
      end
      
      
      def render_in_list
        orms = ActiveRecord::Base.const_get(@model_name).all

        html = '';
        orms.each do |o|
          @objects.push MyAdmin::Records.const_get(@model_name).new(o)
        end
        @objects.each do |o|
          html += o.render_in_list
        end
        html
      end
      
      def edit(id)
        orm = ActiveRecord::Base.const_get(@model_name).find(id)
        @object = MyAdmin::Records.const_get(@model_name).new(orm)
        
        @object.render
      end
      
    end
  end
end
