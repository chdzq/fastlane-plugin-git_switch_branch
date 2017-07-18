module Fastlane
  module Helper
    class GitSwitchBranchHelper
      # class methods that you define here become available in your action
      # as `Helper::GitSwitchBranchHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the git_switch_branch plugin helper!")
      end
    end
  end
end
