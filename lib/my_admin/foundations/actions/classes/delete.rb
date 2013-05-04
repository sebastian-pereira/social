module MyAdmin
  module Foundations
    module Actions
      class Delete < Action

        def render(orm)
          erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/delete.html.erb"))
          erb.result(binding).html_safe
        end

      end
    end
  end
end