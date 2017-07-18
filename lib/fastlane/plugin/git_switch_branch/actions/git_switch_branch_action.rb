module Fastlane
  module Actions
    class GitSwitchBranchAction < Action
      def self.run(params)
        branch = params[:branch]
        branch_expr = /#{branch}/
        if Actions.git_branch =~ branch_expr
          UI.success("Git branch match `#{branch}`, all good! 💪")
        else
          Actions.sh('git checkout .')
          result = Actions.sh("git checkout #{branch}")
          if result.nil?
            UI.success("Git branch match `#{branch}`, all good! 💪")
          else
            UI.error("Git is not on a branch matching `#{branch}`. Current branch is `#{Actions.git_branch}`! can not checkout `#{branch}` reasoin: #{result}。please ensure the repo is checked out to the correct branch.")
          end
        end
      end

      def self.description
        "switch to branch"
      end

      def self.authors
        ["zhangqi"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "ensure git switch to branch"
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :branch,
                                         env_name: "FL_ENSURE_GIT_BRANCH_NAME",
                                         description: "The branch that should be checked for. String that can be either the full name of the branch or a regex to match",
                                         is_string: true,
                                         default_value: 'master')
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
