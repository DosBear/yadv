<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ast="urn:customs.ru:Information:SQDocuments:ApplicationStatus:5.13.3" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0">
	<!-- Шаблон для типа ApplicationStatusType -->
	<xsl:template match="ast:ApplicationStatus">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: normal;
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
										<b>Статусное состояние заявки</b>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер заявления на ЕПГУ</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ast:ApplicationSourceSystemID"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата заявления на ЕПГУ</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ast:ApplicationDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="ast:ApplicationID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер заявления на АПС "Электронные Госуслуги"</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ast:ApplicationID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ast:ApplicationRegDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата регистрации заявления на АПС "Электронные Госуслуги"</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ast:ApplicationRegDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ast:Status">
						<div class="title marg-top">Статусное состояние</div>
					</xsl:if>
					<xsl:apply-templates select="ast:Status"/>
					<xsl:if test="ast:Document"/>
					<div class="title marg-top">Архивы документов, приложенных к заявке</div>
					<xsl:apply-templates select="ast:Document"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ast:PresentedDocumentsType -->
	<xsl:template match="ast:Document">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Данные файла в кодировке BASE64</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="string-length(string(ast:DocumentsBody)) &gt; 0">Есть</xsl:when>
						<xsl:otherwise>Нет</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ast:StatusType -->
	<xsl:template match="ast:Status">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код статуса</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ast:Kind=3">
							<xsl:text>Исполнено</xsl:text>
						</xsl:when>
						<xsl:when test="ast:Kind=4">
							<xsl:text>Отказ</xsl:text>
						</xsl:when>
						<xsl:when test="ast:Kind=6">
							<xsl:text>Принято ведомством</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ast:Kind"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата присвоения статуса</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ast:Date"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="ast:Comment">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Комментарий</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ast:Comment"/>
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
