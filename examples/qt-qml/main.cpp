/* main.mm ---
 *
 * Author: Julien Wintz
 * Created: Thu Mar  7 21:59:40 2013 (+0100)
 * Version:
 * Last-Updated:
 *           By:
 *     Update #: 155
 */

/* Change Log:
 *
 */

#include <QtCore>
#include <QtGui>
#include <QtWidgets>
#include <QQuickView>

#define QT_QML_NO_DEBUGGER
#if defined(Q_OS_IOS)
extern "C" int qtmn(int argc, char** argv) {
#else
int main(int argc, char **argv) {
#endif
  QApplication application(argc, argv);

  QQuickView view;
  view.setResizeMode(QQuickView::SizeRootObjectToView);
  view.show();

  return application.exec();
}
