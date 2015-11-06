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

#include "videosettings.h"
#include "ui_videosettings.h"

#include <QComboBox>
#include <QDebug>
#include <QMediaRecorder>
#include <QMediaService>

VideoSettings::VideoSettings(QMediaRecorder *mediaRecorder, QWidget *parent) :
    QDialog(parent),
    ui(new Ui::VideoSettingsUi),
    mediaRecorder(mediaRecorder)
{
    ui->setupUi(this);

    //audio codecs
    ui->audioCodecBox->addItem(tr("Default audio codec"), QVariant(QString()));
    foreach (const QString &codecName, mediaRecorder->supportedAudioCodecs()) {
        QString description = mediaRecorder->audioCodecDescription(codecName);
        ui->audioCodecBox->addItem(codecName+": "+description, QVariant(codecName));
    }

    //sample rate:
    foreach (int sampleRate, mediaRecorder->supportedAudioSampleRates()) {
        ui->audioSampleRateBox->addItem(QString::number(sampleRate), QVariant(sampleRate));
    }

    ui->audioQualitySlider->setRange(0, int(QMultimedia::VeryHighQuality));

    //video codecs
    ui->videoCodecBox->addItem(tr("Default video codec"), QVariant(QString()));
    foreach (const QString &codecName, mediaRecorder->supportedVideoCodecs()) {
        QString description = mediaRecorder->videoCodecDescription(codecName);
        ui->videoCodecBox->addItem(codecName+": "+description, QVariant(codecName));
    }

    ui->videoQualitySlider->setRange(0, int(QMultimedia::VeryHighQuality));

    ui->videoResolutionBox->addItem(tr("Default"));
    QList<QSize> supportedResolutions = mediaRecorder->supportedResolutions();
    foreach (const QSize &resolution, supportedResolutions) {
        ui->videoResolutionBox->addItem(QString("%1x%2").arg(resolution.width()).arg(resolution.height()),
                                        QVariant(resolution));
    }

    ui->videoFramerateBox->addItem(tr("Default"));
    QList<qreal> supportedFrameRates = mediaRecorder->supportedFrameRates();
    qreal rate;
    foreach (rate, supportedFrameRates) {
        QString rateString = QString("%1").arg(rate, 0, 'f', 2);
        ui->videoFramerateBox->addItem(rateString, QVariant(rate));
    }

    //containers
    ui->containerFormatBox->addItem(tr("Default container"), QVariant(QString()));
    foreach (const QString &format, mediaRecorder->supportedContainers()) {
        ui->containerFormatBox->addItem(format+":"+mediaRecorder->containerDescription(format),
                                        QVariant(format));
    }
}

VideoSettings::~VideoSettings()
{
    delete ui;
}

void VideoSettings::changeEvent(QEvent *e)
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

QAudioEncoderSettings VideoSettings::audioSettings() const
{
    QAudioEncoderSettings settings = mediaRecorder->audioSettings();
    settings.setCodec(boxValue(ui->audioCodecBox).toString());
    settings.setQuality(QMultimedia::EncodingQuality(ui->audioQualitySlider->value()));
    settings.setSampleRate(boxValue(ui->audioSampleRateBox).toInt());
    return settings;
}

void VideoSettings::setAudioSettings(const QAudioEncoderSettings &audioSettings)
{
    selectComboBoxItem(ui->audioCodecBox, QVariant(audioSettings.codec()));
    selectComboBoxItem(ui->audioSampleRateBox, QVariant(audioSettings.sampleRate()));
    ui->audioQualitySlider->setValue(audioSettings.quality());
}

QVideoEncoderSettings VideoSettings::videoSettings() const
{
    QVideoEncoderSettings settings = mediaRecorder->videoSettings();
    settings.setCodec(boxValue(ui->videoCodecBox).toString());
    settings.setQuality(QMultimedia::EncodingQuality(ui->videoQualitySlider->value()));
    settings.setResolution(boxValue(ui->videoResolutionBox).toSize());
    settings.setFrameRate(boxValue(ui->videoFramerateBox).value<qreal>());

    return settings;
}

void VideoSettings::setVideoSettings(const QVideoEncoderSettings &videoSettings)
{
    selectComboBoxItem(ui->videoCodecBox, QVariant(videoSettings.codec()));
    selectComboBoxItem(ui->videoResolutionBox, QVariant(videoSettings.resolution()));
    ui->videoQualitySlider->setValue(videoSettings.quality());

    //special case for frame rate
    for (int i = 0; i < ui->videoFramerateBox->count(); ++i) {
        qreal itemRate = ui->videoFramerateBox->itemData(i).value<qreal>();
        if (qFuzzyCompare(itemRate, videoSettings.frameRate())) {
            ui->videoFramerateBox->setCurrentIndex(i);
            break;
        }
    }
}

QString VideoSettings::format() const
{
    return boxValue(ui->containerFormatBox).toString();
}

void VideoSettings::setFormat(const QString &format)
{
    selectComboBoxItem(ui->containerFormatBox, QVariant(format));
}

QVariant VideoSettings::boxValue(const QComboBox *box) const
{
    int idx = box->currentIndex();
    if (idx == -1)
        return QVariant();

    return box->itemData(idx);
}

void VideoSettings::selectComboBoxItem(QComboBox *box, const QVariant &value)
{
    for (int i = 0; i < box->count(); ++i) {
        if (box->itemData(i) == value) {
            box->setCurrentIndex(i);
            break;
        }
    }
}
