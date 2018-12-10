#include <Wt/WApplication.h>

class TestApp: public Wt::WApplication
{
public:
    TestApp(const Wt::WEnvironment& env);

private:
};

TestApp::TestApp(const Wt::WEnvironment& env)
    : Wt::WApplication(env)
{
    setTitle("TestApp");
}

std::unique_ptr<Wt::WApplication> createApplication(const Wt::WEnvironment& env)
{
    return std::make_unique<TestApp>(env);
}

int main(int argc, char **argv)
{
    return Wt::WRun(argc, argv, [](const Wt::WEnvironment &env) {
        return Wt::cpp14::make_unique<TestApp>(env);
    });
}
