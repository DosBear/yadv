<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fpd_res="urn:customs.ru:Information:SQDocuments:FnsPaymentDebtsResponse:5.13.2">
	<!-- Шаблон для типа FnsPaymentDebtsResponseType -->
	<xsl:template match="fpd_res:FnsPaymentDebtsResponse">
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
										<b>Предоставление сведений о наличии (отсутствии) задолженности по уплате налогов, сборов, пеней, штрафов, процентов (Ответ)</b>
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
					<xsl:if test="fpd_res:DebtInfo">
						<div class="title marg-top">Сведения о задолженности</div>
					</xsl:if>
					<xsl:apply-templates select="fpd_res:DebtInfo"/>
					<xsl:if test="fpd_res:Result">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Результат обработки</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="fpd_res:Result"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа fpd_res:DebtInfoType -->
	<xsl:template match="fpd_res:DebtInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата, по состоянию на которую сформированы сведения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fpd_res:Date"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак наличия задолженности</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="fpd_res:HavingDebts=1 or fpd_res:HavingDebts='true'">
							<xsl:text>присутствует</xsl:text>
						</xsl:when>
						<xsl:when test="fpd_res:HavingDebts=0 or fpd_res:HavingDebts='false'">
							<xsl:text>остутствует</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="fpd_res:HavingDebts"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ИНН организации/физического лица</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="fpd_res:INN"/>
				</td>
			</tr>
		</table>
		<xsl:if test="fpd_res:TaxAuthorities"/>
		<xsl:if test="fpd_res:TaxAuthorities">
			<div class="title marg-top">Перечень территориальных налоговых органов</div>
		</xsl:if>
		<xsl:apply-templates select="fpd_res:TaxAuthorities"/>
	</xsl:template>
	<!-- Шаблон для типа fpd_res:TaxAuthoritiesType -->
	<xsl:template match="fpd_res:TaxAuthorities">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код инспекции ФНС России</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="fpd_res:FNSInspectionCode">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
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
