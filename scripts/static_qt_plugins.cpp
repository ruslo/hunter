// Copyright (c) 2015, Ruslan Baratov
// All rights reserved.

#include <QtPlugin>

// http://doc.qt.io/qt-5/qtglobal.html

#if defined(Q_OS_IOS)
# error "Not for iOS"
#elif defined(Q_OS_DARWIN)
  Q_IMPORT_PLUGIN(QCocoaIntegrationPlugin);
#elif defined(Q_OS_LINUX)
  Q_IMPORT_PLUGIN(QXcbIntegrationPlugin);
#elif defined(Q_OS_WIN)
  Q_IMPORT_PLUGIN(QWindowsIntegrationPlugin);
#endif
