require 'spec_helper'

describe Event do
  
  it { should have_many(:assets).with_autosave }

  it { should have_and_belong_to_many(:participants) }
  
  it { should belong_to(:user) }
  
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:short_desc) }
  
  it { should validate_presence_of(:organizer_name) }

  it { should validate_presence_of(:organizer_mobile_no) }

  it { should validate_presence_of(:location) }

  it { should validate_presence_of(:start_date) }

  it { should validate_presence_of(:end_date) }

end
