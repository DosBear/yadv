<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"  xmlns:osc="urn:customs.ru:Information:CommercialFinanceDocuments:OrderSellCash:5.13.2" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0">
<!-- 
Функциональные требования ГУФТДиТР 2018 № 00415 ФТ на ЛК и Задолженность по формам (пошлины) (приложение).tif Приложение 6
Приложение 6 Поручение таможенного органа о продаже денежных средств плательщика таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, хранящихся в иностранной валюте
-->

<!-- Шаблон для типа OrderSellCashType -->
<xsl:template match="osc:OrderSellCash">
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
			}

		</style>
	</head>
	<body>
		<div class="page">
			<table>
				<tbody align="left" class="graphMain">
					<!--tr  align="center" class="graphHeader">
						<td>РЕШЕНИЕ</td>
					</tr>
					<tr class="delim_3"><td> </td></tr-->
					<tr align="center">
						<td>
							Поручение таможенного органа о продаже денежных средств плательщика таможенных пошлин,<br/>налогов, специальных, антидемпинговых, компенсационных пошлин,<br/>хранящихся в иностранной валюте
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br/>
			<table>
				<tbody align="center" class="graphMain">
					<tr>
						<td width="3%" align="right">от&#160; </td>
						<td width="45%" align="left">
							<xsl:call-template name="Date">
								<xsl:with-param name="date" select="osc:OSLDocDate"/>
							</xsl:call-template>
						</td>
						<td width="12%" align="right">№&#160; </td>
						<td width="40%" class="border_bottom">
							<xsl:call-template name="DocNumber">
								<xsl:with-param name="DocumentReference" select="osc:OSLRegNumber"/>
								<xsl:with-param name="DocType" select="'ПВ'"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br/>
			<table>
				<tbody align="center" class="graphMain">
					<tr>
						<td class="border_bottom">
							<span class="normal"><xsl:value-of select="osc:OSLCustoms/osc:FullOfficeName"/></span>
							<xsl:if test="osc:OSLCustoms/osc:FullOfficeName">
								<span class="normal"> (</span>
							</xsl:if>
							<span class="normal"><xsl:value-of select="osc:OSLCustoms/cat_ru:Code"/></span>
							<xsl:if test="osc:OSLCustoms/osc:FullOfficeName">
								<span class="normal">)</span>
							</xsl:if>
						</td>
					</tr>
					<tr class="graphLittle">
						<td align="center">(наименование таможенного органа)</td>
					</tr>
					<tr class="delim"><td> </td></tr>
					<tr>
						<td align="left">
							<span class="normal">
								поручает банку
							</span>
						</td>
					</tr>
					<tr>
						<td class="border_bottom">
							<span class="normal"><xsl:value-of select="osc:BankAndAccountInfo/cat_ru:BankName"/></span>
							<xsl:if test="osc:BankAndAccountInfo/cat_ru:BICID">
								<span class="normal">, БИК </span>
							</xsl:if>
							<span class="normal"><xsl:value-of select="osc:BankAndAccountInfo/cat_ru:BICID"/></span>
						</td>
					</tr>
					<tr class="graphLittle">
						<td align="center">
							<span>
								(полное наименование, БИК банка)
							</span>	
						</td>
					</tr>
					<tr><td><br/></td></tr>
					<tr>
						<td align="left">
							<span class="normal">
								осуществить продажу иностранной валюты, находящейся на счете
							</span>
						</td>
					</tr>
					<tr class="delim"><td> </td></tr>
					<tr>
						<td class="border_bottom">
							<span class="normal">
								номер(а) счет(а/ов):
								<xsl:for-each select="osc:BankAndAccountInfo/cat_ru:BankAccount">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
								; тип счет(а/ов): <xsl:apply-templates select="osc:BankAndAccountInfo/cat_ru:BankAccountDescription"/>
							</span>
						</td>
					</tr>
					<tr class="graphLittle">
						<td align="center">
							(указывается вид и номер счета плательщика)
						</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
					<tr>
						<td align="left">
							<span class="normal">
								открытом
							</span>
						</td>
					</tr>
					<tr>
						<td class="border_bottom">
							<span class="normal">
								<xsl:apply-templates select="osc:PayerInfo"/>
							</span>
						</td>
					</tr>
					<tr class="graphLittle">
						<td align="center">
							((полное наименование организации или Ф.И.О. индивидуального предпринимателя, физического лица), идентификационный номер налогоплательщика/код причины постановки на учет (если имеется))
						</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
					<tr>
						<td align="left">
							<span class="normal">
								в соответствии с инкассовым поручением (поручением на перевод электронных денежных средств) от
								<u>&#160;&#160;
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="osc:CollectionLetterReference/cat_ru:PrDocumentDate"/>
									</xsl:call-template><xsl:if test="osc:CollectionLetterReference/cat_ru:PrDocumentDate">&#160;г.</xsl:if>&#160;&#160;
								</u>&#160;№&#160;
								<u>&#160;&#160;<xsl:value-of select="osc:CollectionLetterReference/cat_ru:PrDocumentNumber"/>&#160;&#160;
								</u>, а также зачислить эквивалентную сумму в рублях на счет, указанный в таком поручении.
							</span>
						</td>
					</tr>
					<tr><td><br/><br/></td></tr>
					<tr>
						<td align="left"><br/>
							<span class="normal">
								Начальник (заместитель начальника)
							</span>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<table>
				<tr class="graphMain" align="center">
					<td width="41%" class="border_bottom"> 
						<span class="normal">
							<xsl:if test="osc:OSLCustoms/osc:FullOfficeName">
								<xsl:value-of select="osc:OSLCustoms/osc:FullOfficeName"/>
								(
							</xsl:if>
							код ТО <xsl:value-of select="osc:OSLCustoms/cat_ru:Code"/>
							<xsl:if test="osc:OSLCustoms/osc:FullOfficeName">
								)
							</xsl:if>
						</span>	
					</td>
					<td width="3%"> </td>
					<td width="15%" class="border_bottom"> </td>
					<td width="3%"> </td>
					<td width="38%" class="border_bottom">
						<span class="normal">
							<xsl:value-of select="osc:Person/cat_ru:PersonName"/>&#160;
							<xsl:if test="osc:Person/cat_ru:LNP">
								(ЛНП&#160;
								<xsl:value-of select="osc:Person/cat_ru:LNP"/>)
							</xsl:if>		
							<br/>
						</span>	
					</td>
				</tr>
				<tr class="graphLittle" align="center">
					<td width="41%">(наименование таможенного органа)</td>
					<td width="3%"> </td>
					<td width="15%">(подпись)</td>
					<td width="3%"> </td>
					<td width="38%">(Ф.И.О.)</td>
				</tr>
			</table>
			<br/>
			<br/>
			<table>
				<tr class="graphMain" align="center">
					<td width="15%" align="left"> 
						<span class="normal">
							Исполнитель
						</span>	
					</td>
					<td width="50%" class="border_bottom">
						<span class="normal">
							<xsl:apply-templates select="osc:Performer"/>
							<br/>
						</span>	
					</td>
					<td width="35%"> </td>
				</tr>
				<tr class="graphLittle" align="center">
					<td width="15%"> </td>
					<td width="50%">(Ф.И.О.)</td>
					<td width="35%"> </td>
				</tr>
			</table>
		</div>
	</body>
