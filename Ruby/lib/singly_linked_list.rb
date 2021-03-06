# singly linked list
class LinkedList
  attr_reader :sentinel

  def initialize
    @sentinel = Link.new(nil)
  end

  def pop
    prev, last = walkthrough
    prev.next = nil

    last.val
  end

  def push(val)
    link = Link.new(val)
    _, last_link = walkthrough
    last_link.next = link

    self
  end

  def shift
    first_link = @sentinel.next
    val = first_link.val
    @sentinel.next = first_link.next

    val
  end

  def unshift(val)
    link = Link.new(val)
    @sentinel.next, link.next = link, @sentinel.next
    
    self
  end

  private

  def walkthrough
    # walksthrough and returns array of second last and last link
    current = @sentinel
    until current.next.nil?
      prev = current
      current = current.next
    end

    [prev, current]
  end
end

class Link
  attr_accessor :next, :val

  def initialize(val)
    @val = val
    @next = nil
  end
end
