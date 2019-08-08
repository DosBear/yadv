<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rla="urn:customs.ru:Information:RequestLicenseAlcohol:5.10.0">
	<!-- Шаблон для типа ReqLicenseAlcoholType -->
	<xsl:template match="rla:ReqLicenseAlcohol">
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
										<b>Запрос на получение сведений о лицензии на производство и оборот этилового спирта, алкогольной и спиртосодержащей продукции, выданной Росалкогольрегулированием</b>
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
							<td class="annot graphMain" style="width:50%">Наименование организации</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rla:OrganizationName"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rla:ShortName"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">ИНН - индивидуальный номер налогоплательщика</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rla:INN"/>
							</td>
						</tr>
					</table>
					<xsl:if test="rla:KPP">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">КПП - код причины постановки на учёт</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rla:KPP"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rla:RegNumber"/>
					<xsl:if test="rla:RegNumber">
						<div class="title marg-top">Регистрационный номер лицензии</div>
					</xsl:if>
					<xsl:apply-templates select="rla:RegNumber"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rla:LicenseNumberType -->
	<xsl:template match="rla:RegNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер лицении</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rla:DocumentNumber"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата выдачи лицензии</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="rla:DocumentDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
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
