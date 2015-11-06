/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include "imagesettings.h"
#include "ui_imagesettings.h"

#include <QComboBox>
#include <QDebug>
#include <QCameraImageCapture>
#include <QMediaService>

ImageSettings::ImageSettings(QCameraImageCapture *imageCapture, QWidget *parent) :
    QDialog(parent),
    ui(new Ui::ImageSettingsUi),
    imagecapture(imageCapture)
{
    ui->setupUi(this);

    //image codecs
    ui->imageCodecBox->addItem(tr("Default image format"), QVariant(QString()));
    foreach(const QString &codecName, imagecapture->supportedImageCodecs()) {
        QString description = imagecapture->imageCodecDescription(codecName);
        ui->imageCodecBox->addItem(codecName+": "+description, QVariant(codecName));
    }

    ui->imageQualitySlider->setRange(0, int(QMultimedia::VeryHighQuality));

    ui->imageResolutionBox->addItem(tr("Default Resolution"));
    QList<QSize> supportedResolutions = imagecapture->supportedResolutions();
    foreach(const QSize &resolution, supportedResolutions) {
        ui->imageResolutionBox->addItem(QString("%1x%2").arg(resolution.width()).arg(resolution.height()),
                                        QVariant(resolution));
    }
}

ImageSettings::~ImageSettings()
{
    delete ui;
}

void ImageSettings::changeEvent(QEvent *e)
{
    QDialog::changeEvent(e);
    switch (e->type()) {
    case QEvent::LanguageChange:
        ui->retranslateUi(this);
        break;
    default:
        break;
    }
}

QImageEncoderSettings ImageSettings::imageSettings() const
{
    QImageEncoderSettings settings = imagecapture->encodingSettings();
    settings.setCodec(boxValue(ui->imageCodecBox).toString());
    settings.setQuality(QMultimedia::EncodingQuality(ui->imageQualitySlider->value()));
    settings.setResolution(boxValue(ui->imageResolutionBox).toSize());

    return settings;
}

void ImageSettings::setImageSettings(const QImageEncoderSettings &imageSettings)
{
    selectComboBoxItem(ui->imageCodecBox, QVariant(imageSettings.codec()));
    selectComboBoxItem(ui->imageResolutionBox, QVariant(imageSettings.resolution()));
    ui->imageQualitySlider->setValue(imageSettings.quality());
}

QVariant ImageSettings::boxValue(const QComboBox *box) const
{
    int idx = box->currentIndex();
    if (idx == -1)
        return QVariant();

    return box->itemData(idx);
}

void ImageSettings::selectComboBoxItem(QComboBox *box, const QVariant &value)
{
    for (int i = 0; i < box->count(); ++i) {
        if (box->itemData(i) == value) {
            box->setCurrentIndex(i);
            break;
        }
    }
}

