class PermissionTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  belongs_to :permisson, inverse_of: :permission_transitions

end
