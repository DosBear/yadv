<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:rda="urn:customs.ru:Information:CustomsAuditDocuments:ReqDoc4Audit:5.14.3">
<!--Приказ ФТС России  от 14.02.2019 г. № 258 "Об утверждении форм документов, составляемых таможенными органами при проведении таможенных проверок, 
порядков их заполнения и порядка внесения изменений в решение о проведении выездной таможенной проверки"
Приложение № 17 - Требование о представлении документов и (или) сведений при выездной таможенной проверке (rda:IdentKindRequest = 2)
Приложение № 18 - Требование о представлении документов и (или) сведений лицом, связанным с проверяемым лицом по сделкам (операциям) с товарами, в отношении которых проводится таможенная проверка  (rda:IdentKindRequest = 4)
Приложение № 19 - Требование о представлении документов и (или) сведений при камеральной таможенной проверке (rda:IdentKindRequest = 3)
Приложение № 20 - Требование о предъявлении товаров при выездной таможенной проверке (rda:IdentKindRequest = 1)-->
	<!-- Шаблон для типа ReqDoc4AuditType -->
	<xsl:template match="rda:ReqDoc4Audit">
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
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			width: 100%;
            table-layout: fixed;			
			word-wrap: break-word;
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
			font-style: italic;
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
					<xsl:if test="rda:IdentKindRequest='1' or rda:IdentKindRequest='2'">
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
									<td width="80%" class="border_bottom">
										<span class="normal">
											<xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:OfficeName"/>
										</span>
										<xsl:if test="rda:CustomsIssuedRequest/cat_ru:OfficeName">
											<span class="normal"> (</span>
										</xsl:if>
										<span class="normal">
											<xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:Code"/>
										</span>
										<xsl:if test="rda:CustomsIssuedRequest/cat_ru:OfficeName">
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
					</xsl:if>
							<table>
								<tbody align="left" class="graphMain">
									<tr>
										<td width="50%"> </td>
										<td width="50%" class="border_bottom">
										<xsl:apply-templates mode="person" select="rda:AuditOrganization/rda:Person"/>
										<xsl:text> </xsl:text>
											<xsl:apply-templates select="rda:AuditOrganization"/>
											<br/>
										</td>
									</tr>
									<tr class="graphLittle">
										<td width="50%"/>
										<td width="50%" align="center">(адресат)</td>
									</tr>
								</tbody>
							</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr align="center" class="graphHeader">
								<td>ТРЕБОВАНИЕ</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr align="center">
								<td>
									<xsl:choose>
										<xsl:when test="rda:IdentKindRequest = 1">о предъявлении товаров при выездной таможенной проверке</xsl:when>
										<xsl:when test="rda:IdentKindRequest = 2">о представлении документов и (или) сведений при выездной таможенной проверке</xsl:when>
										<xsl:when test="rda:IdentKindRequest = 3">о представлении документов и (или) сведений при камеральной таможенной проверке</xsl:when>
										<xsl:when test="rda:IdentKindRequest = 4">о представлении документов и (или) сведений лицом, связанным с проверяемым лицом по сделкам (операциям) с товарами, в отношении которых проводится таможенная проверка</xsl:when>
										<xsl:otherwise>о <u>&#160;&#160;&#160;&#160;&#160;</u> таможенной проверке</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="rda:IdentKindRequest='1' or rda:IdentKindRequest='2'">
						<br/>
						<table>
							<tbody align="center" class="graphMain">
								<tr>
									<td width="45%" align="left">
										<xsl:call-template name="Date">
											<xsl:with-param name="date" select="rda:RequestNumber/adt_cat:Date"/>
										</xsl:call-template>
									</td>
									<td width="15%"> </td>
									<td width="40%" class="border_bottom">
										<xsl:value-of select="rda:RequestPlace"/>
									</td>
								</tr>
								<tr class="graphLittle">
									<td width="45%"> </td>
									<td width="10%"> </td>
									<td width="45%">(место составления)</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<xsl:if test="rda:IdentKindRequest='1' or rda:IdentKindRequest='2'">
						<table>
							<tbody align="left" class="graphMain">
								<tr class="delim">
									<td> </td>
								</tr>
								<tr style="text-align: justify;">
									<td>
								На основании статей 333,&#160;
								<xsl:choose>
									<xsl:when test="rda:IdentKindRequest='1'">336&#160;</xsl:when>
									<xsl:when test="rda:IdentKindRequest='2'">336, 340&#160;</xsl:when>
								</xsl:choose>
								Таможенного кодекса Евразийского экономического союза и в соответствии с решением о проведении&#160;
								<u>
											<xsl:choose>
												<xsl:when test="rda:AuditFieldKind='1'">&#160;выездной плановой&#160;</xsl:when>
												<xsl:when test="rda:AuditFieldKind='2'">&#160;выездной внеплановой&#160;</xsl:when>
												<xsl:when test="rda:AuditFieldKind='3'">&#160;выездной встречной внеплановой&#160;</xsl:when>
												<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
											</xsl:choose>
										</u>
								таможенной проверки от&#160;
								<xsl:call-template name="DateStr">
											<xsl:with-param name="date" select="rda:DecisionPerformAudit/adt_cat:Date"/>
										</xsl:call-template>
								&#160;№&#160;<u>&#160;<xsl:value-of select="rda:DecisionPerformAudit/adt_cat:Number"/>&#160;</u>&#160;
								необходимо
								<xsl:choose>
									<xsl:when test="rda:IdentKindRequest='1'">&#160;предъявить&#160;</xsl:when>
									<xsl:otherwise>&#160;представить&#160;</xsl:otherwise>
								</xsl:choose>
								в течение&#160;<u>&#160;<xsl:value-of select="rda:DaysLimitSubmission"/>&#160;</u>&#160;
								календарных дней с момента получения настоящего требования следующие
								<xsl:choose>
									<xsl:when test="rda:IdentKindRequest='1'">&#160;товары</xsl:when>
									<xsl:otherwise>&#160;документы и (или) сведения</xsl:otherwise>
								</xsl:choose>
								:
							</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rda:IdentKindRequest='3'">
						<table>
							<tbody align="left" class="graphMain">
								<tr class="delim">
									<td> </td>
								</tr>
								<tr style="text-align: justify;">
								<td>
								На основании статей 336, 340 Таможенного кодекса Евразийского экономического союза в связи с проведением камеральной таможенной проверки (уведомление о проведении камеральной таможенной проверки от&#160;
								<u>&#160;&#160;<xsl:call-template name="russian_date">
												<xsl:with-param select="rda:Notif4Audit/adt_cat:Date" name="dateIn"/>
											</xsl:call-template>&#160;&#160;</u>&#160;№&#160;<u>&#160;<xsl:value-of select="rda:Notif4Audit/adt_cat:Number"/>&#160;</u>&#160;) Вам надлежит представить в течение <u>&#160;<xsl:value-of select="rda:DaysLimitSubmission"/>&#160;</u>&#160;
								календарных дней с даты получения настоящего требования следующие документы и (или) сведения:
							</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rda:IdentKindRequest='4'">
						<table>
							<tbody align="left" class="graphMain">
								<tr class="delim">
									<td> </td>
								</tr>
								<tr style="text-align: justify">
								<td>
								На основании статей 337, 340 Таможенного кодекса Евразийского экономического союза в связи с проводимой таможенной проверкой у лица, с которым 
								<u>&#160;&#160;
									<xsl:choose>
										<xsl:when test="rda:AuditOrganization/cat_ru:OrganizationName">
											<xsl:value-of select="rda:AuditOrganization/cat_ru:OrganizationName"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="rda:AuditOrganization/cat_ru:ShortName"/>
										</xsl:otherwise>
									</xsl:choose>
								&#160;&#160;</u>&#160; 
								связано по сделкам (операциям) с товарами, в отношении которых проводится таможенная проверка в соответствии с решением о проведении&#160;
								<u>
											<xsl:choose>
												<xsl:when test="rda:AuditFieldKind='1'">&#160;выездной плановой&#160;</xsl:when>
												<xsl:when test="rda:AuditFieldKind='2'">&#160;выездной внеплановой&#160;</xsl:when>
												<xsl:when test="rda:AuditFieldKind='3'">&#160;выездной встречной внеплановой&#160;</xsl:when>
												<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
											</xsl:choose>
										</u>
										таможенной проверки от&#160;
										<xsl:call-template name="DateStr">
													<xsl:with-param name="date" select="rda:DecisionPerformAudit/adt_cat:Date"/>
												</xsl:call-template>
										№&#160;<u>&#160;<xsl:value-of select="rda:DecisionPerformAudit/adt_cat:Number"/>&#160;</u> 
										необходимо представить	в течение&#160;<u>&#160;<xsl:value-of select="rda:DaysLimitSubmission"/>&#160;</u>&#160;
										календарных дней с момента получения настоящего требования следующие документы и (или) сведения:
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom">
									<xsl:if test="rda:IdentKindRequest='1'">
										<xsl:for-each select="rda:AuditGoods">
											<xsl:if test="adt_cat:DTNumber">
												<span class="italic">№ ДТ</span>
												<span class="normal">: </span>
												<span class="normal">
													<xsl:apply-templates select="adt_cat:DTNumber"/>
												</span>
											</xsl:if>
											<xsl:if test="adt_cat:GoodsNumeric">
												<span class="italic"> № товара</span>
												<span class="normal">: </span>
												<span class="normal">
													<xsl:value-of select="adt_cat:GoodsNumeric"/>
												</span>
											</xsl:if>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
										<xsl:if test="rda:AuditGoods and rda:RequestedDoc">
											<br/>
										</xsl:if>
									</xsl:if>
									<xsl:for-each select="rda:RequestedDoc">
										<xsl:if test="rda:Position">
											<span class="normal"> 
										№ п/п <xsl:value-of select="rda:Position"/>, 
									</span>
										</xsl:if>
										<span class="normal">
											<xsl:value-of select="cat_ru:PrDocumentName"/> № <xsl:value-of select="cat_ru:PrDocumentNumber"/> от 
								</span>
										<span class="normal">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</span>
										<xsl:if test="rda:RequestPositionID">
											<span class="normal"> 
										, ID позиции в запросе <xsl:value-of select="rda:RequestPositionID"/>
											</span>
										</xsl:if>
										<xsl:if test="rda:DocCode">
											<span class="normal"> 
										, код вида док-та <xsl:value-of select="rda:DocCode"/>
											</span>
										</xsl:if>
										<xsl:if test="rda:ArchDeclID">
											<span class="normal"> 
										, ID декларанта в ЭАД <xsl:value-of select="rda:ArchDeclID"/>
											</span>
										</xsl:if>
										<xsl:if test="rda:ArchDocID">
											<span class="normal"> 
										, ID док-та в архиве <xsl:value-of select="rda:ArchDocID"/>
											</span>
										</xsl:if>
										<xsl:if test="rda:ADocumentID">
											<span class="normal"> 
										, ID док-та <xsl:value-of select="rda:ADocumentID"/>
											</span>
										</xsl:if>
										<xsl:if test="rda:Note">
											<span class="normal"> 
										, <xsl:value-of select="rda:Note"/>
											</span>
										</xsl:if>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
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
								<td>
									<xsl:choose>
										<xsl:when test="rda:IdentKindRequest = '1'">Товары должны быть предъявлены по адресу:</xsl:when>
										<xsl:when test="rda:IdentKindRequest = '2'">Документы и (или) сведения должны быть представлены:</xsl:when>
										<xsl:when test="rda:IdentKindRequest = '3'">Документы и (или) сведения должны быть представлены:</xsl:when>
										<xsl:when test="rda:IdentKindRequest = '4'">Документы и (или) сведения должны быть представлены:</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr class="delim_3">
								<td/>
							</tr>
							<tr>
								<td class="border_bottom">
									<xsl:for-each select="rda:SubmitWayAudit">
										<xsl:for-each select="rda:CustomsAddress">
											<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
										</xsl:for-each>&#160;
										<xsl:choose>
											<xsl:when test="../rda:IdentKindRequest = '1' or ../rda:IdentKindRequest = '2'">
												<xsl:if test="rda:ChiefCommission">
													<xsl:text>Руководителю комиссии по проведению проверки: </xsl:text>
													<xsl:if test="rda:ChiefCommission/cat_ru:PersonPost">
														<xsl:value-of select="rda:ChiefCommission/cat_ru:PersonPost"/>&#160;
													</xsl:if>
													<xsl:if test="rda:ChiefCommission/rda:Rank">
														<xsl:value-of select="rda:ChiefCommission/rda:Rank"/>,&#160;</xsl:if>
													<xsl:if test="rda:ChiefCommission/rda:Department">
														<xsl:value-of select="rda:ChiefCommission/rda:Department"/>,</xsl:if>&#160;<xsl:value-of select="rda:ChiefCommission/rda:CustomsDept/cat_ru:OfficeName"/>
													<xsl:if test="rda:ChiefCommission/rda:CustomsDept/cat_ru:Code">
														<span class="normal">&#160;(</span>
													</xsl:if>
													<xsl:value-of select="rda:ChiefCommission/rda:CustomsDept/cat_ru:Code"/>
													<xsl:if test="rda:ChiefCommission/rda:CustomsDept/cat_ru:Code">
														<span class="normal">)&#160;</span>
													</xsl:if>
													<xsl:value-of select="rda:ChiefCommission/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="rda:ChiefCommission/cat_ru:PersonName"/>&#160;<xsl:value-of select="rda:ChiefCommission/cat_ru:PersonMiddleName"/>
													<xsl:if test="rda:ChiefCommission/rda:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="rda:ChiefCommission/rda:PersonCustomsID"/>,</xsl:if>
													<xsl:if test="rda:ChiefCommission/rda:LNP">&#160;ЛНП:&#160;<xsl:value-of select="rda:ChiefCommission/rda:LNP"/>
													</xsl:if>
													<xsl:if test="rda:ChiefCommission/rda:Phone">&#160;Тел:&#160;<xsl:value-of select="rda:ChiefCommission/rda:Phone"/>
													</xsl:if>
													<xsl:if test="rda:ChiefCommission/rda:Note">&#160;<xsl:value-of select="rda:ChiefCommission/rda:Note"/>
													</xsl:if>
													<br/>
												</xsl:if>
											</xsl:when>
										</xsl:choose>
										<xsl:if test="rda:AnotherWayShare">
											<br/><xsl:apply-templates select="rda:AnotherWayShare"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<xsl:if test="rda:IdentKindRequest = '4'">
								<tr>
									<td style="text-align: justify"><br/>
								&#160;&#160;&#160;&#160;&#160;Информирую, что в соответствии с пунктом 3 статьи 337 Таможенного кодекса Евразийского экономического союза лица, связанные с проверяемым лицом по сделкам (операциям) с товарами, в отношении которых проводится таможенная проверка, обязаны представлять по требованию таможенного органа копии документов и иную информацию по операциям и расчетам, проводимым с проверяемым лицом или с третьими лицами, имеющими отношение к сделкам (операциям) с таковыми товарами, необходимые для проведения таможенной проверки.
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<xsl:choose>
						<xsl:when test="rda:IdentKindRequest='1' or rda:IdentKindRequest='2'">
							<table>
								<tr class="graphMain" align="center">
									<td width="36%" valign="bottom" class="border_bottom">
										<xsl:if test="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonPost">
											<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
								</xsl:if>
										<xsl:if test="rda:CustomsIssuedRequest/rda:Rank">
											<xsl:value-of select="rda:CustomsIssuedRequest/rda:Rank"/>,&#160;</xsl:if>
										<xsl:if test="rda:CustomsIssuedRequest/adt_cat:CustomsSubUnit">
											<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:CustomsSubUnit"/>,</xsl:if>&#160;<xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:OfficeName"/>
										<xsl:if test="rda:CustomsIssuedRequest/cat_ru:Code">
											<span class="normal">&#160;(</span>
										</xsl:if>
										<xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:Code"/>
										<xsl:if test="rda:CustomsIssuedRequest/cat_ru:Code">
											<span class="normal">)&#160;</span>
										</xsl:if>
									</td>
									<td width="2%"> </td>
									<td valign="bottom" width="20%" class="border_bottom"> </td>
									<td width="2%"> </td>
									<td valign="bottom" width="40%" class="border_bottom">
										<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonName"/>&#160;<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>
										<xsl:if test="rda:CustomsIssuedRequest/rda:PersonCustomsID"> номер служебного удостоверения:&#160;<xsl:value-of select="rda:CustomsIssuedRequest/rda:PersonCustomsID"/>,</xsl:if>
										<xsl:if test="rda:CustomsIssuedRequest/rda:LNP"> ЛНП:&#160;<xsl:value-of select="rda:CustomsIssuedRequest/rda:LNP"/>,</xsl:if>
										<xsl:if test="rda:CustomsIssuedRequest/rda:Phone"> Тел:&#160;<xsl:value-of select="rda:CustomsIssuedRequest/rda:Phone"/>,</xsl:if>
										<xsl:if test="rda:CustomsIssuedRequest/rda:Note">&#160;<xsl:value-of select="rda:CustomsIssuedRequest/rda:Note"/>
										</xsl:if>
										<br/>
									</td>
								</tr>
								<tr class="graphLittle" align="center">
									<td valign="top" width="36%">(должность)</td>
									<td width="2%"> </td>
									<td valign="top" width="20%">(подпись)</td>
									<td width="2%"> </td>
									<td valign="top" width="40%">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
								</tr>
							</table>
						</xsl:when>
						<xsl:otherwise>
							<table>
								<tr class="graphMain">
									<td align="left"> 
								Начальник (заместитель начальника)
							</td>
								</tr>
							</table>
							<table>
								<tr class="graphMain" align="center">
									<td width="36%" valign="bottom" class="border_bottom">
										<xsl:if test="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonPost">
											<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
								</xsl:if>
										<xsl:if test="rda:CustomsIssuedRequest/rda:Rank">
											<xsl:value-of select="rda:CustomsIssuedRequest/rda:Rank"/>,&#160;</xsl:if>
										<xsl:if test="rda:CustomsIssuedRequest/adt_cat:CustomsSubUnit">
											<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:CustomsSubUnit"/>,</xsl:if>&#160;<xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:OfficeName"/>
										<xsl:if test="rda:CustomsIssuedRequest/cat_ru:Code">
											<span class="normal">&#160;(</span>
										</xsl:if>
										<xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:Code"/>
										<xsl:if test="rda:CustomsIssuedRequest/cat_ru:Code">
											<span class="normal">)&#160;</span>
										</xsl:if>
									</td>
									<td width="2%"> </td>
									<td valign="bottom" width="20%" class="border_bottom"> </td>
									<td width="2%"> </td>
									<td valign="bottom" width="40%" class="border_bottom">
										<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonName"/>&#160;<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>
										<xsl:if test="rda:CustomsIssuedRequest/rda:PersonCustomsID"> номер служебного удостоверения:&#160;<xsl:value-of select="rda:CustomsIssuedRequest/rda:PersonCustomsID"/>,</xsl:if>
										<xsl:if test="rda:CustomsIssuedRequest/rda:LNP"> ЛНП:&#160;<xsl:value-of select="rda:CustomsIssuedRequest/rda:LNP"/>
										</xsl:if>
										<xsl:if test="rda:CustomsIssuedRequest/rda:Note">&#160;<xsl:value-of select="rda:CustomsIssuedRequest/rda:Note"/>
										</xsl:if>
										<br/>
									</td>
								</tr>
								<tr class="graphLittle" align="center">
									<td valign="top" width="36%">(наименование таможенного органа)</td>
									<td width="2%"> </td>
									<td valign="top" width="20%">(подпись)</td>
									<td width="2%"> </td>
									<td valign="top" width="40%">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
								</tr>
							</table>
						</xsl:otherwise>
					</xsl:choose>
					<br/>
					<xsl:if test="rda:IdentKindRequest='1' or rda:IdentKindRequest='2'">
						<br/>
						<table>
							<tbody align="left" class="graphMain">
								<tr class="delim">
									<td> </td>
								</tr>
								<tr>
									<td>
								Экземпляр требования получил:
							</td>
								</tr>
								<tr class="delim_3">
									<td> </td>
								</tr>
							</tbody>
						</table>
						<table>
							<tr class="graphMain" align="center">
								<td width="70%" valign="bottom" class="border_bottom">
									<xsl:apply-templates mode="person" select="rda:SecondExempReceived"></xsl:apply-templates>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="rda:SecondExempReceived/adt_cat:Passport"/>								
									<xsl:text> </xsl:text>
									<xsl:apply-templates mode="AuthoritesDocument" select="rda:SecondExempReceived/adt_cat:AuthoritesDocument"></xsl:apply-templates>
									<xsl:text> </xsl:text>
									<xsl:value-of select="rda:Comment"/>
								</td>
								<td width="10%"> </td>
								<td width="20%" valign="bottom" class="border_bottom"/>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(должность, фамилия, имя, отчество (отчество указывается при наличии), <br/> наименование и номер документа, удостоверяющего личность проверямого лица <br/>(его представителя)</td>
								<td/>
								<td>(подпись)</td>
							</tr>
						</table>
						<table>
							<tbody align="center" class="graphMain">
								<tr class="delim_3">
									<td> </td>
								</tr>
								<tr>
									<td width="45%" align="left">
										<xsl:call-template name="DateStr">
											<xsl:with-param name="date" select="rda:SecondExempReceived/adt_cat:Date"/>
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
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails|rda:CustomsAddress">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<span class="italic"> (вид адреса</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:choose>
					<xsl:when test="RUScat_ru:AddressKindCode='1'">адрес регистрации</xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode='2'">фактический</xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode='3'">почтовый</xsl:when>
					<xsl:otherwise><xsl:value-of select="RUScat_ru:AddressKindCode"/></xsl:otherwise>
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
	<xsl:template match="rda:AuditOrganization">
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
		<xsl:if test="rda:OKPO">
			<span class="normal">, </span>
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="rda:OKPO"/>
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
		<xsl:if test="rda:FactAddressDetails">
			<span class="normal">
				<br/>
			</span>
			<span class="italic">Фактический адрес</span>
			<span class="normal">: </span>
			<xsl:for-each select="rda:FactAddressDetails">
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="rda:RegionCustoms">
			<span class="normal">,&#160;</span>
			<span class="italic">Региональное таможенное управление:&#160;</span>
			<xsl:if test="rda:RegionCustoms/adt_cat:FullOfficeName">
				<xsl:value-of select="rda:RegionCustoms/adt_cat:FullOfficeName"/>
			</xsl:if>
			<xsl:if test="rda:RegionCustoms/cat_ru:OfficeName">
				<xsl:if test="string-length(rda:RegionCustoms/adt_cat:FullOfficeName) &gt; 0">
					<span class="normal"> (</span>
				</xsl:if>
				<xsl:value-of select="rda:RegionCustoms/cat_ru:OfficeName"/>
				<xsl:if test="string-length(rda:RegionCustoms/adt_cat:FullOfficeName) &gt; 0">
					<span class="normal">)</span>
				</xsl:if>
			</xsl:if>
			<xsl:if test="rda:RegionCustoms/cat_ru:Code">&#160; (<xsl:value-of select="rda:RegionCustoms/cat_ru:Code"/>)&#160;</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
				<xsl:text> </xsl:text>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" name="PersonPost" mode="PersonPost">
		<xsl:value-of select="cat_ru:PersonPost"/>&#160;<xsl:value-of select="rda:Rank"/>&#160;<xsl:value-of select="rda:Department"/>&#160;<span class="normal">
			<xsl:value-of select="rda:CustomsDept/cat_ru:OfficeName"/>
		</span>
		<xsl:if test="rda:CustomsDept/cat_ru:Code">
			<span class="normal">&#160;(</span>
		</xsl:if>
		<span class="normal">
			<xsl:value-of select="rda:CustomsDept/cat_ru:Code"/>
		</span>
		<xsl:if test="rda:CustomsDept/cat_ru:Code">
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" name="PersonName" mode="PersonName">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;<xsl:value-of select="cat_ru:PersonName"/>&#160;<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="rda:PersonCustomsID">, номер служебного удостоверения:&#160;<xsl:value-of select="rda:PersonCustomsID"/></xsl:if>
		<xsl:if test="rda:LNP">, ЛНП:&#160;<xsl:value-of select="rda:LNP"/></xsl:if>
		<xsl:if test="rda:Phone">,&#160;Тел:&#160;<xsl:value-of select="rda:Phone"/></xsl:if>
		<xsl:if test="rda:Note">,&#160;<xsl:value-of select="rda:Note"/>
		</xsl:if>
		<xsl:if test="rda:Comment">,&#160;<xsl:value-of select="rda:Comment"/>
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
	<xsl:template match="RUScat_ru:IdentityCard | adt_cat:Passport">
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
	
		<xsl:template match="*" mode="AuthoritesDocument">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:if test="cat_ru:PrDocumentNumber"> №&#160;<xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate"> от&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template></xsl:if>
			<xsl:if test="cat_ru:ComplationAuthorityDate"> (дата окончания полномочий:&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:ComplationAuthorityDate"/></xsl:call-template>)</xsl:if>
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
	
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="adt_cat:DTNumber">
		<span class="normal">
			<xsl:value-of select="cat_ru:CustomsCode"/>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:value-of select="cat_ru:GTDNumber"/>
		</span>
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
					<td width="13%" class="border_bottom">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="5%" align="left"> "</td>
					<td width="2%"> </td>
					<td width="48%" class="border_bottom">
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
					<td width="9%" align="right">
						<xsl:value-of select="substring($date,1,2)"/>
					</td>
					<td width="9%" class="border_bottom" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="2%"> </td>
					<td width="5%"> г.</td>
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
		&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/>
		<u>
			<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
	</xsl:template>
</xsl:stylesheet>