<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:aac="urn:customs.ru:Information:CustomsAuditDocuments:ActAuditCameral:5.14.3">
<!-- Приказ ФТС России  от 14.02.2019 г. № 258 "Об утверждении форм документов, составляемых таможенными органами при проведении таможенных проверок, 
порядков их заполнения и порядка внесения изменений в решение о проведении выездной таможенной проверки"
Приложение № 2 Акт камеральной таможенной проверки (rda:IdentKindAudit = 2)
Приложение № 3 Акт выездной таможенной проверки (rda:IdentKindAudit = 1)-->
	<!-- Шаблон для типа ActAuditCameralType -->
	<xsl:template match="aac:ActAuditCameral">
		<html>
			<head>
				<style>
			body {
			background: #cccccc;
			}

			div
			{
			white-space: nowrap;
			}

			div.page {
			width: 180mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			font-family:Arial;
			font-size: 11pt;
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
			font-family:Arial;
			font-size: 11pt;
			}

			table.border tr td
			{
			border: 1px solid windowtext;
			}

			.graph {
			font-family: Arial;
			font-size: 11pt;
			}

			.value
			{
			border-bottom: solid 1px black;
			font-style: italic;
			vertical-align:bottom;
			}

			div.title, tr.title td { font-weight:bold;  }
			.bordered { border-collapse: collapse; }
			td.bordered
			{
				border: solid 1px windowtext;
			}

			.border_bottom
			{
			border-bottom: 1px solid black;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			vertical-align:top;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 11pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

		</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="10%"/>
								<td width="80%">МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>(МИНФИН РОССИИ)</td>
								<td width="10%"/>
							</tr>
							<tr class="delim">
								<td colspan="3"> </td>
							</tr>
							<tr>
								<td width="10%"/>
								<td width="80%">ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</td>
								<td width="10%"/>
							</tr>
							<tr class="delim_3">
								<td colspan="3"> </td>
							</tr>
							<tr>
								<td width="10%"/>
								<td width="80%" class="value">
									<span class="normal">
										<xsl:value-of select="aac:Customs/cat_ru:OfficeName"/>
									</span>
									<xsl:if test="aac:Customs/cat_ru:OfficeName">
										<span class="normal"> (</span>
									</xsl:if>
									<span class="normal">
										<xsl:value-of select="aac:Customs/cat_ru:Code"/>
									</span>
									<xsl:if test="aac:Customs/cat_ru:OfficeName">
										<span class="normal">)</span>
									</xsl:if>
								</td>
								<td width="10%"/>
							</tr>
							<tr class="graphLittle">
								<td width="10%"/>
								<td width="80%" align="center">(наименование таможенного органа)</td>
								<td width="10%"/>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="50%"/>
								<td width="50%" class="graphHeader">УТВЕРЖДАЮ</td>
							</tr>
							<tr class="delim">
								<td colspan="2"> </td>
							</tr>
							<tr>
								<td width="50%"/>
								<td width="50%">Начальник (заместитель начальника) таможенного органа</td>
							</tr>
							<tr class="delim_3">
								<td colspan="2"> </td>
							</tr>
							<tr>
								<td width="50%"> </td>
								<td width="50%">
									<table>
										<tr align="center">
											<td width="34%" class="value"> </td>
											<td width="3%"> </td>
											<td width="63%" class="value">
												<xsl:value-of select="aac:CustomsPerson/cat_ru:PersonName"/>
												<xsl:if test="aac:CustomsPerson/cat_ru:LNP">
											&#160;(<xsl:value-of select="aac:CustomsPerson/cat_ru:LNP"/>)
										</xsl:if>
												<br/>
											</td>
										</tr>
										<tr class="graphLittle" align="center">
											<td width="34%">(подпись) </td>
											<td width="3%"> </td>
											<td width="63%">(инициалы, фамилия)</td>
										</tr>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody class="graphMain">
							<tr>
								<td width="50%"> </td>
								<td align="center" width="50%">
									<xsl:call-template name="Date">
										<xsl:with-param name="date" select="aac:DateApprovalAct"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr align="center" class="graphHeader">
								<td>АКТ</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr align="center">
								<td>
									<xsl:choose>
										<xsl:when test="aac:IdentKindAudit = 1">выездной таможенной проверки</xsl:when>
										<xsl:when test="aac:IdentKindAudit = 2">камеральной таможенной проверки</xsl:when>
										<xsl:otherwise>
											<u>&#160;&#160;&#160;&#160;&#160;</u> таможенной проверки</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr align="center">
								<td>
							№&#160;<span class="value">&#160;<xsl:value-of select="aac:ActNumber/adt_cat:Number"/>&#160;</span>
								</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="45%" align="left">
									<xsl:call-template name="Date">
										<xsl:with-param name="date" select="aac:ActNumber/adt_cat:Date"/>
									</xsl:call-template>
								</td>
								<td width="15%"> </td>
								<td width="40%" class="value">
									<xsl:value-of select="aac:ActPlace"/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="45%">(дата)</td>
								<td width="10%"> </td>
								<td width="45%">(место составления)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td>Должностными лицами таможенного органа:</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody align="left" class="graphMain">
											<xsl:for-each select="aac:ListCommission">
												<tr>
													<td width="3%" align="right" valign="bottom">
														<xsl:value-of select="position()"/>.&#160;
													</td>
													<td width="96%" class="value">
														<xsl:apply-templates select="."/>
													</td>
													<td width="1%" align="right" valign="bottom">
														<xsl:choose>
															<xsl:when test="position()=last()"><xsl:text></xsl:text></xsl:when>
															<xsl:otherwise><xsl:text>;</xsl:text></xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<xsl:if test="position()=1">
													<tr class="graphLittle" align="center">
														<td> </td>
														<td>(фамилии, имена, отчества (отчества указываются при наличии), должности должностных лиц таможенного<br/>
												органа, проводивших <xsl:choose>
																<xsl:when test="../aac:IdentKindAudit = 1">выездную</xsl:when>
																<xsl:when test="../aac:IdentKindAudit = 2">камеральную</xsl:when>
															</xsl:choose> таможенную проверку)
														</td>
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
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td>с привлечением должностных лиц:</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody align="left" class="graphMain">
											<xsl:choose>
												<xsl:when test="aac:ListAttractedPersons">
													<xsl:for-each select="aac:ListAttractedPersons">
														<tr>
															<td width="3%" align="right" valign="bottom">
																<xsl:value-of select="position()"/>.&#160;</td>
															<td width="96%" class="value">
																<xsl:apply-templates select="."/>
															</td>
															<td width="1%" align="right" valign="bottom">
																<xsl:choose>
																	<xsl:when test="position()=last()"><xsl:text></xsl:text></xsl:when>
																	<xsl:otherwise><xsl:text>;</xsl:text></xsl:otherwise>
																</xsl:choose>
															</td>
														</tr>
														<xsl:if test="position()=1">
															<tr class="graphLittle" align="center">
																<td width="3%"> </td>
																<td width="97%">(фамилии, имена, отчества (отчества указываются при наличии), должности должностных лиц)</td>
																<td/>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td width="5%" align="right" valign="bottom">
															<xsl:value-of select="position()"/>.&#160;</td>
														<td width="95%" class="value">&#160;&#160;&#8212;</td>
													</tr>
													<tr class="graphLittle" align="center">
														<td width="5%"> </td>
														<td width="95%">(должности, фамилии, имена, отчества (отчества указываются при наличии) должностных лиц)</td>
													</tr>
												</xsl:otherwise>
											</xsl:choose>
										</tbody>
									</table>
								</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td>с&#160;
							<xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="aac:BeginAuditDate"/>
									</xsl:call-template>
							&#160;в соответствии со статьей&#160;
							<xsl:choose>
										<xsl:when test="aac:IdentKindAudit = 1">333</xsl:when>
										<xsl:when test="aac:IdentKindAudit = 2">332</xsl:when>
										<xsl:otherwise>
											<u>&#160;&#160;&#160;&#160;&#160;</u>
										</xsl:otherwise>
									</xsl:choose>
							&#160;Таможенного кодекса Евразийского экономического союза проведена&#160;
							<xsl:choose>
										<xsl:when test="aac:IdentKindAudit = 1">выездная</xsl:when>
										<xsl:when test="aac:IdentKindAudit = 2">камеральная</xsl:when>
										<xsl:otherwise>
											<u>&#160;&#160;&#160;&#160;&#160;</u>
										</xsl:otherwise>
									</xsl:choose>
							&#160;таможенная проверка
						</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="aac:IdentKindAudit = 1">
						<br/>
						<table>
							<tbody align="left" class="graphMain">
								<tr>
									<td>на основании</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates select="aac:Basement"/>
									</td>
								</tr>
								<!--tr>
							<td class="graphLittle" align="center">
								(ссылка на план проверок либо на соответствующий подпункт пункта 16 статьи 333 Таможенного кодекса Евразийского экономического союза)
							</td>
						</tr-->
								<tr class="delim">
									<td> </td>
								</tr>
								<tr>
									<td>
								решения о проведении выездной таможенной проверки от&#160;
								<xsl:call-template name="DateStr">
											<xsl:with-param name="date" select="aac:DecisionPerformAudit/adt_cat:Date"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tr>
												<td width="1%">№</td>
												<td width="99%" class="value">&#160;<xsl:value-of select="aac:DecisionPerformAudit/adt_cat:Number"/>
													<br/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr class="delim">
									<td> </td>
								</tr>
								<tr>
									<td>
										<table>
											<tr>
												<td width="13%">проведена</td>
												<td width="2%"/>
												<td width="38%" class="value" align="center">&#160;
												<xsl:choose>
														<xsl:when test="aac:AuditFieldKind='1'">плановая</xsl:when>
														<xsl:when test="aac:AuditFieldKind='2'">внеплановая</xsl:when>
														<xsl:when test="aac:AuditFieldKind='3'">встречная внеплановая</xsl:when>
													</xsl:choose>
												</td>
												<td width="2%"/>
												<td width="55%">выездная таможенная проверка</td>
											</tr>
											<tr class="graphLittle" align="center">
												<td colspan="2"> </td>
												<td>(плановая/внеплановая/встречная внеплановая)</td>
												<td colspan="2"/>
											</tr>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="99%">в отношении:</td>
								<td width="1%"/>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aac:AuditOrganization"/>
									<br/>
								</td>
								<td align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(указываются сведения о проверяемом лице)
								</td>
								<td/>
							</tr>
							<tr class="delim">
								<td> </td>
								<td/>
							</tr>
							<tr>
								<td>Предмет проверки:</td>
								<td/>
							</tr>
							<tr class="delim_3">
								<td> </td>
								<td/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="aac:SubjectInspection">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(указывается в соответствии с пунктом 6 статьи 331 Таможенного кодекса Евразийского экономического союза)</td>
								<td/>
							</tr>
							<tr class="delim">
								<td> </td>
								<td/>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="35%">Проверяемый период</td>
								<td width="1%" class="value"> </td>
								<td width="63%" class="value">
									<xsl:for-each select="aac:AuditPeriod">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">; </xsl:if>
									</xsl:for-each>
								</td>
								<td width="1%" align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim">
								<td width="99%"> </td>
								<td width="1%"/>
							</tr>
							<tr>
								<td>Номера проверенных таможенных деклараций:</td>
								<td/>
							</tr>
							<tr class="delim_3">
								<td> </td>
								<td/>
							</tr>
							<tr>
								<td class="value"><br/>
									<xsl:for-each select="aac:DTInfo">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim">
								<td width="99%"> </td>
								<td width="1%"/>
							</tr>
							<tr>
								<td>Иные сведения об объекте таможенного контроля</td>
								<td/>
							</tr>
							<tr class="delim_3">
								<td> </td>
								<td/>
							</tr>
							<tr>
								<td class="value"><br/>
									<xsl:for-each select="aac:OtherInfo">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">&#160;</xsl:if>
									</xsl:for-each>
								</td>
								<td align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim">
								<td width="99%"> </td>
								<td width="1%"/>
							</tr>
							<tr>
								<td>Виды проверенных документов и сведений:</td>
								<td/>
							</tr>
							<tr class="delim_3">
								<td> </td>
								<td/>
							</tr>
							<tr>
								<td class="value"><br/>
									<xsl:for-each select="aac:AuditDocuments">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="aac:IdentKindAudit=2">
						<table>
							<tbody align="left" class="graphMain">
								<tr>
									<td class="delim_3" colspan="4">
										<br/>
									</td>
								</tr>
								<tr>
									<td width="35%">Период продления:</td>
									<td width="1%" class="value"> </td>
									<td width="63%" class="value">
										<xsl:if test="aac:StopProlongAudit/aac:ActionKind=2">
											<xsl:for-each select="aac:StopProlongAudit/aac:AuditPeriod">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()">; </xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
									<td width="1%" align="right" valign="bottom"><xsl:text>.</xsl:text></td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="aac:IdentKindAudit=1">
						<br/>
						<table>
							<tbody align="left" class="graphMain">
								<xsl:choose>
									<xsl:when test="aac:StopProlongAudit">
										<xsl:for-each select="aac:StopProlongAudit">
											<tr>
												<td width="10%">Периоды </td>
												<td width="30%">
													<xsl:choose>
														<xsl:when test="aac:ActionKind=1">
															<u>приостановления</u>/<s>продления</s>:</xsl:when>
														<xsl:when test="aac:ActionKind=2">
															<s>приостановления</s>/<u>продления</u>:</xsl:when>
														<xsl:otherwise>приостановления/продления:</xsl:otherwise>
													</xsl:choose>
												</td>
												<td width="1%" class="value"> </td>
												<td width="58%" class="value">
													<span class="normal">
														<xsl:choose>
															<xsl:when test="aac:ActionKind=1">
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="aac:StopProlongDate"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:when test="aac:ActionKind=2">
																<xsl:for-each select="aac:AuditPeriod">
																	<xsl:apply-templates select="."/>
																	<xsl:if test="position()!=last()">; </xsl:if>
																</xsl:for-each>
															</xsl:when>
														</xsl:choose>
													</span>
												</td>
												<td width="1%" align="right" valign="bottom"><xsl:text>.</xsl:text></td>
											</tr>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td width="10%">Периоды </td>
											<td width="30%">приостановления/продления:</td>
											<td width="1%" class="value"> </td>
											<td width="58%" class="value"> </td>
											<td width="1%" align="right" valign="bottom"><xsl:text>.</xsl:text></td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="99%">В ходе проверки проведены следующие мероприятия:</td>
								<td width="1%"/>
							</tr>
							<tr class="delim_3">
								<td> </td>
								<td/>
							</tr>
							<tr>
								<td class="value"><br/>
									<xsl:for-each select="aac:AuditActions">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>
							(сведения о формах таможенного контроля, иных действиях, проведенных в ходе 
							<xsl:choose>
										<xsl:when test="aac:IdentKindAudit = 1">выездной</xsl:when>
										<xsl:when test="aac:IdentKindAudit = 2">камеральной</xsl:when>
										<xsl:otherwise>
											<u>&#160;&#160;&#160;&#160;&#160;</u>
										</xsl:otherwise>
									</xsl:choose>
							 таможенной проверки)
						</td>
							<td/>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="99%">В ходе проверки установлено:</td>
								<td width="1%"/>
							</tr>
							<tr class="delim_3">
								<td> </td>
								<td/>
							</tr>
							<tr>
								<td class="value"><br/>
									<xsl:for-each select="aac:AuditDisorders">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="99%">Возбуждены дела об административных правонарушениях </td>
								<td width="1%"/>
							</tr>
							<tr class="delim_3">
								<td> </td>
								<td/>
							</tr>
							<tr>
								<td class="value"><br/>
									<xsl:for-each select="aac:AdminViolations">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>
							(сведения о возбужденных в ходе  
							<xsl:choose>
										<xsl:when test="aac:IdentKindAudit = 1">выездной</xsl:when>
										<xsl:when test="aac:IdentKindAudit = 2">камеральной</xsl:when>
										<xsl:otherwise>
											<u>&#160;&#160;&#160;&#160;&#160;</u>
										</xsl:otherwise>
									</xsl:choose>
							 таможенной проверки делах об административных правонарушениях)
						</td>
							<td/>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="99%">Выводы<!--xsl:if test="aac:IdentKindAudit = '2'"> и предложения</xsl:if-->:</td>
								<td width="1%"/>
							</tr>
							<tr class="delim_3">
								<td> </td>
								<td/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="aac:Resolution">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
								<td align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="99%">Реквизиты текущего (расчетного) и иных счетов проверяемого лица (при наличии)</td>
								<td width="1%"/>
							</tr>
							<tr class="delim_3">
								<td> </td>
								<td/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="aac:AuditOrganization/RUScat_ru:BankInformation">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
									<br/>
								</td>
								<td align="right" valign="bottom"><xsl:text>.</xsl:text></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td>Приложения на&#160;<u>&#160;&#160;&#160;<xsl:value-of select="aac:AdditionalSheetNumber"/>&#160;&#160;&#160;</u>&#160;листах.</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
							Должностные лица, проводившие
							<xsl:choose>
										<xsl:when test="aac:IdentKindAudit = 1">выездную</xsl:when>
										<xsl:when test="aac:IdentKindAudit = 2">камеральную</xsl:when>
										<xsl:otherwise>
											<u>&#160;&#160;&#160;&#160;&#160;</u>
										</xsl:otherwise>
									</xsl:choose>
							таможенную проверку:
						</td>
							</tr>
						</tbody>
					</table>
					<xsl:for-each select="aac:CommissionSignature">
						<br/>
						<table>
							<tbody class="graphMain">
								<tr align="center">
									<td width="55%" class="value">
										<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
								<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
										<xsl:if test="cat_ru:PersonName">.&#160;</xsl:if>
										<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
										<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
										<br/>
									</td>
									<td width="15%"> </td>
									<td width="30%" class="value"> </td>
								</tr>
								<tr class="graphLittle" align="center">
									<td width="55%">(фамилия, инициалы имени и отчества<br/>(инициал отчества указывается при наличии отчества)</td>
									<td width="15%"> </td>
									<td width="30%">(подпись)</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<table>
						<tbody class="graphMain">
							<tr>
								<td width="31%">
									<xsl:text>Второй экземпляр акта с </xsl:text>
								</td>
								<td width="19%" class="value" align="center">
									<xsl:value-of select="aac:SecondExempReceived/adt_cat:AppendixNumber"/>
								</td>
								<td width="22%">
									<xsl:text> приложениями на</xsl:text>
								</td>
								<td width="5%" align="center" class="value">
									<xsl:value-of select="aac:SecondExempReceived/adt_cat:SheetsNumber"/>
								</td>
								<td width="23%">
									<xsl:text>листах получил:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
								<td class="graphLittle" align="center">(количество приложений)</td>
								<td colspan="3"/>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody class="graphMain">
							<tr align="center">
								<td width="55%" class="value">
									<xsl:apply-templates select="aac:SecondExempReceived"/>
									<br/>
								</td>
								<td width="15%"> </td>
								<td width="30%" class="value"> </td>
							</tr>
							<tr class="graphLittle" align="center">
								<td width="55%">(должность, фамилия, имя, отчество (отчество указывается при наличии, паспортные данные лица, получившего второй экземпляр акта)</td>
								<td width="15%"> </td>
								<td width="30%">(подпись)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody class="graphMain">
							<tr>
								<td align="center" width="40%">
									<xsl:call-template name="Date">
										<xsl:with-param name="date" select="aac:SecondExempReceived/adt_cat:Date"/>
									</xsl:call-template>
								</td>
								<td/>
							</tr>
							<tr class="graphLittle">
								<td align="center">(дата получения второго экземпляра акта)</td>
								<td/>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа adt_cat:PersonType -->
	<xsl:template match="aac:ListCommission|aac:ListAttractedPersons">
		<xsl:if test="cat_ru:PersonPost">												
			должность: <xsl:value-of select="cat_ru:PersonPost"/>,&#160; 
		</xsl:if>
		<xsl:if test="adt_cat:CustomsDept">
			структурное подразделение:&#160;
			<xsl:if test="adt_cat:CustomsDept/cat_ru:OfficeName">
				<xsl:value-of select="adt_cat:CustomsDept/cat_ru:OfficeName"/>
				(</xsl:if>код ТО: <xsl:value-of select="adt_cat:CustomsDept/cat_ru:Code"/>
			<xsl:if test="adt_cat:CustomsDept/cat_ru:OfficeName">)
			</xsl:if>
			,&#160; 
		</xsl:if>
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">												
			&#160;<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
		<xsl:if test="adt_cat:Phone">
			, тел: <xsl:value-of select="adt_cat:Phone"/>
		</xsl:if>
		<xsl:if test="adt_cat:PersonCustomsID">
			, № служ. удостоверения: <xsl:value-of select="adt_cat:PersonCustomsID"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
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
	<!-- Шаблон для типа adt_cat:AuditOrganizationType -->
	<xsl:template match="aac:AuditOrganization">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
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
		<xsl:if test="adt_cat:FactAddress">
			<span class="normal">
				<br/>
			</span>
			<span class="italic">Фактический адрес</span>
			<span class="normal">: </span>
			<xsl:for-each select="adt_cat:FactAddress">
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal">, УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
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
	<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
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
	<!-- Шаблон для типа cat_ru:RBOrganizationFeatures -->
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
	<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
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
	<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
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
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType строка -->
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
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="normal">, </span>
		<span class="italic">Документ, удостоверяющий личность ФЛ</span>
		<span class="normal">: </span>
		<xsl:if test="RUScat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardDate) &gt; 0 or string-length(RUScat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OrganizationName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<span class="normal">, </span>
			<span class="italic">код подразделения</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IssuerCode"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<span class="normal">, </span>
			<span class="italic">идентификатор организации</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AuthorityId"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">, </span>
			<span class="italic">страна в уд.личности</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="aac:DTNumberInfo">
		<xsl:if test="aac:DeclarationKind">
			<xsl:value-of select="aac:DeclarationKind"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
		<xsl:if test="aac:GoodsNumeric">
		(номер(а) товара(ов): 
		<xsl:for-each select="aac:GoodsNumeric">
				<xsl:value-of select="."/>
				<xsl:if test="position() != last()">, </xsl:if>
			</xsl:for-each> 
		)
	</xsl:if>
	</xsl:template>
	<xsl:template match="aac:DTInfo">
		<xsl:if test="aac:DTNumberInfo">
			<xsl:apply-templates select="aac:DTNumberInfo"/>
		</xsl:if>
		<xsl:if test="aac:OtherDocument">
			<xsl:apply-templates select="aac:OtherDocument"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="aac:OtherDocument">
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
	<!-- Шаблон для типа aac:AuditDocType -->
	<xsl:template match="aac:AuditDocuments">
		<xsl:if test="aac:DocCode">
			<span class="normal"> 
			(<xsl:value-of select="aac:DocCode"/>) 
		</span>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentName">
			<span class="normal">
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<span class="normal"> 
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<span class="normal"> от 
			<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="aac:Note">
			<span class="normal">, примечания: 
			<xsl:value-of select="aac:Note"/>
			</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа aac:AuditActionType -->
	<xsl:template match="aac:AuditActions">
		<span class="normal">
			<xsl:apply-templates select="aac:ActionDescription"/>
		</span>
		<xsl:if test="aac:ControlMark">
			<span class="normal"> 
			, код формы таможенного контроля: <xsl:value-of select="aac:ControlMark"/>
			</span>
		</xsl:if>
		<xsl:if test="aac:ActionComments">
			<span class="normal"> 
			, комментарии: <xsl:value-of select="aac:ActionComments"/>
			</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа aac:BasementType -->
	<xsl:template match="aac:Basement">
		<xsl:if test="aac:LinkAuditPlan">
			<xsl:text>Ссылка на план проверок: </xsl:text>
			<xsl:apply-templates select="aac:LinkAuditPlan"/>
			.<br/>
		</xsl:if>
		<xsl:if test="aac:TKst333p16">
			<xsl:text>Основание, указанное в ТК ЕАЭС, статья 333 пункт 16 </xsl:text><br/>
			<xsl:for-each select="aac:TKst333p16">
				<xsl:choose>
					<xsl:when test=".='1'">подпункт 1: данные, полученные в результате анализа информации, содержащейся в информационных ресурсах таможенных органов и иных государственных органов государств-членов, и свидетельствующие о возможном нарушении международных договоров и актов в сфере таможенного регулирования и (или) законодательства государств-членов</xsl:when>
					<xsl:when test=".='2'">подпункт 2: информация, свидетельствующая о возможном нарушении международных договоров и актов в сфере таможенного регулирования и (или) законодательства государств-членов</xsl:when>
					<xsl:when test=".='3'">подпункт 3: заявление лица о включении в реестр уполномоченных экономических операторов</xsl:when>
					<xsl:when test=".='4'">подпункт 4: представление уполномоченным экономическим оператором таможенному органу информации об изменении сведений, заявленных им при включении в реестр уполномоченных экономических операторов о находящихся в собственности, хозяйственном ведении, оперативном управлении или аренде сооружениях, помещениях (частях помещений) и (или) открытых площадках (частях открытых площадок), предназначенных для временного хранения товаров</xsl:when>
					<xsl:when test=".='5'">подпункт 5: необходимость проведения встречной внеплановой выездной таможенной проверки в соответствии с пунктом 17 настоящей статьи</xsl:when>
					<xsl:when test=".='6'">подпункт 6: обращение (запрос) компетентного органа государства, не являющегося членом Союза, о проведении проверки лица, совершавшего сделки, связанные с перемещением товаров через таможенную границу Союза, с иностранным лицом</xsl:when>
					<xsl:when test=".='7'">подпункт 7: поручение (запрос) органов предварительного расследования (органов уголовного преследования) государств-членов по материалам проверки сообщения о преступлении или по возбужденному уголовному делу</xsl:when>
					<xsl:when test=".='8'">подпункт 8: поручение таможенного органа одного государства-члена, данного таможенному органу другого государства-члена, о проведении выездной таможенной проверки у лица, созданного и (или) зарегистрированного в соответствии с законодательством государства-члена, таможенному органу которого направлено поручение по основаниям, предусмотренным подпунктами 1 и (или) 3 пункта 3 статьи 373 настоящего Кодекса</xsl:when>
					<xsl:when test=".='9'">подпункт 9: иные основания, предусмотренные законодательством государств-членов о таможенном регулировании</xsl:when>
					<xsl:otherwise> <xsl:value-of select="."/></xsl:otherwise>
				</xsl:choose>
				<xsl:if test="position()!=last()">;<br/></xsl:if>
			</xsl:for-each>
			.<br/>
		</xsl:if>
		<xsl:if test="aac:FZst229p7">
			<xsl:text>Основание, указанное в Федеральном законе от 03.08.2018 № 289-ФЗ, статья 229 часть 7 </xsl:text><br/>
			<xsl:for-each select="aac:FZst229p7">
				<xsl:choose>
					<xsl:when test=".='1'">пункт 1: представление уполномоченным экономическим оператором таможенному органу информации об изменении сведений, заявленных им при включении в реестр уполномоченных экономических операторов, о его адресе</xsl:when>
					<xsl:when test=".='2'">пункт 2: необходимость проведения внеплановой выездной таможенной проверки в целях подтверждения обоснованности доводов, изложенных в возражениях по акту таможенной проверки, поступивших в таможенный орган в соответствии с частями 16 - 19 статьи 237 настоящего Федерального закона</xsl:when>
					<xsl:otherwise> <xsl:value-of select="."/></xsl:otherwise>
				</xsl:choose>
				<xsl:if test="position()!=last()">;<br/></xsl:if>
			</xsl:for-each>
			.<br/>
		</xsl:if>
		<xsl:if test="aac:BasementText">
			<xsl:apply-templates select="aac:BasementText"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа aac:SubjectInspectionType -->
	<xsl:template match="aac:SubjectInspection">
		<xsl:if test="aac:SubjectInspectionCode">
			<span class="normal">
				<xsl:for-each select="aac:SubjectInspectionCode">
					<xsl:choose>
						<xsl:when test=".='1'">пп.1 п.6 ст. 331 ТК ЕАЭС: факт помещения товаров под таможенную процедуру</xsl:when>
						<xsl:when test=".='2'">пп.2 п.6 ст. 331 ТК ЕАЭС: достоверность сведений, заявленных в таможенной декларации и (или) содержащихся в документах, подтверждающих сведения, заявленные в таможенной декларации</xsl:when>
						<xsl:when test=".='3'">пп.3 п.6 ст. 331 ТК ЕАЭС: соблюдение ограничений по пользованию и (или) распоряжению условно выпущенными товарами</xsl:when>
						<xsl:when test=".='4'">пп.4 п.6 ст. 331 ТК ЕАЭС: исполнение лицами, осуществляющими деятельность в сфере таможенного дела, обязанностей, предусмотренных настоящим Кодексом для каждого вида деятельности в сфере таможенного дела</xsl:when>
						<xsl:when test=".='5'">пп.5 п.6 ст. 331 ТК ЕАЭС: соблюдение юридическим лицом, претендующим на включение в реестр уполномоченных экономических операторов, условий включения в такой реестр, а также соблюдение уполномоченным экономическим оператором условий включения в реестр уполномоченных экономических операторов и исполнение иных обязанностей, предусмотренных настоящим Кодексом</xsl:when>
						<xsl:when test=".='6'">пп.6 п.6 ст. 331 ТК ЕАЭС: соблюдение условий использования товаров в соответствии с таможенными процедурами, предусмотренных настоящим Кодексом</xsl:when>
						<xsl:when test=".='7'">пп.7 п.6 ст. 331 ТК ЕАЭС: соблюдение иных требований, установленных международными договорами и актами в сфере таможенного регулирования и (или) законодательством государств-членов</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="position()!=last()">;<br/>
					</xsl:if>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="aac:SubjectInspectionText and aac:SubjectInspectionCode">;<br/>
		</xsl:if>
		<xsl:if test="aac:SubjectInspectionText">
			<span class="normal">
				<xsl:value-of select="aac:SubjectInspectionText"/>
			</span>
		</xsl:if>
		<xsl:if test="(aac:SubjectInspectionText or aac:SubjectInspectionCode) and aac:Note">;<br/>
		</xsl:if>
		<xsl:if test="aac:Note">
			<span class="normal">примечания: 
			<xsl:value-of select="aac:Note"/>
			</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа adt_cat:DisorderType -->
	<xsl:template match="aac:AuditDisorders">
		<span class="normal">
			<xsl:apply-templates select="adt_cat:DisorderDescription"/>
		</span>
		<xsl:choose>
			<xsl:when test="adt_cat:AKParts or adt_cat:LawArticle">
				<xsl:if test="adt_cat:AKParts">
				; статьи КоАП, под которые подпадают обнаруженные признаки АП: 
				<xsl:value-of select="adt_cat:AKParts"/>
				</xsl:if>
				<xsl:if test="adt_cat:LawArticle">
					; ссылка на положения иных нормативных правовых актов, требования которых нарушены: 
					<xsl:for-each select="adt_cat:LawArticle">
						<xsl:if test="cat_ru:PrDocumentName">
							<xsl:value-of select="cat_ru:PrDocumentName"/>
						</xsl:if>
						<xsl:if test="cat_ru:PrDocumentNumber">
							№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</xsl:if>
						<xsl:if test="cat_ru:PrDocumentDate">
							от 
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="adt_cat:ArticleNumber">
							<xsl:text> статья </xsl:text>
							<xsl:value-of select="adt_cat:ArticleNumber"/>
						</xsl:if>
						<xsl:if test="adt_cat:PartNumber">
							<xsl:text> часть </xsl:text>
							<xsl:value-of select="adt_cat:PartNumber"/>
						</xsl:if>
						<xsl:if test="adt_cat:ClauseNumber">
							<xsl:text> пункт </xsl:text>
							<xsl:value-of select="adt_cat:ClauseNumber"/>
						</xsl:if>
						<xsl:if test="position()!=last()">; </xsl:if>
					</xsl:for-each>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
			, нарушений международных договоров и актов в сфере таможенного регулирования и (или) законодательства Российской Федерации не выявлено
		</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="adt_cat:AuditPayments">
		; Таможенные пошлины, налоги, не уплаченные в установленный срок:
		<xsl:for-each select="adt_cat:AuditPayments">
				<span class="normal">
					<xsl:value-of select="adt_cat:PaymentModeCode"/>&#160; 
				<xsl:value-of select="translate(format-number(adt_cat:PaymentAmount,'#.00'), '.', ',')"/>
					<xsl:if test="adt_cat:PaymentCurrencyCode">
					&#160; (<xsl:value-of select="adt_cat:PaymentCurrencyCode"/>)
				</xsl:if>
				</span>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа aac:AdminViolationType -->
	<xsl:template match="aac:AdminViolations">
		<xsl:if test="aac:DisorderDescription">
		протокол (определение): 
		<xsl:if test="aac:DisorderDescription/cat_ru:PrDocumentName">
				<xsl:value-of select="aac:DisorderDescription/cat_ru:PrDocumentName"/>
			</xsl:if>
			<xsl:if test="aac:DisorderDescription/cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="aac:DisorderDescription/cat_ru:PrDocumentNumber"/>
			</xsl:if>
			<xsl:if test="aac:DisorderDescription/cat_ru:PrDocumentDate">
			от 
			<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="aac:DisorderDescription/cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
		<xsl:if test="aac:AKParts">
			<xsl:if test="aac:DisorderDescription">, </xsl:if>
		статья КоАП: 
		<xsl:value-of select="aac:AKParts"/>
		</xsl:if>
		<xsl:if test="aac:ViolationComments">
			<xsl:if test="aac:DisorderDescription or aac:AKParts">, </xsl:if>
		комментарии: 
		<xsl:value-of select="aac:ViolationComments"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BankInformation">
	тип счета: 
	<xsl:for-each select="cat_ru:BankAccountDescription">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>	
	; счет(а): 
	<xsl:for-each select="cat_ru:BankAccount">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="cat_ru:BankName">
		; банк: <xsl:value-of select="cat_ru:BankName"/>
		</xsl:if>
		<xsl:if test="cat_ru:BankMFO">
		; МФО банка: <xsl:value-of select="cat_ru:BankMFO"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">
		; ОКПО банка: <xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
		; БИК: <xsl:value-of select="cat_ru:BICID"/>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
		; SWIFT банка: <xsl:value-of select="cat_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
		; к/с банка: <xsl:value-of select="cat_ru:CorrAccount"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
		; к/с банка: <xsl:value-of select="cat_ru:CorrAccount"/>
		</xsl:if>
		<xsl:if test="cat_ru:TransitCurrencyAccount">
		; валютный счет организации (транзитный):&#160;
		<xsl:for-each select="cat_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
		; валютный счет организации (специальный транзитный):&#160;
		<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для adt_cat:SecondExempReceivedType-->
	<xsl:template match="aac:SecondExempReceived">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>,&#160;
	</xsl:if>
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
	<xsl:value-of select="cat_ru:PersonName"/>&#160;
	<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="adt_cat:Passport">
		,&#160;
		<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardCode">
				<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardCode"/>&#160;
		</xsl:if>
			<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardName">
				<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardName"/>
			</xsl:if>
			<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(adt_cat:Passport/RUScat_ru:IdentityCardNumber) &gt; 0">
			,&#160;
		</xsl:if>
			<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardSeries">
			серия&#160;
			<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardSeries"/>
				<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardNumber) &gt; 0">&#160;</xsl:if>
			</xsl:if>
			<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardNumber">
			№&#160;
			<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardNumber"/>
			</xsl:if>
			<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardDate) &gt; 0 or string-length(adt_cat:Passport/RUScat_ru:OrganizationName) &gt; 0">
			, выдан&#160;
		</xsl:if>
			<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardDate">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="adt_cat:Passport/RUScat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="adt_cat:Passport/RUScat_ru:OrganizationName">	
			&#160;<xsl:value-of select="adt_cat:Passport/RUScat_ru:OrganizationName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="adt_cat:AuthoritesDocument">
		; документ, подтверждающий полномочия&#160;
		<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentName">
				<xsl:value-of select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentName"/>&#160;
		</xsl:if>
			<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentNumber">
			&#160;№&#160;
			<xsl:value-of select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
			</xsl:if>
			<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentDate">
			&#160;от&#160;
			<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:ComplationAuthorityDate">
			&#160;(дата окончания полномочий&#160;
			<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="adt_cat:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
				</xsl:call-template>
			)
		</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="aac:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
   <!--Шаблон для типа adt_cat:AuditPeriodType-->
	<xsl:template match="aac:AuditPeriod">
		<span class="normal">с </span>
		<xsl:choose>
			<xsl:when test="adt_cat:BeginAuditPeriodDate">
				<span class="normal">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="adt_cat:BeginAuditPeriodDate"/>
					</xsl:call-template>
				</span>
			</xsl:when>
			<xsl:otherwise>(не указано)</xsl:otherwise>
		</xsl:choose>
		<span class="normal"> по </span>
		<xsl:choose>
			<xsl:when test="adt_cat:EndAuditPeriodDate">
				<span class="normal">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="adt_cat:EndAuditPeriodDate"/>
					</xsl:call-template>
				</span>
			</xsl:when>
			<xsl:otherwise>(не указано)</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template name="gtd_date">
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
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)"/>
				</span>
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
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>&#160;"<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;"<u>&#160;<xsl:choose>
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
					</xsl:choose>&#160;</u>&#160;<xsl:value-of select="substring($date,1,2)"/>
				<u>
					<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>