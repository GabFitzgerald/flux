require "./column"

struct Flux::QueryResult::Table(T)
  include Indexable(T)

  getter columns : Array(Column)

  getter records : Array(T)

  def initialize(@columns, @records)
  end

  delegate each, :<<, unsafe_fetch, to: records

  def group_key
    columns.select(&.group).map(&.name)
  end
end
