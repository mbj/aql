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

    # Test if buffer is on empty line
    #
    # @return [true]
    #   if buffer is on empty line 
    #
    # @return [false]
    #   otherwise
    #
    # @api private
    #
    def new_line?
      @buffer.empty? || @buffer.last == "\n"
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
      append(open)
      delimited(nodes)
      append(close)
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
      append('(')
      left.visit(self)
      append(" #{operator} ")
      right.visit(self)
      append(')')
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
      # Encode string in utf-8
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
      # @return [Stirng]
      #
      # @api private
      #
      def self.utf8_encode(string)
        string
      end
    end

  private

    # Emit delimited nodes
    #
    # @param [Enumerable<Node>] nodes
    #
    # @return [undefined]
    #
    # @api private
    #
    def delimited(nodes)
      max = nodes.length - 1
      nodes.each_with_index do |element, index|
        element.visit(self)
        delimiter if index < max
      end
    end

    # Emit delimiter
    #
    # @return [undefined]
    #
    # @api private
    #
    def delimiter
      append(', ')
    end

  end
end
