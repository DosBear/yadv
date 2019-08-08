<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:prs="urn:customs.ru:Information:CommercialFinanceDocuments:PaymentRequirements:5.13.2" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.13.2" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
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
											<xsl:text>Решение таможенного органа о взыскании денежных средств</xsl:text><br/>
											<xsl:text>в бесспорном порядке</xsl:text>
											<br/>
											<xsl:text>от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
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
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением) обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, процентов и пени, исчисленных (начисленных) в:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в сроки, указанные в уведомлениях (уточнениях к уведомлению) об уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на основании статьи 75 Федерального закона от __________ № __________ "О таможенном регулировании" принимает решение о взыскании в бесспорном порядке денежных средств, а так же электронных денежных средств</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации (Ф.И.О. индивидуального предпринимателя, физического лица), идентификационный номер налогоплательщика, код причины постановки на учет (если имеются))</td>
									</tr>
									<tr>
										<td>
											<xsl:text>со счетов в банках в размере </xsl:text>
											<xsl:value-of select="prs:Amount"/>
											<xsl:text> рублей, включая пеню, насчиленную на день составления данного решения в размере </xsl:text>
											<xsl:value-of select="prs:FineAmount"/>
											<xsl:text> рублей.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor"><xsl:with-param name="executor" select="prs:Executor"/><xsl:with-param name="hasPhone" select="'0'"/></xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='ТГП'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<xsl:text>Требование об уплате денежных средств</xsl:text><br/>
											<xsl:text>по банковской гарантии/договору поручительства</xsl:text>
											<br/>
											<xsl:text>от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
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
										<td>на основании статьи 76 Федерального закона от _________ № _________ "О таможенном регулировании" требует не позднее пяти рабочих дней со дня получени указанного требования об уплате денежных средств по банковской гарантии (договору поручительства) перечислить денежные средства в размере:</td>
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
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;В случае неисполнения (ненадлежащего исполнения) данного требования об уплате денежных средств таможенный орган реализует право списать причитающуюся сумму в бесспорном порядке, а также принять меры по ее взысканию, предусмотренные законодательством Российской Федерации.</xsl:text></td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor"><xsl:with-param name="executor" select="prs:Executor"/><xsl:with-param name="hasPhone" select="'1'"/></xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='ТА'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<xsl:text>Требование об уплате денежных средств гарантирующим объединением (ассоциацией)</xsl:text>
											<br/>
											<xsl:text>от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
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
										<td>
											<xsl:text>обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, процентов и пени, исчисленных (начисленных) в расчете таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:CPCID/cat_ru:RegistrationDate"/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates mode="gtd_number" select="prs:CPCID"/>
											<xsl:text>, в отношении товаров, таможенное декларирование которых производилось с применением книжки МДП (картета АТА) от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:DocUsed/prs:DocUsedDate"/>
											<xsl:text> № </xsl:text>
											<xsl:for-each select="prs:DocUsed/prs:TIRIdDetails/*">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
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
										<td class="graph8">(полное наименование гарантирующего объединения (ассоциации), идентификационный номер налогоплательщика / код причины постановки на учет (если имеются))</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на основании статьи 76 Федерального закона от _________ № _________ "О таможенном регулировании" требует перечислить на счет Федерального казначейства: </xsl:text>
											<xsl:apply-templates select="prs:PaymentRequisitions"/>
											<xsl:text> денежные средства в размере</xsl:text>
										</td>
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
										<td class="graph8">(сумма денежных средств, подлежащих уплате по требованию, цифрами и прописью)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включая пеню, начисленную на день составления данного требования в размере </xsl:text>
											<xsl:value-of select="prs:FineAmount"/>
											<xsl:text> рублей.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor"><xsl:with-param name="executor" select="prs:Executor"/><xsl:with-param name="hasPhone" select="'1'"/></xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='РДЗ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<xsl:text>Решение таможенного органа о взыскании денежных средств</xsl:text><br/>
											<xsl:text>в бесспорном порядке</xsl:text>
											<br/>
											<xsl:text>от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
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
										<td>
											обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени, исчисленных (начисленных) в:
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в сроки, указанные в уведомлениях (уточнениях к уведомлению) об уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на основании статьи 75 Федерального закона от __________ № __________ "О таможенном регулировании" принимает решение о взыскании за счет денежного залога, внесенного для обеспечения обязанностей уполномоченного экономического оператора и (или) обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела,</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:Guarantor"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование или Ф.И.О. плательщика ил (или) лица, несущего солидарную обязанность, идентификационный номер налогоплательщика, код причины постановки на учет (если имеются))</td>
									</tr>
									<tr>
										<td>
											<xsl:text>по таможенным распискам:</xsl:text>
											<table width="100%">
												<tbody>
													<tr align="center">
														<td class="bordered">№ п/п</td>
														<td class="bordered">Регистрационный номер</td>
													</tr>
													<xsl:for-each select="prs:CustomsReceipt">
														<tr align="center">
															<td class="bordered"><xsl:value-of select="position()"/></td>
															<td class="bordered">
																<xsl:apply-templates mode="gtd_number" select="./prs:CustomsReceiptID"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в размере </xsl:text>
											<xsl:value-of select="prs:Amount"/>
											<xsl:text> рублей, включая пеню и (или) проценты, насчиленные на день составления данного решения в размере </xsl:text>
											<xsl:value-of select="prs:FineAmount"/>
											<xsl:text> рублей.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor"><xsl:with-param name="executor" select="prs:Executor"/><xsl:with-param name="hasPhone" select="'0'"/></xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='УДЗ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<xsl:text>Уведомление о взыскании таможенных платежей, специальных,</xsl:text><br/>
											<xsl:text>антидемпинговых, компенсационных пошлин, процентов</xsl:text><br/>
											<xsl:text>и пени за счет денежного залога</xsl:text>
											<br/>
											<xsl:text>от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
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
										<td class="graph8">(полное наименование организации (Ф.И.О. индивидуального предпринимателя, физического лица), идентификационный номер налогоплательщика, код причины постановки на учет (если имеются), адрес)</td>
									</tr>
									<tr>
										<td>
											о произведенном в соответствии со статьей 76 Федерального закона от _________ № __________ "О таможенном регулировании" взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени за счет денежного залога по таможенной расписке (по таможенным распискам):
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
													<xsl:for-each select="prs:CustomsReceipt">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="position()"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates mode="gtd_number" select="prs:CustomsReceiptID"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="prs:CRAmount"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="prs:CompAmount"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в счет исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов ил пени:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr align="center" valign="top">
														<td class="bordered" rowspan="2">№ п/п</td>
														<td class="bordered" colspan="2">Реквизиты корректировки декларации на товары или расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</td>
														<td class="bordered" rowspan="2">Код платежа</td>
														<td class="bordered" rowspan="2">Сумма взыскания, рубли</td>
													</tr>
													<tr align="center">
														<td class="bordered">регистрационный номер</td>
														<td class="bordered">дата</td>
													</tr>
													<xsl:for-each select="prs:KDTorCPCID_PMode">
														<tr align="center">
															<td class="bordered"><xsl:value-of select="position()"/></td>
															<td class="bordered"><xsl:apply-templates mode="gtd_number" select="prs:KDTID|prs:CPCID"/></td>
															<td class="bordered"><xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate|prs:CPCID/cat_ru:RegistrationDate"/></td>
															<td class="bordered"><xsl:value-of select="prs:PaymentModeCode"/></td>
															<td class="bordered"><xsl:value-of select="prs:CompAmount"/></td>
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
							<xsl:call-template name="executor"><xsl:with-param name="executor" select="prs:Executor"/><xsl:with-param name="hasPhone" select="'1'"/></xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='РА'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<xsl:text>Решение о взыскании таможенных платежей, специальных, антидемпинговых,</xsl:text><br/>
											<xsl:text>компенсационных пошлин, процентов и пени за счет авансовых платежей, излишне уплаченных</xsl:text><br/>
											<xsl:text>(взысканных) таможенных платежей, специальных, антидемпинговых, компенсационных</xsl:text><br/>
											<xsl:text>пошлин, процентов и пени</xsl:text>
											<br/>
											<xsl:text>от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
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
										<td class="graph8">(полное наименование организации (Ф.И.О. индивидуального предпринимателя, физического лица), идентификационный номер налогоплательщика, код причины постановки на учет (если имеются))</td>
									</tr>
									<tr>
										<td>
											<xsl:text>обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, процентов и пени, исчисленных (начисленных) в:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в сроки, указанные в уведомлениях (уточнениях к уведомлению) об уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на основании статьи 80 Федерального закона от __________ № __________ "О таможенном регулировании" принимает решение о взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени за счет авансовых платежей в размере </xsl:text>
											<xsl:value-of select="prs:Amount"/>
											<xsl:text> рублей, и (или) за счет излишне уплаченных (взысканных) таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" rowspan="2">№ п/п</td>
														<td class="bordered" colspan="3">Реквизиты корректировк декларации на товары или расчет таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени</td>
														<td class="bordered" rowspan="2">Взыскиваемая сумма, рубли</td>
													</tr>
													<tr valign="top" align="center">
														<td class="bordered">регистрационный номер</td>
														<td class="bordered">дата</td>
														<td class="bordered">сумма излишней уплаты (взыскания), рубли</td>
													</tr>
													<xsl:for-each select="prs:DocExcessiveAmount">
														<tr align="center">
															<td class="bordered"><xsl:value-of select="position()"/></td>
															<td class="bordered"><xsl:apply-templates mode="gtd_number" select="prs:KDTID|prs:CPCID"/></td>
															<td class="bordered"><xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate|prs:CPCID/cat_ru:RegistrationDate"/></td>
															<td class="bordered"><xsl:value-of select="prs:ExcessiveAmount"/></td>
															<td class="bordered"><xsl:value-of select="prs:CompAmount"/></td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>всего в размере </xsl:text>
											<xsl:value-of select="prs:PrePaydAmount"/>
											<xsl:text> рублей, в том числе включая пеню и (или) проценты, начисленные на день составления данного решения в размере </xsl:text>
											<xsl:value-of select="prs:FineAmount"/>
											<xsl:text> рублей.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor"><xsl:with-param name="executor" select="prs:Executor"/><xsl:with-param name="hasPhone" select="'0'"/></xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='УАИ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<xsl:text>Уведомление о взыскании таможенных платежей, специальных,</xsl:text><br/>
											<xsl:text>антидемпинговых, компенсационных пошлин, процентов и пени</xsl:text><br/>
											<xsl:text>за счет авансовых платежей, излишне уплаченных (взысканных) таможенных</xsl:text><br/>
											<xsl:text>платежей, специальных, антидемпинговых, компенсационных пошлин, процентов</xsl:text><br/>
											<xsl:text>и пени</xsl:text>
											<br/>
											<xsl:text>от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="prs:DocDate"/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates mode="gtd_number" select="prs:PRSRegNumber"/>
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
										<td class="graph8">(полное наименование организации (Ф.И.О. индивидуального предпринимателя, физического лица), идентификационный номер налогоплательщика, код причины постановки на учет (если имеются), адрес)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>о произведенном в соответствии со статьей 80 Федерального закона от _________ № __________ "О таможенном регулировании" взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени за счет авансовых платежей в размере: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:value-of select="prs:Amount"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сумма авансовых платежей)</td>
									</tr>
									<tr>
										<td>
											<xsl:text>и (или) суммы излишне уплаченных (взысканных) таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени, исчисленных</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" rowspan="2">№ п/п</td>
														<td class="bordered" colspan="3">Реквизиты корректировк декларации на товары или расчет таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени</td>
														<td class="bordered" rowspan="2">Взыскиваемая сумма, рубли</td>
													</tr>
													<tr valign="top" align="center">
														<td class="bordered">регистрационный номер</td>
														<td class="bordered">дата</td>
														<td class="bordered">сумма излишней уплаты (взыскания), рубли</td>
													</tr>
													<xsl:for-each select="prs:DocExcessiveAmount">
														<tr align="center">
															<td class="bordered"><xsl:value-of select="position()"/></td>
															<td class="bordered"><xsl:apply-templates mode="gtd_number" select="prs:KDTID|prs:CPCID"/></td>
															<td class="bordered"><xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate|prs:CPCID/cat_ru:RegistrationDate"/></td>
															<td class="bordered"><xsl:value-of select="prs:ExcessiveAmount"/></td>
															<td class="bordered"><xsl:value-of select="prs:CompAmount"/></td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>в счет исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов ил пени:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr align="center" valign="top">
														<td class="bordered" rowspan="2">№ п/п</td>
														<td class="bordered" colspan="2">Реквизиты корректировки декларации на товары или расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</td>
														<td class="bordered" rowspan="2">Код платежа</td>
														<td class="bordered" rowspan="2">Сумма взыскания, рубли</td>
													</tr>
													<tr align="center">
														<td class="bordered">регистрационный номер</td>
														<td class="bordered">дата</td>
													</tr>
													<xsl:for-each select="prs:KDTorCPCID_PMode">
														<tr align="center">
															<td class="bordered"><xsl:value-of select="position()"/></td>
															<td class="bordered"><xsl:apply-templates mode="gtd_number" select="prs:KDTID|prs:CPCID"/></td>
															<td class="bordered"><xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate|prs:CPCID/cat_ru:RegistrationDate"/></td>
															<td class="bordered"><xsl:value-of select="prs:PaymentModeCode"/></td>
															<td class="bordered"><xsl:value-of select="prs:CompAmount"/></td>
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
							<xsl:call-template name="executor"><xsl:with-param name="executor" select="prs:Executor"/><xsl:with-param name="hasPhone" select="'1'"/></xsl:call-template>
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
					<xsl:value-of  select="substring-before($splittedSum,',')"/>
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
	
	<xsl:template name="executor" match="prs:Executor">
		<xsl:param name="executor"/>
		<xsl:param name="hasPhone"/>
		<table width="100%">
			<tbody>
				<tr>
					<td width="15%">Исполнитель</td>
					<td width="45%" class="value">
						<xsl:value-of select="$executor/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$executor/cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$executor/cat_ru:PersonMiddleName"/>
					</td>
					<td></td>
					<td>
						<xsl:if test="$hasPhone='1'">
							<xsl:text>Телефон</xsl:text>
						</xsl:if>
					</td>
					<td>
						<xsl:if test="$hasPhone='1'">
							<xsl:value-of select="$executor/prs:ExecutivePhone"/>
						</xsl:if>
					</td>
				</tr>
				<tr align="center">
					<td></td>
					<td class="graph8">(Ф.И.О.)</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="prs:CustomsChief">
		<table width="100%">
			<tbody>
				<tr>
					<td width="45%">Начальник (заместительн начальника)</td>
					<td></td>
					<td width="15%"></td>
					<td></td>
					<td width="25%"></td>
				</tr>
				<tr align="center" valign="bottom">
					<td class="value">
						
					</td>
					<td></td>
					<td class="value"></td>
					<td></td>
					<td class="value">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
				<tr align="center">
					<td class="graph8">(наименование таможенного органа)</td>
					<td></td>
					<td class="graph8">(подпись)</td>
					<td></td>
					<td class="graph8">(Ф.И.О.)</td>
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
					<td class="bordered" colspan="3">Уведомление (уточнение к уведомлению) об уплате таможенных платежей, специальных, антидемпинговых, компенсациоанных пошлин, процентов и пени</td>
				</tr>
				<tr align="center">
					<td class="bordered">регистрационный номер</td>
					<td class="bordered">дата</td>
					<td class="bordered">срок исполнения</td>
				</tr>
				<xsl:for-each select="prs:NoticePayment">
					<tr align="center">
						<td class="bordered"><xsl:value-of select="position()"/></td>
						<td class="bordered"><xsl:value-of select="cat_ru:PrDocumentNumber"/></td>
						<td class="bordered"><xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentNumber"/></td>
						<td class="bordered"><xsl:apply-templates mode="russian_date" select="prs:PeriodExecution"/></td>
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
					<td class="bordered" colspan="2">Реквизиты корректировки декларации на товары или расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</td>
				</tr>
				<tr align="center">
					<td class="bordered">регистрационный номер</td>
					<td class="bordered">дата</td>
				</tr>
				<xsl:for-each select="prs:KDTorCPCID">
					<tr valign="top" align="center">
						<td class="bordered"><xsl:value-of select="position()"/></td>
						<td class="bordered"><xsl:apply-templates mode="gtd_number" select="prs:KDTID|prs:CPCID"/></td>
						<td class="bordered"><xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate|prs:CPCID/cat_ru:RegistrationDate"/></td>
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
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
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
