require "spec"

describe String::Builder do
  it "builds" do
    str = String::Builder.build do |builder|
      builder << 123
      builder << 456
    end
    str.should eq("123456")
    str.size.should eq(6)
    str.bytesize.should eq(6)
  end

  it "raises if invokes to_s twice" do
    builder = String::Builder.new
    builder << 123
    builder.to_s.should eq("123")

    expect_raises { builder.to_s }
  end

  it "goes back" do
    s = String::Builder.build do |str|
      str << 12
      str.back(1)
    end
    s.should eq("1")
  end

  it "goes back all" do
    s = String::Builder.build do |str|
      str << 12
      str.back(2)
    end
    s.should eq("")
  end
end
