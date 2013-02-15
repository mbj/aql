require 'aql'

include AQL

person    = Node::Name.new('person')
firstname = Node::Name.new('firstname')
lastname  = Node::Name.new('lastname')

person_firstname = Node::Attribute.new(person, firstname)

node = Node::Operation::For.new(
  person, 
  Node::Name.new('people'),
  Node::Block.new(
    [
      Node::Operation::Unary::Filter.new(
        Node::Operator::Binary::Equality.new(person_firstname, Node::Literal::Primitive::String.new('Markus'))
      ),
      Node::Operation::Unary::Return.new(
        Node::Literal::Primitive::Composed::Document.new([
          Node::Literal::Composed::Document::Attribute.new(
            person_firstname,
            Node::Attribute.new(person, Node::Name.new('lastname'))
          )
        ])
      )
    ]
  )
)

puts node.aql
