#include "userDB.h"
#include <QDebug>

UserDB::UserDB(QObject *parent) : DBOp(parent)
{
    DBOp::setDBInfo("QMYSQL","localhost", 3306, "non", "root", "");
}

bool UserDB::login(QString email, QString pwd)
{
    QString sql = QString("select * from tbl_user, tbl_learninfo where tbl_user.id=tbl_learninfo.userId"
                          " and mail='%1' and pwd=PASSWORD('%2')").arg(email).arg(pwd);
    QList<QList<QString>> userInfoList = DBOp::execSelect(sql);
    if(!userInfoList.isEmpty()){
        qDebug() << userInfoList.at(0);
        return true;
    }
    return false;
}
