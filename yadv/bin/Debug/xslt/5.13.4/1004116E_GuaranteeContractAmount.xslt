<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:gca="urn:customs.ru:Information:ExchangeDocuments:GuaranteeContractAmount:5.13.1">
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="gca:GuaranteeContractAmount">
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
										Предоставление общей суммы денежных средств по банковской гарантии
									</b>
								</font>
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:70mm">Номер договора поручительства</td>
							<td class="graph" style="width:120mm;border-bottom:solid 1px windowtext">
								<xsl:value-of select="gca:ContractNumber"/>
							</td>
						</tr>

						<tr>
							<td class="graph">Дата и время формирования гарантии</td>
							<td class="graph" style="border-bottom:solid 1px windowtext">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="gca:ReserveDate" />
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="graph">Общая сумма действующей гарантии</td>
							<td class="graph" style="border-bottom:solid 1px windowtext">
								<xsl:value-of select="gca:ReserveAmount"/>
							</td>
						</tr>
						<tr>
							<td class="graph">Неиспользованный остаток гарантии</td>
							<td class="graph" style="border-bottom:solid 1px windowtext">
								<xsl:value-of select="gca:ResAmount"/>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
