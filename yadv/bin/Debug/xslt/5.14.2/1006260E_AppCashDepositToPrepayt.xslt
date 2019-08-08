<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"  xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:acdp="urn:customs.ru:Information:CustomsDocuments:AppCashDepositToPrepayt:5.14.0">
<!-- проект
Приказ ФТС России "Об утверждении формы заявления о зачете денежного залога в счет авансовых платежей, оформленного в виде электронного документа, и Порядка заполнения и представления в таможенный орган заявления о зачете денежного залога в счет авансовых платежей, оформленного в виде электронного документа"
Приложение 1 Заявление о зачете денежного залога в счёт авансовых платежей, оформленное в виде электронного документа
-->

<!-- Шаблон для типа AppCashDepositToPrepaytType -->
<xsl:template match="acdp:AppCashDepositToPrepayt">
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
			max-width: 210mm;
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
			max-width: 100%;
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
			font-size: 12pt;
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
			font-size: 10pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 10pt;
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
				<tbody align="center" class="graphHeader">
					<tr>
						<td>
							<xsl:choose>
								<xsl:when test="acdp:DocSign='0'">Заявление о зачете денежного залога в счёт авансовых платежей, оформленное в виде электронного документа</xsl:when>
								<xsl:when test="acdp:DocSign='1'">Заявление о прекращении использования генерального обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, внесенного в форме денежного залога, в виде электронного документа
								</xsl:when>
								<xsl:when test="acdp:DocSign='2'">Заявление о предоставлении отчета об использовании генерального обеспечения</xsl:when>
							</xsl:choose>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br/>
			<table cellpadding="5">
				<col width="36%" valign="top"/>
				<col width="32%" valign="top"/>
				<col width="32%" valign="top"/>
				<tbody align="left">
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<xsl:for-each select="acdp:AppInfo">
					<tr>
						<td class="bordered" style="word-break: break-all;">
							<span class="bold">1. Лицо, внесшее денежный залог</span>
							<span class="normal">
								<br/>
								<br/>
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
							</span>
						</td>
						<td class="bordered">
							<span class="bold">2. ИНН</span>
							<span class="normal">
								<br/>
								<br/>
								<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN" />
							</span>
						</td>
						<td class="bordered">
							<span class="bold">3. ОГРН / ОГРНИП</span>
							<span class="normal">
								<br/>
								<br/>
								<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN" />
							</span>
						</td>
					</tr>
					<tr>
						<td class="bordered">
							<span class="bold">4. Наименование документа,<br/>удостоверяющего личность</span>
							<span class="normal">
								<br/>
								<br/>
								<xsl:if test="RUScat_ru:IdentityCard/cat_ru:IdentityCardCode">
									<xsl:value-of select="RUScat_ru:IdentityCard/cat_ru:IdentityCardCode" /> 
								</xsl:if>
								<xsl:if test="RUScat_ru:IdentityCard/cat_ru:IdentityCardName">
									<xsl:value-of select="RUScat_ru:IdentityCard/cat_ru:IdentityCardName" /> 
								</xsl:if>
							</span>
						</td>
						<td class="bordered">
							<span class="bold">5. Серия документа</span>
							<span class="normal">
								<br/>
								<br/>
								<xsl:value-of select="RUScat_ru:IdentityCard/cat_ru:IdentityCardSeries" />
							</span>
						</td>
						<td class="bordered">
							<span class="bold">6. Номер документа</span>
							<span class="normal">
								<br/>
								<br/>
								<xsl:value-of select="RUScat_ru:IdentityCard/cat_ru:IdentityCardNumber" />
							</span>
						</td>
					</tr>
					<tr>
						<td class="bordered">
							<span class="bold">7. Страна регистрации</span>
							<span class="normal">
								<br/>
								<br/>
								<xsl:if test="RUScat_ru:SubjectAddressDetails[1]/RUScat_ru:CountryCode != 'RU'">
									<xsl:value-of select="RUScat_ru:SubjectAddressDetails[1]/RUScat_ru:CountryCode" /> 
								</xsl:if>
							</span>
						</td>
						<td colspan="2" class="bordered">
							<span class="bold">8. Место нахождения и адрес юридического лица / адрес места жительства (проживания) физического лица</span>
							<span class="normal">
								<br/>
								<br/>
								<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">
										<br/>
									</xsl:if>
								</xsl:for-each>
							</span>
						</td>
					</tr>
					</xsl:for-each>
					<tr>
						<td colspan="3" class="bordered">
							<span class="bold">9. Таможенная расписка</span>
							<span class="normal">
								<br/>
								<br/>
								<xsl:if test="acdp:RegistrationNumber">
									<xsl:apply-templates select="acdp:RegistrationNumber"/>
								</xsl:if>
								<br/>
								<br/>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:RUAddressType -->
<xsl:template match="RUScat_ru:SubjectAddressDetails">
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

<!-- Шаблон для типа acdp:RegistrationNumberType -->
<xsl:template match="acdp:RegistrationNumber">
	<span class="normal">
		<xsl:value-of select="acdp:CustomsCode"/>/<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="acdp:RegistrationDate"/>
		</xsl:call-template>/ЭТР-<xsl:value-of select="acdp:Number"/>
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

</xsl:stylesheet>