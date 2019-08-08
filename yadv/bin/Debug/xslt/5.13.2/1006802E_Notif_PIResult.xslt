<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.13.1" xmlns:npir="urn:customs.ru:Information:PriorInformation:Notif_PIResult:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="npir:Notif_PIResult">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Уведомление о результатах обработки сообщения</title>
				<style type="text/css">
                    body {background-color: #cccccc;}

                    div.page {
                        width: 210mm;
                        margin: 6pt auto;
                        padding: 10mm;
                        background: white;
                        border: solid 1px black;
                    }

                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}

                    h1 {
                        text-align: center;
                        font-size: 16pt;
                        margin-bottom: 10pt;
                        counter-reset: numbered;
                    }

                    h2.numbered:after {
                        content: " № " counter(numbered);
                        counter-increment: numbered;
                    }

                    h2 {
                        font-size: 14pt;
                        text-align: center;
                        margin-top: 20pt;
                    }

                    span {font-weight: bold;}

                    p {padding-left: 10pt;}
                </style>
			</head>
			<body>
				<div class="page">
					<xsl:apply-templates select="npir:Response"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!--Основной шаблон. Обрабатываем корневой элемент-->
	<xsl:template match="npir:Response">
		<h1>Уведомление о результатах обработки сообщения</h1>
		<xsl:apply-templates select="npir:PI_DocResult | npir:TIR_Result"/>
		<xsl:apply-templates select="npir:ResultInformation"/>
	</xsl:template>
	<!--Информация об обработанном документе-->
	<xsl:template match="npir:PI_DocResult">
		<h2>Информация об обработке документа</h2>
		<p>
			<span>Регистрационный идентификатор предварительной информации: </span>
			<xsl:apply-templates select="npir:PI_RegID"/>
			<xsl:apply-templates select="npir:PI_Status"/>
			<xsl:apply-templates select="npir:PI_RegDateTime"/>
			<xsl:apply-templates select="npir:PI_RwArrive"/>
		</p>
	</xsl:template>
	<!--Информация об обработке книжки МДП-->
	<xsl:template match="npir:TIR_Result">
		<h2>Информация об обработке книжки МДП</h2>
		<p>
			<span>Серия, номер книжки МДП: </span>
			<xsl:apply-templates select="catpi_ru:TIRSeries"/>
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="catpi_ru:TIRID"/>
			<br/>
			<span>Порядковый номер белого листа книжки МДП: </span>
			<xsl:value-of select="catpi_ru:TIRWhitePageNumber"/>
			<xsl:if test="catpi_ru:TIRGreenPageNumber">
				<span>, номер зелёного листа: </span>
				<xsl:value-of select="catpi_ru:TIRGreenPageNumber"/>
			</xsl:if>
			<br/>
			<span>Идентификационный номер держателя книжки МДП: </span>
			<xsl:apply-templates select="catpi_ru:TIRHolder"/>
			<xsl:apply-templates select="npir:PI_Status"/>
		</p>
	</xsl:template>
	<xsl:template match="npir:PI_Status">
		<br/>
		<span>Статус предварительной информации: </span>
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="npir:PI_RegDateTime">
		<br/>
		<span>Дата и время регистрации предварительной информации </span>
		<xsl:call-template name="date_time">
			<xsl:with-param name="dateTimeIn" select="."/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="npir:PI_RwArrive">
		<br/>
		<span>УИНП соответствующей предварительной информации на жд состав </span>
		<xsl:value-of select="."/>
	</xsl:template>
	<!--Результат обработки-->
	<xsl:template match="npir:ResultInformation">
		<h2 class="numbered">Результат обработки</h2>
		<p>
			<span>Код возврата: </span>
			<xsl:apply-templates select="npir:ResultCode"/>
			<xsl:if test="npir:ReferenceID">
				<span>, ссылочный идентификатор документа: </span>
				<xsl:apply-templates select="npir:ReferenceID"/>
			</xsl:if>
			<xsl:if test="npir:ResultCategory">
				<span>, степень критичности: </span>
				<xsl:apply-templates select="npir:ResultCategory"/>
			</xsl:if>
			<br/>
			<span>Описание: </span>
			<xsl:apply-templates select="npir:ResultDescription"/>
		</p>
	</xsl:template>
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
