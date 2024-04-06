module ApplicationHelper
  def safe_path_for(model, slug, default: "#")
    record = model.friendly.find(slug) rescue nil
    return default unless record

    case model.name
    when 'Product'
      product_path(record)
    when 'Grade'
      grade_path(record)
    else
      "#"
    end
  end
end
