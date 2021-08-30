# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :update, Project do |project| 
      project.user == user
    end
    can :destroy, Project do |project| 
      project.user == user
    end
    can :create, Project do |project| 
      project.user == user
    end
    can :update, Task do |task|
      task.reporter_id == user.id || task.assignee_id == user.id
    end
    can :destroy, Task do |task| 
      task.reporter_id == user.id || task.assignee_id == user.id
    end
  end
end
