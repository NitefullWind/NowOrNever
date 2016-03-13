#ifndef WORD_H
#define WORD_H

#include <QObject>

class Word : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int index READ index WRITE setIndex)
    Q_PROPERTY(QString spell READ spell WRITE setSpell)
    Q_PROPERTY(QString mean READ mean WRITE setMean)
    Q_PROPERTY(int frequency READ frequency WRITE setFrequency)
public:
    explicit Word(QObject *parent = 0);
    Word(Word &word);

    int index() const {return wordIndex;}
    void setIndex(const int index) {this->wordIndex = index;}

    QString spell() const {return wordSpell;}
    void setSpell(const QString spell) {this->wordSpell = spell;}

    QString mean() const {return wordMean;}
    void setMean(const QString mean) {this->wordMean = mean;}

    int frequency() const {return wordFrequency;}
    void setFrequency(const int frequency) {this->wordFrequency = frequency;}

private:
    int wordIndex;
    QString wordSpell;
    QString wordMean;
    int wordFrequency;
};

#endif // WORD_H
