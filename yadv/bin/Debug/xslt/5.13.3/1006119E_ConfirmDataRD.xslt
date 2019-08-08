<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cdrd="urn:customs.ru:Information:CustomsDocuments:ConfirmDataRD:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ConfirmDataRDType -->
	<xsl:template match="cdrd:ConfirmDataRD">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
										<b>Подтверждение оформления по документу</b>
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
							<td class="annot graphMain" style="width:50%">Уникальный номер по БД РД</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cdrd:BDRDID"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата использования и время</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="cdrd:UseDateTime"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Признак расхождения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="cdrd:Difference='true' or cdrd:Difference='t' or cdrd:Difference='1'">
										<xsl:text>да</xsl:text>
									</xsl:when>
									<xsl:when test="cdrd:Difference='false' or cdrd:Difference='f' or cdrd:Difference='0'">
										<xsl:text>нет</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="cdrd:Difference"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип таможенного документа.</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="cdrd:CustDocType='ДТ'">
										<xsl:text>декларация на товары</xsl:text>
									</xsl:when>
									<xsl:when test="cdrd:CustDocType='ПР'">
										<xsl:text>сообщение о прибытии</xsl:text>
									</xsl:when>
									<xsl:when test="cdrd:CustDocType='УБ'">
										<xsl:text>сообщение об убытии</xsl:text>
									</xsl:when>
									<xsl:when test="cdrd:CustDocType='ТД'">
										<xsl:text>транзитная декларация</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="cdrd:CustDocType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер таможенного документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cdrd:GTDID"/>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="cdrd:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:call-template name="gdt_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>/<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="gdt_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/><xsl:value-of select="substring($dateIn,6,2)"/><xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($dateIn,12,8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
