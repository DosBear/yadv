<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:dpaf="urn:customs.ru:Information:CustomsAuditDocuments:DecisionPerformAuditField:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<!--Приказ ФТС от 14.02.2019 № 258 "Об утверждении форм документов, составляемых таможенными органами при проведении таможенных проверок, порядков их заполнения и порядка внесения изменений в решение о проведении выездной таможенной проверки" (Приложения№ 1, 26)
	Приложение № 1 - Решение о проведении выездной таможенной проверки" not(dpaf:ReasonChange)
	Приложение № 26 - Решение о внесении изменений в решение о проведении выездной таможенной проверки" (dpaf:ReasonChange)-->
	<!-- Шаблон для типа DecisionPerformAuditFieldType -->
	<xsl:template match="dpaf:DecisionPerformAuditField">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									font-family: Arial;
									}

									div
									{
										/*white-space: nowrap;*/
									}

									div.page {
									width: 180mm;
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
									vertical-align: bottom;
									}
									
									.value_date
									{
									font-style: italic;
									}									
									
									.descr{
										font-size: 7pt;
										text-align: center;
										vertical-align: top;
									}
									
	
										.footnote{
										font-size: 7pt;
										text-align: left;
										vertical-align: top;
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
											<br/>
											<br/>
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
										<td style="text-indent: 5%">В соответствии со статьей 333 Таможенного кодекса Евразийского экономического союза <sup>
												<span class="descr">1</span>
											</sup>
										</td>
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
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>РЕШИЛ:</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
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
													<td width="75%" class="descr" align="center">
														<!--(ссылка на пункт плана проверок либо на соответствующий подпункт пункта 16 статьи 333 Таможенного кодекса Евразийского экономического союза)-->
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
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
													<td width="40%" class="descr" align="center">указывается вид выездной таможенной проверки (плановая/внеплановая/встречная внеплановая)
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
										(указываются сведения о проверяемом лице)
										</td>
									</tr>
									<tr>
										<table>
											<tr>
												<td>
													<xsl:text>предмет выездной таможенной проверки </xsl:text>
												</td>
											</tr>
											<tr>
												<td>
													<td class="value" align="center">
														<xsl:apply-templates select="dpaf:AuditSubject"/>
													</td>
												</td>
											</tr>
											<tr class="descr">
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
											<br/>
											<xsl:text>номера таможенных деклараций: </xsl:text>
											<table style="display: inline-table; width: 100%;">
												<tbody>
													<tr>
														<td class="value">
															<xsl:for-each select="dpaf:DTInfo">
																<xsl:apply-templates select="."/>
																<xsl:if test="position()!=last()">
																	<br/>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="descr">
															<!--(номера указываются, если выездная таможенная проверка проводится после выпуска товаров)-->
														</td>
													</tr>
												</tbody>
											</table>
											<br/>
											<br/>
											<xsl:text>иные сведения об объекте таможенного контроля</xsl:text>
											<table style="display: inline-table; width: 100%;">
												<tbody>
													<tr>
														<td class="value" width="99%">
															<xsl:for-each select="dpaf:OtherInfo">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">&#160;</xsl:if>
															</xsl:for-each>
														</td>
														<td width="1%" valign="bottom" align="right">
															<xsl:text>.</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<xsl:text>2. Поручить проведение выездной таможенной проверки должностным лицам таможенного органа:</xsl:text>
											<br/>
											<br/>
											<table>
												<tbody>
													<tr>
														<td width="99%">1) руководитель проверки:</td>
														<td width="1%"/>
														<tr>
													</tr>
														<td class="value">
															<xsl:apply-templates select="dpaf:ChiefAudit"/>
														</td>
														<td valign="bottom" align="right">
															<xsl:choose>
																<xsl:when test="dpaf:ListCommission">
																	<xsl:text>;</xsl:text>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text>.</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr>
														<td class="descr">(фамилия, имя, отчество (отчество указывается при наличии), должность, номер служебного удостоверения руководителя проверки)</td>
														<td/>
													</tr>
												</tbody>
											</table>
											<table>
												<tbody>
													<xsl:for-each select="dpaf:ListCommission">
														<tr>
															<td width="1%" valign="top">
																<xsl:value-of select="position() + 1"/>)
															</td>
															<td width="98%" class="value">
																<xsl:apply-templates select="."/>
															</td>
															<td width="1%" valign="bottom" align="right">
																<xsl:choose>
																	<xsl:when test="position()!=last()">
																		<xsl:text>;</xsl:text>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text>.</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</tr>
														<xsl:if test="position()=1">
															<tr>
																<td/>
																<td class="descr">(фамилии, имена, отчества (отчества указываются при наличии), должности, номера служебных удостоверений должностных лиц таможенного органа, проводящих выездную таможенную проверку)</td>
																<td/>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</tbody>
											</table>
											<br/>
											<xsl:text>3. Должностные лица, привлекаемые для участия в проведении выездной таможенной проверки:</xsl:text>
											<br/>
											<br/>
											<table width="100%">
												<tbody>
													<xsl:for-each select="dpaf:ListAttractedPersons">
														<tr>
															<td width="1%" valign="top">
																<xsl:value-of select="position()"/>)
															</td>
															<td width="98%" class="value">
																<xsl:apply-templates select="."/>
															</td>
															<td width="1%" valign="bottom" align="right">
																<xsl:choose>
																	<xsl:when test="position()!=last()">
																		<xsl:text>;</xsl:text>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text>.</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</tr>
														<xsl:if test="position()=1">
															<tr>
																<td/>
																<td class="descr">(фамилии, имена, отчества (отчества указываются при наличии), должности должностных лиц)</td>
																<td/>
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
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value" width="30%">
															<xsl:value-of select="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonPost"/>
														</td>
														<td/>
														<td class="value" width="30%">
															<br/>
														</td>
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
														<td class="descr">(должность должностного лица таможенного органа, принявшего решение)</td>
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
										<td style="text-align: justify;">
											<xsl:text>Экземпляр решения от </xsl:text>
											<xsl:call-template name="DateStr">
												<xsl:with-param name="date" select="dpaf:DecisionNumber/adt_cat:Date"/>
											</xsl:call-template>
											&#160;№&#160;<u>&#160;<xsl:value-of select="dpaf:DecisionNumber/adt_cat:Number"/>&#160;</u>&#160;
											<xsl:text> о проведении выездной таможенной проверки получил.</xsl:text>
											<br/>
											<xsl:text>О правах и обязанностях проверяемого лица при проведении таможенной проверки в соответствии со статьей 336 Таможенного кодекса Евразийского экономического союза и статьями 235, 236 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», а также о правах и обязанностях должностных лиц таможенного органа при проведении таможенной проверки в соответствии со статьей 335 Таможенного кодекса Евразийского экономического союза и статьей 231 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» проинформирован.</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
											<table>
												<tbody>
													<tr align="center">
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
														<td class="descr"/>
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
															<br/>
															<xsl:apply-templates select="dpaf:SecondExempReceived"/>
														</td>
													</tr>
													<tr>
														<td class="descr">(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность лица, получившего экземпляр решения)</td>
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
										<td width="45%">
											<br/>
										</td>
										<td width="10%"/>
										<td width="45%"/>
									</tr>
									<tr>
										<td colspan="3">При направлении экземпляра решения заказным почтовым отправлением: <br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="value">
											<xsl:apply-templates select="dpaf:DirectionByPost/dpaf:PostAddress"/>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="descr">(почтовый адрес, по которому направлен экземпляр решения)</td>
									</tr>
									<tr>
										<td colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td valign="bottom">
											<xsl:for-each select="dpaf:DirectionByPost/dpaf:Date">
												<xsl:call-template name="Date">
													<xsl:with-param name="date" select="."/>
												</xsl:call-template>
												<xsl:if test="position()!=last()">;<br/></xsl:if>
											</xsl:for-each>
										</td>
										<td/>
										<td class="value">
											<xsl:apply-templates mode="PersonPost" select="dpaf:DirectionByPost"/>&#160;<br>
												<xsl:apply-templates mode="PersonName" select="dpaf:DirectionByPost"/>
											</br>
										</td>
									</tr>
									<tr>
										<td class="descr">(дата направления экземпляра решения)</td>
										<td/>
										<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) и подпись должностного лица таможенного органа)</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>Отметки должностных лиц таможенного органа:</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:value-of select="dpaf:RefusalMark/dpaf:RefusalMark"/>
											<xsl:text> </xsl:text>
											<xsl:if test="dpaf:RefusalMark/dpaf:PostDate">
												<br/>
												<xsl:text>Дата поступления в таможенный орган почтового отправления с отметкой о невручении письма адресату: </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="dpaf:RefusalMark/dpaf:PostDate"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="descr">
											<!--(запись об отказе в получении копии решения о проведении выездной таможенной проверки, запись о дате поступления в таможенный орган почтового отправления с отметкой о невручении письма адресату)-->
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value" width="30%">
															<br/>
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
														<td class="descr">(должность)</td>
														<td/>
														<td class="descr">(подпись)</td>
														<td/>
														<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
													</tr>
												</tbody>
											</table>
										</td>
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
														<td width="55%"> </td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
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
								<xsl:if test="dpaf:MarkKind!='3' or (dpaf:MarkKind='3' and dpaf:Date)">
									<xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="dpaf:Date"/>
									</xsl:call-template>
								</xsl:if>
								<table>
									<tbody>
										<tr>
											<td colspan="5">
												<br/>
											</td>
										</tr>
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
											<td class="descr">(должность)</td>
											<td/>
											<td class="descr">(подпись)</td>
											<td/>
											<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
										</tr>
									</tbody>
								</table>
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
											<td width="55%"> </td>
										</tr>
									</tbody>
								</table>
							</xsl:for-each>
							<table>
								<tbody>
									<tr>
										<tr>
											<td class="value" width="25%">
												<br/>
												<br/>
											</td>
											<td/>
										</tr>
										<tr>
											<td colspan="2" align="left" style="text-indent: 5%" class="footnote">
												<sup>1</sup> Федеральный закон от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (собрание законодательства Российской Федерации, 2017, № 47, ст. 6843)</td>
										</tr>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:otherwise>
							<table width="100%">
								<tbody>
									<tr>
										<td align="center">
											<br/>
											<br/>
											<span style="font-weight:bold;">
											РЕШЕНИЕ 
											</span>
											<br/>
											о внесении изменений
											<br/>
											в решение о проведении выездной таможенной проверки
										</td>
									</tr>
								</tbody>
							</table>
							<!--br/>
							<table width="100%">
								<tbody>
									<tr>
										<td class="value_date" width="39%" align="center">
											<xsl:call-template name="DateStr">
												<xsl:with-param name="date" select="dpaf:DecisionNumber/adt_cat:Date"/>
											</xsl:call-template>
										</td>
										<td width="25%"/>
										<td width="3%">
											<xsl:text>№ </xsl:text>
										</td>
										<td width="33%" class="value" align="center">
											<xsl:value-of select="dpaf:DecisionNumber/adt_cat:Number"/>
										</td>
									</tr>
								</tbody>
							</table-->
							<br/>
							<br/>
							<table>
								<tbody>
									<tr>
										<td style="text-indent: 5%">
											1. Вводная часть.
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%">
											1.1. Должностное лицо таможенного органа, принявшее решение:
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates mode="ApproverPerson" select="dpaf:CustomsIssuedDecision"/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%">
											1.2. Основание (основания) для внесения изменений:
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:value-of select="dpaf:ReasonChange"/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%">
											<br/>
											2. Резолютивная часть.
											<br/>
											<br/>
										</td>
									</tr>
									<tr style="text-align: justify">
										<td style="text-indent: 5%">
											<xsl:text>На основании изложенного, руководствуясь статьей 229 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», решено:</xsl:text>
											<br/>
											<br/>
											<span style="text-indent: 5%">
												<xsl:text>Внести в решение о проведении выездной таможенной проверки</xsl:text>
											</span>
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
														<td width="40%" class="value value_date" align="center">
															<xsl:call-template name="russian_date_monthstr">
																<xsl:with-param name="dateIn" select="dpaf:PrevDecisionNumber/adt_cat:Date"/>
															</xsl:call-template>
														</td>
														<td width="6%" align="center">
															<xsl:text>№</xsl:text>
														</td>
														<td width="48%" class="value value_date" align="center">
															<xsl:value-of select="dpaf:PrevDecisionNumber/adt_cat:Number"/>
														</td>
														<td width="1%" align="right" valign="bottom">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="descr"> </td>
														<td class="descr">(дата)</td>
														<td class="descr"> </td>
														<td class="descr">(номер)</td>
														<td class="descr"> </td>
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
														<td width="15%" valign="top">
															<xsl:text>принятое</xsl:text>
														</td>
														<td width="84%" align="center" class="value">
															<xsl:apply-templates mode="ApproverPerson" select="dpaf:CustomsIssuedPrevDecision"/>
														</td>
														<td width="1%" align="right" valign="bottom">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="descr"> </td>
														<td class="descr">(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) должностного лица таможенного органа, принявшего изменяемое решение о проведении выездной таможнной проверки)</td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>следующие изменения:</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr valign="top" align="center">
														<td style="border: 1px solid black;" width="4%">№ п/п</td>
														<td style="border: 1px solid black;" width="48%">Ранее указанные в строке сведения</td>
														<td style="border: 1px solid black;" width="48%">Измененные (дополненные) сведения</td>
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
							<br/>
							<br/>
							<table>
								<tbody>
									<tr>
										<td class="value" align="center" width="35%">
											<xsl:value-of select="dpaf:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonPost"/>
										</td>
										<td width="5%"/>
										<td class="value" width="20%"/>
										<td width="5%"/>
										<td align="center" class="value" width="35%">
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
										<td style="text-indent: 5%" width="38%">
											<xsl:text>3. Экземпляр решения с</xsl:text>
										</td>
										<td width="10%" class="value" align="center">
											<xsl:value-of select="dpaf:SecondExempReceived/adt_cat:AppendixNumber"/>
										</td>
										<td width="25%" align="center">
											<xsl:text>приложениями на</xsl:text>
										</td>
										<td width="5%" align="center" class="value">
											<xsl:value-of select="dpaf:SecondExempReceived/adt_cat:SheetsNumber"/>
										</td>
										<td width="22%" align="center">
											<xsl:text>листах получил:</xsl:text>
										</td>
									</tr>
									<tr>
										<td/>
										<td class="descr">(количество приложений)</td>
										<td colspan="3"/>
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
										<td/>
										<td width="30%" class="value"/>
									</tr>
									<tr>
										<td width="60%" class="descr">(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность лица,получившего экземпляр решения)</td>
										<td/>
										<td width="30%" class="descr">(подпись)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td colspan="2" class="value_date" align="left">
											<xsl:call-template name="DateStr">
												<xsl:with-param name="date" select="dpaf:SecExempDate"/>
											</xsl:call-template>
										</td>
										<td width="60%"/>
									</tr>
									<tr>
										<td width="31%" class="descr">(дата получения второго экземпляра решения)</td>
										<td width="9%"/>
										<td width="60%"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td style="text-indent: 5%">4. При направлении решения заказным почтовым отправлением:</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="dpaf:DirectionByPost/dpaf:PostAddress"/>
										</td>
									</tr>
									<tr>
										<td class="descr">(почтовый адрес, по которому направлен экземпляр решения)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td valign="bottom" class="value_date" colspan="2">
											<xsl:for-each select="dpaf:DirectionByPost/dpaf:Date">
												<xsl:call-template name="DateStr">
													<xsl:with-param name="date" select="."/>
												</xsl:call-template>
												<xsl:if test="position()!=last()">;<br/></xsl:if>
											</xsl:for-each>
										</td>
										<td width="7%"/>
										<td align="center" width="46%" class="value">
											<xsl:apply-templates mode="PersonPost" select="dpaf:DirectionByPost"/>&#160;<br>
												<xsl:apply-templates mode="PersonName" select="dpaf:DirectionByPost"/>
											</br>
										</td>
									</tr>
									<tr>
										<td width="39%" class="descr">(дата направления экземпляра решения)</td>
										<td width="7%"/>
										<td width="8%"/>
										<td width="46%" class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) и подпись должностного лица таможенного органа)</td>
									</tr>
								</tbody>
							</table>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="dpaf:SecondExempReceived">
		<xsl:for-each select="cat_ru:PersonPost|cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="adt_cat:Passport|dpaf:Passport"/>
	</xsl:template>
	<xsl:template match="*" name="PersonName" mode="PersonName">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;<xsl:value-of select="cat_ru:PersonName"/>&#160;<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="dpaf:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="dpaf:PersonCustomsID"/>,</xsl:if>
		<xsl:if test="dpaf:LNP">&#160;ЛНП:&#160;<xsl:value-of select="dpaf:LNP"/>,</xsl:if>
		<xsl:if test="dpaf:Phone">&#160;Тел:&#160;<xsl:value-of select="dpaf:Phone"/>,</xsl:if>
		<xsl:if test="dpaf:Note">&#160;<xsl:value-of select="dpaf:Note"/>
		</xsl:if>
		<xsl:if test="dpaf:Comment">&#160;<xsl:value-of select="dpaf:Comment"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ApproverPerson" match="*">
		<xsl:if test="adt_cat:ApproverPerson/cat_ru:PersonPost">
			<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
								</xsl:if>
		<xsl:if test="dpaf:Rank">
			<xsl:value-of select="dpaf:Rank"/>,&#160;</xsl:if>
		<xsl:if test="adt_cat:CustomsSubUnit">
			<xsl:value-of select="adt_cat:CustomsSubUnit"/>,&#160;</xsl:if>
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<span class="normal">&#160;(</span>
		</xsl:if>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:Code">
			<span class="normal">)&#160;</span>
		</xsl:if>
		<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;
								<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonName"/>&#160;
								<xsl:if test="adt_cat:ApproverPerson/cat_ru:PersonMiddleName">
			<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>,&#160;</xsl:if>
		<xsl:if test="dpaf:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="dpaf:PersonCustomsID"/>,&#160;</xsl:if>
		<xsl:if test="dpaf:LNP">&#160;ЛНП:&#160;<xsl:value-of select="dpaf:LNP"/>,</xsl:if>
		<xsl:if test="dpaf:Note">&#160;<xsl:value-of select="dpaf:Note"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" name="PersonPost" mode="PersonPost">
		<xsl:value-of select="cat_ru:PersonPost"/>&#160;<xsl:value-of select="dpaf:Rank"/>&#160;<xsl:value-of select="dpaf:Department"/>&#160;<span class="normal">
			<xsl:value-of select="dpaf:CustomsDept/cat_ru:OfficeName"/>
		</span>
		<xsl:if test="dpaf:CustomsDept/cat_ru:Code">
			<span class="normal">&#160;(</span>
		</xsl:if>
		<span class="normal">
			<xsl:value-of select="dpaf:CustomsDept/cat_ru:Code"/>
		</span>
		<xsl:if test="dpaf:CustomsDept/cat_ru:Code">
			<span class="normal">)</span>
		</xsl:if>
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
	<xsl:template match="dpaf:CustomsDept|adt_cat:CustomsDept">
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
	<xsl:template match="dpaf:FactAddressDetails|RUScat_ru:SubjectAddressDetails|dpaf:PostAddress">
		<xsl:for-each select="RUScat_ru:AddressKindCode|RUScat_ru:PostalCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails|dpaf:FactAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<span class="italic"> (вид адреса</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:choose>
					<xsl:when test="RUScat_ru:AddressKindCode='1'">адрес регистрации</xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode='2'">фактический</xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode='3'">почтовый</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="RUScat_ru:AddressKindCode"/>
					</xsl:otherwise>
				</xsl:choose>
			</span>
			<span class="normal">) </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<span class="italic">почтовый индекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostalCode"/>
			</span>
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
			<xsl:if test="RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</span>
			<xsl:if test="RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Region"/>
			</span>
			<xsl:if test="RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:District"/>
			</span>
			<xsl:if test="RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Town"/>
			</span>
			<xsl:if test="RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:City"/>
			</span>
			<xsl:if test="RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:StreetHouse"/>
			</span>
			<xsl:if test="RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:House"/>
			</span>
			<xsl:if test="RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Room"/>
			</span>
			<xsl:if test="RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</span>
			<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO">
			<span class="italic">ОКТМО </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OKTMO"/>
			</span>
			<xsl:if test="RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<span class="italic">OKАTO </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OKATO"/>
			</span>
			<xsl:if test="RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<span class="italic">КЛАДР </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:KLADR"/>
			</span>
			<xsl:if test="RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<span class="italic">Глобальный идентификатор адресного объекта по ФИАС </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AOGUID"/>
			</span>
			<xsl:if test="RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<span class="italic">Код единицы административно-территориального деления </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</span>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<span class="italic">а/я </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dpaf:AuditOrganization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<span class="normal">
				<br/>
			</span>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">
					<span class="italic">Адрес(а)</span>
					<span class="normal">: </span>
				</xsl:if>
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="dpaf:FactAddressDetails">
			<xsl:text>, Адрес местонахождения: </xsl:text>
			<xsl:apply-templates select="dpaf:FactAddressDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">, </span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">, </span>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">, </span>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">, </span>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">, </span>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">, </span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">, </span>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">, </span>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">, </span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dpaf:DTNumberInfo">
		<xsl:if test="dpaf:DeclarationKind">
			<xsl:value-of select="dpaf:DeclarationKind"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="number_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
		<xsl:if test="dpaf:GoodsNumeric">
			(номер(а) товара(ов): 
			<xsl:for-each select="dpaf:GoodsNumeric">
				<xsl:value-of select="."/>
				<xsl:if test="position() != last()">, </xsl:if>
			</xsl:for-each> 
			)
		</xsl:if>
	</xsl:template>
	<xsl:template name="CommunicationDetails">
		<span class="normal">, </span>
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<xsl:template match="dpaf:DTInfo">
		<xsl:if test="dpaf:DTNumberInfo">
			<xsl:apply-templates select="dpaf:DTNumberInfo"/>
		</xsl:if>
		<xsl:if test="dpaf:OtherDocument">
			<xsl:apply-templates select="dpaf:OtherDocument"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dpaf:OtherDocument">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
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
	<xsl:template name="russian_date_monthstr">
		<xsl:param name="dateIn"/>
		<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>&#160;
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
				</xsl:choose>&#160;
				<xsl:value-of select="substring($dateIn,1,4)"/>&#160;г.
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
					<td width="13%" class="value">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value" align="center" style="text-align: center;">
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
					<td width="2%" align="right">
						<xsl:value-of select="substring($date,1,2)"/>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>
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
			&#160;</u>&#160;<xsl:value-of select="substring($date,1,2)"/>
		<u>
			<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.
</xsl:template>
	<xsl:template name="Time">
		<xsl:param name="time"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right"> </td>
					<td width="2%" align="right">в</td>
					<td width="2%" align="right"> </td>
					<td width="44%" class="value" align="center">
						<xsl:value-of select="substring($time,1, 2)"/>
					</td>
					<td width="2%" align="right"> </td>
					<td width="2%" align="right">ч.</td>
					<td width="2%" align="right"> </td>
					<td width="44%" class="value" align="center">
						<xsl:value-of select="substring($time, 4, 2)"/>
					</td>
					<td width="2%" align="right"> </td>
					<td width="2%" align="right">мин.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
