<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:cat_crd="urn:customs.ru:CardCommonAggregateTypes:5.10.0" xmlns:cpreq="urn:customs.ru:CustomsCardDoc:CustPaymentReq:5.10.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="cpreq:CustPaymentReq">
		<html>
			<head>
				<title>Запрос сведений о суммах денежных средств, подлежащих уплате по декларации на товары</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					}


					div.page
					{
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.graphMain
					{
					font-family: Arial;
					font-size: 10pt;
					font-weight: normal;
					}
					.graphLittle
					{
					font-family: Arial;
					font-size: 7pt;
					text-align:center;
					}

					.normal
					{
					font-weight: bold;
					font-family:Arial;
					font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext;
					}
					.w190
					{
					width:190mm;
					}

					.bb
					{
						border-bottom: solid 1pt windowtext;
					}

				</style>
			</head>
			<body>
				<div class="page">
					<div align="center" class="w190 graphMain" style="margin-bottom:5mm">
						<font size="4">
							<b>
								Запрос сведений о суммах денежных средств,<br/> подлежащих уплате по декларации на товары
							</b>
						</font>
					</div>

					<table class="w190">
						<tr>
							<td class="graphMain" style="width:48mm">
								Информация о плательщике
							</td>
							<td class="graphMain bb" style="width:142mm">
								<xsl:value-of select="cpreq:Payer/cat_crd:OrganizationName"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td style="width:10mm" class="graphMain">
								ИНН
							</td>
							<td style="width:40mm" class="graphMain bb">
								<xsl:value-of select="cpreq:Payer/cat_crd:INN"/>
							</td>
							<td style="width:10mm" class="graphMain">
								КПП
							</td>
							<td style="width:40mm" class="graphMain bb">
								<xsl:value-of select="cpreq:Payer/cat_crd:KPP"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td style="width:10mm" class="graphLittle">
							</td>
							<td style="width:40mm" class="graphLittle">
							(ИНН плательщика)
							</td>
							<td style="width:10mm" class="graphLittle">
							</td>
							<td style="width:40mm" class="graphLittle">
								(КПП плательщика)
							</td>
							<td></td>
						</tr>
					</table>
				</div>
			</body>
		</html>

	</xsl:template>


</xsl:stylesheet>