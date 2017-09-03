require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  
  let(:valid_attributes) do
    # TODO: replace the skip statement with a hash of valid attributes similar to the example
    # valid attributes must include the position and level values should be 0, 1, or 2 corresponding to junior, intermediate and senior
    # example: { position: 'Developer', level: Job.levels[:senior] }
    valid_attributes = { position: ['Developer','quality assurance','business analyst'], level: Job.levels[:junior],level: Job.levels[:intermediate],level: Job.levels[:senior] }
  end

  let(:invalid_attributes) do
    # TODO: replace the skip statement with a hash of valid attributes similar to the example
     invalid_attributes != { position: ['Developer','quality assurance','business analyst'], level: Job.levels[:junior],level: Job.levels[:intermediate],level: Job.levels[:senior] }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JobsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      job = Job.create! valid_attributes
      get :show, params: { id: job.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      job = Job.create! valid_attributes
      get :edit, params: { id: job.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Job' do
        expect {
          post :create, params: { job: valid_attributes }, session: valid_session
        }.to change(Job, :count).by(1)
      end

      it 'redirects to the created job' do
        post :create, params: { job: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Job.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the new template)' do
        post :create, params: { job: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        skip('Add a hash of attributes valid for your model')
      }

      it 'updates the requested job' do
        job = Job.create! valid_attributes
        put :update, params: { id: job.to_param, job: new_attributes }, session: valid_session
        job.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the job' do
        job = Job.create! valid_attributes
        put :update, params: { id: job.to_param, job: valid_attributes }, session: valid_session
        expect(response).to redirect_to(job)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        job = Job.create! valid_attributes
        put :update, params: { id: job.to_param, job: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested job' do
      job = Job.create! valid_attributes
      expect {
        delete :destroy, params: { id: job.to_param }, session: valid_session
      }.to change(Job, :count).by(-1)
    end

    it 'redirects to the jobs list' do
      job = Job.create! valid_attributes
      delete :destroy, params: { id: job.to_param }, session: valid_session
      expect(response).to redirect_to(jobs_url)
    end
  end
end
