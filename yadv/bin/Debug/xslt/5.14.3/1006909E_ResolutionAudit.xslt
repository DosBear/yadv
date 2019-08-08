<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:resa="urn:customs.ru:Information:CustomsAuditDocuments:ResolutionAudit:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<!-- Приказ ФТС от 04.12.18 № 1980 "Об утверждении форм постановления об изъятии товаров, акта изъятия товаров и акта о возврате изъятых товаров и порядков их заполнения" 
	Приложение № 1 - Постановление об изъятии товаров (arsg:SeizureKind=2 KindDoc = 2)-->
	<!--Приказ ФТС России  от 14.02.2019 г. № 258 "Об утверждении форм документов, составляемых таможенными органами при проведении таможенных проверок, порядков их заполнения и порядка внесения изменений в решение о проведении выездной таможенной проверки
	Приложение 5 Постановление о наложении ареста на товары (KindDoc = 1)
	Приложение 6 Постановление об изъятии товаров (arsg:SeizureKind=2 KindDoc = 2)
	Приложение 7 Постановление об изъятии документов (KindDoc = 3)-->
	<!-- Шаблон для типа ResolutionAuditType -->
	<xsl:template match="resa:ResolutionAudit">
		<html>
			<head>
				<style>
			body {
			background: #cccccc;
			font-family: Arial;
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
			border: 1px solid windowtext;
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
			vertical-align: top;
			text-align: center;
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
								<td/>
								<td>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</td>
								<td/>
							</tr>
							<tr class="delim_3">
								<td colspan="3"> </td>
							</tr>
							<tr>
								<td/>
								<td class="value">
									<xsl:value-of select="resa:CustomsIssuedResolution/cat_ru:OfficeName"/>
									<xsl:if test="resa:CustomsIssuedResolution/cat_ru:OfficeName">
										<span class="normal"> (</span>
									</xsl:if>
									<xsl:value-of select="resa:CustomsIssuedResolution/cat_ru:Code"/>
									<xsl:if test="resa:CustomsIssuedResolution/cat_ru:OfficeName">)<span class="normal"/>
									</xsl:if>
								</td>
								<td/>
							</tr>
							<tr class="graphLittle">
								<td/>
								<td align="center">(наименование таможенного органа)</td><td/>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
						<tr>
							<td class="delim_3"><br/></td>
						</tr>
							<tr align="center" class="graphHeader">
								<td>ПОСТАНОВЛЕНИЕ</td>
							</tr>
							<tr class="delim_3"><td/>
							</tr>
							<tr align="center">
								<td>
									<xsl:choose>
										<xsl:when test="resa:KindDoc = '1'">о наложении ареста на товары</xsl:when>
										<xsl:when test="resa:KindDoc = '2'">об изъятии товаров</xsl:when>
										<xsl:when test="resa:KindDoc = '3'">об изъятии документов</xsl:when>
										<xsl:otherwise>о <u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
						</tbody>
					</table>
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="45%" align="left">
									<xsl:call-template name="Date">
										<xsl:with-param name="date" select="resa:ResolutionNumber/adt_cat:Date"/>
									</xsl:call-template>
								</td>
								<td width="15%"/> 
								<td width="40%" valign="bottom" class="value"><xsl:value-of select="resa:ResolutionNumber/resa:Place"/></td>
							</tr>
							<tr class="graphLittle">
								<td> (дата)</td>
								<td/> 
								<td>(место составления)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td class="graphMain">
									<xsl:if test="resa:KindDoc = '2'">
										<xsl:choose>
											<xsl:when test="resa:SeizureKind=2">Должностное лицо</xsl:when>
										</xsl:choose>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value"><xsl:apply-templates mode="customs_person" select="resa:CustomsIssuedResolution"/></td>
							</tr>
							<tr class="graphLittle">
								<td align="center">
									<xsl:choose>
										<xsl:when test="resa:SeizureKind=2">(должность, фамилия, имя, отчество (отчество указывается при наличии) начальника таможенного органа либо уполномоченного им должностного лица, вынесшего постановление)</xsl:when>
										<xsl:otherwise>(фамилия, имя, отчество (отчество указывается при наличии), должность, должностного лица таможенного органа, вынесшего постановление)</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
							<xsl:choose>
								<xsl:when test="resa:SeizureKind=2">
									<xsl:if test="resa:KindDoc=2">
										<tr>
											<td class="delim_3"></td>
										</tr>
										<tr>
											<td style="text-align: justify">
												<span class="normal"> установив, что выявлены товары, указанные в пункте<xsl:choose>
														<xsl:when test="resa:Article='1'">&#160;<span class="value">&#160;1&#160;</span> части 1 статьи <span class="value">&#160;318&#160;</span>&#160;&#160;</xsl:when>
														<xsl:when test="resa:Article='2'">&#160;<span class="value">&#160;2&#160;</span> части 1 статьи <span class="value">&#160;318&#160;</span>&#160;&#160;</xsl:when>
														<xsl:when test="resa:Article='3'">&#160;<span class="value">&#160;1&#160;</span> части 1 статьи <span class="value">&#160;319&#160;</span>&#160;&#160;</xsl:when>
														<xsl:when test="resa:Article='4'">&#160;<span class="value">&#160;2&#160;</span> части 1 статьи <span class="value">&#160;319&#160;</span>&#160;&#160;</xsl:when>
														<xsl:otherwise>&#160;&#160;<u>&#160;&#160;&#160;</u> части 1 статьи <u> &#160;&#160;&#160;</u>&#160;&#160;</xsl:otherwise>
													</xsl:choose> Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации", на основании</span>
											</td>
										</tr>
										<tr>
											<td class="delim_3"/>
										</tr>
										<tr>
											<td class="value">Решение<xsl:if test="resa:DecisionPerformAuditNumber/adt_cat:Number"> № <xsl:value-of select="resa:DecisionPerformAuditNumber/adt_cat:Number"/>
												</xsl:if>
												<xsl:if test="resa:DecisionPerformAuditNumber/adt_cat:Date"> от <xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="resa:DecisionPerformAuditNumber/adt_cat:Date"/>
													</xsl:call-template>
													<xsl:if test="resa:DecisionPerformAuditNumber/adt_cat:Time">&#160;(<xsl:value-of select="substring(resa:DecisionPerformAuditNumber/adt_cat:Time,1,8)"/>)										</xsl:if>
												</xsl:if>
											</td>
										</tr>
										<tr>
											<td class="delim_3"><br/></td>
										</tr>
										<tr>
											<td class="graphMain">принятого по результатам</td>
										</tr>
										<tr>
											<td class="value"><xsl:value-of select="resa:NameFormCustomsControl"/></td>
										</tr>
										<tr align="center">
											<td class="graphLittle">(указывается наименование формы таможенного контроля)</td>
										</tr>
										<tr>
											<td class="delim_3"><br/></td>
										</tr>
										<tr>
											<td class="graphMain">руководствуясь статьей <xsl:choose>
													<xsl:when test="resa:Article='1' or resa:Article='2'">
														<span class="value">&#160;318&#160;</span>
													</xsl:when>
													<xsl:when test="resa:Article='3' or resa:Article='4'">
														<span class="value">&#160;319&#160;</span>
													</xsl:when>
													<xsl:otherwise>
														<u> &#160;&#160;&#160;</u>
													</xsl:otherwise>
												</xsl:choose> Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации"</td>
										</tr>
										<tr>
											<td class="delim_3"><br/></td>
										</tr>
										<tr>
											<td class="normal" align="center"><xsl:text>ПОСТАНОВИЛ:</xsl:text></td>
										</tr>
										<tr>
											<td class="delim_3"/>
										</tr>
										<tr>
											<td class="normal">Изъять</td>
										</tr>
										<tr>
											<td class="delim_3"/>
										</tr>
										<xsl:for-each select="resa:Goods">
											<tr>
												<td align="left" class="value"><xsl:apply-templates select="."/></td>
											</tr>
											<tr>
												<td class="delim_3"/>
											</tr>
										</xsl:for-each>
										<tr align="center">
											<td class="graphLittle">(наименование товаров, подлежащих изъятию, их количество)</td>
										</tr>
										<tr>
											<td class="graphMain">у</td>
										</tr>
										<tr>
											<td class="delim_3"/>
										</tr>
										<tr>
											<td class="value"><xsl:apply-templates select="resa:AuditOrganization"/></td>
										</tr>
										<tr align="center">
											<td class="graphLittle">(лицо, у которого обнаружены товары)</td>
										</tr>
										<tr>
											<td class="delim_3"></td>
										</tr>
										<tr>
											<td class="normal">находящиеся</td>
										</tr>
										<tr>
											<td class="delim_3"/>
										</tr>
										<tr>
											<td class="value">
												<xsl:if test="resa:GoodsPlaceAddress">
													<xsl:apply-templates select="resa:GoodsPlaceAddress"/>
												</xsl:if>
											</td>
										</tr>
										<tr align="center">
											<td class="graphLittle">(место нахождения товара)</td>
										</tr>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td class="delim_3"/>
									</tr>	
									<tr>								
										<td class="graphMain" style="text-align: justify">
								при проведении выездной таможенной проверки на основании решения о проведении выездной таможенной проверки от&#160; 
								<span class="value">
												<xsl:choose>
													<xsl:when test="resa:DecisionPerformAuditNumber/adt_cat:Date">&#160;&#160;
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="resa:DecisionPerformAuditNumber/adt_cat:Date"/>
														</xsl:call-template>
														<xsl:if test="resa:DecisionPerformAuditNumber/adt_cat:Time">&#160;
															<xsl:value-of select="substring(adt_cat:Time,1,8)"/>
														</xsl:if>
											&#160;&#160;
										</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</span>
								&#160;№&#160;
								<span class="value">
												<xsl:choose>
													<xsl:when test="resa:DecisionPerformAuditNumber/adt_cat:Number">&#160;&#160;
													<xsl:value-of select="resa:DecisionPerformAuditNumber/adt_cat:Number"/>&#160;&#160;
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</span>
											<br>в отношении</br>
										</td>
									</tr>
									<tr class="delim">
										<td/>
									</tr>
									<tr>
										<td class="value"><xsl:apply-templates select="resa:AuditOrganization"/><br/></td>
									</tr>
									<tr class="graphLittle">
										<td align="center">(указываются сведения о проверяемом лице)</td>
									</tr>
									<tr class="delim">
										<td/>
									</tr>									
									<tr>
										<td><span class="normal">установив, что</span></td>
									</tr>
									<tr class="delim">
										<td/>
									</tr>
									<tr>
										<td class="value"><xsl:apply-templates select="resa:Reason"/></td>
									</tr>
									<xsl:if test="resa:KindDoc = '1'">
										<tr class="graphLittle">
											<td align="center">(указываются основания для наложения ареста на товары)</td>
										</tr>
									</xsl:if>
									<tr class="delim">
										<td/>
									</tr>
									<tr class="delim">
										<td/>
									</tr>
									<tr>
										<td style="text-align: justify">и руководствуясь подпунктом
											<xsl:choose>
												<xsl:when test="resa:KindDoc = '1'">6</xsl:when>
												<xsl:when test="resa:KindDoc = '2'">6</xsl:when>
												<xsl:when test="resa:KindDoc = '3'">5</xsl:when>
												<xsl:otherwise><u>&#160;&#160;&#160;&#160;&#160;</u></xsl:otherwise>
											</xsl:choose>
								пункта 2 статьи 335 Таможенного кодекса Евразийского экономического союза, а также статьей 233 Федерального закона от 3 августа 2018 г. № 289-ФЗ"О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации",
										</td>
									</tr>
									<tr class="delim">
										<td/>
									</tr>
									<tr>
										<td align="center"><span class="normal">ПОСТАНОВИЛ:</span></td>
									</tr>
									<tr class="delim">
										<td/>
									</tr>
									<tr>
										<td>
											<span class="normal">
												<xsl:choose>
													<xsl:when test="resa:KindDoc = '1'">Наложить арест на товары:</xsl:when>
													<xsl:when test="resa:KindDoc = '2'">Изъять товары:</xsl:when>
													<xsl:when test="resa:KindDoc = '3'">Изъять документы:</xsl:when>
													<xsl:otherwise><u>&#160;&#160;&#160;&#160;&#160;</u></xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
									</tr>
									<tr class="delim">
										<td/>
									</tr>									
									<xsl:choose>
										<xsl:when test="resa:KindDoc = '1' or resa:KindDoc = '2'">
											<xsl:for-each select="resa:Goods">
												<tr>
													<td align="left" class="value"><xsl:apply-templates select="."/></td>
												</tr>
											</xsl:for-each>
										</xsl:when>
										<xsl:when test="resa:KindDoc=3">
										<xsl:for-each select="resa:DocsInfo">
											<tr>
												<td align="left" class="value"><xsl:apply-templates select="." mode="document"></xsl:apply-templates></td>
											</tr>
										</xsl:for-each>
										</xsl:when>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</tbody>
					</table>
					<xsl:choose>
						<xsl:when test="resa:SeizureKind=2">
							<xsl:if test="resa:KindDoc = '2'">
								<table>
									<tbody class="graphMain">
									<tr>
										<td class="delim_3"><br/><br/></td>
									</tr>
										<tr>
											<td>Подпись должностного лица таможенного органа:<xsl:apply-templates mode="signatureMark" select="resa:CustomsIssuedResolution/adt_cat:ApproverPerson"/></td>
										</tr>
										<tr>
											<td>Копию настоящего постановления получил:<xsl:apply-templates mode="signature2ndCopy" select="resa:SecondExempReceived"/></td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<table>
							<tr>
								<td colspan="5" class="delim_3"><br/><br/></td>
							</tr>
								<tr class="graphMain" align="center">
									<td width="36%" valign="bottom" class="value">
											<xsl:value-of select="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
									</td>
									<td width="7%"> </td>
									<td width="15%" class="value"> </td>
									<td width="7%"> </td>
									<td width="35%" valign="bottom" class="value">
										<xsl:value-of select="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;
										<xsl:value-of select="substring(resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonName,1,1)"/>
										<xsl:if test="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonName">.&#160;</xsl:if>
										<xsl:value-of select="substring(resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonMiddleName,1,1)"/>
										<xsl:if test="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonMiddleName">.</xsl:if>
										<br/>
									</td>
								</tr>
								<tr class="graphLittle" align="center">
									<td width="36%">(должность должностного лица таможенного органа, вынесшего постановление)</td>
									<td valign="top" width="7%"> </td>
									<td valign="top" width="15%">(подпись)</td>
									<td width="7%"> </td>
									<td valign="top" width="35%">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
								</tr>
							</table>
							<table>
								<tbody align="left" class="graphMain">
									<tr>
										<td width="75%">
										<br/>
											<span class="normal">Копию постановления получил:</span>
										</td>
										<td width="8%"/>
										<td width="17%"/>
									</tr>
									<tr class="delim_3">
										<td colspan="3"> </td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="resa:SecondExempReceived"/>
											<br/>
										</td>
										<td/>
										<td class="value"/>
									</tr>
									<tr class="graphLittle">
										<td align="center">(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность проверяемого лица, либо его представителя)</td>
										<td/>
										<td> (подпись)</td>
									</tr>
								</tbody>
							</table>
						</xsl:otherwise>
					</xsl:choose>
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="45%" align="left">
									<xsl:call-template name="Date">
										<xsl:with-param name="date" select="resa:SecondExempReceived/adt_cat:Date"/>
									</xsl:call-template>
								</td>
								<td width="55%"> </td>
							</tr>
							<tr class="graphLittle">
								<td width="45%"> (дата получения копии постановления) </td>
								<td width="55%"> </td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="resa:CustomsMark">
						<table>
							<tbody align="center" class="graphMain">
								<tr>
									<td class="delim_3"><br/><br/></td>
								</tr>
								<tr>
									<td align="left">Отметки должностных лиц таможенного органа:</td>
								</tr>
								<tr class="delim">
									<td> </td>
								</tr>
								<tr>
									<td align="left" class="value">
										<xsl:value-of select="resa:CustomsMark/resa:CustomsMarkText"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tr>
								<td class="delim_3"><br/><br/></td>
							</tr>						
							<tr class="graphMain" align="center">
								<td width="36%" valign="bottom" class="value">
									<xsl:value-of select="resa:CustomsMark/cat_ru:PersonPost"/>
								</td>
								<td width="7%"> </td>
								<td width="15%" class="border_bottom"> </td>
								<td width="7%"> </td>
								<td width="35%" valign="bottom" class="value">
									<xsl:value-of select="resa:CustomsMark/cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="substring(resa:CustomsMark/cat_ru:PersonName,1,1)"/>
									<xsl:if test="resa:CustomsMark/cat_ru:PersonName">.&#160;</xsl:if>
									<xsl:value-of select="substring(resa:CustomsMark/cat_ru:PersonMiddleName,1,1)"/>
									<xsl:if test="resa:CustomsMark/cat_ru:PersonMiddleName">.</xsl:if>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td valign="top" width="36%">(должность)</td>
								<td width="7%"> </td>
								<td valign="top" width="15%">(подпись)</td>
								<td width="15%"> </td>
								<td valign="top" width="35%">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
							</tr>
							<xsl:if test="resa:CustomsMark/cat_ru:IssueDate">
								<table>
									<tbody align="center" class="graphMain">
										<tr>
											<td width="45%" align="left">
												<xsl:call-template name="Date">
													<xsl:with-param name="date" select="resa:CustomsMark/cat_ru:IssueDate"/>
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
							</xsl:if>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для adt_cat:SecondExempReceivedType-->
	<xsl:template match="resa:SecondExempReceived">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
	<xsl:value-of select="cat_ru:PersonName"/>&#160;
	<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="adt_cat:Passport">
			<xsl:apply-templates select="adt_cat:Passport"/>
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
				</xsl:call-template>)	</xsl:if>
		</xsl:if>
		<xsl:if test="resa:Comment">,&#160;<xsl:value-of select="resa:Comment"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="resa:Goods">
		<xsl:for-each select="resa:GoodsDescription">
			<xsl:value-of select=". "/>
			<xsl:if test="position()!=last()">&#160;</xsl:if>
		</xsl:for-each>
		<xsl:if test="resa:GoodsQuantity">, <xsl:apply-templates select="resa:GoodsQuantity"/>
		</xsl:if>
		<xsl:if test="resa:GoodsCharacteristics">
			<xsl:if test="resa:GoodsQuantity | resa:GoodsgraphLittleiption">, </xsl:if>
			<xsl:for-each select="resa:GoodsCharacteristics">
				<xsl:value-of select=". "/>
				<xsl:if test="position()!=last()">&#160;</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="resa:GoodsQuantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>&#160;<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode"> (<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails | resa:GoodsPlaceAddress">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>(вид адреса:</xsl:text>
			<xsl:choose>
				<xsl:when test="RUScat_ru:AddressKindCode=1"> адрес регистрации) </xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode=2">  фактический адрес) </xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode=3"> почтовый адрес) </xsl:when>
			</xsl:choose>
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
	<xsl:template match="resa:AuditOrganization">
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
		<xsl:if test="resa:OKPO">
			<span class="normal">, </span>
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="resa:OKPO"/>
		</xsl:if>
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
		<xsl:if test="RUScat_ru:UITN">,&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
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
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">; 
				<span class="normal">
						<br/>
					</span>
					<span class="italic">Адрес(а)</span>
					<span class="normal">: </span>
				</xsl:if>
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="resa:FactAddressDetails">
			<span class="normal">
				<br/>
			</span>
			<span class="italic">Фактический адрес</span>
			<span class="normal">: </span>
			<xsl:for-each select="resa:FactAddressDetails">
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
		<xsl:if test="resa:RegionCustoms">
			<span class="normal">,&#160;</span>
			<span class="italic">Региональное таможенное управление:&#160;</span>
			<xsl:if test="resa:RegionCustoms/adt_cat:FullOfficeName">
				<xsl:value-of select="resa:RegionCustoms/adt_cat:FullOfficeName"/>
			</xsl:if>
			<xsl:if test="resa:RegionCustoms/cat_ru:OfficeName">
				<xsl:if test="string-length(resa:RegionCustoms/adt_cat:FullOfficeName) &gt; 0">
					<span class="normal"> (</span>
				</xsl:if>
				<xsl:value-of select="resa:RegionCustoms/cat_ru:OfficeName"/>
				<xsl:if test="string-length(resa:RegionCustoms/adt_cat:FullOfficeName) &gt; 0">
					<span class="normal">)</span>
				</xsl:if>
			</xsl:if>
			<xsl:if test="resa:RegionCustoms/cat_ru:Code">&#160; (<xsl:value-of select="resa:RegionCustoms/cat_ru:Code"/>)&#160;</xsl:if>
		</xsl:if>
		<xsl:if test="resa:Person">,&#160;<xsl:apply-templates mode="person"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="customs_person" match="*">
		<xsl:if test="adt_cat:ApproverPerson/cat_ru:PersonPost">
			<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
			</xsl:if>
		<xsl:if test="resa:Rank">
			<xsl:value-of select="resa:Rank"/>,&#160;</xsl:if>
		<xsl:if test="adt_cat:CustomsSubUnit">
			<xsl:value-of select="adt_cat:CustomsSubUnit"/>,</xsl:if>&#160;<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">&#160;(
			</xsl:if>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:Code">), &#160;
			</xsl:if>
		<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonName"/>&#160;<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>
		<xsl:if test="resa:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="resa:PersonCustomsID"/>,</xsl:if>
		<xsl:if test="resa:LNP">&#160;ЛНП:&#160;<xsl:value-of select="resa:LNP"/> </xsl:if>
		<xsl:if test="resa:Phone">&#160;Тел:&#160;<xsl:value-of select="resa:Phone"/> </xsl:if>
		<xsl:if test="resa:Note">&#160;<xsl:value-of select="resa:Note"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="signature2ndCopy" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="30%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td width="10%"/>
					<td width="20%" class="value"/>
					<td width="10%"/>
					<td width="30%" class="value">
						<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
						<xsl:if test="cat_ru:PersonName">.&#160;</xsl:if>
						<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
						<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
					</td>
				</tr>
				<tr valign="top">
					<td class="graphLittle">(должность)</td>
					<td/>
					<td class="graphLittle">(подпись)</td>
					<td/>
					<td class="graphLittle">(фамилия, инициалы имено и отчества (инициал отчества указывается при наличии отчества) лица, у которого обнаружены товары, либо его представителя)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="signatureMark" match="*">
		<table width="100%">
			<tbody>
				<tr>
					<td colspan="5">
						<br/>
					</td>
				</tr>
				<tr align="center" valign="bottom">
					<td width="40%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td width="3%"/>
					<td width="20%" class="value"/>
					<td width="3%"/>
					<td width="34%" class="value">
						<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
						<xsl:if test="cat_ru:PersonName">.&#160;</xsl:if>
						<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
						<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="graphLittle" valign="top">(должность)</td>
					<td/>
					<td class="graphLittle" valign="top">(подпись)</td>
					<td/>
					<td class="graphLittle" valign="top">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
				</tr>
			</tbody>
		</table>
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
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard|adt_cat:Passport">
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
	
	<xsl:template mode="document" match="*">
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
		<xsl:if test="resa:DocsQuantity">, количество: <xsl:value-of select="resa:DocsQuantity"/> </xsl:if>
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
</xsl:stylesheet>
