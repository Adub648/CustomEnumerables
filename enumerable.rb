# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < size
      yield self[i]
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < size
      yield(self[i], i)
      i += 1
    end
  end

  def my_select(&block)
    array = []
    my_each { |item| array.push(item) if block.call(item) }
    array
  end

  def my_all?(&block)
    my_each do |item|
      return false unless block.call(item)
    end
    true
  end

  def my_any?(&block)
    my_each do |item|
      return true if block.call(item)
    end
    false
  end

  def my_none?(&block)
    my_each do |item|
      return false if block.call(item)
    end
    true
  end

  def my_count(&block)
    count = 0
    my_each do |item|
      count += 1 if block.call(item)
    end
    count
  end

  def my_map(&block)
    array = []
    my_each { |item| array.push(block.call(item)) }
    array
  end

  def my_inject(&block)
    total = self[0]
    my_each do |item|
      total = block.call(total, item) if item != self[0]
    end
    total
  end

  def multiply_els(array)
    array.my_inject { |i, n| i * n }
  end

  def my_map_proc(map_proc)
    array = []
    my_each { |item| array.push(map_proc.call(item)) }
    array
  end

  def my_map_options(&block)
    array = []
    my_each { |item| array.push(block.call(item)) }
    array
  end
end
