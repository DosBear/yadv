<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:req_cim="urn:customs.ru:Information:SQDocuments:RequestCIM:5.12.0">
	<!-- Шаблон для типа RequestCIMType -->
	<xsl:template match="req_cim:RequestCIM">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									/*white-space: nowrap;*/
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
										<b>Запрос сведений о маркированных товарах</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="req_cim:GTDNumber">
						<div class="title marg-top">Регистрационный номер ДТ</div>
					</xsl:if>
					<xsl:apply-templates select="req_cim:GTDNumber"/>
					<div class="title marg-top">Маркированные товары</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Номер товара по ДТ</td>
								<td class="graphMain bordered">Перечень идентификационных номеров</td>
							</tr>
							<xsl:for-each select="req_cim:GoodsCIMReq">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:CIMListType -->
	<xsl:template match="req_cim:CIMList">
		<xsl:for-each select="catESAD_cu:CIMID">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><br/></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа req_cim:GoodsCIMReqType -->
	<xsl:template match="req_cim:GoodsCIMReq">
		<tr valign="top">
			<td class="bordered">
				<xsl:value-of select="req_cim:GoodsNumeric"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="req_cim:CIMList"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="req_cim:GTDNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="num_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
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
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
