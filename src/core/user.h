#ifndef USER_H
#define USER_H

#include <QObject>

class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString newNum READ newNum WRITE setNewNum NOTIFY newNumChanged)
    Q_PROPERTY(QString planNum READ planNum WRITE setPlanNum NOTIFY planNumChanged)
    Q_PROPERTY(QString finishedNum READ finishedNum WRITE setFinishedNum NOTIFY finishedNumChanged)

public:
    explicit User(QObject *parent = 0);
    User(QObject *parent = 0, QString name = "0", QString newNum = "0", QString planNum = "0", QString finishedNum = "0");

    QString name() const {return _name;}
    void setName(const QString name) {this->_name = name; emit nameChanged(name);}

    QString newNum() const {return _newNum;}
    void setNewNum(const QString newNum) {this->_newNum = newNum; emit newNumChanged(newNum);}

    QString planNum() const {return _planNum;}
    void setPlanNum(const QString planNum) {this->_planNum = planNum; emit planNumChanged(planNum);}

    QString finishedNum() const {return _finishedNum;}
    void setFinishedNum(const QString finishedNum) {this->_finishedNum = finishedNum; emit finishedNumChanged(finishedNum);}
signals:
    void nameChanged(const QString name);
    void newNumChanged(const QString newNum);
    void planNumChanged(const QString planNum);
    void finishedNumChanged(const QString finishedNum);
private:
    QString _name;
    QString _newNum;
    QString _planNum;
    QString _finishedNum;
};

#endif // USER_H
