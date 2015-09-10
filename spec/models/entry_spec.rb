require_relative '../spec_helper'

describe Entry do
  it { should validate_presence_of :singer }
  it { should validate_length_of(:singer).is_at_most(64) }

  it { should validate_presence_of :song_title }
  it { should validate_length_of(:song_title).is_at_most(64)}
end
