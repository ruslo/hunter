#include <QtPlugin>

// http://doc.qt.io/qt-5/qtglobal.html

#if defined(Q_OS_IOS)
  // Nothing (exclude OS X)
#elif defined(Q_OS_DARWIN)
  Q_IMPORT_PLUGIN(QCocoaIntegrationPlugin);
#endif
