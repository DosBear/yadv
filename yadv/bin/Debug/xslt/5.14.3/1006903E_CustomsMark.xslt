<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cm="urn:customs.ru:Information:CustomsDocuments:CustomsMark:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа CustomsMarkType -->
	<xsl:template match="cm:CustomsMark">
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
										<b>Документ-аналог отметки инспектора к транспортному, товаросопроводительному документу (железнодорожной накладной)</b>
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
					<xsl:if test="cm:TransportDocumentBody">
						<div class="title marg-top">Транспортный, товаросопроводительный документ (железнодорожная накладная)</div>
						<br/>
						<xsl:if test="cm:TransportDocumentBody">документ приложен</xsl:if>
						<!--xsl:apply-templates select="cm:TransportDocumentBody"/-->
					</xsl:if>
					
					<div class="title marg-top">Сведения из ЭДТ/ЭТД и принятое решение</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Номер декларации</td>
								<td class="graphMain bordered">Вид документа</td>
								<td class="graphMain bordered">Код результата поиска декларации</td>
								<td class="graphMain bordered">Описание результата поиска декларации</td>
								<xsl:if test="//cm:DTInfo"><td class="graphMain bordered">Информация по ДТ</td></xsl:if>
								<xsl:if test="//cm:TransitInfo"><td class="graphMain bordered">Информация по ТД</td></xsl:if>
							</tr>
							<xsl:for-each select="cm:DeclarationInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cm:DocumentBodyType -->
	<xsl:template match="cm:ClsEsadInfoDocumentBody| cm:CustomsMarkDocumentBody| cm:TransportDocumentBody">
	</xsl:template>
	<!-- Шаблон для типа cm:DTInfoType -->
	<xsl:template match="cm:DTInfo">
		<xsl:if test="cm:ClsEsadInfoDocumentBody">
			<u>Сведения из ЭДТ</u><br/>
			<xsl:if test="cm:ClsEsadInfoDocumentBody">документ приложен</xsl:if>
			<!--sl:apply-templates select="cm:ClsEsadInfoDocumentBody"/--><br/>
		</xsl:if>
		<xsl:if test="cm:CustomsMarkDocumentBody">
			<u>Отметки инспектора</u><br/>
			<xsl:if test="cm:CustomsMarkDocumentBody">документ приложен</xsl:if>
			<!--xsl:apply-templates select="cm:CustomsMarkDocumentBody"/-->
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cm:DeclarationInfoType -->
	<xsl:template match="cm:DeclarationInfo">
		<tr>
			<td class="graphMain bordered"><xsl:apply-templates select="cm:GTDID"/></td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="cm:DeclarationType=1">декларация на товары</xsl:when>
					<xsl:when test="cm:DeclarationType=2">транзитная декларация</xsl:when>
					<xsl:otherwise><xsl:value-of select="cm:DeclarationType"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered"><xsl:value-of select="cm:ResultCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cm:ResultDescription"/></td>
			<xsl:if test="//cm:DTInfo"><td class="graphMain bordered"><xsl:apply-templates select="cm:DTInfo"/></td></xsl:if>
			<xsl:if test="//cm:TransitInfo"><td class="graphMain bordered"><xsl:apply-templates select="cm:TransitInfo"/></td></xsl:if>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="cm:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cm:TransitInfoType -->
	<xsl:template match="cm:TransitInfo">
		<xsl:if test="cm:TransitInfoDocumentBody">
			<u>Сведения из транзитной декларации</u><br/>
			<xsl:if test="cm:TransitInfoDocumentBody">документ приложен</xsl:if>
			<!--xsl:apply-templates select="cm:TransitInfoDocumentBody"/-->
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cm:DocumentBodyType -->
	<xsl:template match="cm:TransitInfoDocumentBody">
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
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
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
