AQL
===

[![Build Status](https://secure.travis-ci.org/mbj/aql.png?branch=master)](http://travis-ci.org/mbj/aql)
[![Dependency Status](https://gemnasium.com/mbj/aql.png)](https://gemnasium.com/mbj/aql)
[![Code Climate](https://codeclimate.com/github/mbj/aql.png)](https://codeclimate.com/github/mbj/aql)

Generator for the ArangoDB Query Language [AQL](http://www.arangodb.org/manuals/current/Aql.html) in Ruby. It is used as a backend for [axiom-arango-adapter](https://github.com/mbj/axiom-arango-adapter).

Using AQL
---------

There is currently no stable public API.

Installation
------------

There is currently no gem release. Use git source in your Gemfile:

```ruby
gem 'aql', :git => 'https://github.com/mbj/aql'
```

Or use ```:github => 'mbj/aql'``` if you prefer unencrypted protocols.

Examples
--------

This gem does not have a public API. Please do not use it as a way to generate AQL statements by hand - this gem is not intended for this purpose. Instead write a library that uses this gem to generate AQL. Just to make it easier for you to get into the code, here is an example on how to generate a simple AQL statement:

```ruby
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
#=> "FOR `person` IN `people` FILTER (`person`.`firstname` == "Markus") RETURN {`person`.`firstname`: `person`.`lastname`}"
```

Credits
-------

* [Markus Schirp (mbj)](https://github.com/mbj) Author
* [triAGENS](https://github.com/triAGENS) For sponsoring this work!

Contributing
-------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with Rakefile or version
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

License
-------

This gem is published under the MIT license. See LICENSE file.
