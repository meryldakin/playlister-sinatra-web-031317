module Slugifiable

  module ClassMethods
    def find_by_slug( slug )
      all.find do |entry|
         entry.slug == slug
      end
    end

  end



  module InstanceMethods
    def slug
      name.strip.downcase.gsub(/[\s\.\/\\]/, '-').tr('$','s').gsub(/[^\w+-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
    end
  end
end
