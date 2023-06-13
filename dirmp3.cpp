#include "dirmp3.h"

DirMp3::DirMp3(QObject *parent)
    : QObject{parent}
{

}

QString DirMp3::path()
{
    return dir.path();
}

void DirMp3::setPath(QString value)
{
    dir.setPath(value);
}

QStringList DirMp3::file()
{
    QFileInfoList list = dir.entryInfoList(QDir::AllEntries | QDir::NoDotAndDotDot | QDir::Files);

    QStringList filelist;

    foreach (QFileInfo info, list) {
        filelist.append(info.filePath());
    }
    return filelist;
}

