<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.13.2" xmlns:dpaf="urn:customs.ru:Information:CustomsAuditDocuments:DecisionPerformAuditField:5.13.2" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0">
	<!-- Шаблон для типа DecisionPerformAuditFieldType -->
	<xsl:template match="dpaf:DecisionPerformAuditField">
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
									font-style: italic;
									}
									
									.descr{
										font-size: 8pt;
										text-align: center;
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
				<div class="page">
					<xsl:choose>
						<xsl:when test="not(dpaf:ReasonChange)">
							<table width="100%">
								<tbody>
									<tr align="center">
										<td>
											<b>РЕШЕНИЕ</b>
											<br/>
									о проведении выездной таможенной проверки
								</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td>В соответствии со статьей 333 Таможенного кодекса Евразийского экономического союза</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates mode="type1" select="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson"/>
										</td>
									</tr>
									<tr>
										<td class="descr">(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) начальника (заместителя начальника) таможенного органа или лица, их замещающего)</td>
									</tr>
									<tr>
										<td>РЕШИЛ:</td>
									</tr>
									<tr valign="top">
										<td>
											<table>
												<tr valign="top">
													<td width="25%">
														<xsl:text>1. На основании </xsl:text>
													</td>
													<td width="75%" class="value" align="center">
														<xsl:value-of select="dpaf:Reason"/>
													</td>
												</tr>
												<tr valign="top">
													<td width="25%" class="descr"> </td>
													<td width="75%" class="descr" align="center">(ссылка на пункт плана проверок либо на соответствующий подпункт пункта 16 статьи 333 Таможенного кодекса Евразийского экономического союза)
													</td>
												</tr>
											</table>
										</td>	
									</tr>
									<tr>
										<td><br/></td>
									</tr>
									<tr valign="top">
										<td>
											<table>
												<tr valign="top">
													<td width="15%">
														<xsl:text>назначить</xsl:text>
													</td>
													<td width="40%" class="value" align="center">
														<xsl:choose>
															<xsl:when test="dpaf:AuditFieldKind=1">плановую</xsl:when>
															<xsl:when test="dpaf:AuditFieldKind=2">внеплановую</xsl:when>
															<xsl:when test="dpaf:AuditFieldKind=3">встречную внеплановую</xsl:when>
														</xsl:choose>
													</td>
													<td width="2%"> </td>
													<td width="45%">
														<xsl:text>выездную таможенную проверку</xsl:text>
													</td>
												</tr>
												<tr valign="top">
													<td width="15%" class="descr"> </td>
													<td width="40%" class="descr" align="center">указывается вид выездной таможенной проверки<br/>(плановая/внеплановая/встречная внеплановая)
													<td width="2%" class="descr"> </td>
													<td width="45%" class="descr"> </td>
													</td>
												</tr>
											</table>
										</td>	
									</tr>
									<tr>
										<td>
											<br/>
											<xsl:text>в отношении </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="dpaf:AuditOrganization"/>
										</td>
									</tr>
									<tr>
										<td class="descr">
										(наименование, ОГРН, ИНН, КПП юридического лица/фамилия, имя, отчество (отчество указывается при наличии), ОГРНИП, ИНН индивидуального предпринимателя; место нахождения, место фактического осуществления деятельности)
										</td>
									</tr>
									<tr>
										<table>
											<tr>
												<td>
													<xsl:text>предмет выездной таможенной проверки </xsl:text>
												</td>
												<td>
													<td class="value" align="center">
														<xsl:apply-templates select="dpaf:AuditSubject"/>
													</td>
												</td>	
											</tr>
											<tr class="descr">
												<td>
													<xsl:text> </xsl:text>
												</td>
												<td>
													<td align="center">(указывается в соответствии с пунктом 6 статьи 331 Таможенного кодекса Евразийского экономического союза)</td>
												</td>	
											</tr>
										</table>
									</tr>
									<tr>
										<td>
											<br/>
											<xsl:text>проверяемый период </xsl:text>
											<span class="value">
												<xsl:if test="dpaf:AuditPeriod/adt_cat:BeginAuditPeriodDate">
													<xsl:text> с </xsl:text>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="dpaf:AuditPeriod/adt_cat:BeginAuditPeriodDate"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="dpaf:AuditPeriod/adt_cat:EndAuditPeriodDate">
													<xsl:text> по </xsl:text>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="dpaf:AuditPeriod/adt_cat:EndAuditPeriodDate"/>
													</xsl:call-template>
												</xsl:if>
											</span>
											<br/>
											<xsl:text>номера таможенных деклараций </xsl:text>
											<table style="display: inline-table; width: 100%;">
												<tbody>
													<tr>
														<td class="value">
															<xsl:for-each select="dpaf:DTNumber">
																<xsl:apply-templates select="."/>
																<xsl:if test="position()!=last()"><br/></xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="descr">(номера указываются, если выездная таможенная проверка проводится после выпуска товаров)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td><br/>
											<xsl:text>2. Поручить проведение выездной таможенной проверки должностным лицам таможенного органа:</xsl:text><br/><br/><xsl:text>Руководитель проверки:</xsl:text>
											<br/>
											<table>
												<tbody>
													<tr>
														<td width="1%">1)</td>
														<td class="value">
															<xsl:apply-templates select="dpaf:ChiefAudit"/>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="descr">(фамилия, имя, отчество (отчество указывается при наличии), должность, номер служебного удостоверения руководителя проверки)</td>
													</tr>
													<xsl:for-each select="dpaf:ListCommission">
														<tr>
															<td width="1%">
																<xsl:value-of select="position() + 1"/>)</td>
															<td class="value">
																<xsl:apply-templates select="."/>
															</td>
														</tr>
														<xsl:if test="position()=1">
															<tr>
																<td/>
																<td class="descr">(фамилии, имена, отчества (отчества указываются при наличии), должности, номера служебных удостоверений должностных лиц таможенного органа, проводящих выездную таможенную проверку)</td>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</tbody>
											</table>
											<br/>
											<xsl:text>3. Должностные лица, привлекаемые для участия в проведении выездной таможенной проверки:</xsl:text>
											<table width="100%">
												<tbody>
													<xsl:for-each select="dpaf:ListAttractedPersons">
														<tr>
															<td width="1%">
																<xsl:value-of select="position()"/>)</td>
															<td class="value">
																<xsl:apply-templates select="."/>
															</td>
														</tr>
														<xsl:if test="position()=1">
															<tr>
																<td/>
																<td class="descr">(фамилии, имена, отчества (отчества указываются при наличии), должности должностных лиц)</td>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td>Начальник (заместитель начальника)<br/>таможенного органа</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value" width="30%">
															<xsl:value-of select="dpaf:CustomsIssuedDecision/cat_ru:OfficeName"/>
														</td>
														<td/>
														<td class="value" width="30%"/>
														<td/>
														<td class="value" width="30%">
															<xsl:value-of select="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>
															<xsl:if test="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonName">
																<xsl:text> </xsl:text>
																<xsl:value-of select="substring(dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonName,1, 1)"/>
																<xsl:text>. </xsl:text>
															</xsl:if>
															<xsl:if test="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonMiddleName">
																<xsl:value-of select="substring(dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonMiddleName,1, 1)"/>
																<xsl:text>.</xsl:text>
															</xsl:if>
														</td>
													</tr>
													<tr valign="top">
														<td class="descr">(наименование таможенного органа)</td>
														<td/>
														<td class="descr">(подпись)</td>
														<td/>
														<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%">
								<tbody>
									<tr>
										<td>
											<xsl:text>Экземпляр решения от </xsl:text>
											<xsl:call-template name="DateStr">
												<xsl:with-param name="date" select="dpaf:DecisionNumber/adt_cat:Date"/>
											</xsl:call-template>
											&#160;№&#160;<u>&#160;<xsl:value-of select="dpaf:DecisionNumber/adt_cat:Number"/>&#160;</u>&#160;
											<xsl:text> о проведении выездной таможенной проверки получил.</xsl:text>
											<br/>
											<xsl:text>О правах и обязанностях проверяемого лица при проведении таможенного контроля после выпуска товара в соответствии со статьей 336 Таможенного кодекса Евразийского экономического союза и статьями 235, 236 Федерального закона от ____________ № _______ «О таможенном регулировании», а также о правах и обязанностях должностных лиц таможенного органа при проведении таможенной проверки в соответствии со статьей 335 Таможенного кодекса Евразийского экономического союза и статьей 231 Федерального закона от _____________ № _______ «О таможенном регулировании» проинформирован.</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
											<table>
												<tbody>
													<tr class="value" align="center">
														<td width="45%" align="left">
															<xsl:call-template name="Date">
																<xsl:with-param name="date" select="dpaf:SecExempDate"/>
															</xsl:call-template>
														</td>
														<td width="25%" align="left">
															<xsl:call-template name="Time">
																<xsl:with-param name="time" select="dpaf:SecExempTime"/>
															</xsl:call-template>
														</td>
														<td width="30%" align="left">
														</td>
													</tr>
													<tr>
														<td class="descr" colspan="2">(дата и время получения экземпляра решения)</td>
														<td class="descr"></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<table width="100%">
												<tbody>
													<tr>
														<td>Руководитель (представитель) проверяемого лица:</td>
													</tr>
													<tr>
														<td class="value">
															<xsl:apply-templates select="dpaf:SecondExempReceived"/>
														</td>
													</tr>
													<tr>
														<td class="descr">(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность лица, получившего копию решения)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="right">
											<table width="30%" style="display:inline-table;">
												<tbody>
													<tr>
														<td width="70%">
															<br/>
															<br/>
														</td>
														<td class="value" width="30%"/>
													</tr>
													<tr>
														<td width="70%"/>
														<td class="descr">(подпись)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td>Отметки должностных лиц таможенного органа:</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:value-of select="dpaf:RefusalMark/dpaf:RefusalMark"/>
											<xsl:text> </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="dpaf:RefusalMark/dpaf:RefusalMark"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="descr">(запись об отказе в получении копии решения о проведении выездной таможенной проверки, запись о дате поступления в таможенный орган почтового отправления с отметкой о невручении письма адресату)</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody class="graphMain">
													<tr>
														<td width="45%" align="left">
															<xsl:call-template name="Date">
																<xsl:with-param name="date" select="dpaf:RefusalMark/cat_ru:IssueDate"/>
															</xsl:call-template>
														</td>
														<td width="55%"> </td>
													</tr>
													<tr class="graphLittle">
														<td width="45%"> </td>
														<td  width="55%"> </td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td><br/></td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value" width="30%">
															<xsl:value-of select="dpaf:RefusalMark/cat_ru:PersonPost"/>
														</td>
														<td/>
														<td class="value" width="30%"/>
														<td/>
														<td class="value" width="30%">
															<xsl:value-of select="dpaf:RefusalMark/cat_ru:PersonSurname"/>
															<xsl:if test="dpaf:RefusalMark/cat_ru:PersonName">
																<xsl:text> </xsl:text>
																<xsl:value-of select="substring(dpaf:RefusalMark/cat_ru:PersonName,1, 1)"/>
																<xsl:text>. </xsl:text>
															</xsl:if>
															<xsl:if test="dpaf:RefusalMark/cat_ru:PersonMiddleName">
																<xsl:value-of select="substring(dpaf:RefusalMark/cat_ru:PersonMiddleName,1, 1)"/>
																<xsl:text>.</xsl:text>
															</xsl:if>
														</td>
													</tr>
													<tr valign="top">
														<td class="descr">(наименование таможенного органа)</td>
														<td/>
														<td class="descr">(подпись)</td>
														<td/>
														<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<!--br/>
							<table>
								<tbody>
									<tr>
										<td>Понятые:</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<xsl:for-each select="dpaf:Witnesses">
														<tr>
															<td width="1%">
																<xsl:value-of select="position()"/>)</td>
															<td class="value">
																<xsl:apply-templates select="."/>
																<xsl:text> </xsl:text>
																<xsl:value-of select="dpaf:AddressText"/>
															</td>
														</tr>
														<xsl:if test="position()=1">
															<tr>
																<td/>
																<td class="descr">(фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность, место жительства)</td>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/-->
							<xsl:for-each select="dpaf:StopProlongMark">
								<br/>
								<br/>
								<xsl:choose>
									<xsl:when test="dpaf:MarkKind=1">
										<xsl:text>Проведение таможенной проверки приостановлено с </xsl:text>
									</xsl:when>
									<xsl:when test="dpaf:MarkKind=2">
										<xsl:text>Проведение таможенной проверки возобновлено с </xsl:text>
									</xsl:when>
									<xsl:when test="dpaf:MarkKind=3">
										<xsl:text>Срок проведения таможенной проверки продлен на один месяц:</xsl:text>
									</xsl:when>
								</xsl:choose>
								<xsl:call-template name="DateStr">
									<xsl:with-param name="date" select="dpaf:Date"/>
								</xsl:call-template>
								<table>
									<tbody>
										<tr>
											<td class="value" width="30%">
												<xsl:value-of select="cat_ru:PersonPost"/>
											</td>
											<td/>
											<td class="value" width="30%"/>
											<td/>
											<td class="value" width="30%">
												<xsl:value-of select="cat_ru:PersonSurname"/>
												<xsl:if test="cat_ru:PersonName">
													<xsl:text> </xsl:text>
													<xsl:value-of select="substring(cat_ru:PersonName,1, 1)"/>
													<xsl:text>. </xsl:text>
												</xsl:if>
												<xsl:if test="cat_ru:PersonMiddleName">
													<xsl:value-of select="substring(cat_ru:PersonMiddleName,1, 1)"/>
													<xsl:text>.</xsl:text>
												</xsl:if>
											</td>
										</tr>
										<tr valign="top">
											<td class="descr">(наименование таможенного органа)</td>
											<td/>
											<td class="descr">(подпись)</td>
											<td/>
											<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
										</tr>
										<tr>
											<td>
												<table>
													<tbody class="graphMain">
														<tr>
															<td width="45%" align="left">
																<xsl:call-template name="Date">
																	<xsl:with-param name="date" select="cat_ru:IssueDate"/>
																</xsl:call-template>
															</td>
															<td width="55%"> </td>
														</tr>
														<tr class="graphLittle">
															<td width="45%"> </td>
															<td  width="55%"> </td>
														</tr>
													</tbody>
												</table>
											</td>
											<td/>
											<td/>
											<td/>
											<td/>
										</tr>
									</tbody>
								</table>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<table width="100%">
								<tbody>
									<tr>
										<td align="center">
											МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ
											<br/>
											(МИНФИН РОССИИ)
											<br/>
											<br/>
											ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:value-of select="dpaf:CustomsIssuedDecision/cat_ru:OfficeName"/>
											<xsl:if test="dpaf:CustomsIssuedDecision/cat_ru:OfficeName">
												&#160;(
											</xsl:if>
											<xsl:value-of select="dpaf:CustomsIssuedDecision/cat_ru:Code"/>
											<xsl:if test="dpaf:CustomsIssuedDecision/cat_ru:OfficeName">
												)
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" style="font-weight:bold;">
											<br/>
											<br/>
											РЕШЕНИЕ 
											<br/>
											о внесении изменений (дополнений)
											<br/>
											в решение о проведении выездной таможенной проверки
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td align="left">
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="dpaf:DecisionNumber/adt_cat:Date"/></xsl:call-template>
										</td>
										<td align="right">
											<xsl:text>№ </xsl:text>
											<xsl:value-of select="dpaf:DecisionNumber/adt_cat:Number"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/><br/>
							<table>
								<tbody>
									<tr>
										<td>
											1. Вводная часть.
										</td>
									</tr>
									<tr>
										<td>
											1.1. Должностное лицо таможенного органа, принявшее решение:
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson" mode="type1"/>
										</td>
									</tr>
									<tr>
										<td>
											1.2. Основание (основания) для внесения изменений:
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:value-of select="dpaf:ReasonChange"/>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											2. Резолютивная часть.
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>На основании изложенного, руководствуясь статьей 229 Федерального закона от _____________ № ____________ «О таможенном регулировании», решено:</xsl:text>
											<br/>
											<xsl:text>Внести в решение о проведении выездной таможенной проверки</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="5%">
															<xsl:text>от</xsl:text>
														</td>
														<td width="30%" class="value" align="center">
															<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="dpaf:PrevDecisionNumber/adt_cat:Date"/></xsl:call-template>
														</td>
														<td width="10%" align="center">
															<xsl:text>№</xsl:text>
														</td>
														<td width="38%" class="value" align="center">
															<xsl:value-of select="dpaf:PrevDecisionNumber/adt_cat:Number"/>
														</td>
														<td width="2%" align="center">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
													<tr>
														<td width="5%" class="descr"> </td>
														<td width="30%" class="descr">(дата)</td>
														<td width="10%" class="descr"> </td>
														<td width="38%" class="descr">(номер)</td>
														<td width="2%" class="descr"> </td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="15%">
															<xsl:text>принятое   </xsl:text>
														</td>
														<td width="85%" class="value" align="center">
															<xsl:apply-templates select="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson" mode="type1"/>
														</td>
													</tr>
													<tr>
														<td width="15%" class="descr"> </td>
														<td width="85%" class="descr">(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) должностного лица таможенного органа, принявшего изменяемое (дополняемое) решение)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>2.1. Следующие изменения (дополнения):</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr valign="top" align="center">
														<td style="border: 1px solid black;" width="1%">№ п/п</td>
														<td style="border: 1px solid black;">Ранее указанные в строке сведения</td>
														<td style="border: 1px solid black;">Измененные и (или) дополненные сведения</td>
													</tr>
													<xsl:for-each select="dpaf:Changes">
														<tr valign="top">
															<td style="border: 1px solid black;">
																<xsl:value-of select="position()"/>
															</td>
															<td style="border: 1px solid black;">
																<xsl:apply-templates select="dpaf:PreviousText"/>
															</td>
															<td style="border: 1px solid black;">
																<xsl:apply-templates select="dpaf:ChangeText"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td class="value" width="30%">
											<xsl:value-of select="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonPost"/>
										</td>
										<td/>
										<td class="value" width="30%"/>
										<td/>
										<td class="value" width="30%">
											<xsl:value-of select="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>
											<xsl:if test="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonName">
												<xsl:text> </xsl:text>
												<xsl:value-of select="substring(dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonName,1, 1)"/>
												<xsl:text>. </xsl:text>
											</xsl:if>
											<xsl:if test="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonMiddleName">
												<xsl:value-of select="substring(dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonMiddleName,1, 1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
										</td>
									</tr>
									<tr valign="top">
										<td class="descr">(должность лица, принявшего решение)</td>
										<td/>
										<td class="descr">(подпись)</td>
										<td/>
										<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td width="43%">
											<xsl:text>3. Второй экземпляр решения с </xsl:text>
										</td>
										<td width="25%" class="value" align="center">
											<xsl:value-of select="dpaf:SecondExempReceived/adt_cat:AppendixNumber"/>
										</td>
										<td width="2%">
											<xsl:text> </xsl:text>
										</td>
										<td width="30%">
											<xsl:text> приложениями</xsl:text>
										</td>
									</tr>
									<tr>
										<td width="43%" class="descr"><br/></td>
										<td width="25%" class="descr">(количество приложений)</td>
										<td width="2%" class="descr"></td>
										<td width="30%" class="descr"> </td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td width="5%">
											<xsl:text>на </xsl:text>
										</td>
										<td width="20%" class="value" align="center">
											<xsl:value-of select="dpaf:SecondExempReceived/adt_cat:SheetsNumber"/>
										</td>
										<td width="2%">
											<xsl:text> </xsl:text>
										</td>
										<td width="73%">
											<xsl:text>листах получил:</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td width="60%" class="value">
											<xsl:apply-templates select="dpaf:SecondExempReceived"/>
										</td>
										<td></td>
										<td width="30%" class="value"></td>
									</tr>
									<tr>
										<td width="60%" class="descr">(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность лица,получившего второй экземпляр решения)</td>
										<td></td>
										<td width="30%" class="descr">(подпись)</td>
									</tr>
								</tbody>
							</table>
							<table style="width:30%">
								<tbody>
									<tr>
										<td class="value" align="center">
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="dpaf:SecExempDate"/></xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="descr"></td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td><br/>4. При направлении решения по почте:</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="dpaf:DirectionByPost/adt_cat:PostAddress"/>
										</td>
									</tr>
									<tr>
										<td class="descr">(почтовый адрес направления решения – указывается при направлении решения по почте)</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td width="40%" class="value">
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="dpaf:DirectionByPost/adt_cat:Date"/></xsl:call-template>
										</td>
										<td></td>
										<td width="50%" class="value">
											<xsl:value-of select="dpaf:DirectionByPost/cat_ru:PersonSurname"/>
											<xsl:if test="dpaf:DirectionByPost/cat_ru:PersonName">
												<xsl:text> </xsl:text>
												<xsl:value-of select="substring(dpaf:DirectionByPost/cat_ru:PersonName,1,1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
											<xsl:if test="dpaf:DirectionByPost/cat_ru:PersonMiddleName">
												<xsl:text> </xsl:text>
												<xsl:value-of select="substring(dpaf:DirectionByPost/cat_ru:PersonMiddleName,1,1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="descr">(дата направления решения по почте)</td>
										<td></td>
										<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) и подпись должностного лица таможенного органа, направившего решение по почте)</td>
									</tr>
								</tbody>
							</table>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="dpaf:SecondExempReceived|dpaf:Witnesses">
		<xsl:for-each select="cat_ru:PersonPost|cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="adt_cat:Passport|dpaf:Passport"/>
	</xsl:template>
	<xsl:template match="adt_cat:Passport|dpaf:Passport">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
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
	</xsl:template>
	<xsl:template match="dpaf:ChiefAudit|dpaf:ListCommission|dpaf:ListAttractedPersons">
		<xsl:for-each select="*">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="adt_cat:CustomsDept">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="adt_cat:ApproverPerson" mode="type1">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
	</xsl:template>
	<xsl:template match="adt_cat:FactAddress|RUScat_ru:SubjectAddressDetails|adt_cat:PostAddress">
		<xsl:for-each select="RUScat_ru:AddressKindCode|RUScat_ru:PostalCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="dpaf:AuditOrganization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="adt_cat:FactAddress">
			<xsl:text> фактический адрес: </xsl:text>
			<xsl:apply-templates select="adt_cat:FactAddress"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dpaf:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="number_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="number_date">
		<xsl:param name="dateIn"/>
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
<xsl:template name="Date">
	<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value"><xsl:value-of select="substring($date,9,2)"/></td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
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
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">20</td>
					<td width="9%" class="value" align="left"><xsl:value-of select="substring($date,3,2)"/></td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>	
	</xsl:template>
	
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
		&#160;&#160;<u>&#160;
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
		&#160;</u>&#160;&#160;20<u><xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
</xsl:template>
<xsl:template name="Time">
	<xsl:param name="time"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right"> </td>
					<td width="2%" align="right">в</td>
					<td width="2%" align="right"> </td>
					<td width="44%" class="value" align="center"><xsl:value-of select="substring(dpaf:SecExempTime,1, 2)"/></td>
					<td width="2%" align="right"> </td>
					<td width="2%" align="right">ч.</td>
					<td width="2%" align="right"> </td>
					<td width="44%" class="value" align="center"><xsl:value-of select="substring(dpaf:SecExempTime, 4, 2)"/></td>
					<td width="2%" align="right"> </td>
					<td width="2%" align="right">мин.</td>
				</tr>
			</tbody>
		</table>	
	</xsl:template>

</xsl:stylesheet>
