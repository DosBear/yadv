<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rdt="urn:customs.ru:Information:TreatmentDocuments:RepudInoTreatment:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RepudInoTreatmentType -->
	<xsl:template match="rdt:RepudInoTreatment">
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
									padding: 10mm 10mm 10mm 20mm;
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
										<b>Отказ в выдаче разрешения на переработку товаров вне таможенной территории.</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата направления</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rdt:SendDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="rdt:Comments">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарии</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rdt:Comments"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rdt:Number">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер официального письма таможни</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rdt:Number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rdt:Date">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата выхода официального письма таможни</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rdt:Date"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<div class="title marg-top">Причины отказа</div>
					<table class="w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered" align="center" style="width:7%">п\п</td>
								<td class="graphMain bordered" style="width:93%">Описание причины отказа</td>
							</tr>
							<xsl:for-each select="rdt:RepudReason">
								<xsl:variable name="pp" select="position()"/>
								<tr>
									<td class="graphMain bordered" align="center"><xsl:value-of select="$pp"/></td>
									<td class="graphMain bordered"><xsl:value-of select="rdt:ReasonDescription"/></td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="rdt:Customs">
						<div class="title marg-top">Таможенный орган</div>
						<xsl:apply-templates select="rdt:Customs"/>
					</xsl:if>
					<xsl:if test="rdt:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<xsl:apply-templates select="rdt:CustomsPerson"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="rdt:Customs">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:OfficeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OfficeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="rdt:CustomsPerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:LNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:LNP"/>
					</td>
				</tr>
			</table>
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
</xsl:stylesheet>
