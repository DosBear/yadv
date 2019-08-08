<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:pfsreq="urn:customs.ru:Information:SQDocuments:FTSProductSKKReq:5.13.3">
	<!-- Шаблон для типа FTSProductSKKReqType -->
	<xsl:template match="pfsreq:FTSProductSKKReq">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: normal;
									}

									div.page {
									width: 290mm;
									max-width: 290mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:3mm;
									}

									.marg-t1
									{
									margin-top:5mm;
									margin-bottom:3mm;
									font-family: Arial;
									font-size: 12pt;
									font-variant: small-caps;
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
									border: 1px solid gray;
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

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
								</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Запрос о факте направления товара на СКК в Роспотребнадзор</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор процесса</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:GUID"/></td>
						</tr>
						<xsl:if test="pfsreq:CustomsDestination">
							<tr>
								<td class="annot graphMain" style="width:50%">Таможенный орган назначения товаров</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pfsreq:CustomsDestination"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="pfsreq:PackagesNumber">
							<tr>
								<td class="annot graphMain" style="width:50%">Количество грузовых мест, их маркировка и виды упаковок товаров</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:PackagesNumber"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="pfsreq:CheckpointName or pfsreq:CheckpointId">
							<tr>
								<td class="annot graphMain" style="width:50%">Название пункта пропуска</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="pfsreq:CheckpointName"/>
									<xsl:if test="pfsreq:CheckpointId"> ИД: <xsl:value-of select="pfsreq:CheckpointId"/></xsl:if>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор инцидента</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:IncidentID"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Таможенный пост</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pfsreq:Customs"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Тип ПП. Возможные значения: море, воздух, ж/д, авто</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:CheckpointType"/></td>
						</tr>
					</table>
					<div class="title marg-t1">Информация о товарах</div>
					<table class="bordered w190">
						<xsl:for-each select="pfsreq:Goods">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
					<xsl:if test="pfsreq:TransportInfo">
						<div class="title marg-t1">Сведения о транспортном средстве</div>
						<xsl:apply-templates select="pfsreq:TransportInfo"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text>код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Документ, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardCode"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия и номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
						<xsl:if test="cat_ru:IdentityCardNumber"> № <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or RUScat_ru:IssuerCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Организация, выдавшая документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование вида документа</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:FullIdentityCardName"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AuthorityId"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:CountryCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<b>Вид адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>: </xsl:text></b>
		</xsl:if> 
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode">
			<br/>
			<xsl:text>(</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="pfsreq:CustomsDestination| pfsreq:Customs">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pfsreq:GoodsType -->
	<xsl:template match="pfsreq:Goods">
		<tr class="title" bgcolor="#e3e3e3">
			<td class="graphMain bordered" style="width:12%; vertical-align:middle; border: 1px solid gray">
				<xsl:text>Код товара по ТН ВЭД ЕАЭС: </xsl:text><br/>
				<xsl:value-of select="pfsreq:GoodsTNVEDCode"/>
			</td>
			<td class="graphMain bordered" style="width:88%; vertical-align:middle; border: 1px solid gray">
				<xsl:for-each select="pfsreq:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
			</td>
		</tr>	
		<tr>
			<td class="annot graphMain" colspan="2">
				<xsl:if test="pfsreq:StateRegistration">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Свидетельство о государственной регистрации</td>
							<td class="value graphMain" style="width:50%">
								<xsl:for-each select="pfsreq:StateRegistration">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">,</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:ConsignmentNumber">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер товарно-транспортной накладной (коносамент)</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:ConsignmentNumber"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:GoodsName">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Торговое название товара</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:GoodsName"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:GoodsWeight">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Вес брутто товаров (кг) либо объем товаров (м3)</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(pfsreq:GoodsWeight, '.', ',')"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="pfsreq:Package/pfsreq:PackingInformation">
						<div class="title marg-top">Количество грузовых мест, их маркировка и виды упаковок товара в соответствии с классификатором видов груза,<br/>упаковки и упаковочных материалов</div>
						<xsl:apply-templates select="pfsreq:Package"/>
						<br/>
					</xsl:when>
					<xsl:otherwise>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Количество грузовых мест</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:Package/pfsreq:PlaceNumber"/></td>
							</tr>
						</table>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="pfsreq:ProductionCountry">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Страна изготовления</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:ProductionCountry"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:OriginCountry">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Страна происхождения</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:OriginCountry"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:Producer">
					<div class="title marg-top">Изготовитель</div>
					<xsl:apply-templates select="pfsreq:Producer"/><br/>
				</xsl:if>
				<xsl:if test="pfsreq:ProductSenderName">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование отправителя товара</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:ProductSenderName"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:ProductSenderCountry">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Страна отправления товара</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:ProductSenderCountry"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:ProductRecipientName">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование получателя товара</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:ProductRecipientName"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:Destination">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Назначение товара</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:Destination"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:Scope">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Область применения товара (справочник, для товаров II раздела)</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:Scope"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:FoodCharacteristic">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Характеристика пищевых продуктов (биологически активные добавки, товары, полученные с использованием генно-модифицированных объектов, пищевые добавки и т.д.)</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:FoodCharacteristic"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:IndustrialCharacteristic">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Характеристика промышленных товаров (состав для химических соединений, косметической продукции и средств гигиены)</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:IndustrialCharacteristic"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="pfsreq:PIId">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор ПИ товара</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:PIId"/></td>
						</tr>
					</table>
				</xsl:if>
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">Признак некорректности ПИ</td>
						<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:PIIncorrectMark"/></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" colspan="2" style="border-bottom: 1px solid gray"><br/></td>
		</tr>	
	</xsl:template>
	<!-- Шаблон для типа pfsreq:PackageType -->
	<xsl:template match="pfsreq:Package">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Количество грузовых мест</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:PlaceNumber"/></td>
			</tr>
		</table>
		<br/>
		<xsl:if test="pfsreq:PackingInformation">
			<table class="bordered w190">
				<tr class="title">
					<td class="graphMain bordered">Код вида упаковки товаров</td>
					<td class="graphMain bordered">Количество упаковок</td>
					<td class="graphMain bordered">Маркировка</td>
					<td class="graphMain bordered">Вид упаковки - описание</td>
				</tr>
				<xsl:for-each select="pfsreq:PackingInformation">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pfsreq:PackingInformationType -->
	<xsl:template match="pfsreq:PackingInformation">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="pfsreq:PackingCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="pfsreq:PackingQuantity"/></td>
			<td class="graphMain bordered"><xsl:value-of select="pfsreq:PackingMark"/></td>
			<td class="graphMain bordered"><xsl:value-of select="pfsreq:PackingDescription"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="pfsreq:Producer">
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
							<xsl:value-of select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:CountryA2Code"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Организационно-правовая форма, в которой зарегистрирован хозяйствующий субъект</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
						<xsl:if test="RUScat_ru:BusinessEntityTypeName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="RUScat_ru:UITN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:PersonId"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<div class="title marg-top">Адрес</div>
			<table class="w190">
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<tr>
						<td class="value graphMain" colspan="2"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<br/>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Контактный реквизит субъекта</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="RUScat_ru:CommunicationDetails"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="pfsreq:StateRegistration">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pfsreq:TransportInfoType -->
	<xsl:template match="pfsreq:TransportInfo">
		<xsl:if test="cat_ru:VIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер шасси (VIN)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:VIN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportKindCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код типа транспортного средства</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:TransportKindCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportMarkCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код марки транспортного средства</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:TransportMarkCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportIdentifier">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:TransportIdentifier"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportMeansNationalityCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны принадлежности транспортного средства</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:TransportMeansNationalityCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ActiveTransportIdentifier">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор активного транспортного средства для прицепов, полуприцепов и др.</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:ActiveTransportIdentifier"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportRegNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер свидетельства о регистрации транспортного средства для РБ</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:TransportRegNumber"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pfsreq:TransportModeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:TransportModeCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
