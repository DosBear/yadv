<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:znci_req="urn:customs.ru:Information:SQDocuments:ZAGSNameChangeInfoReq:5.13.1">
	<!-- Шаблон для типа ZAGSNameChangeInfoReqType -->
	<xsl:template match="znci_req:ZAGSNameChangeInfoReq">
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
										<b>Запрос на поиск актовой записи о перемене имени для получения сведений в объеме свидетельства о перемене имени</b>
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
							<td class="annot graphMain" style="width:50%">Код ОКТМО региона, в который подается запрос</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="znci_req:OKTMO"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата регистрации</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="znci_req:RegisterDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Информация о лице</div>
					<xsl:apply-templates select="znci_req:PersonInfo"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа znci_req:PersonInfoType -->
	<xsl:template match="znci_req:PersonInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Сведения о лице до перемены имени</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="znci_req:PersonNameBeforeChange"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Сведения о лице после перемены имени</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="znci_req:PersonNameAfterChange"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата рождения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="znci_req:PersonBirthDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа znci_req:FIOType -->
	<xsl:template match="znci_req:PersonNameAfterChange| znci_req:PersonNameBeforeChange">
		<xsl:value-of select="znci_req:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="znci_req:PersonName"/>
		<xsl:if test="znci_req:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="znci_req:PersonMiddleName"/>
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
