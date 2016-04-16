#ifndef USERINFOUPDATE_H
#define USERINFOUPDATE_H
#include "network.h"

class UserInfoUpdate : public Network
{
    Q_OBJECT
public:
    explicit UserInfoUpdate(QObject *object=0);
    Q_INVOKABLE void setLearnInfo(QString uid, QString planNum, QString newNum, QString finishedNum,
                             QString learnedNum, QString totalNum, QString learnIndex, QString wordTableName);
signals:
    void updateFinished(bool isOk);
public slots:
    void onReplyFinished(QNetworkReply *reply);
};

#endif // USERINFOUPDATE_H
