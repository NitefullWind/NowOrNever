#include "ftpOp.h"
#include "qftp.h"
#include "qurlinfo.h"
#include <QFile>
#include <QUrl>
#include <QDebug>

FtpOp::FtpOp(QObject *parent) : QObject(parent),
    urlString("ftp://115.159.160.167/resource/download/") ,
    ftp(NULL),
    url(NULL),
    file(NULL)
{
}

FtpOp::~FtpOp()
{
//    if(ftp!=NULL)
//        ftp->deleteLater();
//        delete ftp;
//    if(file!=NULL)
//        file->deleteLater();
//        delete file;
//    if(url!=NULL)
//        delete url;
}

void FtpOp::downloadDicDb(QString dir)
{
    ftp = new QFtp(this);


//    connect(ftp, SIGNAL(done(bool)), this, SLOT(ftpFinished(bool)));
    connect(ftp, SIGNAL(dataTransferProgress(qint64,qint64)), this, SLOT(updateProgress(qint64,qint64)));
    connect(ftp, SIGNAL(commandFinished(int,bool)), this, SLOT(commandFinished(int,bool)));

    url = new QUrl(urlString + dir +"/dic.db");
    ftp->connectToHost(url->host(), url->port(21));
    ftp->login();

    file = new QFile();
    file->setFileName("dic.db");
    if(!file->open(QIODevice::WriteOnly)) {
        qDebug() << "open file error" << file->errorString();
    }

    ftp->get(url->path(), file);
    ftp->close();
}

//void FtpOp::ftpFinished(bool error)
//{
//    if(error) {
//        file->remove();
//        qDebug() << "download failed: " << ftp->errorString();
//    }else{
//        file->close();
//        qDebug() << "download file as: " << file->fileName();
//    }
//    emit ftpDone(error);
//}

void FtpOp::updateProgress(qint64 readBytes, qint64 totalBytes)
{
    emit progressChanged(readBytes, totalBytes);
}

void FtpOp::commandFinished(int, bool error)
{
    if(ftp->currentCommand() == QFtp::ConnectToHost) {
        qDebug() << "Ftp Connect To host";
        if(error) {
            qDebug() << "Ftp Connect To host error";
        }
    }
    if(ftp->currentCommand() == QFtp::Login) {
        qDebug() << "Ftp login" << ftp->list();
    }
    if(ftp->currentCommand() == QFtp::Get) {
        if(error) {
            qDebug() << "Canceled download of " << file->fileName();
            file->close();
            file->remove();
        } else {
            file->close();
            qDebug() << "download file ... " << file->fileName();
            delete file;
        }
        emit ftpDone(error);
    }
}
