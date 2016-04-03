#include "user.h"

User::User(QObject *parent) : QObject(parent)
{

}

User::User(QObject *parent, QString name, QString newNum, QString planNum, QString finishedNum) : QObject(parent)
{
    this->_name = name;
    this->_newNum  = newNum;
    this->_planNum = planNum;
    this->_finishedNum = finishedNum;
}
