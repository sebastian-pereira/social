module MyAdmin
  module Foundations
    module Actions
      class Edit < Action

        def render(orm)
          erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/edit.html.erb"))
          erb.result(binding).html_safe
        end

      end
    end
  end
end