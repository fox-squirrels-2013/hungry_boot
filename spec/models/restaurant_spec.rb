require 'spec_helper'

describe Restaurant do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end

end
