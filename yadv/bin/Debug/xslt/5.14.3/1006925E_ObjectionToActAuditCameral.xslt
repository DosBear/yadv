<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:oaac="urn:customs.ru:Information:CustomsAuditDocuments:ObjectionToActAuditCameral:5.14.3">
<!-- 
Приказ ФТС России "Об утверждении форм документов, применяемых при проведении таможенных проверок, порядков их заполнения и 
порядка внесения изменений (дополнений) в решение о проведении выездной таможенной проверки"
Письмо ФТС России от 27.09.2018 № 01-54/61519 "О направлении проекта приказа ФТС России" (Приложение 29)
-->

<!-- Шаблон для типа ObjectionToActAuditCameralType -->
<xsl:template match="oaac:ObjectionToActAuditCameral">
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

			.inlinetable
			{
			border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			display:-moz-inline-stack;/*Firefox 2*/
			display:inline-table; /*Хорошие браузеры*/
			_overflow:hidden;/*IE6, IE7*/
			*zoom:1;/*включаем hasLayout для IE6, IE7*/
			*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
			text-indent: 0;
			vertical-align: top;
			align: center;
			text-align: center;
			}

		</style>
	</head>
	<body>
		<div class="page">

			<table>
				<tbody align="left" class="graphMain">
					<tr  align="center">
						<td>
							<xsl:choose>
								<xsl:when test="oaac:DocKind='1'">
									<b>ВОЗРАЖЕНИЯ</b> проверяемого лица
								</xsl:when>
								<xsl:when test="oaac:DocKind='2'">
									<b>Информация об отсутствии возражений проверяемого лица</b>
								</xsl:when>
								<xsl:otherwise>Неизвествный документ</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<tr class="delim"><td> </td></tr>
					<tr align="center">
						<td>
							<xsl:choose>
								<xsl:when test="oaac:DocKind='2'">
									<b>на акт таможенной проверки</b>
								</xsl:when>
								<xsl:otherwise>на акт таможенной проверки</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
					<tr align="center">
						<td>
							№&#160;<u>&#160;<xsl:value-of select="oaac:ObjectionNumber/adt_cat:Number"/>&#160;</u>
						</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
				</tbody>
			</table>
			<br/>
			<table>
				<tbody align="center" class="graphMain">
					<tr>
						<td width="45%" align="left">
							<xsl:call-template name="Date">
								<xsl:with-param name="date" select="oaac:ObjectionNumber/adt_cat:Date"/>
							</xsl:call-template>
						</td>
						<td width="15%"> </td>
						<td width="40%" class="border_bottom"><xsl:value-of select="oaac:DocPlace"/></td>
					</tr>
					<tr class="graphLittle">
						<td width="45%">(дата)</td>
						<td  width="10%"> </td>
						<td width="45%">(место составления)</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<table>
				<tbody align="left" class="graphMain">
					<tr style="text-align: justify;">
						<td>На основании частей 16,19<xsl:if test="oaac:DocKind='2'"> и 20</xsl:if> статьи 237 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации",
						</td>
					</tr>
					<tr class="delim"><td> </td></tr>
					<tr class="delim_3"><td> </td></tr>
					<tr style="text-align: justify;">
						<td  class="border_bottom">
							<xsl:apply-templates select="oaac:AuditOrganization" />
							<br/>
						</td>
					</tr>
					<tr class="graphLittle">
						<td  width="80%" align="center">указываются сведения о проверяемом лице</td>
					</tr>
					<tr>
						<td>информирует
							<xsl:choose>
								<xsl:when test="oaac:DocKind='1'"> о наличии </xsl:when>
								<xsl:when test="oaac:DocKind='2'"> об отсутствии </xsl:when>
							</xsl:choose>
							возражений по Акту 
							<xsl:call-template name="inlinetable">
								<xsl:with-param name="data">
									<xsl:choose>
										<xsl:when test="oaac:IdentKindAudit='1'">выездной</xsl:when>
										<xsl:when test="oaac:IdentKindAudit='2'">камеральной</xsl:when>
									</xsl:choose>
								</xsl:with-param>
								<xsl:with-param name="data_align" select="'center'"/>
								<xsl:with-param name="description">камеральной/выездной</xsl:with-param>
								<xsl:with-param name="width">30%</xsl:with-param>
							</xsl:call-template>
							таможенной проверки
						</td>
					</tr>
					<tr>
						<td>
							<xsl:call-template name="inlinetable">
								<xsl:with-param name="data">
									№&#160;&#160;<xsl:value-of select="oaac:ActNumber/adt_cat:Number"/>
									&#160;&#160;от&#160;&#160;
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="oaac:ActNumber/adt_cat:Date"/>
									</xsl:call-template>
								</xsl:with-param>
								<xsl:with-param name="data_align" select="'center'"/>
								<xsl:with-param name="description">указываются сведения о номере Акта таможенной проверки</xsl:with-param>
								<xsl:with-param name="width">99%</xsl:with-param>
							</xsl:call-template><xsl:if test="oaac:DocKind='1'"><xsl:text> :</xsl:text></xsl:if>
						</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
				</tbody>
			</table>

			<xsl:choose>
				<xsl:when test="oaac:DocKind='1'">
					<br/>
					<table>
						<tbody>
							<tr valign="top" align="center">
								<td style="border: 1px solid black;" width="35%">Наименование структурной единицы акта таможенной проверки, в отношении положений которой проверяемым лицом представлены возражения</td>
								<td style="border: 1px solid black;" width="35%">Положение акта таможенной проверки, в отношении которого проверяемым лицом представлены возражения</td>
								<td style="border: 1px solid black;" width="30%">Возражения по акту таможенной проверки проверяемого лица, обоснование</td>
							</tr>
							<tr valign="top" align="center">
								<td style="border: 1px solid black;" width="35%">1</td>
								<td style="border: 1px solid black;" width="35%">2</td>
								<td style="border: 1px solid black;" width="30%">3</td>
							</tr>
							<xsl:for-each select="oaac:Objections">
								<tr valign="top">
									<td style="border: 1px solid black;">
										<xsl:apply-templates select="oaac:NameStructuralUnitAct"/>
									</td>
									<td style="border: 1px solid black;">
										<xsl:apply-templates select="oaac:RegulationAct"/>
									</td>
									<td style="border: 1px solid black;">
										<xsl:apply-templates select="oaac:ObjectionsToAct"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:when>
			</xsl:choose>
			<br/><br/>
			<table width="100%" class="graphMain">
				<tbody>
					<tr>
						<td align="left" width="17%" class="normal" valign="bottom">Руководитель проверяемого лица</td>
						<td width="3%"/>
						<td align="center" width="12%" class="value"/>
						<td width="3%"/>
						<td valign="bottom" align="center" width="29%" class="value">
							<xsl:for-each select="oaac:AuditOrganization/adt_cat:Chief">
								<xsl:value-of select="cat_ru:PersonSurname"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="cat_ru:PersonName"/>
								<xsl:if test="cat_ru:PersonMiddleName">
									<xsl:text> </xsl:text>
									<xsl:value-of select="cat_ru:PersonMiddleName"/>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
					<tr>
						<td align="center"/>
						<td/>
						<td align="center" class="graphLittle">(подпись)</td>
						<td/>
						<td align="center" class="graphLittle">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
					</tr>
					<tr>
						<td  colspan="7" class="delim">
							<br/>
						</td>
					</tr>
				</tbody>
			</table>
					
					
					






			<!--table>
				<tbody align="left" class="graphMain">
					<tr>
						<td>Выводы:</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
					<tr>
						<td  class="border_bottom">
							<xsl:for-each select="oaac:Resolution">
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
							<xsl:if test="oaac:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonPost">
								<xsl:value-of select="oaac:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
							</xsl:if>
							<xsl:if test="oaac:CustomsIssued/oaac:Rank">
								<xsl:value-of select="oaac:CustomsIssued/oaac:Rank"/>,&#160;</xsl:if>
							<xsl:if test="oaac:CustomsIssued/adt_cat:CustomsSubUnit">
								<xsl:value-of select="oaac:CustomsIssued/adt_cat:CustomsSubUnit"/>,</xsl:if>&#160;<xsl:value-of select="oaac:CustomsIssued/cat_ru:OfficeName"/>
							<xsl:if test="oaac:CustomsIssued/cat_ru:Code">
								<span class="normal">&#160;(</span>
							</xsl:if>
							<xsl:value-of select="oaac:CustomsIssued/cat_ru:Code"/>
							<xsl:if test="oaac:CustomsIssued/cat_ru:Code">
								<span class="normal">), &#160;</span>
							</xsl:if>
							<xsl:value-of select="oaac:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="oaac:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonName"/>&#160;<xsl:value-of select="oaac:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>
							<xsl:if test="oaac:CustomsIssued/oaac:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="oaac:CustomsIssued/oaac:PersonCustomsID"/>,</xsl:if>
							<xsl:if test="oaac:CustomsIssued/oaac:LNP">&#160;ЛНП:&#160;<xsl:value-of select="oaac:CustomsIssued/oaac:LNP"/>,</xsl:if>
							<xsl:if test="oaac:CustomsIssued/oaac:Phone">&#160;Тел:&#160;<xsl:value-of select="oaac:CustomsIssued/oaac:Phone"/>,</xsl:if>
							<xsl:if test="oaac:CustomsIssued/oaac:Note">&#160;<xsl:value-of select="oaac:CustomsIssued/oaac:Note"/></xsl:if>
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
							<u>&#160;&#160;<xsl:value-of select="oaac:SecondExempReceived/adt_cat:SheetsNumber"/>&#160;&#160;</u>
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
							<xsl:apply-templates select="oaac:SecondExempReceived" />
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
								<xsl:with-param name="date" select="oaac:SecondExempReceived/adt_cat:Date"/>
							</xsl:call-template>
						</td>
						<td></td>
					</tr>
					<tr class="graphLittle">
						<td align="center">(дата получения второго экземпляра акта)</td>
						<td></td>
					</tr>
				</tbody>
			</table-->
		</div>
	</body>
