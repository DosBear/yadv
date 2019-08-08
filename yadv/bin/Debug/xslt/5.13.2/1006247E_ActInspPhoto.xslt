<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ATDcat="urn:customs.ru:Information:CustomsDocuments:ATDCommon:5.13.1" xmlns:aip="urn:customs.ru:Information:CustomsDocuments:ActInspPhoto:5.13.1" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ActInspPhotoType -->
	<xsl:template match="aip:ActInspPhoto">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									}

									div.page {
									width: 190mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:5mm;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									}

									div.title, tr.title td { font-weight:bold;  }
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
								</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Изображение к акту досмотра/осмотра</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<div class="title marg-top">Сведения об АТД</div>
					<xsl:if test="aip:Act_ID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор АТД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="aip:Act_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер АТД</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="aip:ATDNum"/>
							</td>
						</tr>
					</table>
					<xsl:if test="aip:CustDocNumber">
						<div class="title marg-top">Номер таможенного документа</div>
						<xsl:apply-templates select="aip:CustDocNumber"/>
					</xsl:if>
					<xsl:if test="aip:PreviewInfo">
						<div class="title marg-top">Информация о вложении</div>
					</xsl:if>
					<xsl:apply-templates select="aip:PreviewInfo"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ATDcat:AddInfoType -->
	<xsl:template match="ATDcat:AddInfo">
		<xsl:if test="ATDcat:AllView and (ATDcat:AllView='true' or ATDcat:AllView='1')"><xsl:text>общий вид, </xsl:text></xsl:if>
		<xsl:if test="ATDcat:Transport and (ATDcat:Transport='true' or ATDcat:Transport='1')">транспортное средство, </xsl:if>
		<xsl:if test="ATDcat:LoadTransport and (ATDcat:LoadTransport='true' or ATDcat:LoadTransport='1')">загрузка транспортного средства, </xsl:if>
		<xsl:if test="ATDcat:Insp and (ATDcat:Insp='true' or ATDcat:Insp='1')">инспектор, </xsl:if>
		<xsl:if test="ATDcat:Pack and (ATDcat:Pack='true' or ATDcat:Pack='1')">упаковка, </xsl:if>
		<xsl:if test="ATDcat:Mark and (ATDcat:Mark='true' or ATDcat:Mark='1')">маркировка, </xsl:if>
		<xsl:if test="ATDcat:Physical and (ATDcat:Physical='true' or ATDcat:Physical='1')">физические параметры товара, </xsl:if>
		<xsl:if test="ATDcat:Weighing and (ATDcat:Weighing='true' or ATDcat:Weighing='1')">взвешивание, </xsl:if>
		<xsl:if test="ATDcat:Other and (ATDcat:Other='true' or ATDcat:Other='1')">иное</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="ATDcat:Person">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:text> - </xsl:text>
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа aip:CustDocNumberType -->
	<xsl:template match="aip:CustDocNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="aip:DocKind='0'">уведомление о прибытии на таможенную территорию</xsl:when>
						<xsl:when test="aip:DocKind='1'">транзитная декларация</xsl:when>
						<xsl:when test="aip:DocKind='2'">книжка МДП</xsl:when>
						<xsl:when test="aip:DocKind='3'">номер ДО-1/описи</xsl:when>
						<xsl:when test="aip:DocKind='4'">ДТ</xsl:when>
						<xsl:when test="aip:DocKind='5'">уведомление об убытии</xsl:when>
						<xsl:when test="aip:DocKind='9'">иной документ</xsl:when>
						<xsl:otherwise><xsl:value-of select="aip:DocKind"/></xsl:otherwise>
					</xsl:choose>
					
				</td>
			</tr>
		</table>
		<xsl:if test="aip:GTDID or aip:DocNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="aip:GTDID"><xsl:apply-templates select="aip:GTDID"/></xsl:if>
						<xsl:if test="aip:DocNumber"><xsl:value-of select="aip:DocNumber"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="aip:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа aip:InfoPhotoType -->
	<xsl:template match="aip:PreviewInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Уникальный идентификатор изображения</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ATDcat:ImageID"/></td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время создания/сохранения изображения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ATDcat:ImageDate"/></xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:value-of select="substring(ATDcat:ImageDate, 12, 8)"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ATDcat:Type">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Формат изображения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ATDcat:Type"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ATDcat:Person">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Владелец</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="ATDcat:Person"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ATDcat:FileName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Имя файла</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ATDcat:FileName"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ATDcat:Preview">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Миниатюрное изображение</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ATDcat:Preview"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ATDcat:AddInfo">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание вложения содержит</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="ATDcat:AddInfo"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ATDcat:Comments">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Комментарии к изображению</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ATDcat:Comments"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ATDcat:Declarant">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об участнике ВЭД</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ATDcat:Declarant"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="aip:Image">
			<div class="title marg-top">Данные в кодировке base64</div>
			<br/><xsl:value-of select="aip:Image"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
