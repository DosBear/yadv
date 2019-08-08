<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nfc="urn:customs.ru:Information:ExchangeDocuments:NotifFinishControl:5.14.2">
<!-- Письмо УКТР от 11.09.2018 № 24-56/57584-->
	<!-- Шаблон для типа NotifFinishControlType -->
	<xsl:template match="nfc:NotifFinishControl">
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
			width: 180mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			width: 100%;
            table-layout: fixed;			
			word-wrap: break-word;
			border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			}

			table.border tr td
			{
			border: 1px solid windowtext;
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

			.border_bottom
			{
			border-bottom: 1px solid black;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 11pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

		</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody align="left" class="graphMain">
							<tr align="center" class="graphHeader">
								<td>УВЕДОМЛЕНИЕ</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr align="center">
								<td><b>О ЗАВЕРШЕНИИ ТАМОЖЕННОГО КОНТРОЛЯ<br/>ТАМОЖЕННОЙ СТОИМОСТИ</b></td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text>от </xsl:text>
									<xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="nfc:ResolDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="45%" class="border_bottom">
									<xsl:value-of select="nfc:OfficeName"/>
								</td>
								<td width="10%"> </td>
								<td width="45%" class="border_bottom">
									<xsl:value-of select="nfc:DeclName"/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td>
									<xsl:text>(Наименование таможенного органа)</xsl:text>
								</td>
								<td> </td>
								<td>
									<xsl:text>(Наименование декларанта или таможенного представителя)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim">
								<td> </td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>&#160;&#160;&#160;&#160;&#160;В соответствии с пунктом 19 статьи 325 Таможенного кодекса Евразийского экономического союза информируем о завершении </xsl:text>
									<xsl:text>проверки таможенных и иных документов и (или) сведений, представленных в подтверждение заявленных сведений о таможенной стоимости товаров, </xsl:text>
									<xsl:text>заявленных в декларации на товары </xsl:text>
									<u><xsl:text>№&#160;</xsl:text>
									<xsl:apply-templates select="nfc:GTDID"/></u>
									<xsl:text>, и о </xsl:text>
									<xsl:choose>
										<xsl:when test="nfc:GuaranteeSign='1' or nfc:GuaranteeSign='true' or nfc:GuaranteeSign='TRUE' or nfc:GuaranteeSign='t'"><xsl:text>возможности </xsl:text></xsl:when>
										<xsl:otherwise><b><xsl:text>НЕвозможности </xsl:text></b></xsl:otherwise>
									</xsl:choose>
									<xsl:text>возврата (зачета) обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, </xsl:text>
									<xsl:text>компенсационных пошлин, представленного в соответствии с пунктом 1 статьи 121 Таможенного кодекса Евразийского экономического союза.</xsl:text>
								</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom" align="center">
									<span class="normal">
										<xsl:value-of select="nfc:CustomsPerson/cat_ru:PersonName"/>
									</span>
									<xsl:if test="nfc:CustomsPerson/cat_ru:LNP">
										<span class="normal"> (</span>
										<xsl:value-of select="nfc:CustomsPerson/cat_ru:LNP"/>
										<span class="normal">)</span>
									</xsl:if>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(Ф.И.О. уполномоченного должностного лица таможенного органа, ЭЦП)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="nfc:GTDID">
		<span class="normal">
			<xsl:value-of select="cat_ru:CustomsCode"/>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:value-of select="cat_ru:GTDNumber"/>
		</span>
	</xsl:template>
	<xsl:template name="gtd_date">
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
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="border_bottom">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="border_bottom">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
						<xsl:choose>
							<xsl:when test="$month=1">января</xsl:when>
							<xsl:when test="$month=2">февраля</xsl:when>
							<xsl:when test="$month=3">марта</xsl:when>
							<xsl:when test="$month=4">апреля</xsl:when>
							<xsl:when test="$month=5">мая</xsl:when>
							<xsl:when test="$month=6">июня</xsl:when>
							<xsl:when test="$month=7">июля</xsl:when>
							<xsl:when test="$month=8">августа</xsl:when>
							<xsl:when test="$month=9">сентября</xsl:when>
							<xsl:when test="$month=10">октября</xsl:when>
							<xsl:when test="$month=11">ноября</xsl:when>
							<xsl:when test="$month=12">декабря</xsl:when>
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:value-of select="substring($date,1,2)"/>
					</td>
					<td width="9%" class="border_bottom" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> года</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
		&#160;&#160;<u>&#160;
		<xsl:choose>
				<xsl:when test="$month=1">января</xsl:when>
				<xsl:when test="$month=2">февраля</xsl:when>
				<xsl:when test="$month=3">марта</xsl:when>
				<xsl:when test="$month=4">апреля</xsl:when>
				<xsl:when test="$month=5">мая</xsl:when>
				<xsl:when test="$month=6">июня</xsl:when>
				<xsl:when test="$month=7">июля</xsl:when>
				<xsl:when test="$month=8">августа</xsl:when>
				<xsl:when test="$month=9">сентября</xsl:when>
				<xsl:when test="$month=10">октября</xsl:when>
				<xsl:when test="$month=11">ноября</xsl:when>
				<xsl:when test="$month=12">декабря</xsl:when>
			</xsl:choose> 					
		&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/>
		<u>
			<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;года&#160;
	</xsl:template>
</xsl:stylesheet>
