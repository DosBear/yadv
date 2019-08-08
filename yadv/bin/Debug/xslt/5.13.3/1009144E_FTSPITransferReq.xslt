<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:pitreq="urn:customs.ru:Information:SQDocuments:FTSPITransferReq:5.13.3">
	<!-- Шаблон для типа FTSPITransferReqType -->
	<xsl:template match="pitreq:FTSPITransferReq">
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
									margin-top:8mm;
									margin-bottom:3mm;
									font-family: Arial;
									font-size: 12pt;
									font-variant: small-caps:
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
										<b>Запрос передачи ПИ от ФТС России в Роспотребнадзор</b>
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
							<td class="annot graphMain" style="width:40%">Идентификатор процесса</td>
							<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:GUID"/></td>
						</tr>
						<xsl:if test="pitreq:Customs">
							<tr>
								<td class="annot graphMain" style="width:40%">Таможенный орган назначения товаров</td>
								<td class="value graphMain" style="width:60%"><xsl:apply-templates select="pitreq:Customs"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="pitreq:Checkpoint">
							<tr>
								<td class="annot graphMain" style="width:40%">Пункт пропуска</td>
								<td class="value graphMain" style="width:60%"><xsl:apply-templates select="pitreq:Checkpoint"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:40%">Тип ПП. Возможные значения: море, воздух, ж/д, авто</td>
							<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:CheckpointType"/></td>
						</tr>
						<xsl:if test="pitreq:CustomsPost">
							<tr>
								<td class="annot graphMain" style="width:40%">Таможенный пост</td>
								<td class="value graphMain" style="width:60%"><xsl:apply-templates select="pitreq:CustomsPost"/></td>
							</tr>
						</xsl:if>
					</table>
					<div class="title marg-t1">Информация о товарах</div>
					<table class="bordered w190">
							<!--tr class="title">
								<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Описание товара</td>
								<td class="graphMain bordered">Свидетельство о государственной регистрации</td>
								<td class="graphMain bordered">Номер товарно-транспортной накладной (коносамент)</td>
								<td class="graphMain bordered">Торговое название товара</td>
								<td class="graphMain bordered">Вес брутто товара (в килограммах) либо объем товара (в кубических метрах)</td>
								<td class="graphMain bordered">Количество грузовых мест, их маркировка и  виды упаковок товара</td>
								<td class="graphMain bordered">Изготовитель</td>
								<td class="graphMain bordered">Страна изготовления</td>
								<td class="graphMain bordered">Страна происхождения (при наличии)</td>
								<td class="graphMain bordered">Наименование отправителя товара</td>
								<td class="graphMain bordered">Страна отправления товара</td>
								<td class="graphMain bordered">Наименование получателя товара</td>
								<td class="graphMain bordered">Назначение товара</td>
								<td class="graphMain bordered">Область применения товара(справочник, для товаров II раздела)</td>
								<td class="graphMain bordered">Характеристика пищевых продуктов (биологически активные добавки, товары, полученные с использованием генно-модифицированных объектов, пищевые добавки и т.д.)</td>
								<td class="graphMain bordered">Характеристика промышленных товаров (состав для химических соединений, косметической продукции и средств гигиены)</td>
								<td class="graphMain bordered">Идентификатор ПИ товара</td>
								<td class="graphMain bordered">Тип предоставляемой информации. Возможные значения: 1 - ПИ от участника ВЭД; 2 - данные в формате ПИ от сотрудника ФТС</td>
							</tr-->
						<xsl:for-each select="pitreq:Goods">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
					<xsl:if test="pitreq:TransportInfo">
						<div class="title marg-t1">Сведения о транспортном средстве</div>
						<xsl:apply-templates select="pitreq:TransportInfo"/>
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
					<td class="annot graphMain" style="width:40%">Документ, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:60%">
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
					<td class="annot graphMain" style="width:40%">Серия и номер документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
						<xsl:if test="cat_ru:IdentityCardNumber"> № <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата выдачи документа</td>
					<td class="value graphMain" style="width:60%">
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
					<td class="annot graphMain" style="width:40%">Организация, выдавшая документ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование вида документа</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:FullIdentityCardName"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:AuthorityId"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:CountryCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Документ, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:60%">
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
					<td class="annot graphMain" style="width:40%">Серия и номер документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
						<xsl:if test="cat_ru:IdentityCardNumber"> № <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата выдачи документа</td>
					<td class="value graphMain" style="width:60%">
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
					<td class="annot graphMain" style="width:40%">Организация, выдавшая документ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование вида документа</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:FullIdentityCardName"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:AuthorityId"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:CountryCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<b><xsl:text> Вид адреса: </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/></b>
			<xsl:text>  </xsl:text>
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
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="pitreq:Checkpoint| pitreq:Customs| pitreq:CustomsPost">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CustomsCountryCode">
			<xsl:text> код государства - члена ЕАЭС: </xsl:text>
			<xsl:value-of select="cat_ru:CustomsCountryCode"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pitreq:GoodsType -->
	<xsl:template match="pitreq:Goods">
		<tr class="title" bgcolor="#e3e3e3">
			<td class="graphMain bordered" style="width: 12%; vertical-align: middle">
				<xsl:text>Код товара по ТН ВЭД ЕАЭС: </xsl:text><br/>
				<xsl:value-of select="pitreq:GoodsTNVEDCode"/>
			</td>
			<td class="graphMain bordered" style="width: 68%; vertical-align: middle"><xsl:value-of select="pitreq:GoodsDescription"/></td>
			<td class="graphMain bordered" style="width: 20%; vertical-align: middle">
				<xsl:text>Идентификатор ПИ товара: </xsl:text><br/>
				<xsl:value-of select="pitreq:PIId"/>
				<xsl:choose>
					<xsl:when test="pitreq:InfoType=1"> (ПИ от участника ВЭД)</xsl:when>
					<xsl:when test="pitreq:InfoType=2"> (данные в формате ПИ от сотрудника ФТС)</xsl:when>
				</xsl:choose>
			</td>
		</tr>
		<tr>	
			<td class="annot graphMain" colspan="3">
				<table class="w190">
					<xsl:if test="pitreq:StateRegistration">
						<tr>
							<td class="annot graphMain" style="width:40%">Свидетельство о государственной регистрации</td>
							<td class="value graphMain" style="width:60%">
								<xsl:for-each select="pitreq:StateRegistration">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="pitreq:ConsignmentNumber">
						<tr>
							<td class="annot graphMain" style="width:40%">Номер товарно-транспортной накладной (коносамент)</td>
							<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:ConsignmentNumber"/></td>
						</tr>
					</xsl:if>
					<tr>
						<td class="annot graphMain" style="width:40%">Торговое название товара</td>
						<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:GoodsName"/></td>
					</tr>
					<tr>
						<td class="annot graphMain" style="width:40%">Вес брутто товара (в килограммах) либо объем товара (в кубических метрах)</td>
						<td class="value graphMain" style="width:60%"><xsl:value-of select="translate(pitreq:GoodsWeight, '.', ',')"/></td>
					</tr>
				</table>	
				<xsl:choose>
					<xsl:when test="pitreq:Package/pitreq:PackingInformation"><xsl:apply-templates select="pitreq:Package"/></xsl:when>
					<xsl:otherwise>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:40%">Количество грузовых мест</td>
								<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:Package/pitreq:PlaceNumber"/></td>
							</tr>
						</table>
					</xsl:otherwise>
				</xsl:choose>
				<div class="title marg-top">Изготовитель</div>
				<xsl:apply-templates select="pitreq:Producer"/>
				<br/>
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:40%">Страна изготовления</td>
						<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:ProductionCountry"/></td>
					</tr>
					<xsl:if test="pitreq:OriginCountry">
						<tr>
							<td class="annot graphMain" style="width:40%">Страна происхождения</td>
							<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:OriginCountry"/></td>
						</tr>
					</xsl:if>
					<tr>
						<td class="annot graphMain" style="width:40%">Наименование отправителя товара</td>
						<td class="value graphMain" style="width:60%">
							<xsl:value-of select="pitreq:ProductSenderName"/>
							<xsl:text> (</xsl:text>
							<xsl:value-of select="pitreq:ProductSenderCountry"/>
							<xsl:text>)</xsl:text>						
						</td>
					</tr>
					<tr>
						<td class="annot graphMain" style="width:40%">Наименование получателя товара</td>
						<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:ProductRecipientName"/></td>
					</tr>
					<tr>
						<td class="annot graphMain" style="width:40%">Назначение товара</td>
						<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:Destination"/></td>
					</tr>
					<tr>
						<td class="annot graphMain" style="width:40%">Область применения товара (справочник, для товаров II раздела)</td>
						<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:Scope"/></td>
					</tr>
					<xsl:if test="pitreq:FoodCharacteristic">
						<tr>
							<td class="annot graphMain" style="width:40%">Характеристика пищевых продуктов</td>
							<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:FoodCharacteristic"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="pitreq:IndustrialCharacteristic">
						<tr>
							<td class="annot graphMain" style="width:40%">Характеристика промышленных товаров</td>
							<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:IndustrialCharacteristic"/></td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="border-bottom: 1px solid black"><br/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pitreq:PackageType -->
	<xsl:template match="pitreq:Package">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Количество грузовых мест</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="pitreq:PlaceNumber"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pitreq:PackingInformation">
			<div class="title marg-top">Код вида упаковки товаров в соответствии с  классификатором видов груза, упаковки и упаковочных материалов</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Код вида упаковки</td>
						<td class="graphMain bordered">Количество упаковок</td>
						<td class="graphMain bordered">Маркировка</td>
						<td class="graphMain bordered">Вид упаковки - описание</td>
					</tr>
					<xsl:for-each select="pitreq:PackingInformation">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pitreq:PackingInformationType -->
	<xsl:template match="pitreq:PackingInformation">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="pitreq:PackingCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="pitreq:PackingQuantity"/></td>
			<td class="graphMain bordered"><xsl:value-of select="pitreq:PackingMark"/></td>
			<td class="graphMain bordered"><xsl:value-of select="pitreq:PackingDescription"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="pitreq:Producer">
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:60%">
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
					<td class="annot graphMain" style="width:40%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения об организации</td>
					<td class="value graphMain" style="width:60%">
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
					<td class="annot graphMain" style="width:40%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:CountryA2Code"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Организационно-правовая форма, в которой зарегистрирован хозяйствующий субъект</td>
					<td class="value graphMain" style="width:60%">
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
					<td class="annot graphMain" style="width:40%">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:UITN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Уникальный идентификатор физического лица</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:PersonId"/></td>
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
						<td class="annot graphMain" style="width:10%"/>
						<td class="value graphMain" style="width:90%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<br/>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Контактный реквизит субъекта</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:CommunicationDetails"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="pitreq:StateRegistration">
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
	<!-- Шаблон для типа pitreq:TransportInfoType -->
	<xsl:template match="pitreq:TransportInfo">
		<xsl:if test="cat_ru:VIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Номер шасси (VIN)</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="cat_ru:VIN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportKindCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Код типа транспортного средства</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="cat_ru:TransportKindCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportMarkCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Код марки транспортного средства</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="cat_ru:TransportMarkCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportIdentifier">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Идентификатор</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="cat_ru:TransportIdentifier"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportMeansNationalityCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Буквенный код страны принадлежности транспортного средства по классификатору стран мира</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="cat_ru:TransportMeansNationalityCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ActiveTransportIdentifier">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Идентификатор активного транспортного средства для прицепов, полуприцепов и др.</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="cat_ru:ActiveTransportIdentifier"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportRegNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Номер свидетельства о регистрации транспортного средства для РБ</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="cat_ru:TransportRegNumber"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pitreq:TransportModeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров.</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="pitreq:TransportModeCode"/></td>
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
