class PostPolicy < ApplicationPolicy
  def create?
    record.user != user
  end
end
