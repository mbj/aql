module AQL
  # The emit buffer
  class Buffer

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

    # Append content to buffer
    #
    # @param [String] content
    #
    # @return [self]
    #
    # @api private
    #
    def append(content)
      @buffer << content
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
