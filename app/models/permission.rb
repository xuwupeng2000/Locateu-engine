# User can give Permission to another user(EC)
# with Permission EC can view the geo tracks of that user
# Permission also hold encrypted user profile, protected by EC's password
class Permission < ApplicationRecord
  include Statesman::Adapters::ActiveRecordQueries

  has_many :permission_transitions, autosave: false

  def state_machine
    @state_machine ||= PermissionStateMachine.new(self, transition_class: PermissionTransition)
  end

  def self.transition_class
    PermissionTransition
  end

  def self.initial_state
    :pending
  end
  private_class_method :initial_state
end