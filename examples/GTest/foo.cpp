#include <gtest/gtest.h>
#include <gmock/gmock.h>

using namespace testing;

class MyClass
{
public:
    virtual void doSomething(){}
};

class MockClass : public MyClass
{
public:
    MOCK_METHOD0(doSomething, void());  // MOCK_METHOD is from gmock.h
};

TEST(MyTest, demonstrate_clang_tidy_warning)    // TEST is from gtest.h
{
    MockClass myMockClass;

    EXPECT_CALL(myMockClass, doSomething()).Times(1);
    
    myMockClass.doSomething();
}

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

