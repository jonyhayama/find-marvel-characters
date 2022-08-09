class Character < ApplicationRecord
  scope :order_by_name_similarity, ->(name) {
    select('*')
      .select(sanitize_sql_array(["similarity(name, ?) AS score", name]))
      .order("score DESC")
  }
end
