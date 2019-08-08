<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.0" xmlns:eaac="urn:customs.ru:Information:CustomsAuditDocuments:ExtractFromActAuditCameral:5.14.0">
<!-- 
Приказ ФТС России "Об утверждении форм документов, применяемых при проведении таможенных проверок, порядков их заполнения и 
порядка внесения изменений (дополнений) в решение о проведении выездной таможенной проверки"
Письмо ФТС России от 27.09.2018 № 01-54/61519 "О направлении проекта приказа ФТС России" (Приложение 29)
-->

<!-- Шаблон для типа ExtractFromActAuditCameralType -->
<xsl:template match="eaac:ExtractFromActAuditCameral">
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
							<span class="normal">
								<xsl:choose>
									<xsl:when test="eaac:CustomsIssued/adt_cat:FullOfficeName"><xsl:value-of select="eaac:CustomsIssued/adt_cat:FullOfficeName"/></xsl:when>
									<xsl:otherwise><xsl:value-of select="eaac:CustomsIssued/cat_ru:OfficeName"/></xsl:otherwise>
								</xsl:choose>
							</span>
							<xsl:if test="eaac:CustomsIssued/adt_cat:FullOfficeName or eaac:CustomsIssued/cat_ru:OfficeName">
								<span class="normal"> (</span>
							</xsl:if>
							<span class="normal"><xsl:value-of select="eaac:CustomsIssued/cat_ru:Code"/></span>
							<xsl:if test="eaac:CustomsIssued/adt_cat:FullOfficeName or eaac:CustomsIssued/cat_ru:OfficeName">
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
			<table>
				<tbody align="left" class="graphMain">
					<tr  align="center" class="graphHeader">
						<td>ВЫПИСКА</td>
					</tr>
					<tr class="delim"><td> </td></tr>
					<tr align="center">
						<td>из акта таможенной проверки
						</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
					<tr align="center">
						<td>
							от&#160;<u>&#160;
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="eaac:ActNumber/adt_cat:Date"/>
							</xsl:call-template>
							&#160;</u>&#160;&#160;№&#160;<u>&#160;<xsl:value-of select="eaac:ActNumber/adt_cat:Number"/>&#160;</u>
						</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
				</tbody>
			</table>
			<br/>
			<table>
					<tr>
						<td width="13%" >Проведена</td>
						<td width="2%" ></td>
						<td width="45%" class="border_bottom" align="center">&#160;
							<xsl:choose>
								<xsl:when test="eaac:IdentKindAudit='2'">камеральная</xsl:when>
								<xsl:when test="eaac:AuditFieldKind='1'">плановая выездная</xsl:when>
								<xsl:when test="eaac:AuditFieldKind='2'">внеплановая выездная</xsl:when>
								<xsl:when test="eaac:AuditFieldKind='3'">встречная внеплановая выездная</xsl:when>
							</xsl:choose>
						</td>
						<td width="2%" ></td>
						<td width="48%" >таможенная проверка</td>
					</tr>
					<tr class="graphLittle" align="center">
						<td width="13%" > </td>
						<td width="2%" ></td>
						<td width="45%">(плановая выездная/внеплановая выездная/встречная внеплановая выездная/камеральная)</td>
						<td width="2%" ></td>
						<td width="48%" > </td>
					</tr>
			</table>
			<table>
				<tbody align="left" class="graphMain">
					<tr class="delim"><td> </td></tr>
					<tr>
						<td>Номера проверенных таможенных деклараций:</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
					<tr>
						<td  class="border_bottom">
							<xsl:for-each select="eaac:DTInfo">
								<xsl:apply-templates select="."/>
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
					<tr>
						<td>Выводы и предложения:</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
					<tr>
						<td  class="border_bottom">
							<xsl:for-each select="eaac:Resolution">
								<xsl:apply-templates select="." />
							</xsl:for-each>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br/>
			<table>
				<tbody align="left" class="graphMain">
					<tr>
						<td>
							Должностное лицо, составившее выписку из акта:
						</td>
					</tr>
				</tbody>
			</table>
			<table>
				<tbody class="graphMain">
					<tr align="center">
						<td width="55%" class="border_bottom">
							<xsl:if test="eaac:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonPost">
								<xsl:value-of select="eaac:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
							</xsl:if>
							<xsl:if test="eaac:CustomsIssued/eaac:Rank">
								<xsl:value-of select="eaac:CustomsIssued/eaac:Rank"/>,&#160;</xsl:if>
							<xsl:if test="eaac:CustomsIssued/adt_cat:CustomsSubUnit">
								<xsl:value-of select="eaac:CustomsIssued/adt_cat:CustomsSubUnit"/>,</xsl:if>&#160;<xsl:value-of select="eaac:CustomsIssued/cat_ru:OfficeName"/>
							<xsl:if test="eaac:CustomsIssued/cat_ru:Code">
								<span class="normal">&#160;(</span>
							</xsl:if>
							<xsl:value-of select="eaac:CustomsIssued/cat_ru:Code"/>
							<xsl:if test="eaac:CustomsIssued/cat_ru:Code">
								<span class="normal">), &#160;</span>
							</xsl:if>
							<xsl:value-of select="eaac:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="eaac:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonName"/>&#160;<xsl:value-of select="eaac:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>
							<xsl:if test="eaac:CustomsIssued/eaac:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="eaac:CustomsIssued/eaac:PersonCustomsID"/>,</xsl:if>
							<xsl:if test="eaac:CustomsIssued/eaac:LNP">&#160;ЛНП:&#160;<xsl:value-of select="eaac:CustomsIssued/eaac:LNP"/>,</xsl:if>
							<xsl:if test="eaac:CustomsIssued/eaac:Phone">&#160;Тел:&#160;<xsl:value-of select="eaac:CustomsIssued/eaac:Phone"/>,</xsl:if>
							<xsl:if test="eaac:CustomsIssued/eaac:Note">&#160;<xsl:value-of select="eaac:CustomsIssued/eaac:Note"/></xsl:if>
							<br/>
						</td>
						<td width="15%"> </td>
						<td width="30%" class="border_bottom"> </td>
					</tr>
					<tr class="graphLittle" align="center">
						<td width="55%"> </td>
						<td width="15%"> </td>
						<td width="30%">(подпись)</td>
					</tr>
				</tbody>
			</table>
			<br/>



			<table>
				<tbody class="graphMain">
					<tr>
						<td width="28%">
							<xsl:text>Второй экземпляр выписки из акта на </xsl:text>
							<u>&#160;&#160;<xsl:value-of select="eaac:SecondExempReceived/adt_cat:SheetsNumber"/>&#160;&#160;</u>
							<xsl:text> листах получил</xsl:text>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<table>
				<tbody class="graphMain">
					<tr align="center">
						<td width="55%" class="border_bottom">
							<xsl:apply-templates select="eaac:SecondExempReceived" />
							<br/>
						</td>
						<td width="15%"> </td>
						<td width="30%" class="border_bottom"> </td>
					</tr>
					<tr class="graphLittle" align="center">
						<td width="55%"> </td>
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
								<xsl:with-param name="date" select="eaac:SecondExempReceived/adt_cat:Date"/>
							</xsl:call-template>
						</td>
						<td></td>
					</tr>
					<tr class="graphLittle">
						<td align="center">(дата получения второго экземпляра акта)</td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>
