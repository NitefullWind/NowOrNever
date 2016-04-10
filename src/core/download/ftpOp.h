#ifndef FTPOP_H
#define FTPOP_H

#include <QObject>
#include "qurlinfo.h"
QT_BEGIN_NAMESPACE
class QFtp;
class QFile;
class QUrl;
QT_END_NAMESPACE

class FtpOp : public QObject
{
    Q_OBJECT
public:
    explicit FtpOp(QObject *parent = 0);
    ~FtpOp();

    Q_INVOKABLE void downloadDicDb(QString dir = "");
signals:
    void ftpDone(bool error);
    void progressChanged(qint64 done, qint64 total);
public slots:
//    void ftpFinished(bool error);
    void updateProgress(qint64 readBytes, qint64 totalBytes);
    void commandFinished(int commandId, bool error);
private:
    QUrl *url;
    QFtp *ftp;
    QFile *file;
    QString urlString;
};

#endif // FTPOP_H
