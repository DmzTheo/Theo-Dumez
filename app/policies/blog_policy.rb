class BlogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all

      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def show?
    true  # Anyone can view a restaurant
  end

  def create?
    true
  end

  def update?
    record.user == user || user.try(:admin?)
    # - record: the blog passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user || user.try(:admin?)
  end

  def upvote?
    true
  end  

  def unvote?
    true
  end
end