</xsl:template>

<!-- Шаблон для типа adt_cat:PersonType -->
<!--xsl:template match="eaac:ListCommission|eaac:ListAttractedPersons">
		<xsl:if test="cat_ru:PersonPost">												
			должность: <xsl:value-of select="cat_ru:PersonPost"/>,&#160; 
		</xsl:if>
		<xsl:if test="adt_cat:CustomsDept">
			структурное подразделение:&#160;
			<xsl:if test="adt_cat:CustomsDept/cat_ru:OfficeName">
				<xsl:value-of select="adt_cat:CustomsDept/cat_ru:OfficeName"/>
				(
			</xsl:if>
			код ТО <xsl:value-of select="adt_cat:CustomsDept/cat_ru:Code"/>
			<xsl:if test="adt_cat:CustomsDept/cat_ru:OfficeName">
				)
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
</xsl:template-->

<!-- Шаблон для adt_cat:SecondExempReceivedType-->
<xsl:template match="eaac:SecondExempReceived">
	<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>,&#160;
	</xsl:if>
	<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
	<xsl:value-of select="cat_ru:PersonName"/>&#160;
	<xsl:value-of select="cat_ru:PersonMiddleName"/>
	<xsl:if test="adt_cat:Passport">
		,&#160;
		<xsl:if test="adt_cat:Passport/cat_ru:IdentityCardCode">
			<xsl:value-of select="adt_cat:Passport/cat_ru:IdentityCardCode" />&#160;
		</xsl:if>
		<xsl:if test="adt_cat:Passport/cat_ru:IdentityCardName">
			<xsl:value-of select="adt_cat:Passport/cat_ru:IdentityCardName" />
		</xsl:if>
		<xsl:if test="string-length(adt_cat:Passport/cat_ru:IdentityCardSeries) &gt; 0 or string-length(adt_cat:Passport/cat_ru:IdentityCardNumber) &gt; 0">
			,&#160;
		</xsl:if>
		<xsl:if test="adt_cat:Passport/cat_ru:IdentityCardSeries">
			серия&#160;
			<xsl:value-of select="adt_cat:Passport/cat_ru:IdentityCardSeries" />
			<xsl:if test="string-length(adt_cat:Passport/cat_ru:IdentityCardNumber) &gt; 0">&#160;</xsl:if>
		</xsl:if>
		<xsl:if test="adt_cat:Passport/cat_ru:IdentityCardNumber">
			№&#160;
			<xsl:value-of select="adt_cat:Passport/cat_ru:IdentityCardNumber" />
		</xsl:if>
		<xsl:if test="string-length(adt_cat:Passport/cat_ru:IdentityCardDate) &gt; 0 or string-length(adt_cat:Passport/cat_ru:OrganizationName) &gt; 0">
			, выдан&#160;
		</xsl:if>
		<xsl:if test="adt_cat:Passport/cat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="adt_cat:Passport/cat_ru:IdentityCardDate" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="adt_cat:Passport/cat_ru:OrganizationName">	
			&#160;<xsl:value-of select="adt_cat:Passport/cat_ru:OrganizationName" />
		</xsl:if>
	</xsl:if>
	<xsl:if test="adt_cat:AuthoritesDocument">
		; документ, подтверждающий полномочия&#160;
		<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentName">
			<xsl:value-of select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentName" />&#160;
		</xsl:if>
		<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentNumber">
			&#160;№&#160;
			<xsl:value-of select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentNumber" />
		</xsl:if>
		<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentDate">
			&#160;от&#160;
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentDate" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:ComplationAuthorityDate">
			&#160;(дата окончания полномочий&#160;
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="adt_cat:AuthoritesDocument/cat_ru:ComplationAuthorityDate" />
			</xsl:call-template>
			)
		</xsl:if>
	</xsl:if>
