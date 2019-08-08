<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.13.3" xmlns:rda="urn:customs.ru:Information:CustomsAuditDocuments:ReqDoc4Audit:5.13.3">
<!-- 
Приказ ФТС России "Об утверждении форм документов, применяемых при проведении таможенных проверок, порядков их заполнения и 
порядка внесения изменений (дополнений) в решение о проведении выездной таможенной проверки"
Приложение 17 Требование о предъявлении товаров и (или) представлении документов и сведений при выездной таможенной проверке (rda:IdentKindRequest = 1)
Приложение 18 Требование о представлении документов и сведений при выездной таможенной проверке  (rda:IdentKindRequest = 2)
Приложение 19 Требование о представлении документов и сведений при камеральной таможенной проверке (rda:IdentKindRequest = 3)
-->

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
			width: 210mm;
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
			<xsl:if test="rda:IdentKindRequest='1'">
				<table>
					<tbody align="center" class="graphMain">
						<tr>
							<td width="10%"></td>
							<td width="80%">МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>(МИНФИН РОССИИ)</td>
							<td width="10%"></td>
						</tr>
						<tr class="delim"><td colspan="3"> </td></tr>
						<tr>
							<td width="10%"></td>
							<td width="80%">ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</td>
							<td width="10%"></td>
						</tr>
						<tr class="delim_3"><td colspan="3"> </td></tr>
						<tr>
							<td width="10%"></td>
							<td width="80%" class="border_bottom">
								<span class="normal"><xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:OfficeName"/></span>
								<xsl:if test="rda:CustomsIssuedRequest/cat_ru:OfficeName">
									<span class="normal"> (</span>
								</xsl:if>
								<span class="normal"><xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:Code"/></span>
								<xsl:if test="rda:CustomsIssuedRequest/cat_ru:OfficeName">
									<span class="normal">)</span>
								</xsl:if>
							</td>
							<td width="10%"></td>
						</tr>
						<tr class="graphLittle">
							<td width="10%"></td>
							<td  width="80%" align="center">(наименование таможенного органа)</td>
							<td width="10%"></td>
						</tr>
					</tbody>
				</table>
				<br/>
				<br/>
			</xsl:if>
			
			<xsl:choose>
				<xsl:when test="rda:IdentKindRequest='3'">
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="50%"></td>
								<td width="50%">Руководителю</td>
							</tr>
							<tr class="delim_3"><td colspan="2"> </td></tr>
							<tr>
								<td width="50%"> </td>
								<td width="50%"  class="border_bottom">
									<xsl:choose>
										<xsl:when test="rda:AuditOrganization/cat_ru:OrganizationName"><xsl:value-of select="rda:AuditOrganization/cat_ru:OrganizationName"/></xsl:when>
										<xsl:otherwise><xsl:value-of select="rda:AuditOrganization/cat_ru:ShortName"/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="50%"></td>
								<td width="50%" align="center">(наименование лица)</td>
							</tr>
							<tr>
								<td width="50%"></td>
								<td width="50%"  class="border_bottom">
									<xsl:value-of select="rda:AuditOrganization/adt_cat:Chief/cat_ru:PersonSurname"/>&#160;
									<xsl:value-of select="rda:AuditOrganization/adt_cat:Chief/cat_ru:PersonName"/>&#160;
									<xsl:value-of select="rda:AuditOrganization/adt_cat:Chief/cat_ru:PersonMiddleName"/>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="50%"></td>
								<td width="50%" align="center">(фамилия, имя, отчество (отчество указывается при наличии))</td>
							</tr>
							<xsl:for-each select="rda:AuditOrganization/RUScat_ru:SubjectAddressDetails">
								<tr>
									<td width="50%"></td>
									<td width="50%"  class="border_bottom">
										<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
										<br/>
									</td>
								</tr>
								<tr class="graphLittle">
									<td width="50%"></td>
									<td width="50%" align="center">(адрес)</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:when>
				<xsl:otherwise>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="50%"></td>
								<td width="50%">Руководителю</td>
							</tr>
							<tr class="delim_3"><td colspan="2"> </td></tr>
							<tr>
								<td width="50%"> </td>
								<td width="50%"  class="border_bottom">
									<xsl:choose>
										<xsl:when test="rda:AuditOrganization/cat_ru:OrganizationName"><xsl:value-of select="rda:AuditOrganization/cat_ru:OrganizationName"/></xsl:when>
										<xsl:otherwise><xsl:value-of select="rda:AuditOrganization/cat_ru:ShortName"/></xsl:otherwise>
									</xsl:choose>
									<br/>
									<xsl:for-each select="rda:AuditOrganization/RUScat_ru:SubjectAddressDetails">
										<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
										<br/>
									</xsl:for-each>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="50%"></td>
								<td width="50%" align="center">(наименование лица, адрес)</td>
							</tr>
							<tr>
								<td width="50%"></td>
								<td width="50%"  class="border_bottom">
									<xsl:value-of select="rda:AuditOrganization/adt_cat:Chief/cat_ru:PersonSurname"/>&#160;
									<xsl:value-of select="rda:AuditOrganization/adt_cat:Chief/cat_ru:PersonName"/>&#160;
									<xsl:value-of select="rda:AuditOrganization/adt_cat:Chief/cat_ru:PersonMiddleName"/>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="50%"></td>
								<td width="50%" align="center">(фамилия, имя, отчество (отчество указывается при наличии))</td>
							</tr>
						</tbody>
					</table>
				</xsl:otherwise>
			</xsl:choose>	
			<br/>
			<table>
				<tbody align="left" class="graphMain">
					<tr  align="center" class="graphHeader">
						<td>ТРЕБОВАНИЕ</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
					<tr align="center">
						<td>
							<xsl:choose>
								<xsl:when test="rda:IdentKindRequest = 1">о предъявлении товаров и (или) представлении документов и сведений при выездной таможенной проверке</xsl:when>
								<xsl:when test="rda:IdentKindRequest = 2">о представлении документов и сведений при выездной таможенной проверке</xsl:when>
								<xsl:when test="rda:IdentKindRequest = 3">о представлении документов и сведений при камеральной таможенной проверке</xsl:when>
								<xsl:otherwise>о <u>&#160;&#160;&#160;&#160;&#160;</u> таможенной проверке</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</tbody>
			</table>

			<xsl:if test="rda:IdentKindRequest='1'">
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
							<td width="40%" class="border_bottom"><xsl:value-of select="rda:RequestPlace"/></td>
						</tr>
						<tr class="graphLittle">
							<td width="45%"> </td>
							<td  width="10%"> </td>
							<td width="45%">(место составления)</td>
						</tr>
					</tbody>
				</table>
			</xsl:if>		
			<br/>

			<xsl:if test="rda:IdentKindRequest='1' or rda:IdentKindRequest='2'">
				<table>
					<tbody align="left" class="graphMain">
						<tr class="delim"><td> </td></tr>
						<tr>
							<td>
								На основании статей 333,&#160;
								<xsl:choose>
									<xsl:when test="rda:IdentKindRequest='1'">336,&#160;</xsl:when>
									<xsl:when test="rda:IdentKindRequest='2'">337,&#160;</xsl:when>
								</xsl:choose>
								340 Таможенного кодекса Евразийского экономического союза и в соответствии с решением о проведении&#160;
								<u>
									<xsl:choose>
										<xsl:when test="rda:AuditFieldKind='1'">&#160;выездной плановой&#160;</xsl:when>
										<xsl:when test="rda:AuditFieldKind='2'">&#160;выездной внеплановой&#160;</xsl:when>
										<xsl:when test="rda:AuditFieldKind='3'">&#160;выездной встречной внеплановой&#160;</xsl:when>
										<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
									</xsl:choose>
								</u>
								таможенной проверки от &#160;
								<xsl:call-template name="DateStr">
									<xsl:with-param name="date" select="rda:DecisionPerformAudit/adt_cat:Date"/>
								</xsl:call-template>
								&#160;№&#160;<u>&#160;<xsl:value-of select="rda:DecisionPerformAudit/adt_cat:Number"/>&#160;</u>&#160;
								необходимо представить в течение&#160;<u>&#160;<xsl:value-of select="rda:DaysLimitSubmission"/>&#160;</u>&#160;
								календарных дней с момента получения настоящего требования следующие
								<xsl:if test="rda:IdentKindRequest='1'">&#160;товары и (или)&#160;</xsl:if>
								документы и сведения:
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="rda:IdentKindRequest='3'">
				<table>
					<tbody align="left" class="graphMain">
						<tr class="delim"><td> </td></tr>
						<tr>
							<td>
								&#160;&#160;&#160;&#160;&#160;В соответствии со статьями 332 Таможенного кодекса Евразийского экономического союза и статьей 228 Федерального закона 
								от <u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u> 
								№ <u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
								"О таможенном регулировании"
							</td>
						</tr>
						<tr>
							<td class="border_bottom">
								<span class="normal"><xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:OfficeName"/></span>
								<xsl:if test="rda:CustomsIssuedRequest/cat_ru:OfficeName">
									<span class="normal"> (</span>
								</xsl:if>
								<span class="normal"><xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:Code"/></span>
								<xsl:if test="rda:CustomsIssuedRequest/cat_ru:OfficeName">
									<span class="normal">)</span>
								</xsl:if>
							</td>
						</tr>
						<tr class="graphLittle">
							<td  align="center">(наименование таможенного органа)</td>
						</tr>
						<tr class="delim_3"><td> </td></tr>
						<tr>
							<td>
								проводится камеральная таможенная проверка по декларациям на товары / за период
							</td>
						</tr>
						<tr>
							<td  class="border_bottom">
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
								<xsl:if test="rda:AuditGoods and rda:AuditPeriod"><br/></xsl:if>
								<xsl:for-each select="rda:AuditPeriod">
									<span class="italic">с </span>
									<xsl:choose>
										<xsl:when test="adt_cat:BeginAuditPeriodDate">
											<span class="normal">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="adt_cat:BeginAuditPeriodDate" />
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>(не указано)</xsl:otherwise>
									</xsl:choose>
									<span class="italic"> по </span>
									<xsl:choose>
										<xsl:when test="adt_cat:EndAuditPeriodDate">
											<span class="normal">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="adt_cat:EndAuditPeriodDate" />
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>(не указано)</xsl:otherwise>
									</xsl:choose>
									<xsl:if test="position()!=last()">; </xsl:if>
								</xsl:for-each>
								<br/>
							</td>
						</tr>
						<tr class="delim_3"><td> </td></tr>
						<tr>
							<td>
								На основании статей&#160;
								<u>
									<xsl:choose>
										<xsl:when test="rda:BasedArticle='1'">&#160;336, 340&#160;</xsl:when>
										<xsl:when test="rda:BasedArticle='2'">&#160;337, 340&#160;</xsl:when>
										<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
									</xsl:choose>
								</u>
								Таможенного кодекса Евразийского экономического союза Вам надлежит представить в течение&#160;
								<u>&#160;<xsl:value-of select="rda:DaysLimitSubmission"/>&#160;</u>&#160;
								календарных дней с момента получения настоящего требования следующие сведения и документы (копии, заверенные надлежащим образом):
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:if>
			<table>
				<tbody align="left" class="graphMain">
					<tr class="delim_3"><td> </td></tr>
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
								<xsl:if test="rda:AuditGoods and rda:RequestedDoc"><br/></xsl:if>
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
										<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
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
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<table>
				<tbody align="left" class="graphMain">
					<tr class="delim"><td> </td></tr>
					<tr>
						<td>
							Документы&#160;
							<xsl:choose>
								<xsl:when test="rda:IdentKindRequest = '1'">(товары) должны быть представлены (предъявлены)</xsl:when>
								<xsl:when test="rda:IdentKindRequest = '2'">и сведения должны быть представлены (предъявлены)</xsl:when>
								<xsl:when test="rda:IdentKindRequest = '3'">и сведения должны быть представлены</xsl:when>
							</xsl:choose>
							&#160;по адресу:
						</td>
					</tr>
					<tr>
						<td class="border_bottom">
							<span class="normal">
								<xsl:apply-templates select="rda:AddressSubmission"/>
							</span>
							<xsl:if test="rda:IdentKindRequest = '1' or rda:IdentKindRequest = '2'">
								<xsl:if test="rda:ChiefCommission">
									<br/>
									<xsl:for-each select="rda:ChiefCommission">
										<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:if test="cat_ru:PersonMiddleName">												
											&#160;<xsl:value-of select="cat_ru:PersonMiddleName"/>
										</xsl:if>
										<xsl:if test="cat_ru:PersonPost">												
											, должность: <xsl:value-of select="cat_ru:PersonPost"/>
										</xsl:if>
										<xsl:if test="adt_cat:CustomsDept">
											, структурное подразделение:&#160;
											<xsl:if test="adt_cat:CustomsDept/cat_ru:OfficeName">
												<xsl:value-of select="adt_cat:CustomsDept/cat_ru:OfficeName"/>
												(
											</xsl:if>
											код ТО <xsl:value-of select="adt_cat:CustomsDept/cat_ru:Code"/>
											<xsl:if test="adt_cat:CustomsDept/cat_ru:OfficeName">
												)
											</xsl:if>
										</xsl:if>
										<xsl:if test="adt_cat:Phone">
											, тел: <xsl:value-of select="adt_cat:Phone"/>
										</xsl:if>
										<xsl:if test="adt_cat:PersonCustomsID">
											, № служ. удостоверения: <xsl:value-of select="adt_cat:PersonCustomsID"/>
										</xsl:if>
									</xsl:for-each>	
								</xsl:if>								
							</xsl:if>	
						</td>
					</tr>
					<xsl:if test="rda:IdentKindRequest = '3'">
						<tr class="delim_3"><td> </td></tr>
						<tr>
							<td>
								&#160;&#160;&#160;&#160;&#160;Информирую, что права и обязанности проверяемого лица при проведении таможенной 
								проверки установлены статьей 336 Таможенного кодекса Евразийского экономического союза и статьями 235, 236 Федерального закона 
								от <u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u> 
								№ <u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
								"О таможенном регулировании".
							</td>
						</tr>
					</xsl:if>	
				</tbody>
			</table>
			<br/>
			<br/>
			<br/>
			<xsl:choose>
				<xsl:when test="rda:IdentKindRequest='1'">
					<table>
						<tr class="graphMain" align="center">
							<td width="36%" class="border_bottom"> 
								<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonPost"/>
							</td>
							<td width="2%"> </td>
							<td width="20%" class="border_bottom"> </td>
							<td width="2%"> </td>
							<td width="40%" class="border_bottom">
								<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;
								<xsl:value-of select="substring(rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonName,1,1)"/>
								<xsl:if test="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonName">.&#160;</xsl:if>		
								<xsl:value-of select="substring(rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonMiddleName,1,1)"/>
								<xsl:if test="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonMiddleName">.</xsl:if>		
								<br/>
							</td>
						</tr>
						<tr class="graphLittle" align="center">
							<td width="36%">(должность)</td>
							<td width="2%"> </td>
							<td width="20%">(подпись)</td>
							<td width="2%"> </td>
							<td width="40%">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества))</td>
						</tr>
					</table>
				</xsl:when>
				<xsl:otherwise>
					<table>
						<tr class="graphMain" align="center">
							<td width="12%" align="left"> 
								Начальник 
							</td>
							<td width="31%" class="border_bottom"> 
								<xsl:if test="rda:CustomsIssuedRequest/cat_ru:OfficeName">
									<xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:OfficeName"/>
									(
								</xsl:if>
								код ТО <xsl:value-of select="rda:CustomsIssuedRequest/cat_ru:Code"/>
								<xsl:if test="rda:CustomsIssuedRequest/cat_ru:OfficeName">
									)
								</xsl:if>
							</td>
							<td width="2%"> </td>
							<td width="15%" class="border_bottom"> </td>
							<td width="2%"> </td>
							<td width="38%" class="border_bottom">
								<xsl:value-of select="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;
								<xsl:value-of select="substring(rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonName,1,1)"/>
								<xsl:if test="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonName">.&#160;</xsl:if>		
								<xsl:value-of select="substring(rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonMiddleName,1,1)"/>
								<xsl:if test="rda:CustomsIssuedRequest/adt_cat:ApproverPerson/cat_ru:PersonMiddleName">.</xsl:if>		
								<br/>
							</td>
						</tr>
						<tr class="graphLittle" align="center">
							<td width="12%"> </td>
							<td width="31%">(наименование таможенного органа)</td>
							<td width="2%"> </td>
							<td width="15%">(подпись)</td>
							<td width="2%"> </td>
							<td width="38%">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества))</td>
						</tr>
					</table>
				</xsl:otherwise>
			</xsl:choose>
			<br/>
			<xsl:if test="rda:IdentKindRequest='1'">
				<br/>
				<table>
					<tbody align="left" class="graphMain">
						<tr class="delim"><td> </td></tr>
						<tr>
							<td>
								Экземпляр требования получил:
							</td>
						</tr>
						<tr class="delim_3"><td> </td></tr>
					</tbody>
				</table>
				<table>
					<tr class="graphMain" align="center">
						<td width="36%" class="border_bottom"> 
							<xsl:value-of select="rda:SecondExempReceived/cat_ru:PersonPost"/>
						</td>
						<td width="2%"> </td>
						<td width="20%" class="border_bottom"> </td>
						<td width="2%"> </td>
						<td width="40%" class="border_bottom">
							<xsl:value-of select="rda:SecondExempReceived/cat_ru:PersonSurname"/>&#160;
							<xsl:value-of select="substring(rda:SecondExempReceived/cat_ru:PersonName,1,1)"/>
							<xsl:if test="rda:SecondExempReceived/cat_ru:PersonName">.&#160;</xsl:if>		
							<xsl:value-of select="substring(rda:SecondExempReceived/cat_ru:PersonMiddleName,1,1)"/>
							<xsl:if test="rda:SecondExempReceived/cat_ru:PersonMiddleName">.</xsl:if>		
							<br/>
						</td>
					</tr>
					<tr class="graphLittle" align="center">
						<td width="36%">(должность)</td>
						<td width="2%"> </td>
						<td width="20%">(подпись)</td>
						<td width="2%"> </td>
						<td width="40%">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества))</td>
					</tr>
				</table>
				<table>
					<tbody align="center" class="graphMain">
						<tr>
							<td width="45%" align="left">
								<xsl:call-template name="Date">
									<xsl:with-param name="date" select="rda:SecondExempReceived/adt_cat:Date"/>
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
			</xsl:if>
		</div>
	</body>
