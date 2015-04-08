describe Admin::InvitationsController do
  render_views

  let(:team) { create(:team) }
  let(:mission) { create(:mission) }
  before {
    sign_in FactoryGirl.create(:user, role: 'admin')
  }

  before(:each) do
    request.env['HTTP_REFERER'] = '/'
  end

  describe '#create' do
    let(:call_request) { post :create, mission_id: mission.id, invitation: attributes }

    context 'valid request' do
      let(:attributes) { {team_id: team.id} }

      it { expect { call_request }.to change { Invitation.count }.by(1) }

      context 'after request' do
        before { call_request }

        it { should redirect_to '/' }
      end
    end

    context 'invalid request' do
      let(:attributes) { {team_id: nil} }

      it { expect { call_request }.not_to change { Invitation.count } }

      context 'after request' do
        before { call_request }
        it { should redirect_to '/' }
      end
    end
  end
end