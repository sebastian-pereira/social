module MyAdmin
  module Models
    class University
      include MyAdmin::Foundations::Viewable
      include MyAdmin::Foundations::Editable
      include MyAdmin::Models::Base
    end
  end
end