</html>
</xsl:template>

<!-- Шаблон для типа cat_ru:AddressType -->
<xsl:template match="rda:AddressSubmission">
	<xsl:value-of select="cat_ru:PostalCode"/>
	<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">
		<xsl:if test="cat_ru:PostalCode">, </xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			<xsl:if test="cat_ru:CounryName">(<xsl:value-of select="cat_ru:CountryCode"/>) </xsl:if>
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
	</xsl:if>
	<xsl:if test="cat_ru:Region">
		<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
		<xsl:value-of select="cat_ru:Region"/>
	</xsl:if>
	<xsl:if test="cat_ru:City">
		<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
		<xsl:value-of select="cat_ru:City"/>
	</xsl:if>
	<xsl:if test="cat_ru:StreetHouse">
		<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
		<xsl:value-of select="cat_ru:StreetHouse"/>
	</xsl:if>
	<xsl:if test="cat_ru:TerritoryCode">
		<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City or cat_ru:StreetHouse">, </xsl:if>
		<xsl:value-of select="cat_ru:TerritoryCode"/>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:RUAddressType -->
<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
	<xsl:if test="RUScat_ru:AddressKindCode">
		<span class="italic"> (код вида адреса</span>
		<span class="normal">: </span> 
		<span class="normal"><xsl:value-of select="RUScat_ru:AddressKindCode" /></span> 
		<span class="normal">) </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:PostalCode">
		<span class="italic">почтовый индекс</span> 
		<span class="normal">: </span> 
		<span class="normal"><xsl:value-of select="RUScat_ru:PostalCode" /></span> 
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:CountryCode">
		<span class="normal"><xsl:value-of select="RUScat_ru:CountryCode" /></span> 
		<xsl:if test="RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:CounryName">
		<span class="normal"><xsl:value-of select="RUScat_ru:CounryName" /></span> 
		<xsl:if test="RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:Region">
		<span class="normal"><xsl:value-of select="RUScat_ru:Region" /></span> 
		<xsl:if test="RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:District">
		<span class="normal"><xsl:value-of select="RUScat_ru:District" /></span> 
		<xsl:if test="RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:Town">
		<span class="normal"><xsl:value-of select="RUScat_ru:Town" /></span> 
		<xsl:if test="RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:City">
		<span class="normal"><xsl:value-of select="RUScat_ru:City" /></span> 
		<xsl:if test="RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:StreetHouse">
		<span class="normal"><xsl:value-of select="RUScat_ru:StreetHouse" /></span> 
		<xsl:if test="RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:House">
		<span class="normal"><xsl:value-of select="RUScat_ru:House" /></span> 
		<xsl:if test="RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:Room">
		<span class="normal"><xsl:value-of select="RUScat_ru:Room" /></span> 
		<xsl:if test="RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:AddressText">
		<span class="normal"><xsl:value-of select="RUScat_ru:AddressText" /></span> 
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:OKTMO">
		<span class="italic">ОКТМО </span>
		<span class="normal">: </span> 
		<span class="normal"><xsl:value-of select="RUScat_ru:OKTMO" /></span> 
		<xsl:if test="RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:OKATO">
		<span class="italic">OKАTO </span>
		<span class="normal">: </span> 
		<span class="normal"><xsl:value-of select="RUScat_ru:OKATO" /></span> 
		<xsl:if test="RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:KLADR">
		<span class="italic">КЛАДР </span>
		<span class="normal">: </span> 
		<span class="normal"><xsl:value-of select="RUScat_ru:KLADR" /></span> 
		<xsl:if test="RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:AOGUID">
		<span class="italic">Глобальный идентификатор адресного объекта по ФИАС </span>
		<span class="normal">: </span> 
		<span class="normal"><xsl:value-of select="RUScat_ru:AOGUID" /></span> 
		<xsl:if test="RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:TerritoryCode">
		<span class="italic">Код единицы административно-территориального деления </span>
		<span class="normal">: </span> 
		<span class="normal"><xsl:value-of select="RUScat_ru:TerritoryCode" /></span> 
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<span class="normal">, </span>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="RUScat_ru:PostOfficeBoxId">
		<span class="italic">а/я </span>
		<span class="normal">: </span> 
		<span class="normal"><xsl:value-of select="RUScat_ru:PostOfficeBoxId" /></span> 
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа adt_cat:AuditOrganizationType -->
<xsl:template match="rda:AuditOrganization">
	<xsl:if test="cat_ru:OrganizationName">
		<xsl:value-of select="cat_ru:OrganizationName" />
	</xsl:if>
	<xsl:if test="cat_ru:ShortName">
		<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
			<span class="normal"> (</span>
		</xsl:if>
		<xsl:value-of select="cat_ru:ShortName" />
		<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
			<span class="normal">)</span>
		</xsl:if>
	</xsl:if>

	<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RKOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RBOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RAOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:KGOrganizationFeatures" />

	<xsl:if test="RUScat_ru:CountryA2Code">
		<span class="normal">, </span>
		<span class="italic">Код страны</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:CountryA2Code" />
	</xsl:if>

	<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
		<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode" />
	</xsl:if>

	<xsl:if test="RUScat_ru:BusinessEntityTypeName">
		<span class="normal">, </span>
		<span class="italic">ОПФ</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:BusinessEntityTypeName" />
	</xsl:if>
	
	<xsl:if test="RUScat_ru:UITN">
		<xsl:apply-templates select="RUScat_ru:UITN" />
	</xsl:if>

	<xsl:if test="RUScat_ru:PersonId">
		<span class="normal">, </span>
		<span class="italic">УИ ФЛ</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:PersonId" />
	</xsl:if>

	<xsl:if test="RUScat_ru:IdentityCard">
		<xsl:apply-templates select="RUScat_ru:IdentityCard" />
	</xsl:if>

	<xsl:if test="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<xsl:if test="position()=1">; 
				<span class="normal"><br/></span>
				<span class="italic">Адрес(а)</span>
				<span class="normal">: </span>
			</xsl:if>
			<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
			<xsl:if test="position()!=last()"><br/></xsl:if>
		</xsl:for-each>
	</xsl:if>

	<xsl:if test="adt_cat:FactAddress">
		<span class="normal"><br/></span>
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
		<xsl:value-of select="cat_ru:INN" />
	</xsl:if>
	<xsl:if test="cat_ru:KPP">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0">
			<span class="normal"> / </span>
		</xsl:if>
		<xsl:value-of select="cat_ru:KPP" />
	</xsl:if>
	<xsl:if test="cat_ru:OGRN">
		<span class="normal">, </span>
		<span class="italic">ОГРН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:OGRN" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
