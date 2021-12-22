module ApplicationHelper

  # sort機能のヘルパーメソッド
  def sort_order(column, created_at)
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
      link_to orders, { sort: column, direction: direction }, class: "sort_header #{css_class}"
  end

end
