module MyAdmin
  module Fields
    class Model
  
      attr_reader :fields, :name
      
      def initialize(name)
        @fields = []
        @field_types = YAML.load_file("../../config/fields.yml")
        @name = name
        
        config = YAML.load_file("../../config/table_configs/#{@name}.yml")
        if config.instance_of? Hash
          @fields = compose_fields(config)
        end
      end
      
      def add_field(data)
        emp = false
        data[@name].each do |p|
          if p.empty?
            flash[:notice] = 'Empty values'
            emp = true
            return false
          end
        end
        
        config = YAML.load_file("../../config/table_configs/#{@name}.yml")
        
        config[data[@name][:sys_name]] =
          {
            'label' => data[@name][:label],
            'position' => data[@name][:position],
            'type' => data[@name][:type],
            'visible' => data[@name][:visible],
            'readonly' => data[@name][:readonly],
            'disabled' => data[@name][:disabled]
          }

        File.open("../../config/table_configs/#{@name}.yml", 'w') do |f|
          YAML::dump(config, f)
        end
        
      end
      
      def format_fields
        fields = {}
        
        # @fields - [] MyAdmin::Fields::Models::Field
        # Поля - @name='id', @errors = [], @attributes=[]
        @fields.each do |f|
          field = []
          f.attributes.each do |attr|
            type = @field_types[attr.name]
            field_object = ('MyFields::' + type['type'].capitalize).constantize.new('fields['+f.name+']', attr.name, attr.value, attr.value)
            arr = field_values(type['values'])
            unless arr.empty?
              field_object.set_values arr
            end
            #field.push MyFields::Text.new("fields[#{f.name}]", "sys_name", f.name)
            field.push MyFields::Text.new("fields[#{f.name}]", "sys_name", f.name)
            field.push field_object
          end
          fields[f.name] = field
        end
        
        fields
      end
      
      def save(params)
        @fields = compose_fields(params[:fields])
    
        @hs = {}
        fields.each do |f|
          @hs.merge! f.collect
        end
        #File.open("../../config/table_configs/#{@name}.yml", 'w') do |f|
          #YAML::dump(@hs, f)
        #end
      end
      
      def gen_creation_fields
        fields = []
        fields.push MyFields::Text.new(@name, 'sys_name', 'System name')
        fs = YAML.load_file("../../config/fields.yml")
        fs.each_pair do |k, v|
          field = ('MyFields::' + v['type'].capitalize).classify.constantize.new(@name, k, v['name'])
          if v['values']
            arr = field_values(v['values'])
            unless arr.empty?
              field.set_values arr
            end
          end
          fields.push field
        end
        fields
      end
      
      private 
      
      def compose_fields(hash)
        fields = []
        hash.each_pair do |k, v|
          field = Fields::Models::Field.new(k)
          field.collect_attributes(v)
          fields.push field
        end
        fields
      end
      
      def field_values(file_name)
        arr = []
        if file_name
          path = "../../config/field_values/" + file_name + ".yml"
          if File.exists?(path)
            values = YAML.load_file(path)
            values.each_pair do |k, v|
              arr.push [v, k]
            end
          end
        end
        arr
      end
      
      def validate_fields_data(fields)
        fields.each do |field|
          
        end
      end
    end

  end
end
  













