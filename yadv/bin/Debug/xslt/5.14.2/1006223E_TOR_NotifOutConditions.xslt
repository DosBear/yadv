<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tor_noc="urn:customs.ru:Information:CustomsDocuments:TOR_NotifOutConditions:5.10.0">
	<!-- Шаблон для типа TOR_NotifOutConditionsType -->
	<xsl:template match="tor_noc:TOR_NotifOutConditions">
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
										<b>Уведомление о невыполнении условий вывоза</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center">
									<b>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="tor_noc:RegDate"/>
										</xsl:call-template>
										<xsl:text> г.</xsl:text>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot bordered graphMain" style="width:30%; border-bottom:0px;" align="center">
								Наименование таможенного органа
							</td>
							<td style="width:40%"></td>
							<td class="annot bordered graphMain" style="width:30%; border-bottom:0px;" align="center">
								Наименование резидента ТОСЭР, лица, действующего по его поручению
							</td>
						</tr>
						<tr>
							<td class="annot bordered" valign="top" style="border-top:0px;" align="center">
								<xsl:for-each select="tor_noc:Customs/*">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
							<td></td>
							<td class="annot bordered" valign="top" style="border-top:0px;" align="center">
								<xsl:value-of select="tor_noc:ResidentTOR/cat_ru:OrganizationName"/>
								<xsl:if test="not(tor_noc:ResidentTOR/cat_ru:OrganizationName) and tor_noc:ResidentTOR/cat_ru:ShortName">
									<xsl:value-of select="tor_noc:ResidentTOR/cat_ru:ShortName"/>
								</xsl:if>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Настоящим уведомляем, что не выполнены следующие условия вывоза:</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="bordered">№ п/п</td>
								<td class="bordered">Наименование условия</td>
							</tr>
							<xsl:for-each select="tor_noc:Conditions">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="tor_noc:Conditions">
		<tr>
			<td class="bordered"><xsl:value-of select="position()"/></td>
			<td class="bordered">
				<xsl:text>Признак: </xsl:text>
				<xsl:choose>
					<xsl:when test="tor_noc:Sign='1'">отсутствуют сведения о регистрационном номере транспортного средства в информационно-программных средствах ЕАИС таможенных органов</xsl:when>
					<xsl:when test="tor_noc:Sign='2'">несоответствие веса транспортного средства, перевозящего товары, сведениям, содержащимся в Разрешении на вывоз товаров и транспортных средств</xsl:when>
					<xsl:when test="tor_noc:Sign='3'">иное</xsl:when>
				</xsl:choose>
				<xsl:if test="tor_noc:Note">
					<br/>
					<xsl:text>Описание: </xsl:text><xsl:value-of select="tor_noc:Note"/>
				</xsl:if>
				<xsl:if test="tor_noc:CompareDoc">
					<br/>
					<xsl:text>Докумены: </xsl:text>
					<xsl:for-each select="tor_noc:CompareDoc">
						<xsl:value-of select="cat_ru:PrDocumentName"/>
						<xsl:if test="cat_ru:PrDocumentNumber">
							<xsl:text> № </xsl:text><xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</xsl:if>
						<xsl:if test="cat_ru:PrDocumentDate">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
		</tr>
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
