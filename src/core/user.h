#ifndef USER_H
#define USER_H

#include <QObject>

#include "userInfoUpdate.h"

class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString newNum READ newNum WRITE setNewNum NOTIFY newNumChanged)
    Q_PROPERTY(QString planNum READ planNum WRITE setPlanNum NOTIFY planNumChanged)
    Q_PROPERTY(QString finishedNum READ finishedNum WRITE setFinishedNum NOTIFY finishedNumChanged)
    Q_PROPERTY(QString learnedNum READ learnedNum WRITE setLearnedNum NOTIFY learnedNumChanged)
    Q_PROPERTY(QString totalNum READ totalNum WRITE setTotalNum NOTIFY totalNumChanged)
    Q_PROPERTY(QString learnIndex READ learnIndex WRITE setLearnIndex NOTIFY learnIndexChanged)

public:
    explicit User(QObject *parent = 0);
    User(QObject *parent = 0, QString name = "", QString newNum = "0", QString planNum = "0", QString finishedNum = "0"
            , QString learnNum = "555", QString totalNum = "1", QString learnIndex = "0");

    QString id() const {return _id;}
    void setId(const QString id) {this->_id = id; emit idChanged(id);}

    QString name() const {return _name;}
    void setName(const QString name) {this->_name = name; emit nameChanged(name);}

    QString newNum() const {return _newNum;}
    void setNewNum(const QString newNum) {this->_newNum = newNum; emit newNumChanged(newNum);}

    QString planNum() const {return _planNum;}
    void setPlanNum(const QString planNum) {this->_planNum = planNum; emit planNumChanged(planNum);}

    QString finishedNum() const {return _finishedNum;}
    void setFinishedNum(const QString finishedNum) {this->_finishedNum = finishedNum; emit finishedNumChanged(finishedNum);}

    QString learnedNum() const {return _learnedNum;}
    void setLearnedNum(const QString learnedNum) {this->_learnedNum = learnedNum; emit learnedNumChanged(learnedNum);}

    QString totalNum() const {return _totalNum;}
    void setTotalNum(const QString totalNum) {this->_totalNum = totalNum; emit totalNumChanged(totalNum);}

    QString learnIndex() const {return _learnIndex;}
    void setLearnIndex(const QString learnIndex) {this->_learnIndex = learnIndex; emit learnIndexChanged(learnIndex);}

    Q_INVOKABLE void updateLearnInfo();
signals:
    void idChanged(const QString id);
    void nameChanged(const QString name);
    void newNumChanged(const QString newNum);
    void planNumChanged(const QString planNum);
    void finishedNumChanged(const QString finishedNum);
    void learnedNumChanged(const QString learnedNum);
    void totalNumChanged(const QString totalNum);
    void learnIndexChanged(const QString learnIndex);
private:
    QString _id;
    QString _name;
    QString _newNum;
    QString _planNum;
    QString _finishedNum;
    QString _learnedNum;
    QString _totalNum;
    QString _learnIndex;
    UserInfoUpdate UIU;

};

#endif // USER_H
