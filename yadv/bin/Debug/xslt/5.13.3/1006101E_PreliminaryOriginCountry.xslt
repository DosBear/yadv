<?xml version="1.0" encoding="UTF-8"?>
<!--Форма предварительного решения о происхождении товара, ввозимого на таможенную территорию Евразийского экономического союза. Утв. Решением Коллегии ЕЭК от 16.01.2018 № 7 -->
<xsl:stylesheet exclude-result-prefixes="cat_ru porc" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:porc="urn:customs.ru:Information:CustomsDocuments:PreliminaryOriginCountry:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template name="Date">
		<xsl:value-of select="substring (., 9, 2)"/> 
					<xsl:variable name="month" select="substring(., 6, 2)"/>
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
					<xsl:value-of select="substring(., 1, 4)"/> г.
	</xsl:template>
	<xsl:template name="Date_2">
		<xsl:value-of select="substring (., 9, 2)"/>.
					<xsl:value-of select="substring(., 6, 2)"/>.
					<xsl:value-of select="substring(., 1, 4)"/>
	</xsl:template>
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="porc:PreliminaryOriginCountry">
		<html>
			<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			<style>
					@media print 
					{
						div.page 
						{
						border: none; 
						margin: 0; 
						}
					}

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
					padding: 1px;
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
			<div class="page">
				<table cellpadding="5">
					<col width="50%" valign="top"/>
					<col width="35%" valign="top"/>
					<col width="15%" valign="top"/>
					<tbody align="left">
						<tr>
							<td/>
							<td/>
							<td/>
						</tr>
						<tr>
							<td align="center" class="graphHeader bordered" colspan="3">ПРЕДВАРИТЕЛЬНОЕ РЕШЕНИЕ<br/>
								о происхождении товара, ввозимого на таможенную территорию Евразийского экономического союза</td>
						</tr>
						<tr>
							<td class="bordered" colspan="3">
								<span class="bold">1. Регистрационный номер предварительного решения</span>
								<span class="normal">
									<br/><br/>
									<xsl:apply-templates select="porc:RegistrationNumber"/>
								</span>
							</td>
						</tr>
						<tr>
							<td class="bordered">
								<span class="bold">2. Наименование таможенного органа, принявшего предварительное решение</span>
								<span class="normal">
									<br/><br/>
									<xsl:value-of select="porc:PORC_Customs/porc:FullOfficeName"/>
									<span class="normal">&#032;(</span>
									<xsl:value-of select="porc:PORC_Customs/cat_ru:Code"/>
									<span class="normal">)</span>
								</span>
							</td>
							<td class="bordered" colspan="2">
								<span class="bold">3. Дата окончания срока действия предварительного решения</span>
								<span class="normal">
									<br/><br/>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="porc:DateEnd"/>
									</xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td class="bordered">
								<span class="bold">4. Заявитель</span>
								<span class="normal">
									<br/><br/>
									<xsl:apply-templates select="porc:Applicant"/>
								</span>
							</td>
							<td class="bordered" colspan="2">
								<span class="bold">5. Сведения о сделке</span>
								<span class="normal">
									<br/><br/>
									<span class="normal">1.&#032;</span>
									<xsl:apply-templates select="porc:TransactionDetails/porc:TransactionDetailsDocument"/>
									<br/>
									<span class="normal">2.&#032;</span>
									<xsl:choose>
										<xsl:when test="porc:TransactionDetails/porc:CommercialDocument">
											<xsl:for-each select="porc:TransactionDetails/porc:CommercialDocument">
												<xsl:apply-templates select="."/>
												<xsl:if test="position() != last()">,&#032;</xsl:if>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<span class="normal">&#032;&#8212;</span>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
						</tr>
						<tr>
							<td class="bordered">
								<span class="bold">6. Правила определения происхождения товаров</span>
								<span class="normal">
									<br/><br/>
									<xsl:apply-templates select="porc:Document"/>
								</span>
							</td>
							<td class="bordered">
								<span class="bold">7. Сертификат о происхождении товара</span>
								<span class="normal">
									<br/><br/>
									<xsl:apply-templates select="porc:Certificate"/>
									<xsl:if test="porc:Certificate/porc:OrganizationFullName">
										<br/>
										<span class="normal"><xsl:value-of select="porc:Certificate/porc:OrganizationFullName"/></span>
									</xsl:if>
								</span>
							</td>
							<td class="bordered">
								<span class="bold">8. Отметка о верификации</span>
								<span class="normal">
									<br/><br/>
									<xsl:choose>
										<xsl:when test="porc:Verification='true' or porc:Verification='1' or porc:Verification='t' or porc:Verification='True'">Проведена</xsl:when>
										<xsl:otherwise>Не проводилась</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
						</tr>
						<tr>
							<td class="bordered">
								<span class="bold">9. Сведения о производителе товара</span>
								<br/><br/>
								<span class="normal">1.&#032;</span>
								<xsl:choose>
									<xsl:when test="porc:GoodsManufacturer/porc:Manufacturer or porc:GoodsManufacturer/porc:ManufacturerAddress">
										<span class="normal"><xsl:value-of select="porc:GoodsManufacturer/porc:Manufacturer"/></span>
										<xsl:if test="porc:GoodsManufacturer/porc:Manufacturer and porc:GoodsManufacturer/porc:ManufacturerAddress">
											<span class="normal">,&#032;</span>
										</xsl:if>
										<xsl:for-each select="porc:GoodsManufacturer/porc:ManufacturerAddress">
											<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
										</xsl:for-each>	
									</xsl:when>
									<xsl:otherwise>
										<span class="normal">&#032;&#8212;</span>
									</xsl:otherwise>
								</xsl:choose>
								<br/>
								<span class="normal">2.&#032;</span>
								<xsl:choose>
									<xsl:when test="porc:GoodsManufacturer/porc:PlaceManufactur">
										<xsl:for-each select="porc:GoodsManufacturer/porc:PlaceManufactur">
											<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
										</xsl:for-each>	
									</xsl:when>
									<xsl:otherwise>
										<span class="normal">&#032;&#8212;</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="bordered" colspan="2">
								<span class="bold">10. Описание товара</span>
								<br/><br/>
								<span class="normal">1.&#032;</span>
								<span class="normal"><xsl:apply-templates select="porc:Goods/porc:GoodsDescription"/></span>
								<br/>
								<span class="normal">2.&#032;</span>
								<xsl:choose>
									<xsl:when test="string-length(string(porc:Goods/porc:GoodsCharacteristics)) &gt; 0">
										<xsl:for-each select="porc:Goods/porc:GoodsCharacteristics/child::*">
											<xsl:call-template name="child"/>
											<xsl:if test="position()!=last()">,&#032;</xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<span class="normal">&#032;&#8212;</span>
									</xsl:otherwise>
								</xsl:choose>
								<br/>
								<span class="normal">3.&#032;</span>
								<xsl:choose>
									<xsl:when test="string-length(string(porc:Goods/porc:GoodsCode)) &gt; 0">
										<span class="normal"><xsl:value-of select="porc:Goods/porc:GoodsCode"/></span>
									</xsl:when>
									<xsl:otherwise>
										<span class="normal">&#032;&#8212;</span>
									</xsl:otherwise>
								</xsl:choose>
								<br/>
								<span class="normal">4.&#032;</span>
								<xsl:choose>
									<xsl:when test="string-length(string(porc:Goods/porc:GoodsValue)) &gt; 0">
										<span class="normal"><xsl:value-of select="translate(translate(format-number(porc:Goods/porc:GoodsValue/RUScat_ru:Amount, '#,###.00'), ',', ' '), '.', ',')"/></span>
										<span class="normal">&#032;(</span>
										<span class="normal"><xsl:value-of select="porc:Goods/porc:GoodsValue/RUScat_ru:CurrencyCode"/></span>
										<span class="normal">)</span>
									</xsl:when>
									<xsl:otherwise>
										<span class="normal">&#032;&#8212;</span>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="porc:Goods/porc:GoodsOtherCharacteristics">
									<br/>
									<span class="normal">5.&#032;</span>
									<span class="normal"><xsl:apply-templates select="porc:Goods/porc:GoodsOtherCharacteristics"/></span>
								</xsl:if>	
							</td>
						</tr>
						<tr>
							<td class="bordered">
								<span class="bold">11. Критерий определения происхождения товара</span>
								<span class="normal">
									<br/><br/>
									<xsl:apply-templates select="porc:Criterion"/>
								</span>
							</td>
							<td class="bordered" colspan="2">
								<span class="bold">12. Происхождение товара</span>
								<span class="normal">
									<br/><br/>
									<xsl:apply-templates select="porc:OriginCountryName"/>
								</span>
							</td>
						</tr>
						<tr>
							<td class="bordered" colspan="3">
								<span class="bold">13. Для служебных отметок</span>
								<span class="normal">
									<br/><br/>
									<xsl:apply-templates select="porc:Mark"/>
								</span>
							</td>
						</tr>
						<tr>
							<td class="bordered" colspan="3">
								<span class="bold">14. Уполномоченное лицо таможенного органа</span>
								<span class="normal">
									<br/><br/>
								</span>	
								<xsl:apply-templates select="porc:PersonSignature"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</html>
	</xsl:template>

	<!-- Регистраницонный номер-->
	<xsl:template match="porc:RegistrationNumber">
		<span class="normal"><xsl:value-of select="porc:CountryCode"/></span>
		<span class="normal">/</span>
		<span class="normal"><xsl:value-of select="porc:CustomsCode"/></span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="porc:Date"/>
			</xsl:call-template>
		</span>
		<span class="normal">/</span>
		<span class="normal"><xsl:value-of select="porc:SerialNumber"/></span>
		<span class="normal">/</span>
		<span class="normal"><xsl:value-of select="porc:IndexElement"/></span>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="porc:PersonSignature">
		<xsl:if test="cat_ru:PersonPost">
			<span class="normal"><xsl:value-of select="cat_ru:PersonPost"/></span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<span class="normal"><xsl:value-of select="cat_ru:PersonSurname"/></span>
		<span class="normal">&#160;</span>
		<span class="normal"><xsl:value-of select="cat_ru:PersonName"/></span>
		<xsl:if test="cat_ru:PersonMiddleName">
			<span class="normal">&#160;</span>
			<span class="normal"><xsl:value-of select="cat_ru:PersonMiddleName"/></span>
		</xsl:if>
		<xsl:if test="cat_ru:IssueDate">
			<br/>
			<span class="italic">дата подписания</span>
			<span class="normal">:&#032;</span>
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
				</xsl:call-template>
			</span>	
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа porc:GoodsInformationType/child-->
	<xsl:template name="child">    
		<xsl:variable name="el_name">
			<xsl:value-of select="name()"/>
		</xsl:variable>
		<span class="italic">
			<xsl:choose>
				<xsl:when test="$el_name='porc:FunctionalPurpose'">функциональное назначение</xsl:when>
				<xsl:when test="$el_name='porc:GoodsMark'">марка (модель)</xsl:when>
				<xsl:when test="$el_name='porc:GoodsMarking'">артикул</xsl:when>
				<xsl:when test="$el_name='porc:PackagingDescription'">описание упаковки</xsl:when>
				<xsl:when test="$el_name='porc:GoodsStandard'">стандарт</xsl:when>
				<xsl:when test="$el_name='porc:GoodsSort'">сорт</xsl:when>
				<xsl:when test="$el_name='porc:WoodSortiment'">сортимент</xsl:when>
				<xsl:when test="$el_name='porc:WoodKind'">порода древесины</xsl:when>
				<xsl:when test="$el_name='porc:Dimensions'">размеры</xsl:when>
			</xsl:choose>
		</span>	
		<span class="normal">:&#032;</span>
		<span class="normal"><xsl:apply-templates select="@*|node()"/></span>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:OrganizationType -->
	<xsl:template match="porc:Applicant">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName" />
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">&#032;(</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName" />
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">
			<span class="normal">;&#032;</span>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" />
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures" />
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures" />
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures" />
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures" />
		</xsl:if>
	
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">,&#032;</span>
			<span class="italic">Код страны</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="RUScat_ru:CountryA2Code" />
		</xsl:if>
	
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode" />
		</xsl:if>
	
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">,&#032;</span>
			<span class="italic">ОПФ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName" />
		</xsl:if>
		
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN" />
		</xsl:if>
	
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<span class="normal"><br/></span>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">
					<span class="italic">Адрес</span>
					<span class="normal">:&#032;</span>
				</xsl:if>
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
	
		<!--xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if-->
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:ContactType строка -->
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">:&#032;</span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">,&#032;</span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">:&#032;</span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">,&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">:&#032;</span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">,&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">:&#032;</span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">,&#032;</span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails | porc:ManufacturerAddress | porc:PlaceManufactur">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<span class="italic">&#032;(код вида адреса</span>
			<span class="normal">:&#032;</span>
			<span class="normal"><xsl:value-of select="RUScat_ru:AddressKindCode" /></span>
			<span class="normal">)&#032;</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<span class="italic">почтовый индекс</span>
			<span class="normal">:&#032;</span>
			<span class="normal"><xsl:value-of select="RUScat_ru:PostalCode" /></span>
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"><xsl:value-of select="RUScat_ru:CountryCode" /></span>
			<xsl:if test="RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<span class="normal"><xsl:value-of select="RUScat_ru:CounryName" /></span>
			<xsl:if test="RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<span class="normal"><xsl:value-of select="RUScat_ru:Region" /></span>
			<xsl:if test="RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<span class="normal"><xsl:value-of select="RUScat_ru:District" /></span>
			<xsl:if test="RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<span class="normal"><xsl:value-of select="RUScat_ru:Town" /></span>
			<xsl:if test="RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<span class="normal"><xsl:value-of select="RUScat_ru:City" /></span>
			<xsl:if test="RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<span class="normal"><xsl:value-of select="RUScat_ru:StreetHouse" /></span>
			<xsl:if test="RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<span class="normal"><xsl:value-of select="RUScat_ru:House" /></span>
			<xsl:if test="RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<span class="normal"><xsl:value-of select="RUScat_ru:Room" /></span>
			<xsl:if test="RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<span class="normal"><xsl:value-of select="RUScat_ru:AddressText" /></span> 
			<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<!--xsl:if test="RUScat_ru:OKTMO">
			<span class="italic">ОКТМО</span>
			<span class="normal">:&#032;</span> 
			<span class="normal"><xsl:value-of select="RUScat_ru:OKTMO" /></span> 
			<xsl:if test="RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<span class="italic">OKАTO</span>
			<span class="normal">:&#032;</span> 
			<span class="normal"><xsl:value-of select="RUScat_ru:OKATO" /></span> 
			<xsl:if test="RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<span class="italic">КЛАДР</span>
			<span class="normal">:&#032;</span> 
			<span class="normal"><xsl:value-of select="RUScat_ru:KLADR" /></span> 
			<xsl:if test="RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<span class="italic">Глобальный идентификатор адресного объекта по ФИАС</span>
			<span class="normal">:&#032;</span> 
			<span class="normal"><xsl:value-of select="RUScat_ru:AOGUID" /></span> 
			<xsl:if test="RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<span class="italic">Код единицы административно - территориального деления</span>
			<span class="normal">:&#032;</span> 
			<span class="normal"><xsl:value-of select="RUScat_ru:TerritoryCode" /></span> 
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<span class="normal">,&#032;</span>
			</xsl:if>	
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<span class="italic">а/я</span>
			<span class="normal">:&#032;</span> 
			<span class="normal"><xsl:value-of select="RUScat_ru:PostOfficeBoxId" /></span> 
		</xsl:if-->
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"><xsl:value-of select="RUScat_ru:UITNCode"/></span> 
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">&#032;(</span> 
			<span class="normal"><xsl:value-of select="RUScat_ru:CountryCode"/></span>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
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
				<span class="normal">:&#032;</span>
			</span>	
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN" />
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP" />
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:OGRN" />
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">,&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:BIN" />
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">,&#032;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:IIN" />
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:CategoryCode" />
			<span class="normal">&#032;/&#032;</span>
			<xsl:value-of select="cat_ru:KATOCode" />
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:RNN" />
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:ITNReserv" />
			</xsl:if>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RBOrganizationFeatures -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">,&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNP" />
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber" />
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">,&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNN" />
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber" />
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate" />
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGINN" />
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGOKPO" />
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="porc:TransactionDetailsDocument | porc:CommercialDocument | porc:Document | porc:Certificate">
		<xsl:if test="cat_ru:PrDocumentName">
			<span class="normal"><xsl:value-of select="cat_ru:PrDocumentName"/></span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<span class="normal">№&#032;</span>
			<span class="normal"><xsl:value-of select="cat_ru:PrDocumentNumber"/></span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<span class="normal">&#032;от&#032;</span>
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</span>
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
</xsl:stylesheet>
