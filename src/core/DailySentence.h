#ifndef DAILYSENTENCE_H
#define DAILYSENTENCE_H
#include "network.h"

class DailySentence : public Network
{
    Q_OBJECT
    Q_PROPERTY(QString content READ content NOTIFY contentChanged)
    Q_PROPERTY(QString note READ note NOTIFY noteChanged)
public:
    DailySentence(QObject *object=0);
    Q_INVOKABLE void get();
    QString content() {return _content;}
    QString note() {return _note;}
signals:
    void contentChanged(QString content);
    void noteChanged(QString note);
public slots:
    void onReplyFinished(QNetworkReply *reply);
private:
    QString _content;
    QString _note;
};

#endif // DAILYSENTENCE_H
