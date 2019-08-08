<?xml version="1.0" encoding="UTF-8"?>
<!--
Проект приказа ФТС России "Об утверждении Порядка действий должностных лиц ФТС России при принятии решений об исключении юридических лиц из реестра таможенных предстаителей"
Письмо ГУФТДиТР от 25.12.2017 № 05-34/73722
-->
<xsl:stylesheet version="1.0" xmlns:decb="urn:customs.ru:Information:SQDocuments:DecisionExclusionCustBroker:5.14.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="decb:DecisionExclusionCustBroker">
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
			max-width: 180mm;
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
			table-layout: fixed;
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
			
			td
			{
			text-align: justify;
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
			font-size: 12pt;
			font-weight:bold;
			text-align: center;
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
				<meta CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			</head>
			<body>
				<div class="page">
					<br/>
					<br/>
					<table>
						<xsl:choose>
							<xsl:when test="decb:DocKind=1">
								<tbody class="graphMain">
									<tr align="center">
										<td class="graphHeader">Решение № <u>&#160;&#160;
												<xsl:value-of select="decb:DecisionExclusion/decb:Number"/>
											&#160;&#160;</u>
										</td>	
									</tr>
									<tr>
										<td class="delim"> </td>
									</tr>
									<tr align="center">
										<td class="graphHeader">"Об исключении из реестра таможенных представителей"</td>
									</tr>
									<tr align="left" class="normal">
										<td>
											<br/>
											<br/>
											<br/>
											<p style="text-indent: 7%">В связи с неисполнением обязанности (с наступлением события), установленной (ого)</p>
										</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="left" class="value">
											<xsl:for-each select="decb:Reason">
												<!--xsl:apply-templates/-->
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="left" class="normal">исключить из реестра таможенных представителей</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="decb:Organization"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">(наименование организации с указанием организационно-правовой формы)</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<xsl:if test="decb:IncludionBroker/decb:DecisionIncludion">
										<tr align="left">
											<td class="normal">Решение* №  
                                       <u>
													&#160;&#160;<xsl:value-of select="decb:IncludionBroker/decb:DecisionIncludion/decb:Number"/>&#160;&#160;
												</u>
										от
									<u>
													&#160;&#160;<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="decb:IncludionBroker/decb:DecisionIncludion/decb:Date"/>
													</xsl:call-template>&#160;&#160;
												</u>
										 "О включении в реестр таможенных представителей".&#160;
									</td>
										</tr>
									</xsl:if>
									<xsl:if test="decb:IncludionBroker/decb:Order">
										<tr align="left">
											<td class="normal">Приказ* ФТС России №&#160; 
											<u>&#160;&#160;<xsl:value-of select="decb:IncludionBroker/decb:Order/decb:Number"/>&#160;&#160;</u>
											&#160;от&#160;
									        <u>&#160;&#160;
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="decb:IncludionBroker/decb:Order/decb:Date"/>
												</xsl:call-template>
											&#160;&#160;</u>
										&#160;"О включении в реестр таможенных представителей".&#160;
									</td>
										</tr>
									</xsl:if>
								</tbody>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="decb:DocKind=2">
								<tbody class="graphMain">
									<tr align="center">
										<td class="graphHeader">Решение № <u>
												&#160;&#160;<xsl:value-of select="decb:DecisionRevoke/decb:Number"/>&#160;&#160;
											</u>
										</td>
									</tr>
									<tr align="center">
										<td class="delim"> </td>
									</tr>
									<tr align="center">
										<td class="graphHeader">"Об отмене решения № 
											<u>
												&#160;&#160;<xsl:value-of select="decb:DecisionExclusion/decb:Number"/>&#160;&#160;
											</u>
										</td>
									</tr>
									<tr align="center">
										<td class="delim"> </td>
									</tr>
									<tr align="center">
										<td class="graphHeader">"Об исключении из реестра таможенных представителей"</td>
									</tr>
									<tr align="left" class="normal">
										<td>
											<br/>
											<br/>
											<br/>
											<p style="text-indent: 7%">В связи с устранением основания исключения из реестра таможенных представителей, установленного</p>
										</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="left" class="value">
											<xsl:for-each select="decb:Reason">
												<!--xsl:apply-templates/-->
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="left" class="normal">отменить решение от&#160;
											<u>&#160;&#160;
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="decb:DecisionExclusion/decb:Date"/>
												</xsl:call-template>
											&#160;&#160;</u>
											&#160;№&#160; 
											<u>
												&#160;&#160;<xsl:value-of select="decb:DecisionExclusion/decb:Number"/>&#160;&#160;
											</u>&#160;"Об исключении из реестра таможенных представителей", принятое в отношении
										</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="decb:Organization"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">(наименование организации с указанием организационно-правовой формы)</td>
									</tr>
									<tr>
										<td class="delim"/>
									</tr>
								</tbody>
							</xsl:when>
						</xsl:choose>
					</table>
					<br/>
					<br/>
					<br/>
					<table>
						<tbody class="graphMain">
							<tr>
								<td width="35%">Дата принятия решения</td>
								<td/>
								<td/>
								<td width="30%"/>
								<td/>
								<td/>
								<td align="right" width="35%">
									<xsl:call-template name="russian_date_month">
										<xsl:with-param name="dateIn" select="decb:DecisionExclusion/decb:Date"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:call-template name="PersonSignature">
						<xsl:with-param name="PersonSignature" select="decb:PersonSignature"/>
					</xsl:call-template>
					<br/>
					<br/>
					<br/>
					<xsl:if test="decb:DocKind=1">
						<table width="100%" class="graphLittle">
							<tr>
								<td>_____________________________________</td>
							</tr>
							<tr>
								<td style="text-indent: 7%">
									<p>*В случае если таможенный представитель был включен в реестр таможенных представителей до момента вступления в силу Федерального закона от ____№____ "О таможенном регулировании", указывается дата и номер приказа ФТС России о включении в реестр таможенных представителей.</p>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="decb:Organization">
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
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="normal">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic">по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				&#160;<u>&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;</u>&#160;
				<xsl:text>"</xsl:text>
				&#160;<u>&#160;&#160;
					<xsl:call-template name="month">
						<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
					</xsl:call-template>
				&#160;&#160;</u>&#160;
				<xsl:text>20</xsl:text>
				<u>
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</u>&#160;
				<xsl:text>г.</xsl:text>
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
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="PersonSignature">
		<table class="normal" width="100%">
			<tr align="center" valign="bottom">
				<td width="35%" class="value" style="text-align: center;">
					<xsl:value-of select="decb:PersonSignature/cat_ru:PersonPost"/>
				</td>
				<td width="3%"/>
				<td width="20%" class="value"/>
				<td width="3%"/>
				<td width="39%" class="value">
					<xsl:value-of select="decb:PersonSignature/cat_ru:PersonSurname"/> &#160;<xsl:value-of select="substring(decb:PersonSignature/cat_ru:PersonName, 1, 1)"/>. <xsl:if test="decb:PersonSignature/cat_ru:PersonMiddleName">
						<xsl:value-of select="substring(decb:PersonSignature/cat_ru:PersonMiddleName, 1, 1)"/>. </xsl:if>
				</td>
			</tr>
			<tr align="center">
				<td valign="top" class="graphLittle">должность уполномоченного лица ФТС России</td>
				<td/>
				<td valign="top" class="graphLittle">подпись</td>
				<td/>
				<td valign="top" class="graphLittle">Ф.И.О. уполномоченного лица ФТС России</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
