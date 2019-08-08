<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.0" xmlns:resa="urn:customs.ru:Information:CustomsAuditDocuments:ResolutionAudit:5.14.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0">
	<!-- 
Приказ ФТС России "Об утверждении форм документов, применяемых при проведении таможенных проверок, порядков их заполнения и 
порядка внесения изменений (дополнений) в решение о проведении выездной таможенной проверки"
Приложение 5 Постановление о наложении ареста на товары (KindDoc = 1)
Приложение 6 Постановление об изъятии товаров (KindDoc = 2)
Приложение 7 Постановление об изъятии документов (KindDoc = 3)
-->
	<!--Приложение (ГУТКПВТ 53522 Формы документов по ФЗ-289 (приложение).docx, форма 1 (KindDoc = 1), форма 2 (KindDoc = 2), форма 3 (KindDoc = 3)) к Письму ГУТКПВТ от 24.09.2018 № 23-20/53522-->
	<!-- Шаблон для типа ResolutionAuditType -->
	<xsl:template match="resa:ResolutionAudit">
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
										<xsl:value-of select="resa:CustomsIssuedResolution/cat_ru:OfficeName"/>
									</span>
									<xsl:if test="resa:CustomsIssuedResolution/cat_ru:OfficeName">
										<span class="normal"> (</span>
									</xsl:if>
									<span class="normal">
										<xsl:value-of select="resa:CustomsIssuedResolution/cat_ru:Code"/>
									</span>
									<xsl:if test="resa:CustomsIssuedResolution/cat_ru:OfficeName">
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
							<tr align="center" class="graphHeader">
								<td>ПОСТАНОВЛЕНИЕ</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
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
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="45%" align="left">
									<xsl:call-template name="Date">
										<xsl:with-param name="date" select="resa:ResolutionNumber/adt_cat:Date"/>
									</xsl:call-template>
								</td>
								<td width="15%"> </td>
								<td width="40%" class="border_bottom">
									<xsl:value-of select="resa:ResolutionNumber/resa:Place"/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="45%"> </td>
								<td width="10%"> </td>
								<td width="45%">(место составления)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom">
									<xsl:if test="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonPost">
										<xsl:value-of select="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
								</xsl:if>
									<xsl:if test="resa:CustomsIssuedResolution/resa:Rank">
										<xsl:value-of select="resa:CustomsIssuedResolution/resa:Rank"/>,&#160;</xsl:if>
									<xsl:if test="resa:CustomsIssuedResolution/adt_cat:CustomsSubUnit">
										<xsl:value-of select="resa:CustomsIssuedResolution/adt_cat:CustomsSubUnit"/>,&#160;</xsl:if>
									<xsl:value-of select="resa:CustomsIssuedResolution/cat_ru:OfficeName"/>
									<xsl:if test="resa:CustomsIssuedResolution/cat_ru:Code">
										<span class="normal">&#160;(</span>
									</xsl:if>
									<xsl:value-of select="resa:CustomsIssuedResolution/cat_ru:Code"/>
									<xsl:if test="resa:CustomsIssuedResolution/cat_ru:Code">
										<span class="normal">)&#160;</span>
									</xsl:if>
									<xsl:value-of select="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;
								<xsl:value-of select="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonName"/>&#160;
								<xsl:if test="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonMiddleName">
										<xsl:value-of select="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>,&#160;</xsl:if>
									<xsl:if test="resa:CustomsIssuedResolution/resa:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="resa:CustomsIssuedResolution/resa:PersonCustomsID"/>,&#160;</xsl:if>
									<xsl:if test="resa:CustomsIssuedResolution/resa:LNP">&#160;ЛНП:&#160;<xsl:value-of select="resa:CustomsIssuedResolution/resa:LNP"/>,</xsl:if>
									<xsl:if test="resa:CustomsIssuedResolution/resa:Note">&#160;<xsl:value-of select="resa:CustomsIssuedResolution/resa:Note"/>
									</xsl:if>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(должность, фамилия, имя, отчество (отчество указывается при наличии) должностного лица таможенного органа, вынесшего постановление)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td>
									<span class="normal">
								при проведении выездной таможенной проверки на основании решения о проведении выездной таможенной проверки от&#160; 
								<u>
											<xsl:choose>
												<xsl:when test="resa:DecisionPerformAuditNumber/adt_cat:Date">
											&#160;&#160;
											<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="resa:DecisionPerformAuditNumber/adt_cat:Date"/>
													</xsl:call-template>
													<xsl:if test="resa:DecisionPerformAuditNumber/adt_cat:Time">
												&#160;<xsl:value-of select="resa:DecisionPerformAuditNumber/adt_cat:Time"/>
													</xsl:if>
											&#160;&#160;
										</xsl:when>
												<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
											</xsl:choose>
										</u>
								&#160;№&#160;
								<u>
											<xsl:choose>
												<xsl:when test="resa:DecisionPerformAuditNumber/adt_cat:Number">
											&#160;&#160;
											<xsl:value-of select="resa:DecisionPerformAuditNumber/adt_cat:Number"/>
											&#160;&#160;
										</xsl:when>
												<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
											</xsl:choose>
										</u>
								в отношении
							</span>
								</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom">
									<xsl:apply-templates select="resa:AuditOrganization"/>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(указываются сведения о проверяемом лице)</td>
							</tr>
							<tr>
								<td>
									<span class="normal">установив, что</span>
								</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom">
									<xsl:apply-templates select="resa:Reason"/>
									<br/>
								</td>
							</tr>
							<xsl:if test="resa:KindDoc = '1'">
								<tr class="graphLittle">
									<td align="center">(указываются основания для наложения ареста на товары)</td>
								</tr>
							</xsl:if>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td>
									<span class="normal">
								и руководствуясь подпунктом
								<xsl:choose>
											<xsl:when test="resa:KindDoc = '1'">6</xsl:when>
											<xsl:when test="resa:KindDoc = '2'">6</xsl:when>
											<xsl:when test="resa:KindDoc = '3'">5</xsl:when>
											<xsl:otherwise>
												<u>&#160;&#160;&#160;&#160;&#160;</u>
											</xsl:otherwise>
										</xsl:choose>
								пункта 2 статьи 335 Таможенного кодекса Евразийского экономического союза, а также статьей 233 Федерального закона от 3 августа 2018 г. № 289-ФЗ"О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации",
							</span>
								</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td align="center">
									<span class="normal">ПОСТАНОВИЛ:</span>
								</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td>
									<span class="normal">
										<xsl:choose>
											<xsl:when test="resa:KindDoc = '1'">Наложить арест на товары</xsl:when>
											<xsl:when test="resa:KindDoc = '2'">Изъять товары</xsl:when>
											<xsl:when test="resa:KindDoc = '3'">Изъять документы:</xsl:when>
											<xsl:otherwise>
												<u>&#160;&#160;&#160;&#160;&#160;</u>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
							</tr>
							<tr>
								<td class="border_bottom">
									<xsl:apply-templates select="resa:RestrictionsInfo"/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tr class="graphMain" align="center">
							<td width="36%" valign="bottom" class="border_bottom">
								<xsl:if test="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonPost">
									<xsl:value-of select="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
								</xsl:if>
								<xsl:if test="resa:Rank">
									<xsl:value-of select="resa:CustomsIssuedResolution/resa:Rank"/>,&#160;</xsl:if>
								<xsl:if test="resa:CustomsIssuedResolution/adt_cat:CustomsSubUnit">
									<xsl:value-of select="resa:CustomsIssuedResolution/adt_cat:CustomsSubUnit"/>,&#160;</xsl:if>
								<xsl:value-of select="resa:CustomsIssuedResolution/cat_ru:OfficeName"/>
								<xsl:if test="resa:CustomsIssuedResolution/cat_ru:Code">
									<span class="normal">&#160;(</span>
								</xsl:if>
								<xsl:value-of select="resa:CustomsIssuedResolution/cat_ru:Code"/>
								<xsl:if test="resa:CustomsIssuedResolution/cat_ru:Code">
									<span class="normal">)&#160;</span>
								</xsl:if>
							</td>
							<td width="2%"> </td>
							<td width="20%" class="border_bottom"> </td>
							<td width="2%"> </td>
							<td width="40%" valign="bottom" class="border_bottom">
								<xsl:value-of select="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="substring(resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonName,1,1)"/>
								<xsl:if test="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonName">.&#160;</xsl:if>
								<xsl:value-of select="substring(resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonMiddleName,1,1)"/>
								<xsl:if test="resa:CustomsIssuedResolution/adt_cat:ApproverPerson/cat_ru:PersonMiddleName">.</xsl:if>
								<xsl:if test="resa:CustomsIssuedResolution/resa:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="resa:CustomsIssuedResolution/resa:PersonCustomsID"/>,&#160;</xsl:if>
								<xsl:if test="resa:CustomsIssuedResolution/resa:LNP">&#160;ЛНП:&#160;<xsl:value-of select="resa:CustomsIssuedResolution/resa:LNP"/>,</xsl:if>
								<xsl:if test="resa:CustomsIssuedResolution/resa:Note">&#160;<xsl:value-of select="resa:CustomsIssuedResolution/resa:Note"/>
								</xsl:if>
								<br/>
							</td>
						</tr>
						<tr class="graphLittle" align="center">
							<td width="36%">(должность должностного лица таможенного органа, вынесшего постановление)</td>
							<td valign="top" width="2%"> </td>
							<td valign="top" width="20%">(подпись)</td>
							<td width="2%"> </td>
							<td valign="top" width="40%">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
						</tr>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td>
									<span class="normal">Копию постановления получил:</span>
								</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom">
									<span class="normal">
										<xsl:apply-templates select="resa:SecondExempReceived"/>
									</span>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность лица, у которого обнаружены товары, либо его представителя)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr class="graphMain" align="center">
							<td width="36%" valign="bottom" class="border_bottom">
								<xsl:value-of select="resa:SecondExempReceived/cat_ru:PersonPost"/>
							</td>
							<td width="2%"> </td>
							<td width="20%" class="border_bottom"> </td>
							<td width="2%"> </td>
							<td width="40%" valign="bottom" class="border_bottom">
								<xsl:value-of select="resa:SecondExempReceived/cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="substring(resa:SecondExempReceived/cat_ru:PersonName,1,1)"/>
								<xsl:if test="resa:SecondExempReceived/cat_ru:PersonName">.&#160;</xsl:if>
								<xsl:value-of select="substring(resa:SecondExempReceived/cat_ru:PersonMiddleName,1,1)"/>
								<xsl:if test="resa:SecondExempReceived/cat_ru:PersonMiddleName">.</xsl:if>
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
					<br/>
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
								<td width="45%"> </td>
								<td width="55%"> </td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:if test="resa:CustomsMark">
						<table>
							<tbody align="center" class="graphMain">
								<tr>
									<td align="left">Отметки должностных лиц таможенного органа:</td>
								</tr>
								<tr class="delim">
									<td> </td>
								</tr>
								<tr>
									<td align="left" class="border_bottom">
										<xsl:value-of select="resa:CustomsMark/resa:CustomsMarkText"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tr class="graphMain" align="center">
								<td width="36%" valign="bottom" class="border_bottom">
									<xsl:value-of select="resa:CustomsMark/cat_ru:PersonPost"/>
								</td>
								<td width="2%"> </td>
								<td width="20%" class="border_bottom"> </td>
								<td width="2%"> </td>
								<td width="40%" valign="bottom" class="border_bottom">
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
								<td width="2%"> </td>
								<td valign="top" width="20%">(подпись)</td>
								<td width="2%"> </td>
								<td valign="top" width="40%">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
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
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
	<xsl:value-of select="cat_ru:PersonName"/>&#160;
	<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="adt_cat:Passport">
		,&#160;
		<xsl:if test="adt_cat:Passport/cat_ru:IdentityCardCode">
				<xsl:value-of select="adt_cat:Passport/cat_ru:IdentityCardCode"/>&#160;
		</xsl:if>
			<xsl:if test="adt_cat:Passport/cat_ru:IdentityCardName">
				<xsl:value-of select="adt_cat:Passport/cat_ru:IdentityCardName"/>
			</xsl:if>
			<xsl:if test="string-length(adt_cat:Passport/cat_ru:IdentityCardSeries) &gt; 0 or string-length(adt_cat:Passport/cat_ru:IdentityCardNumber) &gt; 0">
			,&#160;
		</xsl:if>
			<xsl:if test="adt_cat:Passport/cat_ru:IdentityCardSeries">
			серия&#160;
			<xsl:value-of select="adt_cat:Passport/cat_ru:IdentityCardSeries"/>
				<xsl:if test="string-length(adt_cat:Passport/cat_ru:IdentityCardNumber) &gt; 0">&#160;</xsl:if>
			</xsl:if>
			<xsl:if test="adt_cat:Passport/cat_ru:IdentityCardNumber">
			№&#160;
			<xsl:value-of select="adt_cat:Passport/cat_ru:IdentityCardNumber"/>
			</xsl:if>
			<xsl:if test="string-length(adt_cat:Passport/cat_ru:IdentityCardDate) &gt; 0 or string-length(adt_cat:Passport/cat_ru:OrganizationName) &gt; 0">
			, выдан&#160;
		</xsl:if>
			<xsl:if test="adt_cat:Passport/cat_ru:IdentityCardDate">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="adt_cat:Passport/cat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="adt_cat:Passport/cat_ru:OrganizationName">	
			&#160;<xsl:value-of select="adt_cat:Passport/cat_ru:OrganizationName"/>
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
				</xsl:call-template>)	</xsl:if>
		</xsl:if>
		<xsl:if test="resa:Comment">,&#160;<xsl:value-of select="resa:Comment"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<span class="italic"> (код вида адреса</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AddressKindCode"/>
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
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="normal">, </span>
		<span class="italic">Документ, удостоверяющий личность ФЛ</span>
		<span class="normal">: </span>
		<xsl:if test="cat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
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
				<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(cat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardNumber"/>
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
					<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="cat_ru:OrganizationName"/>
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
					<td width="2%" align="right">
						<xsl:value-of select="substring($date,1,2)"/>
					</td>
					<td width="9%" class="border_bottom" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
