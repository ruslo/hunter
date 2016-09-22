#include <QCoreApplication>

#if defined(Q_OS_IOS)
extern "C" int qtmn(int argc, char** argv) {
#else
int main(int argc, char **argv) {
#endif
  QCoreApplication a(argc, argv);
  return a.exec();
}
