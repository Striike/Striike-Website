module PagesHelper
  def nl2br s
    simple_format(s).gsub(/<\/p>(\s*)<p([^>]*)>/, '<br /><br />')
    simple_format(s).gsub('-', '<li />')
  end
end
