module PantriesHelper
  def options_for_categories
    @pantry.categories
  end

  def options_for_units
    %w(lb cup oz tbsp tsp count)
  end


end
