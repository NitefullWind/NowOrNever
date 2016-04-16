#include "userInfoUpdate.h"

UserInfoUpdate::UserInfoUpdate(QObject *object)
    : Network(object)
{
    connect(&m_nam, SIGNAL(finished(QNetworkReply*)), this, SLOT(onReplyFinished(QNetworkReply*)));
}

void UserInfoUpdate::setLearnInfo(QString uid, QString planNum, QString newNum, QString finishedNum, QString learnedNum, QString totalNum, QString learnIndex, QString wordTableName)
{
    QUrl url(hostUrl.arg("UpdateLearnInfo?uid=%1&plan=%2&new=%3&finished=%4&learned=%5&total=%6&learn=%7&tableName=%8").arg(uid).arg(planNum)
             .arg(newNum).arg(finishedNum).arg(learnedNum).arg(totalNum).arg(learnIndex).arg(wordTableName));
    m_nam.get(QNetworkRequest(url));
}

void UserInfoUpdate::onReplyFinished(QNetworkReply *reply)
{
    QString data  = getReplyData(reply);
    emit updateFinished(data == "true");
}