</html>
</xsl:template>

<!-- Шаблон для типа adt_cat:PersonType -->
<!--xsl:template match="oaac:ListCommission|oaac:ListAttractedPersons">
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
<xsl:template match="oaac:SecondExempReceived">
	<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>,&#160;
	</xsl:if>
	<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
	<xsl:value-of select="cat_ru:PersonName"/>&#160;
	<xsl:value-of select="cat_ru:PersonMiddleName"/>
	<xsl:if test="adt_cat:Passport">
		,&#160;
		<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardCode">
			<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardCode" />&#160;
		</xsl:if>
		<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardName">
			<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardName" />
		</xsl:if>
		<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(adt_cat:Passport/RUScat_ru:IdentityCardNumber) &gt; 0">
			,&#160;
		</xsl:if>
		<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardSeries">
			серия&#160;
			<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardSeries" />
			<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardNumber) &gt; 0">&#160;</xsl:if>
		</xsl:if>
		<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardNumber">
			№&#160;
			<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardNumber" />
		</xsl:if>
		<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardDate) &gt; 0 or string-length(adt_cat:Passport/RUScat_ru:OrganizationName) &gt; 0">
			, выдан&#160;
		</xsl:if>
		<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="adt_cat:Passport/RUScat_ru:IdentityCardDate" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="adt_cat:Passport/RUScat_ru:OrganizationName">	
			&#160;<xsl:value-of select="adt_cat:Passport/RUScat_ru:OrganizationName" />
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

