describe "Testing for Different Matchers" do

  it "Hello Testing" do
    expect(Customer.new.test).to include("hello")
  end

  it "assert on equality" do
    number = 3
#    should is old syntax in rspec 2 and expect is new
#    number.should == 3
    expect(number).to eq(3)
    expect(number).to eql(3)
    expect(number).to equal(3)
  end

  it "assert on mathematics operation" do
    number = 5
    expect(number).to be >= 4
    expect(number).to be > 1
    expect(number).to be < 7
    expect(number).to be <= 5
  end

  it "assert om matching regular expression" do
    email = "vinay@kretio.com"
    regular_expression = /^\w+@\w+.[a-z]{2,4}$/
    expect(email).to match regular_expression
  end

  it "asser on type and classes" do
    object_int = 4
    object_float = 4.0
    object_float = 4.0

    expect(object_int).to be_a(Fixnum)
    expect(object_float).to be_a(Float)
    expect(object_float).to be_a(Numeric)
    expect(object_float).to be_an_instance_of(Float)
  end

  it "assert on truthiness" do
    var_true = true
    var_false = false
    var_nil = nil

    object_class = Class.new
    expect(var_true).to be true
    expect(var_true).to be_truthy
    expect(object_class).to be_truthy
    expect(var_false).to be false
    expect(var_false).to be_falsey
    expect(var_nil).to be nil
    expect(var_nil).to be_falsey

  end

  it "expect errors" do
    expect do
      raise ArgumentError
    end.to raise_error #TypeError
  end

  it "assert on predicates" do
    class Test
      def instance_methods?
        true
      end
    end
    expect(Test.new).to be_an_instance_methods
  end

  it "asert on collections" do
    array = [ :one, :two, :three]
    expect(array).to include(:one)
    expect(array).to start_with [:one, :two]
    expect(array).to end_with [:three]
  end

  it "negates assert" do
    number = 4
    expect(number).not_to be > 6
  end

  end

#######################################################
  describe Customer  do
  it "Customer class setter method" do
    #Old syanatx
    #     customer = Customer.new
    #     customer.should respond_to(:name=)
    # Old syntax ; using of subject methods
    #     subject.should respond_to(:name=)
    # Another way to check
    #      should respond_to(:name=)
    # One another way

    customer = Customer.new
    expect(customer).to respond_to(:name=)

  end

  it "Customer class getter method" do
    customer = Customer.new
    expect(customer).to respond_to(:name)
  end

  it "test case for association" do
    reflection = Customer.reflect_on_association(:orders)
    reflection.macro.should eq :has_many
  end

end