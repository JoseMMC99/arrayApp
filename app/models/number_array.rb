class NumberArray
  include Mongoid::Document
  include Mongoid::Timestamps
  field :nums, type: Array
end
