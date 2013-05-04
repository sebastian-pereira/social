module MyAdmin
  module Models
    module Base


      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::FormTagHelper
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      #include ::Rails.application.routes.url_helpers

      attr_reader :model_relations, :objects, :actions
      
      def initialize
        @objects = []
        @model_name = self.class.name.split('::')[-1]
        @actions = []

        begin
          unless defined?(ActiveRecord::Base.const_get(@model_name)) != 'constant'
            raise ClassNotDefinedException, @model_name
          end

          @model = ActiveRecord::Base.const_get(@model_name )
        rescue NameError => e
          raise ClassNotDefinedError, "Error! Model #{@model_name.capitalize} not found"
        end

      end

    end
  end
end
