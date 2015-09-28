class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role) }

    if @user.roles.size == 0
      can :read, :all #for guest without roles
      can :apply, Post
    end
  end

  def Find_work
    can :read, :all
    can :apply, Post
  end

  def Hire_member
    can :manage, Post, :user_id => @user.id
    can :new, Post
    can :read, :all
    cannot :apply, Post
  end

  def admin
    can :access, :rails_admin
    can :manage, :all
    can :dashboard 
  end
end
