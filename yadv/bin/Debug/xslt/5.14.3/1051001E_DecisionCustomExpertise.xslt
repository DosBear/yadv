<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС России от 16.01.2019 г. № 34 "Об утверждении Порядка проведения таможенной экспертизы, формы решения таможенного органа о назначении таможенной экспертизы"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dce="urn:customs.ru:Information:CustomsDocuments:DecisionCustomExpertise:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа DecisionCustomExpertiseType -->
	<xsl:key match="dce:Goods/dce:RiskProfile" name="rows_RiskProfile" use="."/>
	<xsl:template match="dce:DecisionCustomExpertise">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									font-family: Arial;
									font-size: 10pt;
									}

									div.page {
									width: 180mm;
									padding: 10mm;
									padding-left:	20mm;
									background: #ffffff;
									border: solid 1pt #ffffff;
									font-family: Arial;
									font-size: 10pt;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									table-layout: fixed;
									font-family: Arial;
									font-size: 10pt;
									}
									
									td {
									max-width: 180mm;
									word-break: break-word;
									word-wrap: break-word;
									-ms-word-break: break-all;
									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
									}

									.graphMain_value
									{
									border-bottom: solid 1px black;
									vertical-align:bottom;
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

									.underlined {
									border-bottom: 1px solid windowtext;
									vertical-align:bottom;
									}

									.graphMain
									{
									font-family: Arial;
									font-size: 10pt;
									}

									.graphLittle 
									{
									font-family: Arial;
									font-size: 7pt;
									}

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}

									.graphDelim_1
									{
									font-family: Arial;
									font-size: 1pt;
									}

								</style>
			</head>
			<body>
				<div class="page graphMain">
					<table>
						<tbody>
							<tr>
								<td align="center">
									<br/>
									<b>
										<xsl:text>Решение таможенного органа о назначении таможенной экспертизы</xsl:text>
									</b>
								</td>
							</tr>
							<tr>
								<td align="center">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="50%" valign="top" align="left">
													<xsl:text>№ </xsl:text>
													<u>&#160;<xsl:apply-templates select="dce:DecisionNumber"/>&#160;</u>
												</td>
												<td width="50%" valign="top" align="right">
													<xsl:text>от </xsl:text>
													<xsl:call-template name="DateStr">
														<xsl:with-param name="date" select="dce:DecisionDate"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="4%">
									<xsl:text>1.</xsl:text>
								</td>
								<td width="96%">
									<xsl:text>Уполномоченное должностное лицо таможенного органа: </xsl:text>
								</td>
							</tr>
							<tr>
								<td align="left" class="graphMain_value" colspan="2">
									<xsl:for-each select="dce:InspectorInfo">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:if test="cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="cat_ru:PersonMiddleName"/>
										</xsl:if>
										<xsl:if test="cat_ru:PersonPost">
											<xsl:text>, </xsl:text>
											<xsl:value-of select="cat_ru:PersonPost"/>
										</xsl:if>
										<xsl:if test="dce:LNP">
											<xsl:text>, ЛНП: </xsl:text>
											<xsl:value-of select="dce:LNP"/>
										</xsl:if>
										<xsl:if test="dce:Phone">
											<xsl:text>, Номер служебного телефона: </xsl:text>
											<xsl:value-of select="dce:Phone"/>
										</xsl:if>
									</xsl:for-each>
									<br/>
									<xsl:apply-templates select="dce:InitiatorDecision"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="2">
									<xsl:text>(фамилия, имя, отчество (при наличии), должность, наименование таможенного органа, выявшего необходимость применения меры по минимизации рисков: проведение таможенной экспертизы)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="4%">
									<xsl:text>2.</xsl:text>
								</td>
								<td width="96%" class="graphMain_value">
									<xsl:apply-templates select="dce:ReceivedDocuments"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="2">
									<xsl:text>(реквизиты декларации на товары, транзитной декларации, пассажирской таможенной декларации, декларации на транспортное средство, 
									иных документов в соответствии с пунктом 6 статьи 105 Таможенного кодекса Евразийского экономического союза, иных документов, полученных 
									при проведении таможенного контроля после выпуска товаров, а также таможенного контроля в соответствии с частями 4 и 5 статьи 214 Федерального закона 
									от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации")</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="4%" valign="top">
									<xsl:text>3.</xsl:text>
								</td>
								<td width="96%" valign="bottom">
									<xsl:text>Основания для проведения таможенной экспертизы: </xsl:text>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="graphMain_value">
									<xsl:for-each select="dce:Goods/dce:RiskProfile[generate-id(key('rows_RiskProfile',.)[1])=generate-id()]">
										<xsl:value-of select="dce:RiskProfileType"/>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="dce:TerrActionCode"/>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="dce:DivisionCode"/>
										<xsl:text>/</xsl:text>
										<xsl:call-template name="number_date">
											<xsl:with-param name="dateIn" select="dce:RiskProfileRegDate"/>
										</xsl:call-template>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="dce:RiskProfileNumber"/>
										<xsl:text>(</xsl:text>
										<xsl:value-of select="dce:RiskProfileNumberVersion"/>
										<xsl:text>)</xsl:text>
										<xsl:if test="position()!=last()">; </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="2">
									<xsl:text>(номер профиля риска)</xsl:text>
									<sup>1</sup>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="4%" valign="top">
									<xsl:text>4.</xsl:text>
								</td>
								<td width="96%" valign="bottom" align="justify" style="text-align: justify;">
									<xsl:text>В соответствии с пунктом 5 статьи 389 Таможенного кодекса Евразийского экономического союза</xsl:text>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<xsl:text>РЕШИЛ:</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="4%" valign="top">
									<xsl:text>5.</xsl:text>
								</td>
								<td width="18%" align="left">
									<xsl:text>Назначить</xsl:text>
								</td>
								<td width="45%" valign="top" align="center" class="graphMain_value">
									<xsl:choose>
										<xsl:when test="dce:CustomExpertiseKind='1'">
											<xsl:text>первичная</xsl:text>
										</xsl:when>
										<xsl:when test="dce:CustomExpertiseKind='2'">
											<xsl:text>дополнительная</xsl:text>
										</xsl:when>
										<xsl:when test="dce:CustomExpertiseKind='3'">
											<xsl:text>повторная</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="dce:CustomExpertiseKind"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td width="33%" align="right">
									<xsl:text>таможенную экспертизу</xsl:text>
								</td>
							</tr>
							<tr>
								<td colspan="2"/>
								<td align="center" class="graphLittle">
									<xsl:text>(первичная или дополнительная, или повторная)</xsl:text>
								</td>
								<td/>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="4%">
									<xsl:text>6.</xsl:text>
								</td>
								<td width="96%">
									<xsl:text>Поручить ее проведение: </xsl:text>
								</td>
							</tr>
							<tr>
								<td align="left" class="graphMain_value" colspan="2">
									<xsl:apply-templates select="dce:CEKTUDivision"/>
									<xsl:if test="dce:CEKTUDivision and dce:Executor">
										<br/>
									</xsl:if>
									<xsl:apply-templates select="dce:Executor"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="2">
									<xsl:text>(наименование уполномоченного таможенного органа, органа, проводящего таможенную экспертизу, иной экспертной организации, иного эксперта)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="4%">
									<xsl:text>7.</xsl:text>
								</td>
								<td width="96%">
									<xsl:choose>
										<xsl:when test="dce:Executor">
											<xsl:text>Поставить перед таможенным экспертом (экспертом) вопрос(ы):</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>Поставить перед таможенным экспертом вопрос(ы):</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:choose>
						<xsl:when test="dce:Question">
							<table>
								<tbody>
									<xsl:for-each select="dce:Question">
										<tr>
											<td width="4%"/>
											<td width="3%" valign="bottom">
												<xsl:value-of select="dce:QuestionNumber"/>
												<xsl:text>.</xsl:text>
											</td>
											<td width="93%" class="graphMain_value" align="justify" style="text-align: justify;">
												<xsl:value-of select="dce:QuestionText"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:when>
						<xsl:otherwise>
							<table>
								<tbody>
									<tr>
										<td width="4%"/>
										<td width="3%" valign="bottom">
											<xsl:text>1.</xsl:text>
										</td>
										<td width="93%" class="graphMain_value"/>
									</tr>
								</tbody>
							</table>
						</xsl:otherwise>
					</xsl:choose>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="4%" valign="top">
									<xsl:text>8.</xsl:text>
								</td>
								<td width="96%" align="justify" style="text-align: justify;">
									<xsl:text>В распоряжение таможенного эксперта (эксперта) предоставить материалы, документы, пробы и (или) образцы товаров:</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td width="4%"/>
								<td width="3%"/>
								<td width="3%"/>
								<td width="90%"/>
							</tr>
							<xsl:choose>
								<xsl:when test="dce:Goods">
									<xsl:for-each select="dce:Goods">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td colspan="4">
											<br/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="dce:Goods">
							</xsl:if>
							<tr>
								<td class="graphMain_value" colspan="4"/>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="4">
									<xsl:text>(наименование товаров, указанных в декларации на товары или иных документах, подлежащих отбору)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td class="graphDelim_1">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graphMain_value">
									<xsl:apply-templates select="dce:PresentedDocuments"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									<xsl:text>(перечень документов: декларация на товары, транзитная декларация, пассажирская таможенная декларация, декларация на транспортное средство, иные документы, предоставляемые вместе с решением о назначении таможенной экспертизы)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td width="4%">
									<br/>
								</td>
								<td width="2%"/>
								<td width="94%"/>
							</tr>
							<tr>
								<td valign="top">
									<xsl:text>9.</xsl:text>
								</td>
								<td colspan="2" align="justify" style="text-align: justify;">
									<xsl:text>Видоизменение, частичное или полное уничтожение, разрушение материалов, документов, проб и (или) образцов товаров исследования:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td class="bordered" align="center">
													<xsl:choose>
														<xsl:when test="dce:DestructionResolution='1' or dce:DestructionResolution='true' or dce:DestructionResolution='t' or dce:DestructionResolution='TRUE'">
															<xsl:text>X</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text> </xsl:text><br/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td/>
								<td>
									<xsl:text>Разрешить</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td class="bordered" align="center">
													<xsl:choose>
														<xsl:when test="not(dce:DestructionResolution='1' or dce:DestructionResolution='true' or dce:DestructionResolution='t' or dce:DestructionResolution='TRUE')">
															<xsl:text>X</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text> </xsl:text><br/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td/>
								<td>
									<xsl:text>НЕ Разрешить</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td width="4%">
									<br/>
								</td>
								<td width="2%"/>
								<td width="94%"/>
							</tr>
							<tr>
								<td valign="top">
									<xsl:text>10.</xsl:text>
								</td>
								<td colspan="2">
									<xsl:text>Произвел следующие действия (в случае отсутствия технологии удаленного выпуска):</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td class="bordered" align="center">
													<xsl:choose>
														<xsl:when test="dce:ExpertActions='1' and (dce:IndSelf='1' or dce:IndSelf='true' or dce:IndSelf='t' or dce:IndSelf='TRUE')">
															<xsl:text>X</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text> </xsl:text><br/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td/>
								<td>
									<xsl:text>Отобрал пробы и (или) образцы товара</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td class="bordered" align="center">
													<xsl:choose>
														<xsl:when test="dce:ExpertActions='2' and (dce:IndSelf='1' or dce:IndSelf='true' or dce:IndSelf='t' or dce:IndSelf='TRUE')">
															<xsl:text>X</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text> </xsl:text><br/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td/>
								<td align="justify" style="text-align: justify;">
									<xsl:text>Произвел изъятие таможенных, транспортных (перевозочных), коммерческих и иных документов</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td class="bordered" align="center">
													<xsl:choose>
														<xsl:when test="dce:ExpertActions='3' and (dce:IndSelf='1' or dce:IndSelf='true' or dce:IndSelf='t' or dce:IndSelf='TRUE')">
															<xsl:text>X</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text> </xsl:text><br/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td/>
								<td>
									<xsl:text>Произвел изъятие средств идентификации</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<!--xsl:if test="not(dce:IndSelf='1' or dce:IndSelf='true' or dce:IndSelf='t' or dce:IndSelf='TRUE')"-->
						<table>
							<tbody>
								<tr>
									<td width="15%">
										<br/>
									</td>
									<td width="85%"/>
								</tr>
								<tr>
									<td align="center" colspan="2">
										<xsl:text>ПОРУЧИЛ</xsl:text>
										<sup>2</sup>
										<xsl:text>:</xsl:text>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="graphDelim_1">
										<br/>
									</td>
								</tr>
								<tr>
									<td class="graphMain_value" colspan="2">
										<xsl:choose>
											<xsl:when test="not(dce:IndSelf='1' or dce:IndSelf='true' or dce:IndSelf='t' or dce:IndSelf='TRUE')">
												<xsl:apply-templates select="dce:CustomsFact"/>
											</xsl:when>
											<xsl:otherwise> <br/></xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" colspan="2">
										<xsl:text>(наименование, код таможенного органа)</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text>В срок до</xsl:text>
									</td>
									<td class="graphMain_value">
										<xsl:choose>
											<xsl:when test="not(dce:IndSelf='1' or dce:IndSelf='true' or dce:IndSelf='t' or dce:IndSelf='TRUE')">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="dce:ActThievingDate"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise> <br/></xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td/>
									<td align="center" class="graphLittle">
										<xsl:text>(указывается срок, до которого должны быть произведены действия и составлены документы)</xsl:text>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="graphDelim_1">
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td width="4%"/>
									<td width="2%"/>
									<td width="94%"/>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td class="bordered" align="center">
														<xsl:choose>
															<xsl:when test="dce:ExpertActions='1' and not(dce:IndSelf='1' or dce:IndSelf='true' or dce:IndSelf='t' or dce:IndSelf='TRUE')">
																<xsl:text>X</xsl:text>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> </xsl:text><br/>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td/>
									<td>
										<xsl:text>Отобрать пробы и (или) образцы товара</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td class="bordered" align="center">
														<xsl:choose>
															<xsl:when test="dce:ExpertActions='2' and not(dce:IndSelf='1' or dce:IndSelf='true' or dce:IndSelf='t' or dce:IndSelf='TRUE')">
																<xsl:text>X</xsl:text>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> </xsl:text><br/>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td/>
									<td align="justify" style="text-align: justify;">
										<xsl:text>Произвести изъятие таможенных, транспортных (перевозочных), коммерческих и иных документов</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td class="bordered" align="center">
														<xsl:choose>
															<xsl:when test="dce:ExpertActions='3' and not(dce:IndSelf='1' or dce:IndSelf='true' or dce:IndSelf='t' or dce:IndSelf='TRUE')">
																<xsl:text>X</xsl:text>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> </xsl:text><br/>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td/>
									<td>
										<xsl:text>Произвести изъятие средств идентификации</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					<!--/xsl:if-->
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="4%" valign="top">
									<xsl:text>11.</xsl:text>
								</td>
								<td width="96%" valign="top" align="justify" style="text-align: justify;">
									<xsl:text>Доставить пробы и (или) образцы товара, изъятые таможенные, транспортные (перевозочные), 
									коммерческие и иные документы, средства идентификации таких товаров и документов в уполномоченный 
									таможенный орган, проводящий таможенную экспертизу (иную экспертную организацию, иного эксперта) /
									предоставить образец товара к осмотру по месту нахождения/в срок до&#160;</xsl:text>
									<u>&#160;&#160;
									<xsl:choose>
											<xsl:when test="dce:DeliveryDate">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="dce:DeliveryDate"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
										</xsl:choose>
									&#160;&#160;</u>
									<xsl:text>.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="4%" valign="top">
									<xsl:text>12.</xsl:text>
								</td>
								<td width="96%" valign="top" align="justify" style="text-align: justify;">
									<xsl:text>Получить неизрасходованные в результате экспертизы пробы и (или) образцы товаров, изъятые таможенные, 
									транспортные (перевозочные), коммерческие и иные документы, средства идентификации таких товаров и документов в срок&#160;</xsl:text>
									<u>&#160;&#160;
									<xsl:choose>
											<xsl:when test="dce:ReturnDate">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="dce:ReturnDate"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
										</xsl:choose>
									&#160;&#160;</u>
									<xsl:text> с момента получения уведомления о выполнении экспертизы.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>Уполномоченное должностное лицо таможенного органа:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="graphMain_value">
									<xsl:for-each select="dce:InspectorInfo">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:if test="cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="cat_ru:PersonMiddleName"/>
										</xsl:if>
										<xsl:if test="cat_ru:PersonPost">
											<xsl:text>, </xsl:text>
											<xsl:value-of select="cat_ru:PersonPost"/>
										</xsl:if>
										<xsl:if test="dce:LNP">
											<xsl:text>, ЛНП: </xsl:text>
											<xsl:value-of select="dce:LNP"/>
										</xsl:if>
										<xsl:if test="dce:Phone">
											<xsl:text>, Номер служебного телефона: </xsl:text>
											<xsl:value-of select="dce:Phone"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									<xsl:text>(фамилия, имя, отчество (при наличии), должность)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="2%" class="graphMain_value"/>
								<td width="23%" class="graphMain_value"/>
								<td width="75%"/>
							</tr>
							<tr>
								<td class="graphLittle">
									<sup>1</sup>
								</td>
								<td colspan="2" class="graphLittle">
									<xsl:text>Указывается в случае назначения таможенной экспертизы в рамках реализации системы управления рисками.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									<sup>2</sup>
								</td>
								<td colspan="2" class="graphLittle">
									<xsl:text>Поручение формируется в случае применения технологии удаленного выпуска.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="dce:CustomsFact">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CustomsCountryCode">
			<xsl:text> (код страны: </xsl:text>
			<xsl:value-of select="cat_ru:CustomsCountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа dce:PresentedDocumentsType -->
	<xsl:template match="dce:ReceivedDocuments | dce:PresentedDocuments">
		<xsl:apply-templates select="dce:GTDNumber"/>
		<xsl:if test="dce:Document">, </xsl:if>
		<xsl:for-each select="dce:Document">
			<xsl:for-each select="./*">
				<xsl:choose>
					<xsl:when test="local-name(.)='PrDocumentNumber'">
						<xsl:text>№ </xsl:text>
						<xsl:value-of select="."/>
					</xsl:when>
					<xsl:when test="local-name(.)='PrDocumentDate'">
						<xsl:text>от </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="."/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="."/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="position()!=last()">
					<xsl:text> </xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа dce:DecisionNumberType -->
	<xsl:template match="dce:DecisionNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="number_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<!--xsl:choose>
			<xsl:when test="dce:ExpertisePoint='ДВ'">
				<xsl:text>до выпуска ДТ</xsl:text>
			</xsl:when>
			<xsl:when test="dce:ExpertisePoint='ПВ'">
				<xsl:text>после выпуска ДТ</xsl:text>
			</xsl:when>
			<xsl:otherwise-->
		<xsl:value-of select="dce:ExpertisePoint"/>
		<!--/xsl:otherwise>
		</xsl:choose-->
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:SerialNumber"/>
	</xsl:template>
	<!-- Шаблон для типа dce:GoodsType -->
	<xsl:template match="dce:Goods">
		<tr>
			<td class="graphDelim_1" colspan="4">
				<br/>
			</td>
		</tr>
		<tr>
			<td/>
			<td valign="top">
				<xsl:value-of select="dce:ListNumeric"/>
				<xsl:text>.</xsl:text>
			</td>
			<td colspan="2" align="justify">
				<xsl:if test="dce:GoodsNumeric">
					<xsl:text>№ товара в исх.документе: </xsl:text>
					<xsl:value-of select="dce:GoodsNumeric"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="dce:TNVEDGroup">
					<xsl:text>(Группа ТН ВЭД ЕАЭС: </xsl:text>
					<xsl:value-of select="dce:TNVEDGroup"/>
					<xsl:text>) </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="dce:GoodsDescription"/>
			</td>
		</tr>
		<xsl:if test="dce:RiskProfile">
			<xsl:for-each select="dce:RiskProfile">
				<tr>
					<td class="graphDelim_1" colspan="4">
						<br/>
					</td>
				</tr>
				<tr>
					<td colspan="3"/>
					<td align="justify">
						<xsl:text>Профиль риска: </xsl:text>
						<xsl:value-of select="dce:RiskProfileType"/>
						<xsl:choose>
							<xsl:when test="dce:RiskProfileType='0'">
								<xsl:text> (автоматически выявленный риск, проставляется программным средством в автоматическом режиме)</xsl:text>
							</xsl:when>
							<xsl:when test="dce:RiskProfileType='1'">
								<xsl:text> (самостоятельно выявленный риск, проставляется программным средством в автоматическом режиме при внесении должностным лицом таможенного поста новой записи (в том числе, при применении "рамочных" ПР  и ПР по информации правоохранительных подразделений))</xsl:text>
							</xsl:when>
							<xsl:when test="dce:RiskProfileType='2'">
								<xsl:text> (риск, выявленный в автоматизированном режиме, требует принятия окончательного решения должностным лицом таможенного поста (значение является промежуточным, наличие значения "2" в отчете блокирует переход к следующему этапу проверки на риски либо выпуск ДТ))</xsl:text>
							</xsl:when>
							<xsl:when test="dce:RiskProfileType='3'">
								<xsl:text> (риск, выявленный в автоматизированном режиме, по которому должностным лицом таможенного поста на основании проверки неформализованных индикаторов риска принято решение - "Риск выявлен")</xsl:text>
							</xsl:when>
							<xsl:when test="dce:RiskProfileType='4'">
								<xsl:text> (риск, выявленный в автоматизированном режиме, по которому должностным лицом таможенного поста на основании проверки неформализованных индикаторов риска принято решение - "Риск не выявлен")</xsl:text>
							</xsl:when>
							<xsl:when test="dce:RiskProfileType='5'">
								<xsl:text> (резерв)</xsl:text>
							</xsl:when>
							<xsl:when test="dce:RiskProfileType='6'">
								<xsl:text> (профиль риска не применяется по причине упрощенного контроля таможенной стоимости идентичных товаров)</xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:text>, Код вида профиля риска: </xsl:text>
						<xsl:value-of select="dce:TerrActionCode"/>
						<xsl:choose>
							<xsl:when test="dce:TerrActionCode='11'">
								<xsl:text> (общероссийский профиль риска)</xsl:text>
							</xsl:when>
							<xsl:when test="dce:TerrActionCode='12'">
								<xsl:text> (региональный профиль риска)</xsl:text>
							</xsl:when>
							<xsl:when test="dce:TerrActionCode='13'">
								<xsl:text> (зональный профиль риска)</xsl:text>
							</xsl:when>
							<xsl:when test="dce:TerrActionCode='20'">
								<xsl:text> (целевой профиль риска)</xsl:text>
							</xsl:when>
							<xsl:when test="dce:TerrActionCode='21'">
								<xsl:text> (целевой правоохранительный профиль риска)</xsl:text>
							</xsl:when>
							<xsl:when test="dce:TerrActionCode='32'">
								<xsl:text> (профиль риска на основе моделей)</xsl:text>
							</xsl:when>
							<xsl:when test="dce:TerrActionCode='55'">
								<xsl:text> (профиль риска, обязательный к применению)</xsl:text>
							</xsl:when>
							<xsl:when test="dce:TerrActionCode='77'">
								<xsl:text> (профиль риска для идентификации категории уровня риска)</xsl:text>
							</xsl:when>
							<xsl:when test="dce:TerrActionCode='88'">
								<xsl:text> (зависимый профиль риска)</xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:text>, Код ТО, разработавшего ПР/ЦПР: </xsl:text>
						<xsl:value-of select="dce:DivisionCode"/>
						<xsl:text>, Дата регистрации ПР: </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="dce:RiskProfileRegDate"/>
						</xsl:call-template>
						<xsl:text>, № п/п: </xsl:text>
						<xsl:value-of select="dce:RiskProfileNumber"/>
						<xsl:text> (</xsl:text>
						<xsl:value-of select="dce:RiskProfileNumberVersion"/>
						<xsl:text>)</xsl:text>
						<xsl:if test="position()!=last()">
							<xsl:text>;</xsl:text>
						</xsl:if>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об отсутствии НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
	<xsl:template match="dce:Executor">
		<xsl:if test="cat_ru:OrganizationLanguage">
			Язык заполнения: <xsl:value-of select="cat_ru:OrganizationLanguage"/>
			<br/>
		</xsl:if>
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<br/>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа dce:CEKTUDivisionType -->
	<xsl:template match="dce:CEKTUDivision">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='CustomsCode'">
					<xsl:text>код: </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='CustomsCode'">
					<xsl:text>наименование: </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='CustomsCode'">
					<xsl:text>адрес: </xsl:text>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="local-name()='BranchNotEKSSign'">
					<xsl:choose>
						<xsl:when test=".='0' or .='false' or .='FALSE' or .='f'">подразделение не обособленное или в составе ЭКС</xsl:when>
						<xsl:otherwise>подразделение не обособленное или в составе ЭКС</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="dce:GTDNumber">
		<xsl:variable name="CustCode" select="cat_ru:CustomsCode"/>
		<xsl:variable name="date">
			<xsl:call-template name="number_date">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="gdtNum" select="cat_ru:GTDNumber"/>
		<xsl:value-of select="concat($CustCode,'/',$date,'/',$gdtNum)"/>
	</xsl:template>
	<!-- Шаблон для типа dce:InitiatorDecisionType -->
	<xsl:template match="dce:InitiatorDecision">
		<xsl:value-of select="dce:Name"/>
		<xsl:if test="dce:CustomsCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="dce:CustomsCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:value-of select="dce:Address"/>
	</xsl:template>
	<!-- Шаблон для типа dce:PersonType -->
	<xsl:template match="dce:InspectorInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:PersonName"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Отчество</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:PersonMiddleName"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Должность</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:PersonPost"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ЛНП инспектора</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:LNP"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер служебного телефона</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:Phone"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа dce:QuestionType -->
	<xsl:template match="dce:Question">
		<tr>
			<td width="2%"/>
			<td>
				<xsl:text>    </xsl:text>
				<xsl:value-of select="dce:QuestionNumber"/>
				<xsl:text>. </xsl:text>
				<xsl:value-of select="dce:QuestionText"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="monthword_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:variable name="month" select="substring($dateIn,6,2)"/>
				<xsl:choose>
					<xsl:when test="substring($dateIn,6,2)='01'">января</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='02'">февраля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='03'">марта</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='04'">апреля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='05'">мая</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='06'">июня</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='07'">июля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='08'">августа</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='09'">сентября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='10'">октября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='11'">ноября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='12'">декабря</xsl:when>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="number_date">
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
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0 and substring($date,1,10)!='0001-01-01'">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;<u>
					<xsl:value-of select="substring($date,9,2)"/>
				</u>&#34;
				&#160;<u>&#160;
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
				</u>&#160;<xsl:value-of select="substring($date,1,2)"/>
				<u>
					<xsl:value-of select="substring($date,3,2)"/>
				</u>&#160;г.
			</xsl:when>
			<xsl:otherwise>
				&#34;<u>&#160;&#160;&#160;&#160;&#160;</u>&#34;
				&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
