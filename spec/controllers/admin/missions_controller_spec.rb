describe Admin::MissionsController do
  render_views

  let(:team) { create(:team) }
  before {
    sign_in FactoryGirl.create(:user, role: 'admin')
  }

  describe '#update' do
    let(:call_request) { put :update, team: team, mission: attributes, id: mission.id, team_id: team.id }
    let(:mission) { create(:mission, name: 'Mission 3', side: "Left") }

    context 'valid request' do
      let(:attributes) { attributes_for(:mission, name: 'Mission 4', side: "Right") }

      it { expect { call_request }.to change { mission.reload.name }.from('Mission 3').to('Mission 4') }
      it { expect { call_request }.to change { mission.reload.side }.from('Left').to('Right') }

      context 'after request' do
        before { call_request }
        it { should redirect_to admin_missions_path }
      end
    end

    context 'invalid request' do
      let(:attributes) { attributes_for(:mission, name: nil, side: 'Right') }

      it { expect { call_request }.not_to change { mission.reload.name } }
      it { expect { call_request }.not_to change { mission.reload.side } }

      context 'after request' do
        before { call_request }
        it { should render_template "edit" }
      end
    end
  end
end