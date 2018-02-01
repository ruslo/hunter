#include <sm/state_machine.h>
#include <iostream>

struct Foo: public State
{
	void update(float dt) override
	{
		std::cout << "(updated)" << std::endl;
	}

	void draw(float dt) override
	{
		std::cout << "(drawed)" << std::endl;
	}
};

int main()
{
	StateMachine machine;

	machine.push_state<Foo>();

	machine.update(0.0f);

	machine.pop_state();

	machine.update(0.0f);

	return 0;
}