</xsl:template>

<xsl:template match="eaac:DTNumberInfo">
	<xsl:if test="eaac:DeclarationKind">
		<xsl:value-of select="eaac:DeclarationKind"/>
		<xsl:text> </xsl:text>
	</xsl:if>
	<xsl:value-of select="cat_ru:CustomsCode"/>
	<xsl:text>/</xsl:text>
	<xsl:call-template name="gtd_date">
		<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
	</xsl:call-template>
	<xsl:text>/</xsl:text>
	<xsl:value-of select="cat_ru:GTDNumber"/>
	<xsl:if test="eaac:GoodsNumeric">
		(номер(а) товара(ов): 
		<xsl:for-each select="cat_ru:GTDNumber">
			<xsl:value-of select="."/>
			<xsl:if test="position() != last()">, </xsl:if>
		</xsl:for-each> 
		)
	</xsl:if>
</xsl:template>
<xsl:template match="eaac:DTInfo">
	<xsl:if test="eaac:DTNumberInfo">
		<xsl:apply-templates select="eaac:DTNumberInfo"/>
	</xsl:if>
	<xsl:if test="eaac:OtherDocument">
		<xsl:apply-templates select="eaac:OtherDocument"/>
	</xsl:if>
</xsl:template>
<xsl:template match="eaac:OtherDocument">
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
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
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
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>