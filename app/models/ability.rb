class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role) }

    if @user.roles.size == 0
      can :read, :all #for guest without roles
    end
  end

  def Find_work
    can :read, :all
  end

  def Hire_member
    can :manage, Post
  end

  def admin
    can :access, :rails_admin
    can :manage, :all
    can :dashboard 
  end
end
