class PermissionStateMachine
  include Statesman::Machine

  state :pending, initial: true
  state :accepted
  state :cancelled

  transition from: :pending, to: [:accepted, :cancelled]
  transition from: :accepted, to: [:cancelled]

  guard_transition(to: :accepted) do |perm, transition|
  end

  guard_transition(to: :cancelled) do |perm, transition|
  end

  before_transition(to: :cancelled) do |order, transition|
  end

  after_transition(to: :accepted) do |order, transition|
  end

  after_transition(to: :cancelled) do |order, transition|
  end
end