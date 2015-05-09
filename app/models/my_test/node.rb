class MyTest::Node
  # include Mongoid::Document
  # include Mongoid::Tree
  # field :name, :type => String
  # before_destroy :destroy_children
  #
  # def to_node
  #   {"id" => self._id, "text"=>self.name, "state"=>"open",
  #    "children" => self.children.map { |c| c.to_node }
  #   }
  # end
end
