<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_crd="urn:customs.ru:CardCommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rslt="urn:customs.ru:CustomsCardDoc:PaymentTransactionResult:5.10.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template match="rslt:PaymentTransactionResult">
		<html>
			<head>
				<title>Сообщение о результатах обработки</title>
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
								Сообщение о результатах обработки
								<br/>
								<xsl:choose>
									<xsl:when test="rslt:DocumentStatusFlag='1'">
										(новый документ)<br/>
									</xsl:when>
									<xsl:when test="rslt:DocumentStatusFlag='2'">
										(исправление документа)<br/>
									</xsl:when>
								</xsl:choose>
								от
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rslt:DocumentDate" />
								</xsl:call-template>
							</b>
						</font>
					</div>

					<!--xsl:if test="rslt:DocumentNumber/rslt:TerminalKind!='4'"-->
						<table class="w190">
							<tr>
								<td class="graphMain" style="width:52mm">
									Номер
									<xsl:choose>
										<xsl:when test="rslt:DocumentNumber/rslt:TerminalKind='1'">
											электронного терминала
										</xsl:when>
										<xsl:when test="rslt:DocumentNumber/rslt:TerminalKind='2'">
											платёжного терминала
										</xsl:when>
										<xsl:when test="rslt:DocumentNumber/rslt:TerminalKind='3'">
											банкомата
										</xsl:when>
										<xsl:when test="rslt:DocumentNumber/rslt:TerminalKind='4'">
											банкомата
										</xsl:when>
									</xsl:choose>
								</td>
								<td class="graphMain bb" style="width:138mm">
									<xsl:value-of select="rslt:DocumentNumber/rslt:TerminalID"/>
								</td>
							</tr>
							<tr>
								<td class="graphMain" style="width:52mm">
									Номер чека
								</td>
								<td class="graphMain bb" style="width:138mm">
									<xsl:value-of select="rslt:DocumentNumber/rslt:ChequeNumber"/>
								</td>
							</tr>
						</table>
						<table class="w190" style="margin-top:5mm">
							<tr>
								<td class="graphMain" colspan="7">Сведения о платеже</td>
							</tr>
						</table>
						<table class="w190">
							<tr>
								<td class="graphMain" style="width:60mm">Идентификатор банковской операции</td>
								<td class="graphMain bb" style="width:130mm">
									<xsl:value-of select="rslt:PaymentInformation/rslt:BankTransactionID"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle" style="width:60mm"></td>
								<td class="graphLittle" style="width:130mm">
									уникальный идентификатор банковской операции
								</td>
							</tr>
						</table>
						<table class="w190" style="margin-top:5mm">
							<tr>
								<td class="graphMain" style="width:30mm">Дата обработки</td>
								<td class="graphMain bb" style="width:40mm">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rslt:PaymentInformation/rslt:ProcessingDate" />
									</xsl:call-template>
								</td>
								<td style="width:10mm" />
								<td class="graphMain" style="width:15mm">Сумма</td>
								<td class="graphMain bb" style="width:30mm">
									<xsl:value-of select="translate(rslt:PaymentInformation/rslt:Amount, '.', ',')"/>
								</td>
								<td style="width:10mm" />
								<td></td>
							</tr>
							<tr>
								<td class="graphLittle" style="width:30mm"></td>
								<td class="graphLittle" style="width:40mm">
									(дата обработки оператором)
								</td>
								<td class="graphLittle" style="width:10mm" />
								<td class="graphLittle" style="width:15mm"></td>
								<td class="graphLittle" style="width:30mm">
								(сумма платежа)
								</td>
								<td class="graphLittle" style="width:10mm" />
								<td class="graphLittle"></td>
							</tr>
						</table>
						<table class="w190">
							<tr>
								<td class="graphMain" style="width:25mm">Дата оплаты</td>
								<td class="graphMain bb" style="width:40mm">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rslt:PaymentInformation/rslt:PaymentDate" />
									</xsl:call-template>
								</td>
								<td style="width:10mm" />
								<td class="graphMain" style="width:25mm">Время оплаты</td>
								<td class="graphMain bb" style="width:30mm">
									<xsl:value-of select="substring(rslt:PaymentInformation/rslt:PaymentTime, 1,8)"/>
								</td>
								<td style="width:10mm" />
								<td></td>
							</tr>
							<tr>
								<td class="graphLittle" style="width:25mm"></td>
								<td class="graphLittle" style="width:40mm">
									(дата оплаты)
								</td>
								<td class="graphLittle" style="width:10mm" />
								<td class="graphLittle" style="width:25mm"></td>
								<td class="graphLittle" style="width:30mm">
									(время оплаты)
								</td>
								<td class="graphLittle" style="width:10mm" />
								<td class="graphLittle"></td>
							</tr>
						</table>
						<table class="w190">
							<tr>
								<td class="graphMain" style="width:45mm">Код таможенного органа</td>
								<td class="graphMain bb" style="width:30mm">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rslt:PaymentInformation/rslt:CustomsCode" />
									</xsl:call-template>
								</td>
								<td style="width:5mm" />
								<td class="graphMain" style="width:60mm">Номер таможенной платежной карты</td>
								<td class="graphMain bb" style="width:40mm">
									<xsl:value-of select="rslt:PaymentInformation/rslt:CardNumber"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle" style="width:45mm"></td>
								<td class="graphLittle" style="width:30mm">
									(код получателя платежа)
								</td>
								<td class="graphLittle" style="width:5mm" />
								<td class="graphLittle" style="width:60mm"></td>
								<td class="graphLittle" style="width:40mm">
									(номер карты)
								</td>
							</tr>
						</table>
					<!--/xsl:if-->
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
