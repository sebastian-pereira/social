class MyAdmin::ModelController < ApplicationController
  
  layout 'admin_area'
  before_filter :init
  def index
    class_model_object = MyAdmin::Fields::Model.new(@model)
    @fields = class_model_object.format_fields
    @field_labels = YAML.load_file("../../config/fields.yml")
    
    @fields_for_create = class_model_object.gen_creation_fields
    
    @relations = class_model_object
  end
  
  def save
    class_model_object = MyAdmin::Fields::Model.new(@model)
    class_model_object.save(params)
      
    #redirect_to :action => :index
  end
  
  def add_field
    class_model_object = MyAdmin::Fields::Model.new(@model)
    @fields = class_model_object.format_fields
    class_model_object.add_field(params)
    redirect_to :back
    
  end
  
  private 
  
  def init
    @model = params[:model]
  end
end