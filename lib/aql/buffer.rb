module AQL
  # The emit buffer
  class Buffer
    include Equalizer.new(:contents)

    # Initialize object
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize
      @buffer = []
    end

    # Emit wrapped delimited
    #
    # @param [String] open
    # @param [Enumerable<Node>] nodes
    # @param [String] close
    #
    # @return [self]
    #
    # @api private
    #
    def wrap_delimited(open, nodes, close)
      parentheses(open, close) do
        delimited(nodes)
      end
    end

    # Emit block in parentheses
    #
    # @return [self]
    #
    # @api private
    #
    def parentheses(open = '(', close = ')')
      append(open)
      yield
      append(close)
    end

    # Emit delimited nodes
    #
    # @param [Enumerable<Node>] nodes
    #
    # @return [self]
    #
    # @api private
    #
    def delimited(nodes, delimiter = ', ')
      max = nodes.length - 1
      nodes.each_with_index do |element, index|
        element.visit(self)
        append(delimiter) if index < max
      end
      self
    end

    # Emit binary
    #
    # @param [Node] left
    # @param [Symbol] operator
    # @param [Node] right
    #
    # @return [self]
    #
    # @api private
    #
    def binary(left, operator, right)
      parentheses do
        left.visit(self)
        append(" #{operator} ")
        right.visit(self)
      end
    end

    # Append content to buffer
    #
    # @param [String] content
    #
    # @return [self]
    #
    # @api private
    #
    def append(content)
      @buffer << self.class.utf8_encode(content)
      self
    end

    # Return content
    #
    # @return [String]
    #
    # @api private
    #
    def content
      @buffer.join.freeze
    end

    if defined?(Encoding)
      # Encode string in UTF-8
      #
      # @param [String] string
      #
      # @return [String]
      #
      # @api private
      #
      def self.utf8_encode(string)
        string.encode(Encoding::UTF_8)
      end
    else
      # Dummy encode string for rubies that do not support encoding hell
      #
      # @param [String] string
      #
      # @return [String]
      #
      # @api private
      #
      def self.utf8_encode(string)
        string
      end
    end

  end
end
