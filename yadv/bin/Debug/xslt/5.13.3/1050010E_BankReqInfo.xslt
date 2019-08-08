<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:BnkReqInf="urn:customs.ru:Information:GuaranteeDocuments:BankReqInfo:5.13.1">
	<!-- Шаблон для типа BankReqInfoType -->
	<xsl:template match="BnkReqInf:BankReqInfo">
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
										<b>Запрос на получение сведений о кредитной организации/Запрос на получение сведений о принятых банковских гарантиях/Запрос о наличии обеспечения уплаты таможенных пошлин, налогов у участника ВЭД</b>
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
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Вид запроса</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="BnkReqInf:DocumentSign=0">
										<xsl:text>Запрос на получение сведений о кредитной организации</xsl:text>
									</xsl:when>
									<xsl:when test="BnkReqInf:DocumentSign=1">
										<xsl:text>Запрос на получение сведений о принятых банковских гарантиях</xsl:text>
									</xsl:when>
									<xsl:when test="BnkReqInf:DocumentSign=2">
										<xsl:text>Запрос о наличии обеспечения уплаты таможенных пошлин, налогов у участника ВЭД</xsl:text>
									</xsl:when>
									<xsl:otherwise><xsl:value-of select="BnkReqInf:DocumentSign"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="BnkReqInf:BankInfo">
						<div class="title marg-top">Сведения о кредитной организации/об участнике ВЭД</div>
					</xsl:if>
					<xsl:apply-templates select="BnkReqInf:BankInfo"/>
					<xsl:if test="BnkReqInf:PeriodAcceptedGuarantee">
						<div class="title marg-top">Период, в который приняты гарантии</div>
						<xsl:apply-templates select="BnkReqInf:PeriodAcceptedGuarantee"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа BnkReqInf:BankInformationType -->
	<xsl:template match="BnkReqInf:BankInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ИНН банка/участника ВЭД</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="BnkReqInf:BankINN"/></td>
			</tr>
		</table>
		<xsl:if test="BnkReqInf:BankName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сокращенное наименование банка (филиала банка), учреждения Банка России</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="BnkReqInf:BankName"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа BnkReqInf:PeriodAcceptedGuaranteeType -->
	<xsl:template match="BnkReqInf:PeriodAcceptedGuarantee">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата начала периода</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="BnkReqInf:BeginDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата окончания периода</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="BnkReqInf:EndDate"/>
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
