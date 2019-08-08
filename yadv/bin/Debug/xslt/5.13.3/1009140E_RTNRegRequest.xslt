<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rtnreg="urn:customs.ru:Information:SQDocuments:RTNRegRequest:5.13.1">
	<!-- Шаблон для типа RTNRegRequestType -->
	<xsl:template match="rtnreg:RTNRegRequest">
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
										<b>
										<xsl:choose>
											<xsl:when test="rtnreg:Request/rtnreg:OGPermitRequest">Запрос сведений из реестра разрешений ОГ</xsl:when>
											<xsl:when test="rtnreg:Request/rtnreg:DocReestrRequest">Запрос сведений из реестра разрешительных документов</xsl:when>
											<xsl:when test="rtnreg:Request/rtnreg:CardPermitRequest">Запрос сведений из реестра карточек допуска</xsl:when>
											<xsl:otherwise>Запрос сведений из реестра разрешений ОГ, реестра разрешительных документов, реестра карточек допуска</xsl:otherwise>
										</xsl:choose>
										</b>
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
					</xsl:if>
					<xsl:if test="rtnreg:Request">
						<div class="title marg-top">Запрос сведений</div>
					</xsl:if-->
					<br/>
					<xsl:apply-templates select="rtnreg:Request"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rtnreg:CardPermitRequestType -->
	<xsl:template match="rtnreg:CardPermitRequest">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер ТС</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rtnreg:AutoNumber"/>
				</td>
			</tr>
		</table>
		<xsl:if test="rtnreg:Number">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия и номер бланка карточки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rtnreg:Number"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rtnreg:CertificateNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер удостоверения допуска</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rtnreg:CertificateNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rtnreg:CountryListType -->
	<xsl:template match="rtnreg:CountryList">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Страна Таможенного союза, у которой необходимо запросить информацию</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="rtnreg:Country">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа rtnreg:DocReestrRequestType -->
	<xsl:template match="rtnreg:DocReestrRequest">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер разрешения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rtnreg:Number"/>
				</td>
			</tr>
		</table>
		<xsl:apply-templates select="rtnreg:CountryList"/>
		<xsl:if test="rtnreg:TransitPermitTypeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид разрешения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rtnreg:TransitPermitTypeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rtnreg:OGPermitRequestType -->
	<xsl:template match="rtnreg:OGPermitRequest">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер ТС</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rtnreg:AutoNumber"/>
				</td>
			</tr>
		</table>
		<xsl:apply-templates select="rtnreg:CountryList"/>
		<xsl:if test="rtnreg:PermitNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер разрешения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rtnreg:PermitNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rtnreg:RequestType -->
	<xsl:template match="rtnreg:Request">
		<xsl:apply-templates select="rtnreg:OGPermitRequest"/>
		<xsl:apply-templates select="rtnreg:DocReestrRequest"/>
		<xsl:apply-templates select="rtnreg:CardPermitRequest"/>
	</xsl:template>
</xsl:stylesheet>
