
#ifndef DIRMP3_H
#define DIRMP3_H


#include <QObject>
#include <QDir>
#include <QFileInfo>
#include <QFileInfoList>


class DirMp3 : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString path READ path WRITE setPath)
    Q_PROPERTY(QStringList file READ file)

public:
    explicit DirMp3(QObject *parent = nullptr);

signals:

private:
    QDir dir;
    QString path();
    void setPath(QString value);
    QStringList file();

};

#endif // DIRMP3_H
