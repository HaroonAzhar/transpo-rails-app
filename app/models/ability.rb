class Ability
  include CanCan::Ability

  def initialize(user)
    
        user ||=User.new
      
        
        can :read, Route
        can :read, Stop
        
      

        unless user.nil? 
          # CanCan accepts a hash of conditions;
          # here, we're saying that the Post's user_id
          # needs to match the requesting User's id
          can :update, User, { user_id: user.id }
        end
        if user.admin?
          can :manage, Route
          can :manage, Stop
        end
      end
  
end
