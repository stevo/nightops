describe InviteTeamToMission do

  let(:mission) { create(:mission) }

  describe '#call' do
    let(:user) { create(:user) }
    context 'team present' do
      let(:team) { create(:team, users: [user]) }

      it 'adds a team to mission' do
        expect { described_class.call(self) }.to change { mission.teams.count }.by(1)
      end

      let(:fake_mailer) { double(deliver: true) }

      it 'sends an email' do
        expect(TeamMailer).to receive(:invitation_notification).with(team.users.first, mission.external_url).and_return(fake_mailer)
        expect(fake_mailer).to receive(:deliver)
        described_class.call(self)
      end
    end

    context 'team is nil' do
      let(:team) { nil }

      it 'does not add a team to mission' do
        expect { described_class.call(self) }.not_to change { mission.teams.count }
      end

      it 'does not send an email' do
        expect(TeamMailer).not_to receive(:invitation_notification)
        described_class.call(self)
      end
    end
  end
end