require 'spec_helper'

describe User do
  
  it { should have_many(:services).with_dependent(:destroy)}

  it { should have_many(:services).with_autosave }

  it { should have_many(:events).with_dependent(:destroy)}

  it { should have_many(:events).with_autosave}

  it { should have_and_belong_to_many(:participated_events) }
  
  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:email) }

  it { should validate_format_of(:email).to_allow("anil@joshsoftware.com").not_to_allow("anil.com") }
  
  it { should validate_format_of(:website).to_allow("http://www.google.com").not_to_allow("anil.com") }
  
  it { should validate_presence_of(:name).on(:create, :update) }
end
