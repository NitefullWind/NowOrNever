#ifndef USERDB_H
#define USERDB_H

#include "dbOp.h"

class UserDB : public DBOp
{
    Q_OBJECT
public:
    explicit UserDB(QObject *parent = 0);
    Q_INVOKABLE bool login(QString email, QString pwd);
};

#endif // USERDB_H
