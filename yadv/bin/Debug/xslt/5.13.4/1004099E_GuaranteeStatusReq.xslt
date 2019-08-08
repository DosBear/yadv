<?xml version="1.0" encoding="utf-8"?>

<!-- бланк в свободной форме -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gsreq="urn:customs.ru:Information:ExchangeDocuments:GuaranteeStatusReq:5.13.1">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="gsreq:GuaranteeStatusReq">
		<html>
			<head>
				<title>Запрос/Информация о документе обеспечения</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
					}

					.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
					}

					.header {
					font-weight: bold;
					margin-top:20px;
					}

					table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					td {
					font-family: Courier, serif;
					vertical-align:top;
					}

					.low {
					font: 12;
					font-fase: Courier;
					}
					.graph {
					font-family: Arial;
					font-size: 10pt;
					}
					jh {
					font: 16;
					font-face: Arial;
					}
					dog1 {
					position:relative;
					left: 50px;
					bottom: 50px;
					}
					.gra {
					font-family: Arial;
					font-size: 6pt;
					}
					.g{
					border-right:0pt solid;
					}

				</style>
			</head>
			<body>
				<div class="page">
					<table border="0" style="width:190mm">
						<tr>
							<td align="center" colspan="2" style="border:solid 0pt; padding-bottom:5mm">
								<font face="Times new roman" size="4">
									<b>
									<xsl:choose>
										<xsl:when test="gsreq:RequestKind=1">Запрос статуса процесса работы с дополнением к договору поручительства</xsl:when>
										<xsl:when test="gsreq:RequestKind=2">Запрос сведений о лицах, несущих солидарную ответственность</xsl:when>
										<xsl:otherwise>Запрос информации о документе обеспечения</xsl:otherwise>
									</xsl:choose>								
									</b>
								</font>
							</td>
						</tr>
						<br/>
						<xsl:if test="gsreq:GRN">
							<tr>
								<td class="graph" style="width:70mm">Cсылочный номер гарантии в транзите</td>
								<td class="graph" style="width:120mm;border-bottom:solid 1px windowtext">
									<xsl:value-of select="gsreq:GRN"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="gsreq:GuaranteeID">
							<tr>
								<td class="graph">Уникальный идентификатор, присваиваемый дополнению к договору поручительства при регистрации</td>
								<td class="graph" style="border-bottom:solid 1px windowtext">
									<xsl:value-of select="gsreq:GuaranteeID/gsreq:AdditionalID"/>
								</td>
							</tr>
							<xsl:if test="gsreq:GuaranteeID/gsreq:ContractNumber">
								<tr>
									<td class="graph">Номер договора поручительства</td>
									<td class="graph" style="border-bottom:solid 1px windowtext">
										<xsl:value-of select="gsreq:GuaranteeID/gsreq:ContractNumber"/>
									</td>
								</tr>
							</xsl:if>
						</xsl:if>
						<xsl:if test="gsreq:CustomsReceiptRegNumber">
							<tr>
								<td class="graph">Регистрационный номер таможенной расписки</td>
								<td class="graph" style="border-bottom:solid 1px windowtext">
									<xsl:apply-templates select="gsreq:CustomsReceiptRegNumber"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="gsreq:INN_Carrier">
							<tr>
								<td class="graph">ИНН перевозчика</td>
								<td class="graph" style="border-bottom:solid 1px windowtext">
									<xsl:value-of select="gsreq:INN_Carrier"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="gsreq:INN_AEO">
							<tr>
								<td class="graph">ИНН уполномоченного экономического оператора</td>
								<td class="graph" style="border-bottom:solid 1px windowtext">
									<xsl:value-of select="gsreq:INN_AEO"/>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div>
			</body>
		</html>
		</xsl:template>
	<xsl:template match="gsreq:CustomsReceiptRegNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="gsreq:DocNumberPrefix"/>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
