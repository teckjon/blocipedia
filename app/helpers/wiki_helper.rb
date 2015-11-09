module WikiHelper
    def public
        if  @wiki.public?
            content_tag :span, 'Public'
        else 
            content_tag :span, 'Private'
        end
    end    
            
end