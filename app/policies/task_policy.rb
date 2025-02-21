class TaskPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  def create?
    user.super_admin? || user.creator?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    !record.completed? && (user.super_admin? || user.editor? || record.user == user)
  end

  def index?
    user.super_admin? || user.viewer?
  end

  def destroy?
    !record.completed? && (user.super_admin? || user.destroyer?)
  end

  def show?
    user.super_admin? || record.user == user
  end

  def user_tasks?
    record.where.not(user: user).empty?
  end


  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      if user.super_admin?
        scope.all
      else
        scope.where(status: [Task.statuses["pending"], Task.statuses["in-progress"]])
      end
    end
  end
end
