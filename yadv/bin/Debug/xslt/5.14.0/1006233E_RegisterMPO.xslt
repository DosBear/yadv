<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.14.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:rmpo="urn:customs.ru:Information:CustomsDocuments:RegisterMPO:5.14.0">
	<!-- Шаблон для типа RegisterMPOType -->
	<xsl:template match="rmpo:RegisterMPO">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					font-size: 9pt;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					/*width: 190mm;*/
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 5mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
					{
					margin-top:5mm;
					}

					.marg-t1
					{
					margin-top:10mm;
					font-size: 11pt;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					font-size:9pt;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 9pt;
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
										<b>Реестр экспортируемых международных почтовых отправлений</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="rmpo:Representative">
						<div class="title marg-t1">Декларант / Таможенный представитель</div>
						<xsl:apply-templates select="rmpo:Representative"/>
					</xsl:if>
					
					<div class="title marg-t1">Сведения о партиях товара</div>
					<xsl:for-each select="rmpo:Consignment">
						<xsl:apply-templates select="."/>
						<br/>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address">
		<br/>
		<xsl:for-each select="./*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<br/>
		<xsl:if test="cat_ru:Phone">
			<xsl:text>т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> emal: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="cat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Код вида документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CategoryCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:KATOCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:RNN">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Резерв для ИТН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ITNReserv"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGINN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGOKPO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Идентификационный номер физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">ОГРН/ОГРНИП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">КПП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KPP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:BIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:ITN"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="rmpo:Address">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
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
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rmpo:ConsignmentType -->
	<xsl:template match="rmpo:Consignment">
		<table class="bordered w190">
			<tbody>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="graphMain bordered">Номер партии товаров п/п</td>
					<td class="graphMain bordered">Уникальный идентификатор</td>
					<td class="graphMain bordered">Номер МПО</td>
					<td class="graphMain bordered">Код валюты счета</td>
					<td class="graphMain bordered">Вес товаров, брутто, кг</td>
					<td class="graphMain bordered">Стоимость товаров в валюте счета (сделки)</td>
					<td class="graphMain bordered">Стоимость товаров в евро</td>
					<td class="graphMain bordered">Стоимость товаров в рублях</td>
					<td class="graphMain bordered">Идентификатор резервирования</td>
					<!--td class="graphMain bordered">Отправитель</td>
					<td class="graphMain bordered">Получатель</td>
					<td class="graphMain bordered">Сведения о товарах</td>
					<td class="graphMain bordered">Сведения об общих накладных</td-->
				</tr>
				<tr>
					<td class="graphMain bordered" bgcolor="#e3e3e3" align="center">
						<b><xsl:value-of select="rmpo:ListNumeric"/></b>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="rmpo:WayBillID"/>
					</td>
					<td class="graphMain bordered">
						<xsl:if test="rmpo:MPO">
							<xsl:apply-templates select="rmpo:MPO"/>
						</xsl:if>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="rmpo:Currency"/>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="translate(rmpo:GrossWeight, '.', ',')"/>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="translate(rmpo:GoodsCost, '.', ',')"/>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="translate(rmpo:GoodsCostEuro, '.', ',')"/>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="translate(rmpo:GoodsCostRuble, '.', ',')"/>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="rmpo:ReservationID"/>
					</td>
					<!--td class="graphMain bordered">
						<xsl:apply-templates select="rmpo:Consignor"/>
					</td>
					<td class="graphMain bordered">
						<xsl:apply-templates select="rmpo:Consignee"/>
					</td>
					<td class="graphMain bordered">
						
					</td>
					<td class="graphMain bordered">
						<xsl:if test="rmpo:WayBill">
							<xsl:for-each select="rmpo:WayBill">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</xsl:if>
					</td-->
				</tr>
				<tr>
				<td colspan="9">
					<table class="w190">
						<tr>
							<td class="graphMain" style="width:30%"><b>Отправитель</b></td>
							<td class="value graphMain" style="width:70%">
								<xsl:apply-templates select="rmpo:Consignor"/>
							</td>
						</tr>
						<tr>
							<td class="graphMain" style="width:30%"><b>Получатель</b></td>
							<td class="value graphMain" style="width:70%">
								<xsl:apply-templates select="rmpo:Consignee"/>
							</td>
						</tr>
						<tr>
							<td class="graphMain" style="width:30%"><b>Сведения об общих накладных</b></td>
							<td class="value graphMain" style="width:70%">
								<xsl:if test="rmpo:WayBill">
									<xsl:for-each select="rmpo:WayBill">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
									</xsl:for-each>
								</xsl:if>
							</td>
						</tr>
					</table>
					<div class="marg-top"><b>Сведения о товарах</b></div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Порядковый номер товара</td>
								<td class="graphMain bordered">Наименование товара</td>
								<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС </td>
								<td class="graphMain bordered">Стоимость товара в валюте счета (сделки)</td>
								<td class="graphMain bordered">Вес товара, брутто, кг</td>
								<td class="graphMain bordered">Стоимость товара в евро</td>
								<td class="graphMain bordered">Стоимость товара в рублях</td>
								<td class="graphMain bordered">Количество товара в единице измерения</td>
								<td class="graphMain bordered">Сведения о представляемых документах</td>
							</tr>
							<xsl:for-each select="rmpo:Goods">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	</xsl:template>
	<!-- Шаблон для типа rmpo:ConsignorType -->
	<xsl:template match="rmpo:Consignor|rmpo:Consignee">
		<xsl:apply-templates select="rmpo:Person"/>
		<xsl:apply-templates select="rmpo:JuridicalPerson"/>
		<br/>
		<xsl:if test="rmpo:RFOrganizationFeatures">
			<xsl:apply-templates select="rmpo:RFOrganizationFeatures"/>
			<br/>		
		</xsl:if>
		<xsl:if test="rmpo:Address">
			<xsl:apply-templates select="rmpo:Address"/>
			<br/>		
		</xsl:if>
		<xsl:apply-templates select="rmpo:Contact"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="rmpo:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>,  </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rmpo:GoodsType -->
	<xsl:template match="rmpo:Goods">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rmpo:GoodsNumeric"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rmpo:GoodsDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rmpo:GoodsTNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rmpo:GoodsCost, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rmpo:GrossWeight, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rmpo:GoodsCostEuro, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rmpo:GoodsCostRuble, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="rmpo:GoodsQuantity">
					<xsl:for-each select="rmpo:GoodsQuantity">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="rmpo:PresentedDocuments">
					<xsl:for-each select="rmpo:PresentedDocuments">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="rmpo:GoodsQuantity">
		<xsl:for-each select="*">
			<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">(</xsl:if>
			<xsl:value-of select="."/>
			<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">)</xsl:if>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа rmpo:JuridicalPersonType -->
	<xsl:template match="rmpo:JuridicalPerson">
		<xsl:value-of select="rmpo:OrganizationName"/>
		<xsl:if test="not(rmpo:OrganizationName) and rmpo:ShortName">
			<xsl:value-of select="rmpo:ShortName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rmpo:MPO_RegistrationType -->
	<xsl:template match="rmpo:MPO">
		<xsl:value-of select="rmpo:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="MPO_date">
			<xsl:with-param name="dateIn" select="rmpo:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="rmpo:MPO_Number"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="rmpo:Person">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rmpo:PresentedDocumentsType -->
	<xsl:template match="rmpo:PresentedDocuments">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:text> </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
		</xsl:call-template>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUOrganizationType -->
	<xsl:template match="rmpo:Representative">
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<div class="title marg-top">Сведения об организации</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="cat_ru:Address">
			<div class="title marg-top">Адрес организации</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Address"/>
		<xsl:if test="cat_ru:IdentityCard">
			<div class="title marg-top">Документ, удостоверяющий личность</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:IdentityCard"/>
		<xsl:if test="cat_ru:Contact">
			<div class="title marg-top">Контактная информация</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Contact"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="rmpo:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			ИНН: <xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			КПП: <xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rmpo:WayBillType -->
	<xsl:template match="rmpo:WayBill">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:text> </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="rmpo:WayBillKind=2"><xsl:text>общая авианакладная</xsl:text></xsl:when>
			<xsl:when test="rmpo:WayBillKind=3"><xsl:text>транспортная накладная</xsl:text></xsl:when>
			<xsl:when test="rmpo:WayBillKind=4"><xsl:text>депеша</xsl:text></xsl:when>
			<xsl:otherwise><xsl:value-of select="rmpo:WayBillKind"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="MPO_date">
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
