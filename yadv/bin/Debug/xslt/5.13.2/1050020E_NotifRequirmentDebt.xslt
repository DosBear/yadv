<?xml version="1.0" encoding="utf-8"?>
<!-- Форма уведомления из письма ГУФТДиТР №05-58/55489 от 04.10.2017г. -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:cltComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonLeafTypesCust:5.8.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:nrd="urn:customs.ru:Information:GuaranteeDocuments:NotifRequirmentDebt:5.13.1">
	<!-- Шаблон для типа NotifRequirmentDebtType -->
	<xsl:template match="nrd:NotifRequirmentDebt">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
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
				<xsl:choose>
					<xsl:when test="nrd:DocKind=1 or nrd:DocKind=2">
						<div class="page">
							<table class="w190">
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<xsl:choose>
												<xsl:when test="nrd:DocKind=1">Уведомление</xsl:when>
												<xsl:when test="nrd:DocKind=2">Уточнение к уведомлению</xsl:when>
											</xsl:choose>
											 об уплате таможенных и иных платежей, специальных,<br/>антидемпинговых, компенсационных пошлин, процентов и пени
										</font>
										<br/>
										<xsl:if test="nrd:DocDetails/nrd:DocDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="nrd:DocDetails/nrd:DocDate"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:text> № </xsl:text>
										<xsl:value-of select="nrd:DocDetails/nrd:NotifNumber"/>
									</td>
								</tr>
							</table>
							<br/>
							<table class="w190">
								<tr valign="top" align="center">
									<td style="border-bottom: 1px solid;">
										<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="nrd:CustomsOffice/cat_ru:Code"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="nrd:CustomsOffice/nrd:Address"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
									(наименование таможенного органа, адрес таможенного органа)
									</td>
								</tr>
								<tr>
									<td align="justify">
									на основании статьи 73 Федерального закона от "__"_______ 20__ г. № ____ "О таможенном регулировании Российской Федерации" уведомляет
									</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid;">
										<xsl:apply-templates select="nrd:Debtor"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
									(наименование организации или индивидуального предпринимателя, ФИО физического лица, ИНН, КПП (если имеются), паспортные данные, адрес)
									</td>
								</tr>
								<tr>
									<td align="justify">
									о неисполнении обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных
									</td>
								</tr>
							</table>
							<table>	
								<tr>
									<td align="justify" style="width:80mm">пошлин, процентов и пени, исчисленных в </td>
									<td style="border-bottom: 1px solid;">
										<xsl:apply-templates select="nrd:CalcDebtDoc" mode="document"/>
										<xsl:text>,</xsl:text>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td style="font-size: 8pt;">
									(указывается вид, регистрационный номер и дата документа)
									</td>
								</tr>
							</table>
							в размере:<br/>
							<!--table>	
								<tr valign="top">
									<td style="width:20mm">в размере </td>
									<td style="border-bottom:1px solid"><xsl:value-of select="nrd:AmountLetter"/></td>
									<td style="width:40mm">, в том числе:</td>
								</tr>
								<tr align="center">
									<td style="width:20mm"/>
									<td style="width:130mm; font-size: 8pt">(общая сумма задолженности прописью)<br/><br/></td>
									<td style="width:40mm"/>
								</tr>
							</table-->
							<table>	
								<tr>
									<td>
										<table>
											<tr valign="middle" align="center">
												<td style="border:1px solid;" rowspan="2">№</td>
												<td style="border:1px solid;" colspan="3">Подлежащие уплате таможенные платежи, специальные, антидемпинговые, компенсационные пошлины, проценты и пени</td>
												<td style="border:1px solid;" rowspan="2">Срок исполнения обязанности</td>
											</tr>
											<tr valign="middle" align="center">
												<td style="border:1px solid;">код</td>
												<td style="border:1px solid;">наименование</td>
												<td style="border:1px solid;">Сумма, руб., коп.</td>
											</tr>
											<xsl:for-each select="nrd:Paying">
												<tr>
													<td style="border:1px solid;width:5mm">
														<xsl:value-of select="position()"/>
													</td>
													<td style="border:1px solid;width:15mm" align="center">
														<xsl:value-of select="nrd:PaymentModeCode"/>
													</td>
													<td style="border:1px solid;width:110mm">
														<xsl:value-of select="nrd:PaymentName"/>
													</td>
													<td style="border:1px solid;width:40mm" align="right">
														<xsl:value-of select="nrd:Amount"/>
													</td>
													<td style="border:1px solid;width:20mm" align="center">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="nrd:DatePayment"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
											<tr>
												<td colspan="3" style="border:1px solid;" align="right">Итого: </td>
												<td style="border:1px solid;" align="right">
													<xsl:value-of select="nrd:Amount"/>
												</td>
												<td style="border:1px solid;"/>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="justify">
										<br/>&#160;&#160;&#160;&#160;&#160;<xsl:text>Обязанность по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени, указанная в настоящем уведомлении, подлежит исполнению в соответствии со статьей 28 Федерального закона от "__"_______ 20__г. № ___ "О таможенном регулировании в Российской Федерации". При </xsl:text>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td style="width:172mm">уплате в безналичной форме денежные средства вносятся по коду бюджетной классификации</td>
									<td style="border-bottom:1px solid;"><xsl:value-of select="nrd:CBC"/></td>
								</tr>
								<!--tr align="center">
									<td/><td style="font-size: 8pt">(указывается код бюджетной классификации)</td>
								</tr-->
							</table>
							<table>
								<tr>
									<td align="justify">
										<xsl:text> на счет Федерального казначейства </xsl:text>
										<u>
											<xsl:value-of select="nrd:PaymentRequisitions/catComFin_ru:BankName"/>
											<xsl:if test="count(nrd:PaymentRequisitions/*) &gt; 1">, </xsl:if>
											<xsl:apply-templates select="nrd:PaymentRequisitions"/>
										</u>
										<xsl:text>. </xsl:text>
									</td>
								</tr>
								<tr>
									<td align="justify">
										<br/>&#160;&#160;&#160;&#160;&#160;<xsl:text>При неисполнения указанной в настоящем </xsl:text>
										<xsl:choose>
											<xsl:when test="nrd:DocKind=1"> уведомлении </xsl:when>
											<xsl:when test="nrd:DocKind=2"> уточнении к уведомлению </xsl:when>
										</xsl:choose>
										<xsl:text> обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени по истечении</xsl:text>&#160;
										<u>
										<xsl:choose>
											<xsl:when test="nrd:TermDateIndicator=1">пятнадцати</xsl:when>
											<xsl:when test="nrd:TermDateIndicator=2">пяти</xsl:when>
											<xsl:when test="nrd:TermDateIndicator=3">десяти</xsl:when>
											<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										</u>&#160;
										<xsl:text>рабочих дней со дня получения</xsl:text>
										<sup>*)</sup>
										<xsl:text> таможенный орган предпримет меры взыскания в соответствии с главой 12 Федерального закона от 27 ноября 2010г. № 311-ФЗ "О таможенном регулировании в Российской Федерации".</xsl:text>
									</td>
								</tr>
							</table>
							<xsl:if test="nrd:DocKind=2">
								<br/><br/>
								<table>
									<tr align="center">
										<td style="font-size: 8pt;border-top:1px solid; border-left: 1px solid; border-right: 1px solid;">(данный раздел заполняется в случае направления уточнения к уведомлению об уплате таможенных платежей, специальный, антидемпинговых, компенсационных пошлин, процентов и пени)</td>
									</tr>
									<tr>
										<td style="border-left: 1px solid; border-right: 1px solid; border-bottom: 1px solid;">
											<table>
												<tr>
													<td>В связи с тем, что обязанность по уплате таможенных и иных платежей изменилась</td>
												</tr>
												<tr>
													<td style="border-bottom:1px solid;">
														<xsl:value-of select="nrd:ChangeReason"/>
													</td>
												</tr>
												<tr align="center">
													<td style="font-size: 8pt;">(основание изменения обязанности  по уплате таможенных и иных платежей)</td>
												</tr>
												<tr>
													<td>
														<xsl:text>Уведомление (уточнение к уведомлению) об уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени </xsl:text>
														<xsl:value-of select="nrd:DocDetails/nrd:NotifNumber"/>
														<xsl:text> считать отозванным.</xsl:text>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</xsl:if>
							<table>
								<tr>
									<td align="justify">
										<br/>&#160;&#160;&#160;&#160;&#160;
										<xsl:text>В адрес декларанта/таможенного представителя </xsl:text>
										<u><xsl:apply-templates select="nrd:Declarant"/></u>
										<xsl:text> направлено </xsl:text>
										<xsl:choose>
											<xsl:when test="nrd:DocKind=1">уведомление</xsl:when>
											<xsl:when test="nrd:DocKind=1">уточнение у уведомлению</xsl:when>
										</xsl:choose>
										<xsl:text> об уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин процентов и пени № </xsl:text>
										<u>&#160;<xsl:value-of select="nrd:DocDetails/nrd:NotifNumber"/>&#160;</u>.
									</td>
								</tr>
								<tr>
									<td>
										<br/><br/>
										<table>
											<tr>
												<td align="right">Исполнитель: </td>
												<td width="50%" style="border-bottom:1px solid;">
													<xsl:value-of select="nrd:DocSign/nrd:PersonName"/>
												</td>
												<td align="right">Телефон: </td>
												<td width="20%" style="border-bottom:1px solid;">
													<xsl:value-of select="nrd:DocSign/nrd:Phone"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center">(Ф.И.О.)</td>
												<td/>
												<td/>
											</tr>
										</table>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="font-size:8pt;border-top: 1px solid;" align="justify">
										<sup>*)</sup> В соответствии с частью 12 статьи 73 и частью 3 статьи 284 Федерального закона от "__"______ 20__ г. № ____ "О таможенном регулировании в Российской Федерации"  днем получения уведомления об уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени при направлении уведомления по почте заказным письмом считается шестой день, следующий за днем отправки заказного письма, а в случае направления уведомления в виде электронного документа - день, следующий за днем его отправления.
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="border-top:1px dashed;">
										Отметка о вручении
										<br/>
										<br/>
										<table>
											<tr>
												<td width="20%" style="border-bottom:1px solid;" align="center">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="nrd:ReceiveMark/nrd:DateSign"/>
													</xsl:call-template>
												</td>
												<td width="2.5%"/>
												<td width="25%" style="border-bottom:1px solid;"/>
												<td width="2.5%"/>
												<td width="50%" style="border-bottom:1px solid;">
													<xsl:value-of select="nrd:ReceiveMark/nrd:PersonName"/>
												</td>
											</tr>
											<tr valign="top" align="center">
												<td style="font-size: 8pt;">(дата вручения)</td>
												<td/>
												<td style="font-size: 8pt;">(подпись)</td>
												<td/>
												<td style="font-size: 8pt;">(Ф.И.О. уполномоченного представителя организации или физического лица)</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="nrd:DocKind=3 or nrd:DocKind=4">
						<div class="page">
							<table class="w190">
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>
												<xsl:text>Требование № </xsl:text>
												<xsl:value-of select="nrd:DocDetails/nrd:NotifNumber"/>
												<xsl:if test="nrd:DocDetails/nrd:DocDate">
													<xsl:text> от </xsl:text>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="nrd:DocDetails/nrd:DocDate"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
												<xsl:choose>
													<xsl:when test="nrd:DocKind = 3">бенефициара </xsl:when>
													<xsl:when test="nrd:DocKind = 4">кредитора </xsl:when>
												</xsl:choose>
												об уплате денежной суммы по банковской гарантии
											</b>
										</font>
									</td>
								</tr>
							</table>
							<br/>
							<table class="w190">
								<tr valign="top" align="center">
									<td style="border-bottom: 1px solid;">
										<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
									(наименование таможенного органа)
									</td>
								</tr>
								<tr>
									<td>информирует о неисполнении должником </td>
								</tr>
								<tr>
									<td style="border-bottom: 1px solid;">
										<xsl:apply-templates select="nrd:Debtor"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
										(полное наименование организации, Ф.И.О. индивидуального предпринимателя, ИНН/КПП, адрес принципала)
									</td>
								</tr>
								<tr>
									<td>своих обязательств, обеспеченных
										<xsl:for-each select="nrd:GuaranteeDoc">
											<xsl:choose>
												<xsl:when test="nrd:GuaranteeKind=2"> банковской гарантией</xsl:when>
												<xsl:when test="nrd:GuaranteeKind=4"> договором поручительства</xsl:when>
												<xsl:when test="nrd:GuaranteeKind=5"> дополнением к договору поручительства (245)</xsl:when>
												<xsl:when test="nrd:GuaranteeKind=6"> дополнением к договору поручительства (397)</xsl:when>
												<xsl:when test="nrd:GuaranteeKind=7"> договором поручительства в рамках генерального</xsl:when>
											</xsl:choose>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td style="border-bottom: 1px solid;">
										<xsl:for-each select="nrd:GuaranteeDoc">
											<xsl:choose>
												<xsl:when test="nrd:GuaranteeKind=2">
													<xsl:for-each select="nrd:GuaranteeInfo">
														<xsl:text>№ </xsl:text>
														<xsl:value-of select="nrd:GuaranteeOriginalNumber"/>
														<xsl:text> от </xsl:text>
														<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="nrd:GuaranteeOriginalDate"/></xsl:call-template>	
														<xsl:text>, </xsl:text>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<xsl:for-each select="nrd:ContractInfo">
														<xsl:if test="nrd:ContractDate">от&#32;
															<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="nrd:ContractDate"/></xsl:call-template>
														</xsl:if>
														<xsl:if test="nrd:ContractNumber"> № <xsl:value-of select="nrd:ContractNumber"/></xsl:if>
													</xsl:for-each>
													<xsl:text>, </xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="nrd:GuaranteeRegNumber">
												рег.номер обеспечения: <xsl:value-of select="nrd:GuaranteeRegNumber"/>
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<xsl:apply-templates select="nrd:Guarantor"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
										(реквизиты банковской гарантии/договора поручительства, организация гарант)
									</td>
								</tr>
								<tr>
									<td style="border-bottom: 1px solid;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="nrd:ViolationInfo"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
										(описание, в чем состоит нарушение принципалом обязанности по уплате таможенных пошлин, налогов, пеней и процентов,<br/>в обеспечение которой выдана гарантия)
									</td>
								</tr>
							</table>	
							<table>	
								<tr>
									<td style="width:73mm">В связи с неисполнением обязанностей</td>
									<td style="border-bottom: 1px solid;"><xsl:value-of select="nrd:Debtor/cat_ru:OrganizationName"/></td>
								</tr>
								<tr align="center">
									<td style="width:73mm"/>
									<td style="font-size: 8pt;">(наименование организации или ФИО принципала)</td>
								</tr>
								<tr>
									<td style="width:73mm">обеспеченных банковской гарантией</td>
									<td style="border-bottom: 1px solid;"><xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/></td>
								</tr>
								<tr align="center">
									<td style="width:73mm"/>
									<td style="font-size: 8pt;">(наименование таможенного органа)</td>
								</tr>
								<tr>
									<td colspan="2">
										<xsl:text>требует в течение десяти календарных дней с даты получения данного требования перечислить денежные средства в сумме </xsl:text>
										<u>
											<xsl:value-of select="nrd:Amount"/>
											<xsl:text> (</xsl:text>
											<xsl:value-of select="nrd:AmountLetter"/>
											<xsl:text>)</xsl:text>
										</u>
									</td>
								</tr>
							</table>	
							<table>
								<tr valign="top">
									<td style="border:1px solid; font-weight:bold">Вид платежа</td>
									<td style="border:1px solid; font-weight:bold">Код бюджетной классификации</td>
									<td style="border:1px solid; font-weight:bold">Сумма, руб.</td>
								</tr>
								<xsl:for-each select="nrd:Paying">
									<tr>
										<td style="border:1px solid;">
											<xsl:value-of select="nrd:PaymentName"/>
										</td>
										<td style="border:1px solid;" align="center">
											<xsl:value-of select="nrd:CBC"/>
										</td>
										<td style="border:1px solid;">
											<xsl:value-of select="nrd:Amount"/>
											<xsl:if test="nrd:AmountLetter">
												<xsl:text> (</xsl:text>
												<xsl:value-of select="nrd:AmountLetter"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td style="border:1px solid;" colspan="2" align="right">Итого: </td>
									<td style="border:1px solid;">
										<xsl:value-of select="nrd:Amount"/>
										<xsl:text> (</xsl:text>
										<xsl:value-of select="nrd:AmountLetter"/>
										<xsl:text>)</xsl:text>
									</td>
								</tr>
							</table>
							<table>	
								<tr>
									<td style="width:73mm">по следующим банковским реквизитам</td>
									<td style="border-bottom:1px solid;"><xsl:value-of select="nrd:PaymentRequisitions/catComFin_ru:BankName"/></td>
								</tr>
								<tr align="center">
									<td style="width:73mm"/>
									<td style="font-size: 8pt;">(банк получателя)</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid;" colspan="2"><xsl:apply-templates select="nrd:PaymentRequisitions"/></td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;" colspan="2">(БИК, счет №, получатель, ИНН, КПП, ОКАТО)</td>
								</tr>
							</table>
							<table>	
								<tr>
									<td style="width:107mm">В случае, если настоящее требование не будет исполнено,</td>
									<td style="border-bottom:1px solid;"><xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/></td>
								</tr>
								<tr align="center">
									<td style="width:107mm"/>
									<td style="font-size: 8pt;">(наименование таможенного органа)</td>
								</tr>
							</table>
							<table>	
								<tr>
									<td style="width:75mm">реализует право бесспорного списания с</td>
									<td style="border-bottom:1px solid;"><xsl:value-of select="nrd:Guarantor/cat_ru:OrganizationName"/></td>
								</tr>
								<tr align="center">
									<td style="width:75mm"/>
									<td style="font-size: 8pt;">(полное наименование организации гаранта)</td>
								</tr>
							</table>
							<xsl:text>сумм, указанных в данном требовании и неустойки в размере 0,1% от суммы, подлежащей уплате за каждый каждый календарный день просточки, начиная с дня, следующего за днем, установленного в требовании срока уплаты.</xsl:text>
							<br/><br/>
							<table>	
								<tr>
									<td style="width:30mm">Приложение:</td>
									<td style="border-bottom:1px solid;"><xsl:value-of select="nrd:Appendix"/></td>
								</tr>
								<tr align="center">
									<td style="width:30mm"/>
									<td style="font-size: 8pt;"><br/></td>
								</tr>
								<tr>
									<td style="width:30mm">Начальник</td>
									<td style="border-bottom:1px solid;"><xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/></td>
								</tr>
								<tr align="center">
									<td style="width:30mm"/>
									<td style="font-size: 8pt;">(наименование таможенного органа)</td>
								</tr>
								<tr>
									<td colspan="2">М.П.</td>
								</tr>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="nrd:DocKind=5 or nrd:DocKind=6 or nrd:DocKind=7">
						<div class="page">
							<table class="w190">
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<xsl:choose>
												<xsl:when test="nrd:DocKind=5">Информирование о частичном взыскании за счет обеспечения</xsl:when>
												<xsl:when test="nrd:DocKind=6">Уведомление о завершении взыскания</xsl:when>
												<xsl:when test="nrd:DocKind=7">Уведомление об отмене взыскания</xsl:when>
											</xsl:choose>
										</font>
										<br/>
										<xsl:if test="nrd:DocDetails/nrd:DocDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="nrd:DocDetails/nrd:DocDate"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:text> № </xsl:text>
										<xsl:value-of select="nrd:DocDetails/nrd:NotifNumber"/>
									</td>
								</tr>
							</table>
							<br/>
							<table class="w190">
								<tr valign="top" align="center">
									<td style="border-bottom: 1px solid;">
										<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="nrd:CustomsOffice/cat_ru:Code"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="nrd:CustomsOffice/nrd:Address"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
									(наименование таможенного органа, адрес таможенного органа)
									</td>
								</tr>
								<tr>
									<td align="justify">
									на основании статьи ___ Таможенного кодекса Евразийского экономического союза и статьи ___ Федерального закона от "___"______ 20__ г. № ____ "О таможенном регулировании Российской Федерации" уведомляет
									</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid;">
										<xsl:apply-templates select="nrd:Debtor"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
									(наименование организации или индивидуального предпринимателя, ФИО физического лица, ИНН, КПП (если имеются), паспортные данные, адрес)
									</td>
								</tr>
								<tr>
									<td align="justify">
										<xsl:choose>
											<xsl:when test="nrd:DocKind=5">
												о частичном взыскании за счет обеспечения
												<xsl:if test="nrd:AmountActuallyRecovered"> в размере <xsl:value-of select="nrd:AmountActuallyRecovered"/></xsl:if>
											</xsl:when>
											<xsl:when test="nrd:DocKind=6">
												о завершении взыскания
												<xsl:if test="nrd:DateEndPenaltyPayment"> c&#32; 
													<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="nrd:DateEndPenaltyPayment"/></xsl:call-template>
												</xsl:if>
											</xsl:when>
											<xsl:when test="nrd:DocKind=7">
												об отмене взыскания
												<xsl:if test="nrd:DateEndPenaltyPayment"> c&#32; 
													<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="nrd:DateEndPenaltyPayment"/></xsl:call-template>
												</xsl:if>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td align="justify">
										<br/>&#160;&#160;&#160;&#160;&#160;
										<xsl:text>В адрес декларанта/таможенного представителя </xsl:text>
										<u><xsl:apply-templates select="nrd:Declarant"/></u>
										<xsl:text> направлено уведомление № </xsl:text>
										<u>&#160;<xsl:value-of select="nrd:DocDetails/nrd:NotifNumber"/>&#160;</u>.
									</td>
								</tr>
								<tr>
									<td>
										<br/><br/>
										<table>
											<tr>
												<td align="right">Исполнитель: </td>
												<td width="50%" style="border-bottom:1px solid;">
													<xsl:value-of select="nrd:DocSign/nrd:PersonName"/>
												</td>
												<td align="right">Телефон: </td>
												<td width="20%" style="border-bottom:1px solid;">
													<xsl:value-of select="nrd:DocSign/nrd:Phone"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center">(Ф.И.О.)</td>
												<td/>
												<td/>
											</tr>
										</table>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="border-top:1px dashed;">
										Отметка о вручении
										<br/>
										<br/>
										<table>
											<tr>
												<td width="20%" style="border-bottom:1px solid;" align="center">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="nrd:ReceiveMark/nrd:DateSign"/>
													</xsl:call-template>
												</td>
												<td width="2.5%"/>
												<td width="25%" style="border-bottom:1px solid;"/>
												<td width="2.5%"/>
												<td width="50%" style="border-bottom:1px solid;">
													<xsl:value-of select="nrd:ReceiveMark/nrd:PersonName"/>
												</td>
											</tr>
											<tr valign="top" align="center">
												<td style="font-size: 8pt;">(дата вручения)</td>
												<td/>
												<td style="font-size: 8pt;">(подпись)</td>
												<td/>
												<td style="font-size: 8pt;">(Ф.И.О. уполномоченного представителя организации или физического лица)</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>	
					</xsl:when>
					<xsl:otherwise>
						<div class="page">
							<table class="w190">
								<tr>
									<td align="center" class="graphMain">
										<font size="4">Уведомление </font>
										<br/>
										<xsl:if test="nrd:DocDetails/nrd:DocDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="nrd:DocDetails/nrd:DocDate"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:text> № </xsl:text>
										<xsl:value-of select="nrd:DocDetails/nrd:NotifNumber"/>
									</td>
								</tr>
							</table>
							<br/>
							<table class="w190">
								<tr valign="top" align="center">
									<td style="border-bottom: 1px solid;">
										<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="nrd:CustomsOffice/cat_ru:Code"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="nrd:CustomsOffice/nrd:Address"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
									(наименование таможенного органа, адрес таможенного органа)
									</td>
								</tr>
								<tr>
									<td align="justify">
									на основании статьи ___ Таможенного кодекса Евразийского экономического союза и статьи ___ Федерального закона от "___"______ 20__ г. № ____ "О таможенном регулировании Российской Федерации" уведомляет
									</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid;">
										<xsl:apply-templates select="nrd:Debtor"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
									(наименование организации или индивидуального предпринимателя, ФИО физического лица, ИНН, КПП (если имеются), паспортные данные, адрес)
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td align="justify">
										<br/>&#160;&#160;&#160;&#160;&#160;
										<xsl:text>В адрес декларанта/таможенного представителя </xsl:text>
										<u><xsl:apply-templates select="nrd:Declarant"/></u>
										<xsl:text> направлено уведомление № </xsl:text>
										<u>&#160;<xsl:value-of select="nrd:DocDetails/nrd:NotifNumber"/>&#160;</u>.
									</td>
								</tr>
								<tr>
									<td>
										<br/><br/>
										<table>
											<tr>
												<td align="right">Исполнитель: </td>
												<td width="50%" style="border-bottom:1px solid;">
													<xsl:value-of select="nrd:DocSign/nrd:PersonName"/>
												</td>
												<td align="right">Телефон: </td>
												<td width="20%" style="border-bottom:1px solid;">
													<xsl:value-of select="nrd:DocSign/nrd:Phone"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center">(Ф.И.О.)</td>
												<td/>
												<td/>
											</tr>
										</table>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="border-top:1px dashed;">
										Отметка о вручении
										<br/>
										<br/>
										<table>
											<tr>
												<td width="20%" style="border-bottom:1px solid;" align="center">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="nrd:ReceiveMark/nrd:DateSign"/>
													</xsl:call-template>
												</td>
												<td width="2.5%"/>
												<td width="25%" style="border-bottom:1px solid;"/>
												<td width="2.5%"/>
												<td width="50%" style="border-bottom:1px solid;">
													<xsl:value-of select="nrd:ReceiveMark/nrd:PersonName"/>
												</td>
											</tr>
											<tr valign="top" align="center">
												<td style="font-size: 8pt;">(дата вручения)</td>
												<td/>
												<td style="font-size: 8pt;">(подпись)</td>
												<td/>
												<td style="font-size: 8pt;">(Ф.И.О. уполномоченного представителя организации или физического лица)</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>						</div>	
					</xsl:otherwise>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="nrd:PaymentRequisitions">
		<!--xsl:value-of select="catComFin_ru:BankName"/-->
		<xsl:if test="catComFin_ru:OKPOID">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="catComFin_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:BICID">
			<xsl:text>, БИК: </xsl:text>
			<xsl:value-of select="catComFin_ru:BICID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:SWIFTID">
			<xsl:text>, SWIFT: </xsl:text>
			<xsl:value-of select="catComFin_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:AccountNumeric">
			<xsl:text>, корр.счет: </xsl:text>
			<xsl:value-of select="catComFin_ru:AccountNumeric"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:CurrentCurrencyAccount">
			<xsl:text>, валютный счет (текущий): </xsl:text>
			<xsl:for-each select="catComFin_ru:CurrentCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:TransitCurrencyAccount">
			<xsl:text>, валютный счет (транзитный): </xsl:text>
			<xsl:for-each select="catComFin_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:SpecialTransitCurrencyAccount">
			<xsl:text>, валютный счет (специальный): </xsl:text>
			<xsl:for-each select="catComFin_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:RoubleCurrencyAccount">
			<xsl:text>, рублевый счет: </xsl:text>
			<xsl:value-of select="catComFin_ru:RoubleCurrencyAccount"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:BankPostalAddress">
			<xsl:text>, адрес: </xsl:text>
			<xsl:for-each select="catComFin_ru:BankPostalAddress/*">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="document">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="nrd:Debtor|nrd:Declarant|nrd:Guarantor">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails"> адрес: </xsl:if>
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">; </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:PostalCode|RUScat_ru:CountryCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:value-of select="cat_ru:IdentityCardName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:IdentityCardSeries"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:IdentityCardNumber"/>
		<xsl:text> </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:OrganizationName"/>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
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