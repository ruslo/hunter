#include <gtest/gtest.h>
#include <gmock/gmock.h>

class Turtle {
 public:
  virtual int GetX() const = 0;
  virtual ~Turtle() {}
};

class MockTurtle: public Turtle {
 public:
  MOCK_CONST_METHOD0(GetX, int());
};

TEST(Foo, Boo) {
  ASSERT_EQ(3, 3);
}

TEST(Foo, Mock) {
  MockTurtle turtle;
  EXPECT_CALL(turtle, GetX()).Times(::testing::AtLeast(1));

  turtle.GetX();
}
