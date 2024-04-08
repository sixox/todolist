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

  def canonical_url
    case controller_name
    when 'home'
      root_url
    when 'grades', 'products', 'posts', 'packings'
      if action_name == 'show' && params[:id].present?
        polymorphic_url(controller_name.classify.constantize.friendly.find(params[:id]))
      else
        polymorphic_url(controller_name)
      end
    else
      request.original_url
    end
  rescue ActiveRecord::RecordNotFound
    root_url
  end

  # Generates a canonical URL tag
  def canonical_url_tag
    tag.link(rel: 'canonical', href: canonical_url)
  end

end
