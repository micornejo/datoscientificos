# -*- coding: utf-8 -*-
module ApplicationHelper

  def breadcrumbs_name(name)
    case name
    when '';       'Portada'
    when 'buenas_practicas';    'Buenas prácticas'
    when 'beneficios';          'Beneficios'
    else; name.gsub('_', ' ')
    end
  end

  def active_link(title, controller, action, tag='li')
    url = url_for(controller: controller, action: action)
    path = request.fullpath
    if path == url or (url != '/' and /^#{url}/ === path)
      "<#{tag} class=\"active\">#{link_to(title, url)}</#{tag}>".html_safe
    else
      "<#{tag}>#{link_to(title, url)}</#{tag}>".html_safe
    end
  end

end
