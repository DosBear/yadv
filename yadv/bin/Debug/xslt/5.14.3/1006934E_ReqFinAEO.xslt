<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.3" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:rfa="urn:customs.ru:Information:ReqFinAEO:5.14.3">
<!-- Письмо ГУИТ от 30.04.2019 № 09-126/25992 
rfa:ReqCode = 71 - Камеральная таможенная проверка (стр. 8)
rfa:ReqCode = 81 - Выездная таможенная проверка (стр. 6)
rfa:ReqCode = 12 - Проверка системы учета товаров и отчетности по ним (стр. 12)
-->
	<!-- Шаблон для типа ReqFinAEOType -->
	<xsl:template match="rfa:ReqFinAEO">
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
					<xsl:if test="rfa:ReqCode='81'">
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
											<xsl:value-of select="rfa:Customs/cat_ru:OfficeName"/>
										</span>
										<xsl:if test="rfa:Customs/cat_ru:OfficeName">
											<span class="normal"> (</span>
										</xsl:if>
										<span class="normal">
											<xsl:value-of select="rfa:Customs/cat_ru:Code"/>
										</span>
										<xsl:if test="rfa:Customs/cat_ru:OfficeName">
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
					<xsl:choose>
						<xsl:when test="rfa:ReqCode='12'">
							<table>
								<tbody align="left" class="graphMain">
									<tr>
										<td width="50%"> </td>
										<td width="50%">
											<xsl:text>Руководителю</xsl:text>
											<br/>
										</td>
									</tr>
									<tr>
										<td width="50%"> </td>
										<td width="50%" class="border_bottom">
											<br/>
											<xsl:value-of select="rfa:AuthoriziedOperatorDetails/cat_ru:OrganizationName"/>
											<xsl:if test="rfa:AuthoriziedOperatorDetails/cat_ru:OrganizationName and rfa:AuthoriziedOperatorDetails/cat_ru:ShortName">
												<xsl:text> (</xsl:text>
											</xsl:if>
											<xsl:value-of select="rfa:AuthoriziedOperatorDetails/cat_ru:ShortName"/>
											<xsl:if test="rfa:AuthoriziedOperatorDetails/cat_ru:OrganizationName and rfa:AuthoriziedOperatorDetails/cat_ru:ShortName">
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
									</tr>
									<tr class="graphLittle">
										<td width="50%"/>
										<td width="50%" align="center">(наименование проверяемого лица)</td>
									</tr>
									<tr>
										<td width="50%"> </td>
										<td width="50%" class="border_bottom"> <br/></td>
									</tr>
									<tr class="graphLittle">
										<td width="50%"/>
										<td width="50%" align="center">(инициалы, фамилия)</td>
									</tr>
									<tr>
										<td width="50%"> </td>
										<td width="50%" class="border_bottom">
											<xsl:if test="rfa:AuthoriziedOperatorDetails/RUScat_ru:SubjectAddressDetails">
												<xsl:for-each select="rfa:AuthoriziedOperatorDetails/RUScat_ru:SubjectAddressDetails">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">;<br/></xsl:if>
												</xsl:for-each>
											</xsl:if><br/>
										</td>
										<tr class="graphLittle">
											<td width="50%"/>
											<td width="50%" align="center">(адрес)</td>
										</tr>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody align="left" class="graphMain">
									<tr align="center" class="graphHeader">
										<td>ЗАПРОС</td>
									</tr>
									<tr class="delim_3">
										<td> </td>
									</tr>
									<tr align="center">
										<td>документов и (или) сведений, необходимых для проведения таможенного контроля</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="rfa:ReqCode='71' or rfa:ReqCode='81'">
							<table>
								<tbody align="left" class="graphMain">
									<tr>
										<td width="50%"> </td>
										<td width="50%" class="border_bottom">
											<xsl:apply-templates select="rfa:AuthoriziedOperatorDetails"/>
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
												<xsl:when test="rfa:ReqCode = '81'">о представлении документов и (или) сведений при выездной таможенной проверке</xsl:when>
												<xsl:when test="rfa:ReqCode = '71'">о представлении документов и (или) сведений при камеральной таможенной проверке</xsl:when>
											</xsl:choose>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
					</xsl:choose>
					<xsl:if test="rfa:ReqCode='81'">
						<br/>
						<table>
							<tbody align="center" class="graphMain">
								<tr>
									<td width="45%" align="left">
										<xsl:call-template name="Date">
											<xsl:with-param name="date" select="rfa:ExecutionDate"/>
										</xsl:call-template>
									</td>
									<td width="15%"> </td>
									<td width="40%" class="border_bottom">
										<br/>
									</td>
								</tr>
								<tr class="graphLittle">
									<td> </td>
									<td> </td>
									<td>(место составления)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody align="left" class="graphMain">
								<tr class="delim">
									<td> </td>
								</tr>
								<tr style="text-align: justify;">
									<td>
										На основании статей 333, 336, 340 Таможенного кодекса Евразийского экономического союза и в соответствии с решением о проведении&#160;
										<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
										таможенной проверки от&#160;
										<xsl:call-template name="DateStr">
													<xsl:with-param name="date" select="'&quot;____&quot; ______________ 20___ г.'"/>
												</xsl:call-template>
										&#160;№&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;
										необходимо представить в течение&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;
										календарных дней с момента получения настоящего требования следующие документы и (или) сведения:
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rfa:ReqCode='71'">
						<table>
							<tbody align="left" class="graphMain">
								<tr class="delim">
									<td> </td>
								</tr>
								<tr style="text-align: justify;">
								<td>
								На основании статей 336, 340 Таможенного кодекса Евразийского экономического союза в связи с проведением камеральной таможенной проверки (уведомление о проведении камеральной таможенной проверки от&#160;
								<u>&#160;&#160;<xsl:call-template name="russian_date">
												<xsl:with-param select="'            '" name="dateIn"/>
											</xsl:call-template>&#160;&#160;</u>&#160;№&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;) Вам надлежит представить в течение <u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;
								календарных дней с даты получения настоящего требования следующие документы и (или) сведения:
							</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rfa:ReqCode='12'">
						<table>
							<tbody align="left" class="graphMain">
								<tr class="delim">
									<td> </td>
								</tr>
								<tr style="text-align: justify">
									<td>
										В соответствии со статьями 340 Таможенного кодекса Евразийского экономического союза и статьями 239 - 242 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»
									</td>
								</tr>	
								<tr>
									<td class="border_bottom">
										<span class="normal">
											<xsl:value-of select="rfa:Customs/cat_ru:OfficeName"/>
										</span>
										<xsl:if test="rfa:Customs/cat_ru:OfficeName">
											<span class="normal"> (</span>
										</xsl:if>
										<span class="normal">
											<xsl:value-of select="rfa:Customs/cat_ru:Code"/>
										</span>
										<xsl:if test="rfa:Customs/cat_ru:OfficeName">
											<span class="normal">)</span>
										</xsl:if>
									</td>
								</tr>
								<tr class="graphLittle">
									<td align="center">(наименование таможенного органа)</td>
								</tr>
								<tr style="text-align: justify">
									<td>
										проводится таможенный контроль с применением меры, обеспечивающей проведение таможенного контроля, проверки наличия системы учета товаров и ведения учета товаров
									</td>
								</tr>	
								<tr style="text-align: justify">
									<td>
										за период с&#160;<u>&#160;&#160;
										<xsl:call-template name="DateStr">
											<xsl:with-param select="rfa:DODate/rfa:StartDate" name="date"/>
										</xsl:call-template>
										&#160;&#160;</u>&#160;по&#160;<u>&#160;&#160;
										<xsl:call-template name="DateStr">
											<xsl:with-param select="rfa:DODate/rfa:EndDate" name="date"/>
										</xsl:call-template>
										&#160;&#160;</u>
									</td>
								</tr>	
								<tr class="delim">
									<td> </td>
								</tr>
								<tr style="text-align: justify">
									<td>
										На основании статьи 340 Таможенного кодекса Евразийского экономического союза и статей 239 - 242 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» просим представить в течение 10 рабочих дней со дня получения следующие документы и (или) сведения, необходимые для проведения таможенного контроля:
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
								<td class="border_bottom"> <br/></td>
							</tr>
							<tr>
								<td class="border_bottom"> <br/></td>
							</tr>
							<xsl:if test="rfa:ReqCode='71' or rfa:ReqCode='81'">
								<tr>
									<td class="border_bottom"> <br/></td>
								</tr>
							</xsl:if>
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
										<xsl:when test="rfa:ReqCode='12'">Документы и сведения должны быть представлены по адресу:</xsl:when>
										<xsl:when test="rfa:ReqCode='71'">Документы и (или) сведения должны быть представлены:</xsl:when>
										<xsl:when test="rfa:ReqCode='81'">Документы и (или) сведения должны быть представлены:</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr class="delim_3">
								<td/>
							</tr>
							<tr>
								<td class="border_bottom"> <br/></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<xsl:choose>
						<xsl:when test="rfa:ReqCode='81'">
							<table>
								<tr class="graphMain" align="center">
									<td valign="bottom" width="36%" class="border_bottom">
										<xsl:value-of select="rfa:Signatures/cat_ru:PersonPost"/>
										<br/>
									</td>
									<td width="2%"> </td>
									<td valign="bottom" width="20%" class="border_bottom"> </td>
									<td width="2%"> </td>
									<td valign="bottom" width="40%" class="border_bottom">
										<xsl:value-of select="rfa:Signatures/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="rfa:Signatures/cat_ru:PersonName"/>&#160;<xsl:value-of select="rfa:Signatures/cat_ru:PersonMiddleName"/>
										<br/>
									</td>
								</tr>
								<tr class="graphLittle" align="center">
									<td valign="top">(должность)</td>
									<td> </td>
									<td valign="top" >(подпись)</td>
									<td> </td>
									<td valign="top">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
								</tr>
							</table>
						</xsl:when>
						<xsl:otherwise>
							<table>
								<tr class="graphMain">
									<td align="left"> 
										<xsl:choose>
											<xsl:when test="rfa:ReqCode='12'">Начальник</xsl:when>
											<xsl:when test="rfa:ReqCode='71'">Начальник (заместитель начальника)</xsl:when>
										</xsl:choose>
									</td>
								</tr>
							</table>
							<table>
								<tr class="graphMain" align="center">
									<td width="36%" valign="bottom" class="border_bottom">
										<xsl:value-of select="rfa:Customs/cat_ru:Code"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="rfa:Customs/cat_ru:OfficeName"/>
									</td>
									<td width="2%"> </td>
									<td valign="bottom" width="20%" class="border_bottom"> </td>
									<td width="2%"> </td>
									<td valign="bottom" width="40%" class="border_bottom">
										<xsl:choose>
											<xsl:when test="rfa:ReqCode='12'">
												<xsl:if test="rfa:Signatures/cat_ru:PersonName"><xsl:value-of select="concat(substring(rfa:Signatures/cat_ru:PersonName,1,1),'. ')"/></xsl:if>
												<xsl:if test="rfa:Signatures/cat_ru:PersonMiddleName"><xsl:value-of select="concat(substring(rfa:Signatures/cat_ru:PersonMiddleName,1,1),'. ')"/></xsl:if>
												<xsl:value-of select="rfa:Signatures/cat_ru:PersonSurname"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="rfa:ChiefCommission/cat_ru:PersonPost">
													<xsl:value-of select="rfa:ChiefCommission/cat_ru:PersonPost"/>&#160;
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="rfa:Signatures/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="rfa:Signatures/cat_ru:PersonName"/>&#160;<xsl:value-of select="rfa:Signatures/cat_ru:PersonMiddleName"/>
											</xsl:otherwise>
										</xsl:choose>
										<br/>
									</td>
								</tr>
								<tr class="graphLittle" align="center">
									<td valign="top">(наименование таможенного органа)</td>
									<td> </td>
									<td valign="top" >(подпись)</td>
									<td> </td>
									<td valign="top">
										<xsl:choose>
											<xsl:when test="rfa:ReqCode='12'">(инициалы, фамилия)</xsl:when>
											<xsl:otherwise>(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</table>
						</xsl:otherwise>
					</xsl:choose>
					<br/>
					<xsl:if test="rfa:ReqCode='81'">
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
								<td width="70%" valign="bottom" class="border_bottom"><br/> </td>
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
											<xsl:with-param name="date" select="'&quot;____&quot; ______________ 20___ г.'"/>
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
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа RUDECLcat:AEODeclarantDetailsType -->
	<xsl:template match="rfa:AuthoriziedOperatorDetails|RUScat_ru:SubjectBranch">
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
		<xsl:if test="rfa:OKPO">
			<span class="normal">, </span>
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="rfa:OKPO"/>
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
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<br/>
			<span class="italic">Контактная информация</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectBranch">
			<br/>
			<span class="italic">Обособленное подразделение</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="RUScat_ru:SubjectBranch"/>
		</xsl:if>
		<xsl:if test="RUDECLcat:AEORegistryIdDetails">
			<br/>
			<span class="italic">Cвидетельство о включении в реестр УЭО</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="RUDECLcat:AEORegistryIdDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="italic"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">(</span>
			<span class="italic">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:AEORegistryIdDetailsType -->
	<xsl:template match="RUDECLcat:AEORegistryIdDetails">
		<xsl:value-of select="catESAD_cu:DocId"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="catESAD_cu:AEORegistryKindCode"/>
		<xsl:text>) код типа реестра: </xsl:text>
		<xsl:value-of select="catESAD_cu:RegistryOwnerCode"/>
		<xsl:if test="catESAD_cu:CountryA2Code">
			<xsl:text> код страны: </xsl:text>
			<xsl:value-of select="catESAD_cu:CountryA2Code"/>
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
		<xsl:value-of select="cat_ru:PersonPost"/>&#160;<xsl:value-of select="rfa:Rank"/>&#160;<xsl:value-of select="rfa:Department"/>&#160;<span class="normal">
			<xsl:value-of select="rfa:CustomsDept/cat_ru:OfficeName"/>
		</span>
		<xsl:if test="rfa:CustomsDept/cat_ru:Code">
			<span class="normal">&#160;(</span>
		</xsl:if>
		<span class="normal">
			<xsl:value-of select="rfa:CustomsDept/cat_ru:Code"/>
		</span>
		<xsl:if test="rfa:CustomsDept/cat_ru:Code">
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" name="PersonName" mode="PersonName">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;<xsl:value-of select="cat_ru:PersonName"/>&#160;<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="rfa:PersonCustomsID">, номер служебного удостоверения:&#160;<xsl:value-of select="rfa:PersonCustomsID"/></xsl:if>
		<xsl:if test="rfa:LNP">, ЛНП:&#160;<xsl:value-of select="rfa:LNP"/></xsl:if>
		<xsl:if test="rfa:Phone">,&#160;Тел:&#160;<xsl:value-of select="rfa:Phone"/></xsl:if>
		<xsl:if test="rfa:Note">,&#160;<xsl:value-of select="rfa:Note"/>
		</xsl:if>
		<xsl:if test="rfa:Comment">,&#160;<xsl:value-of select="rfa:Comment"/>
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
					<td width="3%" align="left"> "</td>
					<td width="2%"> </td>
					<td width="46%" class="border_bottom">
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
					<td width="9%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="substring($date,5,1)='-' and substring($date,8,1)='-'">
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
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$date"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>