<!-- Шаблон для типа adt_cat:AuditOrganizationType -->
<xsl:template match="oaac:AuditOrganization">
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
		<span class="normal"><br/></span>
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<xsl:if test="position()=1">
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

<xsl:template name="CommunicationDetails">
	<span class="normal">, </span>
	<span class="italic">Контактные данные</span>
	<span class="normal">: </span>
	<xsl:variable name="temp">
		<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
	</xsl:variable>
	<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
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
	<xsl:if test="RUScat_ru:IdentityCardCode">
		<span class="normal">
			<xsl:value-of select="RUScat_ru:IdentityCardCode" />
		</span>
		<span class="normal">&#160;</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:IdentityCardName">
		<span class="normal">
			<xsl:value-of select="RUScat_ru:IdentityCardName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:FullIdentityCardName">
		<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
			<span class="normal"> (</span>
		</xsl:if>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:FullIdentityCardName" />
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
			<xsl:value-of select="RUScat_ru:IdentityCardSeries" />
		</span>
		<xsl:if test="string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">&#160;</span>
		</xsl:if>
	</xsl:if>
	<xsl:if test="RUScat_ru:IdentityCardNumber">
		<span class="italic">№</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:IdentityCardNumber" />
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
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate" />
			</xsl:call-template>
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:OrganizationName">	
		<span class="normal">&#160;</span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:OrganizationName" />
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
				<xsl:otherwise><xsl:value-of select="RUScat_ru:AddressKindCode"/></xsl:otherwise>
			</xsl:choose>
		</span> 
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
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="graphMain value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="graphLittle">
						<xsl:value-of select="$description"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
</xsl:stylesheet>