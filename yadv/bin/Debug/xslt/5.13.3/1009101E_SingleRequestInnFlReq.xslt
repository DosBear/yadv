<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:srifreq="urn:customs.ru:Information:SQDocuments:SingleRequestInnFlReq:5.13.3">
	<!-- Шаблон для типа SingleRequestInnFlReqType -->
	<xsl:template match="srifreq:SingleRequestInnFlReq">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
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
										<b>Единичный запрос ИНН физического лица</b>
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
					</xsl:if>
					<xsl:if test="srifreq:PersonInfo">
						<div class="title marg-top">Идентификационные данные физического лица </div>
					</xsl:if-->
					<xsl:apply-templates select="srifreq:PersonInfo"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="srifreq:PersonFIO">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:35%">Ф.И.О.</td>
				<td class="value graphMain" style="width:65%">
					<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
					<xsl:value-of select="cat_ru:PersonName"/>&#160;
					<xsl:value-of select="cat_ru:PersonMiddleName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:35%">Должность</td>
					<td class="value graphMain" style="width:65%"><xsl:value-of select="cat_ru:PersonPost"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа srifreq:RUPersonBaseType -->
	<xsl:template match="srifreq:PersonInfo">
		<xsl:apply-templates select="srifreq:PersonFIO"/>
		<xsl:if test="srifreq:BirthDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:35%">Дата рождения</td>
					<td class="value graphMain" style="width:65%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="srifreq:BirthDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="srifreq:BirthPlace">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:35%">Место рождения</td>
					<td class="value graphMain" style="width:65%"><xsl:value-of select="srifreq:BirthPlace"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="srifreq:RUIdentityCard">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:35%">Документ, удостоверяющий личность</td>
					<td class="value graphMain" style="width:65%"><xsl:apply-templates select="srifreq:RUIdentityCard"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="srifreq:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:35%">ИНН</td>
					<td class="value graphMain" style="width:65%"><xsl:value-of select="srifreq:INN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="srifreq:InsuranceNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:35%">СНИЛС</td>
					<td class="value graphMain" style="width:65%"><xsl:value-of select="srifreq:InsuranceNumber"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="srifreq:RUIdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<xsl:text>серия </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>				
		<xsl:if test="cat_ru:IdentityCardNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName or RUScat_ru:IssuerCode">выдан </xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or RUScat_ru:IssuerCode">
			&#160;<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">&#160;<xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId"> выдан <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
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