<xsl:template match="cat_ru:RKOrganizationFeatures">
	<xsl:if test="cat_ru:BIN">
		<span class="normal">, </span>
		<span class="italic">БИН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:BIN" />
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
		<xsl:value-of select="cat_ru:IIN" />
	</xsl:if>
	<xsl:if test="cat_ru:ITN">
		<span class="normal">, </span>
		<span class="italic">ИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:CategoryCode" />
		<span class="normal"> / </span>
		<xsl:value-of select="cat_ru:KATOCode" />
		<xsl:if test="cat_ru:RNN">
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:RNN" />
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:ITNReserv" />
		</xsl:if>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:RBOrganizationFeatures -->
<xsl:template match="cat_ru:RBOrganizationFeatures">
	<xsl:if test="cat_ru:UNP">
		<span class="normal">, </span>
		<span class="italic">УНП</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:UNP" />
	</xsl:if>
	<xsl:if test="cat_ru:RBIdentificationNumber">
		<span class="normal">, </span>
		<span class="italic">ИНФЛ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:RBIdentificationNumber" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
<xsl:template match="cat_ru:RAOrganizationFeatures">
	<xsl:if test="cat_ru:UNN">
		<span class="normal">, </span>
		<span class="italic">УНН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:UNN" />
	</xsl:if>
	<xsl:if test="cat_ru:SocialServiceNumber">
		<span class="normal">, </span>
		<span class="italic">НЗОУ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:SocialServiceNumber" />
	</xsl:if>
	<xsl:if test="cat_ru:SocialServiceCertificate">
		<span class="normal">, </span>
		<span class="italic">№ справки об отсутв. НЗОУ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:SocialServiceCertificate" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
