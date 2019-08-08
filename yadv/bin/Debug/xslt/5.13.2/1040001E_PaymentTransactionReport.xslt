<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:cat_crd="urn:customs.ru:CardCommonAggregateTypes:5.10.0" xmlns:ptr="urn:customs.ru:CustomsCardDoc:PaymentTransactionReport:5.10.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="ptr:PaymentTransactionReport">
		<html>
			<head>
				<title>Электронный чек подтверждения уплаты</title>
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
					padding-top:0
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
								Электронный чек подтверждения уплаты
								<br/>
								<xsl:if test="(ptr:DocumentStatusFlag='1' or ptr:DocumentStatusFlag='2' or ptr:DocumentStatusFlag='3') and (ptr:ResendingFlag='0' or ptr:ResendingFlag='1')">
									<xsl:text>(</xsl:text>
									<xsl:choose>
										<xsl:when test="ptr:DocumentStatusFlag='1'">
											<xsl:text>новый документ</xsl:text>
										</xsl:when>
										<xsl:when test="ptr:DocumentStatusFlag='2'">
											<xsl:text>исправление документа</xsl:text>
										</xsl:when>
										<xsl:when test="ptr:DocumentStatusFlag='3'">
											<xsl:text>удаление ошибочно посланного документа</xsl:text>
										</xsl:when>
									</xsl:choose>

									<xsl:if test="(ptr:DocumentStatusFlag='1' or ptr:DocumentStatusFlag='2' or ptr:DocumentStatusFlag='3') or (ptr:ResendingFlag='0' or ptr:ResendingFlag='1')">
										<xsl:text>, </xsl:text>
									</xsl:if>


									<xsl:choose>
										<xsl:when test="ptr:ResendingFlag='0'">
											<xsl:text>документ отправляется впервые</xsl:text>
										</xsl:when>
										<xsl:when test="ptr:ResendingFlag='1'">
											<xsl:text>документ уже отправлялся</xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:text>)</xsl:text>
								</xsl:if>
								<br/>
								от
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ptr:DocumentDate" />
								</xsl:call-template>
							</b>
						</font>
					</div>

					<xsl:apply-templates select="ptr:PayerInfo" >
						<xsl:with-param name="titleIn" select="'плательщике'" />
						<xsl:with-param name="descIn" select="'(информация о плательщике)'" />
					</xsl:apply-templates>
					<table class="w190">
						<tr>
							<td style="width:60mm" class="graphMain">Номер таможенной платежной карты</td>
							<td class="graphMain bb" style="width:130mm">
								<xsl:value-of select="ptr:PayerInfo/ptr:CardNumber"/>
							</td>
						</tr>
						<tr>
							<td style="width:60mm" class="graphLittle"></td>
							<td class="graphLittle" style="width:130mm">
								(номер таможенной платежной карты, с использованием который был осуществлен платеж)
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width:65mm">
								Документ, удостоверяющий личность
							</td>
							<td class="graphMain bb" style="width:125mm">
								<xsl:apply-templates select="ptr:PayerInfo/ptr:IdentityCard" />
							</td>
						</tr>
						<tr>
							<td class="graphLittle" style="width:65mm">

							</td>
							<td class="graphLittle" style="width:125mm">
								документ, удостоверяющий личность
							</td>
						</tr>
					</table>

					<xsl:apply-templates select="ptr:Principal" >
						<xsl:with-param name="titleIn" select="'лице, в пользу которого произведен платеж'" />
						<xsl:with-param name="descIn" select="'(Информация о лице, в пользу которого произведен платеж)'" />
					</xsl:apply-templates>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width:65mm">
								Документ, удостоверяющий личность
							</td>
							<td class="graphMain bb" style="width:125mm">
								<xsl:apply-templates select="ptr:Principal/ptr:IdentityCard" />
							</td>
						</tr>
						<tr>
							<td class="graphLittle" style="width:65mm">

							</td>
							<td class="graphLittle" style="width:125mm">
								документ, удостоверяющий личность
							</td>
						</tr>
					</table>

					<xsl:apply-templates select="ptr:Recipient">
						<xsl:with-param name="titleIn" select="'получателе'" />
						<xsl:with-param name="descIn" select="'(информация о получателе)'" />
					</xsl:apply-templates>

					<xsl:apply-templates select="ptr:PaymentInformation"/>

				</div>
			</body>
		</html>

	</xsl:template>

	<xsl:template match="ptr:PaymentInformation">
		<table class="w190" style="margin-top:5mm">
			<tr>
				<td class="graphMain" colspan="7">Сведения о платеже</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:60mm">Идентификатор банковской операции</td>
				<td class="graphMain bb" style="width:130mm">
					<xsl:value-of select="ptr:BankTransactionID"/>
				</td>
			</tr>
			<tr>
				<td class="graphLittle" style="width:60mm"></td>
				<td class="graphLittle" style="width:130mm">
					уникальный идентификатор банковской операции
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:30mm">Дата обработки</td>
				<td class="graphMain bb" style="width:35mm">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ptr:ProcessingDate" />
					</xsl:call-template>
				</td>
				<td style="width:10mm" />
				<td class="graphMain" style="width:15mm">Сумма</td>
				<td class="graphMain bb" style="width:20mm">
					<xsl:value-of select="translate(ptr:Amount, '.', ',')"/>
				</td>
				<td style="width:5mm" />
				<td style="width:10mm" class="graphMain">Документ</td>
				<td class="graphMain bb" style="width:50mm">
					<xsl:choose>
						<xsl:when test="ptr:PaymentDocumentKind='01' or ptr:PaymentDocumentKind='1'">
							таможенная платежная карта
						</xsl:when>
						<xsl:when test="ptr:PaymentDocumentKind='02' or ptr:PaymentDocumentKind='2'">
							банковская карта
						</xsl:when>
						<xsl:when test="ptr:PaymentDocumentKind='03' or ptr:PaymentDocumentKind='3'">
							наличные средства
						</xsl:when>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="graphLittle" style="width:30mm"></td>
				<td class="graphLittle" style="width:35mm">
					(дата обработки оператором)
				</td>
				<td class="graphLittle" style="width:10mm" />
				<td class="graphLittle" style="width:15mm"></td>
				<td class="graphLittle" style="width:20mm">
					(сумма платежа)
				</td>
				<td class="graphLittle" style="width:5mm" />
				<td class="graphLittle" style="width:10mm" />
				<td class="graphLittle" style="width:50mm" >
					(тип платежного документа)
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:25mm">Дата оплаты</td>
				<td class="graphMain bb" style="width:40mm">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ptr:PaymentDate" />
					</xsl:call-template>
				</td>
				<td style="width:10mm" />
				<td class="graphMain" style="width:25mm">Время оплаты</td>
				<td class="graphMain bb" style="width:30mm">
					<xsl:value-of select="substring(ptr:PaymentTime, 1,8)"/>
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
						<xsl:with-param name="dateIn" select="ptr:CustomsCode" />
					</xsl:call-template>
				</td>
				<td style="width:5mm" />
				<td class="graphMain" style="width:10mm">КБК</td>
				<td class="graphMain bb" style="width:40mm">
					<xsl:value-of select="ptr:CBC"/>
				</td>
				<td style="width:50mm"></td>
			</tr>
			<tr>
				<td class="graphLittle" style="width:45mm"></td>
				<td class="graphLittle" style="width:30mm">
					(код получателя платежа)
				</td>
				<td class="graphLittle" style="width:5mm" />
				<td class="graphLittle" style="width:10mm"></td>
				<td class="graphLittle" style="width:40mm">
					(код бюджетной классификации)
				</td>
				<td class="graphLittle" style="width:50mm"></td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:105mm">Документ, являющийся основанием для совершения платежа</td>
				<td class="graphMain bb" style="width:85mm">
					<xsl:value-of select="ptr:PaymentBaseDocument/cat_crd:PrDocumentNumber" />
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ptr:PaymentBaseDocument/cat_crd:PrDocumentDate" />
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:apply-templates select="ptr:SystemOperator"></xsl:apply-templates>
		<table>
			<tbody>
				<tr>
					<td class="graphMain" style="width:40mm">Назначение платежа</td>
					<td class="graphMain bb" style="width:150mm;"><xsl:value-of select="ptr:Reason"/></td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="PrintName">
		<xsl:param name="titleIn" />
		<xsl:param name="descIn" />
		<table class="w190" style="margin-top:5mm">
			<tr>
				<td class="graphMain" style="width:48mm">
					<xsl:choose>
						<xsl:when test="substring($titleIn, 1, 1)='о'">
							Информация об
						</xsl:when>
						<xsl:otherwise>
							Информация о
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="$titleIn"/>
				</td>
				<td class="graphMain bb" style="width:142mm">
					<xsl:value-of select="cat_crd:OrganizationName"/>
				</td>
			</tr>
			<tr>
				<td class="graphLittle" style="width:48mm">

				</td>
				<td class="graphLittle" style="width:142mm">
					<xsl:value-of select="$descIn"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td style="width:10mm" class="graphMain">
					ИНН
				</td>
				<td style="width:40mm" class="graphMain bb">
					<xsl:value-of select="cat_crd:INN"/>
				</td>
				<td style="width:10mm" />
				<td style="width:10mm" class="graphMain">
					КПП
				</td>
				<td style="width:40mm" class="graphMain bb">
					<xsl:value-of select="cat_crd:KPP"/>
				</td>
				<td style="width:10mm" />
				<xsl:choose>
					<xsl:when test="ptr:OKPO">
						<td style="width:10mm" class="graphMain">
							ОКПО
						</td>
						<td style="width:40mm" class="graphMain bb">
							<xsl:value-of select="ptr:OKPO"/>
						</td>
						<td style="width:10mm"></td>
						<td style="width:40mm" />
					</xsl:when>
					<xsl:otherwise>
						<td></td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td style="width:10mm" class="graphLittle">
				</td>
				<td style="width:40mm" class="graphLittle">
					<xsl:text>(ИНН </xsl:text>
					<xsl:value-of select="$titleIn"/>
					<xsl:choose>
						<xsl:when test="substring($titleIn, string-length($titleIn), 1)='л'">
							<xsl:text>я)</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>а)</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td style="width:10mm" class="graphLittle"></td>
				<td style="width:10mm" class="graphLittle">
				</td>
				<td style="width:40mm" class="graphLittle">
					<xsl:text>(КПП </xsl:text>
					<xsl:value-of select="$titleIn"/>
					<xsl:choose>
						<xsl:when test="substring($titleIn, string-length($titleIn), 1)='л'">
							<xsl:text>я)</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>а)</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td style="width:10mm" class="graphLittle"></td>
				<xsl:choose>
					<xsl:when test="ptr:OKPO">
						<td style="width:10mm" class="graphLittle">
						</td>
						<td style="width:40mm" class="graphLittle">
							(код по ОКПО)
						</td>
					</xsl:when>
					<xsl:otherwise>
						<td></td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="ptr:SystemOperator">
		<xsl:call-template name="PrintName">
			<xsl:with-param name="titleIn" select="'операторе'" />
			<xsl:with-param name="descIn" select="'(оператор системы, в которой оформлен платеж)'" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="ptr:PayerInfo|ptr:Recipient|ptr:Principal">
		<xsl:param name="titleIn" />
		<xsl:param name="descIn" />
		<xsl:call-template name="PrintName">
			<xsl:with-param name="titleIn" select="$titleIn" />
			<xsl:with-param name="descIn" select="$descIn" />
		</xsl:call-template>
		<xsl:if test="name(.) != 'ptr:Principal'">
			<table class="w190">
				<tr>
					<td style="width:10mm" class="graphMain">Банк</td>
					<td class="graphMain bb" style="width:140mm">
						<xsl:value-of select="ptr:Account"/>
					</td>
					<td style="width:10mm"></td>
					<td style="width:10mm" class="graphMain">БИК</td>
					<td class="graphMain bb" style="width:20mm">
						<xsl:value-of select="ptr:BIC"/>
					</td>
				</tr>
				<tr>
					<td style="width:10mm" class="graphLittle"></td>
					<td class="graphLittle" style="width:140mm">
						(наименование банка)
					</td>
					<td style="width:10mm" class="graphLittle"></td>
					<td style="width:10mm" class="graphLittle"></td>
					<td class="graphLittle" style="width:20mm">
						(БИК банка)
					</td>
				</tr>
			</table>
			<table class="w190">
				<tr>
					<td style="width:20mm" class="graphMain">Номер счета</td>
					<td class="graphMain bb" style="width:50mm">
						<xsl:value-of select="ptr:Account"/>
					</td>
					<td style="width:20mm"></td>
					<td style="width:30mm" class="graphMain">Корр. счет банка</td>
					<td class="graphMain bb" style="width:50mm">
						<xsl:value-of select="ptr:BankAccount"/>
					</td>
				</tr>
				<tr>
					<td style="width:20mm" class="graphLittle"></td>
					<td class="graphLittle" style="width:50mm">
						(номер счета плательщика)
					</td>
					<td class="graphLittle" style="width:20mm"></td>
					<td style="width:30mm" class="graphLittle">
					</td>
					<td class="graphLittle" style="width:50mm">
						(номер к/с банка плательщика)
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template match="ptr:IdentityCard">
		<xsl:if test="cat_crd:IdentityCardCode">
			Код вида документа: <xsl:value-of select="cat_crd:IdentityCardCode"/>,
		</xsl:if>
		<xsl:if test="cat_crd:IdentityCardSeries or cat_crd:IdentityCardNumber">
			Серия и номер:
			<xsl:value-of select="cat_crd:IdentityCardSeries"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="cat_crd:IdentityCardNumber"/>
		</xsl:if>
		<xsl:if test="cat_crd:IdentityCardDate or cat_crd:OrganizationName">
			<xsl:text>, выдан </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_crd:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
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