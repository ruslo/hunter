#include <fakeit/standalone/fakeit.hpp>
#include <iostream>

struct SomeInterface {
	virtual int foo(int) = 0;
	virtual int bar(std::string) = 0;
};

int main()
{
	using namespace fakeit;
	
	// Instantiate a mock object.
	Mock<SomeInterface> mock;

	// Setup mock behavior.
	When(Method(mock,foo)).Return(1); // Method mock.foo will return 1 once.

	// Fetch the mock instance.
	SomeInterface &i = mock.get();

	// Production code
	i.foo(1);

	// Verify method mock.foo was invoked.
	Verify(Method(mock,foo));

	// Verify method mock.foo was invoked with specific arguments.
	Verify(Method(mock,foo).Using(1));
}
