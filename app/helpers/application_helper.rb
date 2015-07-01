module ApplicationHelper
  def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
  end

  def font_awesome_icon_for_social_site(social_site)
    case social_site
    when 'plus.google'
      'fa-google-plus-square'
    when 'instagram'
      'fa-instagram'
    else
       "fa-#{social_site}-square"
     end
  end

  def admin_nav_links(agent)
    [
      ['Basic Information', edit_agent_path(agent)],
      ['About Section', agent_edit_biography_path],
      ['Membership', nil],
      ['Brokers', new_agent_broker_path(agent)],
      ['Buyers & Sellers Info', agent_edit_guides_path(agent)],
      ['Graphics', agent_edit_themes_path(agent)],
      ['Links', agent_edit_links_path(agent)],
      ['Team Section', nil],
      ['Testimonials', agent_edit_testimonials_path(agent)]
    ]
  end

  def css_font_family_for_font_name(font_name)
    case font_name
    when :impact
      "Impact, Haettenschweiler, 'Franklin Gothic Bold', Charcoal, 'Helvetica Inserat', 'Bitstream Vera Sans Bold', 'Arial Black', 'sans serif';"
    when :tahoma
      "Tahoma, Verdana, Segoe, sans-serif;"
    when :verdana
      "Verdana, Geneva, sans-serif;"
    when :georgia
      "Georgia, Times, 'Times New Roman', serif;"
    when :palatino
      "Palatino, 'Palatino Linotype', 'Palatino LT STD', 'Book Antiqua', Georgia, serif;"
    when :times
      "Times;"
    when :courier
      "Courier;"
    when :lucida
      "'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Geneva, Verdana, sans-serif;"
    when :helvetica
      "'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;"
    else
      "'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;"
    end
  end
end
