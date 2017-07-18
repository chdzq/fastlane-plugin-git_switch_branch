describe Fastlane::Actions::GitSwitchBranchAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The git_switch_branch plugin is working!")

      Fastlane::Actions::GitSwitchBranchAction.run(nil)
    end
  end
end
