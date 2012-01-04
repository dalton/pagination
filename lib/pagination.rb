require 'forwardable'

module Conversions
  private
  def Paginated(collection)
    return collection if collection.is_a?(Paginated)
    Paginated.new(collection)
  end
end

class Paginated
  extend Forwardable
  include Enumerable

  attr_writer :limiter, :offsetter, :page

  def_delegators :entries, :empty?, :count, :[], :each

  def initialize(collection, options = {per_page: 10, page: 1})
    @collection = collection
    @per_page = options[:per_page]
    @page = options[:page]
  end

  def entries
    @collection.send(offsetter, offset).send(limiter, @per_page)
  end

  def page_count
    @collection.size / @per_page
  end

  private
  def limiter
    @limiter ||= :limit
  end

  def offsetter
    @offsetter ||= :offset
  end

  def offset
    (@page *@per_page) - @per_page
  end
end