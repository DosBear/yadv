<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonLeafTypes:5.0.8" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rtdni="urn:customs.ru:Information:ExchangeDocuments:RegTDNumberInfo:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RegTDNumberInfoType -->
	<xsl:template match="rtdni:RegTDNumberInfo">
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
										<b>Сведения о номере зарегистрированной транзитной декларации.</b>
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
					<xsl:if test="rtdni:Comments">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарии</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rtdni:Comments"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rtdni:GRN">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Cсылочный номер гарантии в транзите </td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rtdni:GRN"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rtdni:AdditionalNumber">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Присвоенный номер дополнения к договору поручительства</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rtdni:AdditionalNumber"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rtdni:TDNumber">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер транзитной декларации</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rtdni:TDNumber"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rtdni:TIRID">
						<div class="title marg-top">Номер книжки МДП</div>
						<xsl:apply-templates select="rtdni:TIRID"/>
					</xsl:if>
					<xsl:if test="rtdni:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<xsl:apply-templates select="rtdni:CustomsPerson"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="rtdni:CustomsPerson">
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
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="rtdni:TDNumber| rtdni:AdditionalNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа rtdni:TIRIDType -->
	<xsl:template match="rtdni:TIRID">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер книжки МДП.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rtdni:TIRID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Серия книжки МДП.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rtdni:TIRSeries"/>
				</td>
			</tr>
		</table>
		<xsl:if test="rtdni:TIRPageNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер листа книжки МДП.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rtdni:TIRPageNumber"/>
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