<xsl:template match="cat_ru:KGOrganizationFeatures">
	<xsl:if test="cat_ru:KGINN">
		<span class="italic">, ИНН(ПИН)</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:KGINN" />
	</xsl:if>
	<xsl:if test="cat_ru:KGOKPO">
		<span class="italic">, ОКПО</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:KGOKPO" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
	<span class="normal">, </span>
	<span class="italic">Код ОПФ: </span>
	<xsl:value-of select="RUScat_ru:UnifiedCode" />
	<xsl:if test="RUScat_ru:CodeListId">
		<span class="normal"> (</span>
		<span class="italic"> по справ. </span>
		<xsl:value-of select="RUScat_ru:CodeListId" />
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
	<xsl:if test="cat_ru:IdentityCardCode">
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardCode" />
		</span>
		<span class="normal">&#160;</span>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardName">
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:FullIdentityCardName">
		<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
			<span class="normal"> (</span>
		</xsl:if>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:FullIdentityCardName" />
		</span>
		<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
			<span class="normal">)</span>
		</xsl:if>
	</xsl:if>
		
	<xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardSeries">
		<span class="italic">серия</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardSeries" />
		</span>
		<xsl:if test="string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">&#160;</span>
		</xsl:if>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardNumber">
		<span class="italic">№</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardNumber" />
		</span>
	</xsl:if>
	<xsl:if test="string-length(cat_ru:IdentityCardDate) &gt; 0 or string-length(cat_ru:OrganizationName) &gt; 0">
		<!--xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
		<span class="normal">, </span>
		<span class="italic">выдан</span>
		<span class="normal">: </span>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardDate">
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate" />
			</xsl:call-template>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:OrganizationName">	
		<span class="normal">&#160;</span>
		<span class="normal">
			<xsl:value-of select="cat_ru:OrganizationName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:IssuerCode">	
		<span class="normal">, </span>
		<span class="italic">код подразделения</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:IssuerCode" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:AuthorityId">	
		<span class="normal">, </span>
		<span class="italic">идентификатор организации</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:AuthorityId" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:CountryCode">	
		<span class="normal">, </span>
		<span class="italic">страна в уд.личности</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:CountryCode" />
		</span>
	</xsl:if>
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
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<span class="normal">
				<xsl:value-of select="substring($dateIn,9,2)" />
			</span>
			<span class="normal">.</span>
			<span class="normal">
				<xsl:value-of select="substring($dateIn,6,2)" />
			</span>
			<span class="normal">.</span>
			<span class="normal">
				<xsl:value-of select="substring($dateIn,1,4)" />
			</span>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="Date">
	<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="border_bottom"><xsl:value-of select="substring($date,9,2)"/></td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="border_bottom">
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
					<td width="2%" align="right"><xsl:value-of select="substring($date,1,2)"/></td>
					<td width="9%" class="border_bottom" align="left"><xsl:value-of select="substring($date,3,2)"/></td>
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
		&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/><u><xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
	</xsl:template>
	
</xsl:stylesheet>