</html>
</xsl:template>

<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
<xsl:template match="osc:PayerInfo">
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
	<!--xsl:if test="cat_ru:OGRN">
		<span class="normal">, </span>
		<span class="italic">ОГРН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:OGRN" />
	</xsl:if-->
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

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="osc:Performer">
	<span class="normal">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>,&#160;
		</xsl:if>
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			&#160;<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</span>
</xsl:template>

<!-- Шаблон для типа osc:DocRegNumberType -->
<xsl:template name="DocNumber">
	<xsl:param name="DocumentReference"/>
	<xsl:param name="DocType"/>
	<span class="normal">
		<xsl:value-of select="$DocumentReference/osc:CustomsCode"/>/<xsl:value-of select="$DocumentReference/osc:RegistrationDate"/>/<xsl:value-of select="$DocType"/>/<xsl:value-of select="$DocumentReference/osc:DocNumber"/>
	</span>
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
					<td width="2%" align="right">20</td>
					<td width="9%" class="border_bottom" align="left"><xsl:value-of select="substring($date,3,2)"/></td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>	
	</xsl:template>
	
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}" style="align: {$data_align};"> <!--да, выравнивание дважды, нужно для кроссплатформенности-->
					<td class="border_bottom">
						<xsl:value-of select="$data"/><br/>
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