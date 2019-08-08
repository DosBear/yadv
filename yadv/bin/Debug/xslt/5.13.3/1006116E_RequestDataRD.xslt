<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rdrd="urn:customs.ru:Information:CustomsDocuments:RequestDateRD:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RequestDataRDType -->
	<xsl:template match="rdrd:RequestDataRD">
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
										<b>Запрос перечня разрешительных документов</b>
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
					<xsl:if test="rdrd:DocNumber">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rdrd:DocNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код вида документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rdrd:DocCode"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="rdrd:DocType='true' or rdrd:DocType='t' or rdrd:DocType='1'">
										<xsl:text>квотируемый</xsl:text>
									</xsl:when>
									<xsl:when test="rdrd:DocType='false' or rdrd:DocType='f' or rdrd:DocType='0'">
										<xsl:text>неквотируемый</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rdrd:DocType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="rdrd:DocDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rdrd:DocDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rdrd:FormNumber">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер бланка</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rdrd:FormNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rdrd:Contract">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Контракт</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="rdrd:Contract"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rdrd:ContractType -->
	<xsl:template match="rdrd:Contract">
		<xsl:if test="rdrd:ConNumber">
			№ <xsl:value-of select="rdrd:ConNumber"/>
		</xsl:if>
		<xsl:if test="rdrd:ConDateSignature">
			<xsl:text disable-output-escaping="yes"> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="rdrd:ConDateSignature"/>
			</xsl:call-template>
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
