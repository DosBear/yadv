<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cbc cat_ru clt_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cbc="urn:customs.ru:Information:RegistrationDocuments:CustomsBrokerCertificate:5.13.2" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="cbc:CustomsBrokerCertificate">
		<html>
			<head>
				<title>Свидетельство о включении в Реестр таможенных брокеров</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    table {
                        border: 0;
                        cellpadding: 0;
                        cellspacing: 0;
                        width: 100%;
                        border-collapse: collapse;
                    }

                    td {
                        font-size: 6.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                        padding-left: 4pt
                    }

                    td.bold {
                        font-size: 8.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: bottom;
                        /*white-space: nowrap;*/
                    }

                    td.value {
                        font-size: 10.0pt;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                    }

                    td.border-bottom {
                        border-left: medium none;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    span.bold {
                        font-size: 12.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                    }

                    span.value {
                        font-size: 12.0pt;
                        color: windowtext;
                    }

                    div.page {
                        width: 210mm;
                        height: 297mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    .graph {
                        font-family: Arial;
                        font-size: 7pt;
                    }

                    .graph-number {
                        font-size: 9pt;
                        font-weight: bold;
                    }

                    .graph-big {
                        font-size: 9pt;
                    }

                    @media print {
                        div.page {
                            border: none;
                        }
                    }
                </style>
			</head>
			<body>
				<div class="page">
                    ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
                    <br/>
                    РОССИЙСКОЙ ФЕДЕРАЦИИ
                    <br/>
					<p/>
					<xsl:value-of select="cbc:FormNumber"/>
					<br/>
					<h1>СВИДЕТЕЛЬСТВО</h1>
					<br/>
					<p/>
                    №
                    <xsl:value-of select="cbc:DocumentReference/cat_ru:PrDocumentNumber"/>
					<br/>
					<p align="center">
						<span class="value">
							<b>о включении в Реестр таможенных представителей</b>
						</span>
					</p>
					<table style="padding-top: 20pt;">
						<tr>
							<td class="graph-number" colspan="2" width="50%">Настоящим Федеральная  таможенная
                                служба Российской Федерации
                            </td>
						</tr>
						<tr>
							<td class="graph-number" width="50%">подтверждает включение</td>
							<td class="value" width="50%">
								<xsl:value-of select="cbc:Organization/cat_ru:OrganizationName"/> 
                     </td>
						</tr>
						<tr>
							<td class="graph-number" width="50%">в Реестр таможенных представителей.</td>
							<td width="50%"/>
						</tr>
						<tr>
							<td class="graph-big" width="50%">
								<i>Местонахождение организации</i>
							</td>
							<td class="value" width="50%">
								<xsl:apply-templates select="cbc:Organization/cbc:Address"/>
								<xsl:if test="cbc:Organization/cbc:FactAddress">
									<br/>Фактический адрес<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="cbc:Organization/cbc:FactAddress"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graph-big" width="50%">
                        ИНН
                     </td>
							<td class="value" width="50%">
								<xsl:value-of select="cbc:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
							</td>
						</tr>
						<tr>
							<td class="graph-big" width="50%">
								<i>Наименование и местонахождение
                                    <br/>
                                    обособленных структурных
                                    <br/>
                                    подразделений:
                                </i>
							</td>
							<td class="value" width="50%">
								<xsl:for-each select="cbc:Organization/cbc:BranchDescriprion">
									<xsl:apply-templates select="."/>
									<br/>
								</xsl:for-each>
							</td>
						</tr>
						<!--tr>
							<td class="graph-big" width="50%">
								<i>Форма обеспечения уплаты
                                    <br/>
                                    таможенных платежей
                                </i>
							</td>
							<td class="value" width="50%">
								<xsl:value-of select="cbc:PaymentGuarantee/cbc:PaymentMode"/>
							</td>
						</tr-->
						<!--xsl:if test="cbc:PaymentGuarantee/cbc:PaymentAmount">
					  <tr>
						 <td class="graph-big" width="50%">
							<i>Сумма обеспечения</i>
						 </td>
						 <td class="value" width="50%">
							<xsl:value-of select="cbc:PaymentGuarantee/cbc:PaymentAmount"/>
						 </td>
					  </tr>
                  </xsl:if-->
						<tr>
							<td class="graph-number" width="50%">Ограничения сферы деятельности:</td>
							<td/>
						</tr>
						<tr>
							<td class="graph-big" width="50%">
								<i>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>по видам
                                    товаров в соответствии
                                    <br/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>с ТН ВЭД
                                    ЕАЭС
                                </i>
							</td>
							<td class="value" width="50%">
								<xsl:value-of select="cbc:FieldRestrictions/cbc:GoodsRestriction"/>
							</td>
						</tr>
						<tr>
							<td class="graph-big" width="50%">
								<i>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>по видам
                                    транспорта
                                </i>
							</td>
							<td class="value" width="50%">
								<xsl:value-of select="cbc:FieldRestrictions/cbc:TransportRestriction"/>
							</td>
						</tr>
						<tr>
							<td class="graph-big" width="50%">
								<i>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>по региону
                                    деятельности
                                </i>
							</td>
							<td class="value" width="50%">
								<xsl:value-of select="cbc:FieldRestrictions/cbc:RegionRestriction"/>
							</td>
						</tr>
						<tr>
							<td class="graph-big" width="50%">
								<i>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>по видам
                                    таможенных операций
                                </i>
							</td>
							<td class="value" width="50%">
								<xsl:value-of select="cbc:FieldRestrictions/cbc:ProcedureRestriction"/>
							</td>
						</tr>
					</table>
					<p align="left">
						<span class="graph-number">Дата выдачи свидетельства</span>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<span class="value">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cbc:DocumentReference/cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</span>
					</p>
					<!--p align="left">
                  <span class="graph-big">
                     <i>Уполномоченное лицо ФТС России</i>
                  </span>
               </p-->
					<table>
						<tr>
							<td class="border-bottom" style="vertical-align: bottom; text-align: center;" width="30%">
								<span class="value">
									<xsl:value-of select="cbc:PersonSignature/cat_ru:PersonPost"/>
								</span>
							</td>
							<td colspan="3" width="5%"/>
							<td class="border-bottom" style="vertical-align: bottom; text-align: center;" width="30%">
								<span class="value">
									<xsl:value-of select="cbc:PersonSignature/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="cbc:PersonSignature/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="cbc:PersonSignature/cat_ru:PersonMiddleName"/>
								</span>
							</td>
						</tr>
						<tr>
							<td align="center" width="30%">(должность)</td>
							<td width="5%"/>
							<td align="center" width="30%">(подпись)</td>
							<td width="5%"/>
							<td align="center" width="30%">(Инициалы, Фамилия)</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="cbc:BranchDescriprion">
		<xsl:value-of select="cbc:OrganizationName"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates select="cbc:Address"/>
	</xsl:template>
	<xsl:template match="cbc:Address | cbc:FactAddress">
		<xsl:value-of select="cat_ru:PostalCode"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:value-of select="cat_ru:City"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:value-of select="cat_ru:StreetHouse"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
