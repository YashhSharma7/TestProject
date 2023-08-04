# # app/admin/ability.rb
# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     # Here, you can define abilities for Active Admin resources
#      user ||= User.new # Guest user (not logged in)

#     if user.admin?
#       can :manage, :all # Admin users can manage all resources
#     else
#       can :read, Product # Regular users can read products
#     end
#   end
# end
