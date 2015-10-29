class WikiPolicy < ApplicationPolicy
    def create
        user.present?
    end
    
    def update
        user.present? && (user.admin? || record.user == user || !record.private? )
    end
end