#include "user.h"

User::User(QObject *parent) : QObject(parent)
{
    _name = "";
    _newNum = "0";
    _planNum = "0";
    _finishedNum = "0";
    _learnedNum = "1";
    _totalNum = "0";
    _learnIndex = "0";
}

User::User(QObject *parent, QString name, QString newNum, QString planNum, QString finishedNum
           ,QString learnNum, QString totalNum, QString learnIndex) : QObject(parent)
{
    this->_name = name;
    this->_newNum  = newNum;
    this->_planNum = planNum;
    this->_finishedNum = finishedNum;
    this->_learnedNum = learnNum;
    this->_totalNum = totalNum;
    this->_learnIndex = learnIndex;
}

//更新用户学习信息
void User::updateLearnInfo()
{
    UIU.setLearnInfo(id(), planNum(), newNum(), finishedNum(), learnedNum(), totalNum(), learnIndex());
}
