<?xml version="1.0" encoding="utf-8"?>
<!-- edited with XMLSpy v2013 (http://www.altova.com) by  () -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:prs="urn:customs.ru:Information:CommercialFinanceDocuments:PaymentRequirements:5.13.4" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:include href="SumInWords.xslt"/>
	<!-- Шаблон для типа PaymentRequirementsType -->
	<xsl:template match="prs:PaymentRequirements">
		<html>
			<head>
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
									.graph8{
									font-size:8pt;
									}
									div.cellwidener {
									margin-top: 0pt;
									margin-left: 0pt;
									margin-bottom: 0pt;
									margin-right: 5pt;
									}
									
									underline 
									{ text-decoration: underline; }
								</style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<xsl:when test="prs:DocType='РБП'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Решение таможенного органа о взыскании денежных средств</xsl:text>
												<br/>
												<xsl:text>в бесспорном порядке</xsl:text>
												<br/>
												<xsl:text>от </xsl:text>
												<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
												<xsl:text> № </xsl:text>
												<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением) обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных (начисленных) в:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в сроки, указанные в уведомлении(ях) (уточнении(ях) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на основании статьи 75 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение о взыскании в бесспорном порядке денежных средств (драгоценных металлов), а так же электронных денежных средств</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии))</td>
									</tr>
									<tr>
										<td>
											<xsl:text>со счетов в банках в размере </xsl:text>
											<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> рублей, включая пени в размере  </xsl:text>
											<xsl:value-of select="translate(translate(format-number(prs:FineAmount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> рублей, насчиленные на день составления данного решения, в том числе:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr align="center" valign="top">
														<td class="bordered">Код платежа</td>
														<td class="bordered">Сумма, рубли</td>
													</tr>
													<xsl:for-each select="prs:ChargesRecover">
														<tr align="center">
															<td class="bordered" align="center">
																<xsl:value-of select="prs:PaymentModeCode"/>
															</td>
															<td class="bordered" align="right">
																<div class="cellwidener">
																	<xsl:value-of select="translate(translate(format-number(prs:CompAmount, '#,###.00'),',',' '),'.',',')"/>
																</div>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'0'"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='ТГП'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Требование об уплате денежных средств</xsl:text>
												<br/>
												<xsl:text>по банковской гарантии/договору поручительства</xsl:text>
												<br/>
												<xsl:text>от </xsl:text>
												<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
												<xsl:text> № </xsl:text>
												<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование принципала по банковской гарантии (должника по договору поручительства), идентификационный номер налогоплательщика, код причины постановки на учет (если имеются))</td>
									</tr>
									<tr>
										<td>обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, процентов и пени, или обязанностей уполномоченного экономического оператора либо юридического лица, осущетсвляющего деятельность в сфере таможенного дела, в сроки, указанные в уведомлениях (уточнениях к уведомлению) об уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени:</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>обеспеченной(ых)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:Guarantor"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="document" select="prs:GuaranteeInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование гаранта (поручителя), способ обеспечения (банковская гарантия или договори поручительства), регристрационный номер и дата банковской гарантии (договора поручительства))</td>
									</tr>
									<tr>
										<td>на основании статьи 76 Федерального закона  от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" требует не позднее пяти рабочих дней со дня получени указанного требования об уплате денежных средств по банковской гарантии (договору поручительства) перечислить денежные средства в размере:</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:value-of select="prs:Amount"/>
											<xsl:text> </xsl:text>
											<i>
												<xsl:apply-templates mode="sumWords" select="prs:Amount"/>
											</i>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сумма денежных средств, подлежащих уплате по требованию цифрами и прописью)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на счет Федерального казначейства: </xsl:text>
											<xsl:apply-templates select="prs:PaymentRequisitions"/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;В случае неисполнения (ненадлежащего исполнения) данного требования об уплате денежных средств таможенный орган реализует право списать причитающуюся сумму в бесспорном порядке, а также принять меры по ее взысканию, предусмотренные законодательством Российской Федерации.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'1'"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='ТА'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Требование об уплате денежных средств гарантирующим объединением (ассоциацией)</xsl:text>
												<br/>
												<xsl:text>от </xsl:text>
												<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
												<xsl:text> № </xsl:text>
												<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии))</td>
									</tr>
									<tr>
										<td>
											<xsl:text>обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных (начисленных) в соответствии со статьей 52 ТК ЕАЭС в расчете таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:CPCID/cat_ru:RegistrationDate"/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates mode="gtd_number" select="prs:CPCID"/>
											<xsl:text>, в отношении товаров, таможенное декларирование которых производилось с применением книжки МДП (картета АТА) от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:DocUsed/prs:DocUsedDate"/>
											<xsl:text> № </xsl:text>
											<xsl:for-each select="prs:DocUsed/prs:TIRIdDetails/*">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text> </xsl:text>
												</xsl:if>
											</xsl:for-each>
											<xsl:value-of select="prs:DocUsed/prs:CarnetNumber"/>
											<xsl:text>, обеспеченной в соответствии с международным договором</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:Guarantor"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование гарантирующего объединения (ассоциации), идентификационный номер налогоплательщика (при наличии))</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на основании статьи 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" требует перечислить на счет Федерального казначейства: </xsl:text>
											<xsl:apply-templates select="prs:PaymentRequisitions"/>
											<xsl:text> денежные средства в размере</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> </xsl:text>
											<i>
												<xsl:apply-templates mode="sumWords" select="prs:Amount"/>
											</i>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сумма денежных средств, подлежащих уплате по требованию, цифрами и прописью)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включая пени в размере </xsl:text>
											<xsl:value-of select="translate(translate(format-number(prs:FineAmount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> рублей, начисленные на день составления данного требования.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'1'"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='РДЗ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Решение таможенного органа об обращении взыскания на денежный залог, внесенный для обеспечения обязанностей 
														уполномоченного экономического оператора и (или) обязанностей юридического лица, осуществляющего деятельность 
														в сфере таможенного дела</xsl:text>
												<br/>
												<xsl:text> от </xsl:text>
												<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
												<xsl:text> № </xsl:text>
												<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
												<br/>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика</td>
									</tr>
									<tr>
										<td>
											обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных (начисленных) в:
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на основании статьи 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение о взыскании за счет денежного залога, внесенного для обеспечения обязанностей уполномоченного экономического оператора и (или) обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела,</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:Guarantor"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование или фамилия, имя, отчество (при наличии) плательщика и (или) лица, несущего солидарную обязанность, идентификационный номер налогоплательщика (при наличии))</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в размере </xsl:text>
											<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> рублей, включая пени и (или) проценты в размере </xsl:text>
											<xsl:value-of select="translate(translate(format-number(prs:FineAmount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> рублей, насчиленные на день составления данного решения.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'0'"/>
							</xsl:call-template>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="left">
										<td>
											<xsl:text>&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;</xsl:text>
										</td>
									</tr>
									<tr valign="top" align="left">
										<td>
											<xsl:text>Регистрационные номера таможенных расписок, с которых произведено взыскание:</xsl:text>
										</td>
									</tr>
									<tr valign="top" align="left">
										<td class="value">
											<xsl:for-each select="prs:CustomsReceiptInfo">
												<xsl:for-each select="prs:CustomsReceipt">
													<xsl:apply-templates mode="gtd_number" select="./prs:CustomsReceiptID"/>
													<xsl:if test="position()!=last()">
														<xsl:text>, </xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:for-each>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="prs:DocType='РПЗ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<br>
													<xsl:text>Решение таможенного органа об обращении взыскания на предмет залога</xsl:text>
													<br/>
													<xsl:text>от </xsl:text>
													<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
													<xsl:text> № </xsl:text>
													<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
												</br>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии)</td>
									</tr>
									<tr>
										<td>
											обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных (начисленных) в:
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в сроки, указанные в уведомлении(ях) (уточнении(ях) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на основании статьи 76 Федерального закона  от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение об обращении взыскания на предмет залога</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="99%" class="value">
															<xsl:for-each select="prs:GuaranteePledgeObject">
																<xsl:value-of select="."/>
															</xsl:for-each>
														</td>
														<td width="99%" valign="bottom" align="right">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>внесенного</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:Guarantor"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование или фамилия, имя, отчество (при наличии) плательщика и (или) лица, несущего солидарную обязанность, идентификационный номер налогоплательщика)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>по договору залога </xsl:text>
											<xsl:choose>
												<xsl:when test="prs:GuaranteeInfo">
													<xsl:apply-templates mode="DocPledgeObject" select="prs:GuaranteeInfo"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text> от </xsl:text>
													<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
													<xsl:text> № </xsl:text>
													<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:text>, в счет исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в размере </xsl:text>
											<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> рублей, включая пени и (или) проценты в размере </xsl:text>
											<xsl:value-of select="translate(translate(format-number(prs:FineAmount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> рублей, насчиленные на день составления данного решения.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'0'"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='УДЗ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Уведомление о взыскании таможенных платежей, специальных,</xsl:text>
												<br/>
												<xsl:text>антидемпинговых, компенсационных пошлин, процентов</xsl:text>
												<br/>
												<xsl:text>и пени за счет денежного залога</xsl:text>
												<br/>
												<xsl:text>от </xsl:text>
												<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
												<xsl:text> № </xsl:text>
												<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>информирует</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
											<xsl:text>, адрес: </xsl:text>
											<xsl:apply-templates select="prs:PrincipalInfo/RUScat_ru:SubjectAddressDetails"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии), адрес)</td>
									</tr>
									<tr>
										<td>
											о произведенном в соответствии со статьей 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет денежного залога по таможенной расписке (по таможенным распискам):
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr align="center">
														<td class="bordered" rowspan="2">№ п/п</td>
														<td class="bordered" colspan="2">Реквизиты таможенной расписки</td>
														<td class="bordered" rowspan="2">Взыскиваемая сумма, рубли</td>
													</tr>
													<tr align="center">
														<td class="bordered">регистрационный номер</td>
														<td class="bordered">сумма, рубли</td>
													</tr>
													<xsl:for-each select="prs:CustomsReceiptInfo">
														<xsl:for-each select="prs:CustomsReceipt">
															<tr>
																<td class="bordered" align="center">
																	<xsl:value-of select="position()"/>
																</td>
																<td class="bordered" align="center">
																	<xsl:apply-templates mode="gtd_number" select="prs:CustomsReceiptID"/>
																</td>
																<td class="bordered" align="right">
																	<div class="cellwidener">
																		<xsl:value-of select="translate(translate(format-number(prs:CRAmount, '#,###.00'),',',' '),'.',',')"/>
																	</div>
																</td>
																<td class="bordered" align="right">
																	<div class="cellwidener">
																		<xsl:value-of select="translate(translate(format-number(prs:CompAmount, '#,###.00'),',',' '),'.',',')"/>
																	</div>
																</td>
															</tr>
														</xsl:for-each>
														<tr>
															<td class="bordered" align="left" colspan="3">
																Итого:
															</td>
															<td class="bordered" align="right">
																<xsl:if test="prs:TotalCompAmount">
																	<div class="cellwidener">
																		<xsl:value-of select="translate(translate(format-number(prs:TotalCompAmount, '#,###.00'),',',' '),'.',',')"/>
																	</div>
																</xsl:if>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в счет исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr align="center" valign="top">
														<td class="bordered" rowspan="2">№ п/п</td>
														<td class="bordered" colspan="2">Реквизиты корректировки декларации на товары или расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, 
															расчета таможенных пошлин, налогов, взимаемых по единым ставкам, либо таможенных пошлин, налогов, взимаемых в виде совокупного таможенного платежа, корректировки 
															таможенного приходного ордера, заявления, предусмотренного пунктом 4 статьи 277 ТК ЕАЭС, либо иного таможенного документа, определенного Евразийской экономической 
															комиссией в соответствии с пунктом 24 статьи 266 ТК ЕАЭС</td>
														<td class="bordered" rowspan="2">Код вида платежа</td>
														<td class="bordered" rowspan="2">Сумма взыскания, рубли</td>
													</tr>
													<tr align="center">
														<td class="bordered">регистрационный номер</td>
														<td class="bordered">дата</td>
													</tr>
													<xsl:for-each select="prs:KDTorCPCID_PModeInfo">
														<xsl:for-each select="prs:KDTorCPCID_PMode">
															<tr align="center">
																<td class="bordered" align="center">
																	<xsl:value-of select="position()"/>
																</td>
																<td class="bordered" align="center">
																	<xsl:apply-templates mode="gtd_number" select="prs:KDTID|prs:CPCID"/>
																</td>
																<td class="bordered" align="center">
																	<xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate|prs:CPCID/cat_ru:RegistrationDate"/>
																</td>
																<td class="bordered" align="center">
																	<xsl:value-of select="prs:PaymentModeCode"/>
																</td>
																<td class="bordered" align="right">
																	<div class="cellwidener">
																		<xsl:value-of select="translate(translate(format-number(prs:CompAmount, '#,###.00'),',',' '),'.',',')"/>
																	</div>
																</td>
															</tr>
														</xsl:for-each>
														<tr align="center">
															<td class="bordered" align="left" colspan="4">Итого:</td>
															<td class="bordered" align="right">
																<xsl:if test="prs:TotalCompAmount">
																	<div class="cellwidener">
																		<xsl:value-of select="translate(translate(format-number(prs:TotalCompAmount, '#,###.00'),',',' '),'.',',')"/>
																	</div>
																</xsl:if>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'1'"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='РА'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Решение таможенного органа о взыскании таможенных платежей, специальных, антидемпинговых,</xsl:text>
												<xsl:text>компенсационных пошлин, процентов и пеней за счет авансовых платежей</xsl:text>
												<br/>
												<xsl:text>от </xsl:text>
												<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
												<xsl:text> № </xsl:text>
												<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных (начисленных) в:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в сроки, указанные в уведомлении(ях) (уточнении(ях) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на основании статьи 80 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение о взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет авансовых платежей в размере </xsl:text>
											<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> рублей, в том числе включая пени и (или) проценты в размере </xsl:text>
											<xsl:value-of select="translate(translate(format-number(prs:FineAmount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> рублей, начисленные на день составления данного решения.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'0'"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='УАИ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Уведомление о взыскании таможенных платежей, специальных, </xsl:text>
												<xsl:text>антидемпинговых, компенсационных пошлин, процентов и пеней </xsl:text>
												<xsl:text>за счет авансовых платежей</xsl:text>
												<br/>
												<br/>
												<xsl:text>от </xsl:text>
												<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
												<xsl:text> № </xsl:text>
												<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>информирует</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
											<xsl:text>, адрес: </xsl:text>
											<xsl:apply-templates select="prs:PrincipalInfo/RUScat_ru:SubjectAddressDetails"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии), адрес)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>о произведенном в соответствии со статьей 80 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет авансовых платежей в размере: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сумма авансовых платежей)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в счет исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr align="center" valign="top">
														<td class="bordered" rowspan="2">№ п/п</td>
														<td class="bordered" colspan="2">Реквизиты корректировки декларации на товары или расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин,
															расчета таможенных пошлин, налогов, взимаемых по единым ставкам, либо таможенных пошлин, налогов, взимаемых в виде совокупного таможенного платежа, 
															корректировки таможенного приходного ордера, заявления, предусмотренного пунктом 4 статьи 277 ТК ЕАЭС, либо иного таможенного документа, определенного 
															Евразийской эеономической комиссией в соответствии с пунктом 24 статьи 266 ТК ЕАЭС
														</td>
														<td class="bordered" rowspan="2">Код вида платежа</td>
														<td class="bordered" rowspan="2">Сумма взыскания, рубли</td>
													</tr>
													<tr align="center">
														<td class="bordered">регистрационный номер</td>
														<td class="bordered">дата</td>
													</tr>
													<xsl:for-each select="prs:KDTorCPCID_PModeInfo">
														<xsl:for-each select="prs:KDTorCPCID_PMode">
															<tr>
																<td class="bordered" align="center">
																	<xsl:value-of select="position()"/>
																</td>
																<td class="bordered" align="center">
																	<xsl:apply-templates mode="gtd_number" select="prs:KDTID|prs:CPCID"/>
																</td>
																<td class="bordered" align="center">
																	<xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate|prs:CPCID/cat_ru:RegistrationDate"/>
																</td>
																<td class="bordered" align="center">
																	<xsl:value-of select="prs:PaymentModeCode"/>
																</td>
																<td class="bordered" align="right">
																	<div class="cellwidener">
																		<xsl:value-of select="translate(translate(format-number(prs:CompAmount, '#,###.00'),',',' '),'.',',')"/>
																	</div>
																</td>
															</tr>
														</xsl:for-each>
														<tr>
															<td class="bordered" align="left" colspan="4">Итого:</td>
															<td class="bordered" align="right">
																<xsl:if test="prs:TotalCompAmount">
																	<div class="cellwidener">
																		<xsl:value-of select="translate(translate(format-number(prs:TotalCompAmount, '#,###.00'),',',' '),'.',',')"/>
																	</div>
																</xsl:if>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'1'"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:PostalCode|RUScat_ru:CountryCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="prs:PaymentRequisitions">
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
	<xsl:template mode="sumWords" match="*">
		<xsl:variable name="splittedSum">
			<xsl:value-of select="translate(.,'.',',')"/>
		</xsl:variable>
		<xsl:variable name="integerPart">
			<xsl:choose>
				<xsl:when test="substring-before($splittedSum,',')!=''">
					<xsl:value-of select="substring-before($splittedSum,',')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$splittedSum"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="fractionalPart" select="substring-after($splittedSum,',')"/>
		<xsl:choose>
			<xsl:when test="$integerPart!='0'">
				<xsl:call-template name="RecurseSumWords">
					<xsl:with-param name="Value" select="$integerPart"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
		<xsl:text> руб. </xsl:text>
		<xsl:if test="$fractionalPart!=''">
			<xsl:value-of select="substring(concat($fractionalPart,'00'),1,2)"/>
			<xsl:text> коп.</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="DocPledgeObject" match="*">
		<xsl:text> от </xsl:text>
		<xsl:choose>
			<xsl:when test="cat_ru:PrDocumentDate">
				<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
			</xsl:when>
			<xsl:otherwise>
				<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> № </xsl:text>
		<xsl:choose>
			<xsl:when test="cat_ru:PrDocumentNumber">
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</xsl:when>
			<xsl:otherwise>
				<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="executor" match="prs:Executor">
		<xsl:param name="executor"/>
		<xsl:param name="hasPhone"/>
		<table width="100%">
			<tbody>
				<tr valign="bottom">
					<td width="16%">Исполнитель</td>
					<td width="55%" class="value" align="center">
						<xsl:value-of select="$executor/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$executor/cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$executor/cat_ru:PersonMiddleName"/>
					</td>
					<td/>
					<xsl:if test="$hasPhone='1'">
						<td align="right">
							<xsl:text>Телефон&#160;&#160;</xsl:text>
						</td>
						<td class="value" align="center">
							<xsl:value-of select="$executor/prs:ExecutivePhone"/>
						</td>
					</xsl:if>
				</tr>
				<tr align="center" valign="top">
					<td/>
					<td class="graph8">(инициалы, фамилия должностного лица таможенного органа)</td>
					<td/>
					<xsl:if test="$hasPhone='1'">
						<td/>
						<td/>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="prs:CustomsChief">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="40%" align="left">Начальник таможенного органа<br/>(или лицо, им уполномоченное)</td>
					<td/>
					<td class="value" width="15%"/>
					<td/>
					<td class="value" width="30%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
				<tr align="center">
					<td class="graph8"/>
					<td/>
					<td class="graph8">(подпись)</td>
					<td/>
					<td class="graph8">(инициалы, фамилия)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
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
	<xsl:template mode="NoticePayment" match="*">
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td class="bordered" rowspan="2">№ п/п</td>
					<td class="bordered" colspan="3">Уведомление (уточнение к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсациоанных пошлин, процентов и пеней</td>
				</tr>
				<tr align="center">
					<td class="bordered">регистрационный номер</td>
					<td class="bordered">дата</td>
					<td class="bordered">срок исполнения</td>
				</tr>
				<xsl:for-each select="prs:NoticePayment">
					<tr align="center">
						<td class="bordered">
							<xsl:value-of select="position()"/>
						</td>
						<td class="bordered">
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates mode="russian_date" select="prs:PeriodExecution"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="KDTorCPCID" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="top">
					<td class="bordered" rowspan="2">№ п/п</td>
					<td class="bordered" colspan="2">Реквизиты корректировки декларации на товары или расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин,
						расчета таможенных пошлин, налогов, взимаемых по единым ставкам, либо таможенных пошлин, налогов, взимаемых в виде совокупного таможенного платежа, 
						корректировки таможенного приходного ордера, заявления, предусмотренного пунктом 4 статьи 277 ТК ЕАЭС, либо иного таможенного документа, определенного 
						Евразийской эеономической комиссией в соответствии с пунктом 24 статьи 266 ТК ЕАЭС
					</td>
				</tr>
				<tr align="center">
					<td class="bordered">регистрационный номер</td>
					<td class="bordered">дата</td>
				</tr>
				<xsl:for-each select="prs:KDTorCPCID">
					<tr valign="top" align="center">
						<td class="bordered">
							<xsl:value-of select="position()"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates mode="gtd_number" select="prs:KDTID|prs:CPCID"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate|prs:CPCID/cat_ru:RegistrationDate"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="prs:PRSCustoms">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="not(cat_ru:OfficeName) and prs:FullOfficeName">
			<xsl:value-of select="prs:FullOfficeName"/>
		</xsl:if>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<xsl:template mode="gtd_number" match="*">
		<xsl:if test="./*[local-name()='DocNumberPrefix']">
			<xsl:value-of select="./*[local-name()='DocNumberPrefix']"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="./*[local-name()='CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="./*[local-name()='RegistrationDate']"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="./*[local-name()='RegNumber']|./*[local-name()='GTDNumber']"/>
		<xsl:if test="./*[local-name()='Code']">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="./*[local-name()='Code']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="num_date" match="*">
		<xsl:param name="dateIn" select="."/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="russian_date" match="*">
		<xsl:param name="dateIn" select="."/>
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
