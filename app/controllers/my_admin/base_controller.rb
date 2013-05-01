class MyAdmin::BaseController < ApplicationController
  
  before_filter :init
  layout 'admin_area'
  
  attr_reader :model
  
  def index
   #@objects = ('MyAdmin::Models::' + @model.classify.to_s).constantize.new.index
   @model = MyAdmin::Models.const_get(@short_model_name.classify).new
   @html = @model.render_in_list
  end
  
  def edit
    #@object = ('MyAdmin::Models::' + @model.classify.to_s).constantize.new.edit(params[:id])
    @model = MyAdmin::Models.const_get(@short_model_name.classify).new
    @html = @model.edit(params[:id])
  end
  
  def save
    @object = ('MyAdmin::Models::' + @model.classify.to_s).constantize.new.save(params[@@name])
    
    if @object
      flash[:notice] = 'Saved!'
      redirect_to :action => :index      
    else
      flash[:notice] = 'Error occured!!!'
      redirect_to :back
    end
  end
  
  
  private 
  
  def init

    @short_model_name = controller_name
    #@model_object = ('MyAdmin::' + @@name.classify.to_s).constantize.new
  end
end