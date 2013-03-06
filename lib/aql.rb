require 'backports'
require 'abstract_type'
require 'adamantium'
require 'concord'

# Library namespace
module AQL

  # Return AQL node for literal
  #
  # @param [Object] value
  #
  # @return [AQL::Node::Literal]
  #
  # @api private
  #
  def self.literal_node(value)
    AQL::Node::Literal.build(value)
  end

  # Return AQL name node
  #
  # @param [#to_s] name
  #
  # @return [AQL::Node::Name]
  #
  # @api private
  #
  def self.name_node(name)
    AQL::Node::Name.new(name.to_s)
  end

end

require 'aql/buffer'
require 'aql/node'
require 'aql/constants'
require 'aql/node/name'
require 'aql/node/call'
require 'aql/node/null'
require 'aql/node/block'
require 'aql/node/attribute'
require 'aql/node/literal'
require 'aql/node/literal/singleton'
require 'aql/node/literal/primitive'
require 'aql/node/literal/primitive/string'
require 'aql/node/literal/primitive/number'
require 'aql/node/literal/composed'
require 'aql/node/literal/composed/document'
require 'aql/node/literal/composed/list'
require 'aql/node/operator'
require 'aql/node/operator/assignment'
require 'aql/node/operator/binary'
require 'aql/node/operator/unary'
require 'aql/node/operator/ternary'
require 'aql/node/operator/nary'
require 'aql/node/operation'
require 'aql/node/operation/unary'
require 'aql/node/operation/nary'
require 'aql/node/operation/binary'
require 'aql/node/operation/limit'
require 'aql/node/operation/for'
