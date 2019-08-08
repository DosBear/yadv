<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_ru="urn:customs.ru:RUCommonLeafTypes:5.4.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:rtpp="urn:customs.ru:Information:CustomsDocuments:RevealingTransportPP:5.12.0">
	<!-- Шаблон для типа RevealingTransportPPType -->
	<xsl:template match="rtpp:RevealingTransportPP">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
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
									padding: 10mm 10mm 10mm 20mm;
									background: #ffffff;
									border: solid 1pt #000000;
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
										<b>Сообщение о прибытии/убытии транспортного средства</b>
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
					<xsl:if test="rtpp:ServiceInfo">
						<div class="title marg-top">Служебная информация</div>
						<xsl:apply-templates select="rtpp:ServiceInfo"/>
					</xsl:if>
					<xsl:if test="rtpp:Transport">
						<div class="title marg-top">Сведения о транспортном средстве</div>
						<xsl:apply-templates select="rtpp:Transport"/>
					</xsl:if>
					<xsl:if test="rtpp:Consignment">
						<div class="title marg-top">Сведения о товарной партии</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title" bgcolor="silver">
									<td class="graphMain bordered">ИД</td>
									<td class="graphMain bordered">№ ТТН</td>
									<td class="graphMain bordered">Дата ТТН</td>
									<td class="graphMain bordered">Тамож. № накл.</td>
									<td class="graphMain bordered">Вес брутто, кг</td>
									<td class="graphMain bordered">Кол-во в ДЕИ</td>
									<td class="graphMain bordered">Общая стоимость</td>
									<td class="graphMain bordered">Код валюты</td>
									<td class="graphMain bordered">Код страны отпр.</td>
									<td class="graphMain bordered">Код страны назню</td>
									<td class="graphMain bordered">Кол-во гр.мест</td>
									<td class="graphMain bordered">№ партии</td>
									<td class="graphMain bordered">Вес нетто, кг</td>
									<td class="graphMain bordered">Рег ИД ПП</td>
									<!--td class="graphMain bordered">Отправитель</td>
									<td class="graphMain bordered">Получатель</td>
									<td class="graphMain bordered">Сведения о товаре</td>
									<td class="graphMain bordered">Перевозчик</td-->
								</tr>
								<xsl:for-each select="rtpp:Consignment">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rtpp:RegistrationNumber">
						<div class="title marg-top">Регистрационный номер уведомления о прибытии / убытии.</div>
					</xsl:if>
					<xsl:apply-templates select="rtpp:RegistrationNumber"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address">
		<xsl:text> </xsl:text>
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
		тел. 
		<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
		 факс <xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
		 телекс <xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
		 email 
		<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CategoryCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:KATOCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:RNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ITNReserv"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGINN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
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
					<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
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
					<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
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
		 ОГРН <xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
		 ИНН <xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
		 КПП <xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:BIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITN"/>
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:ITN"/>
	</xsl:template>
	<!-- Шаблон для типа rtpp:CarInformationType -->
	<xsl:template match="rtpp:CarInformation">
		<xsl:if test="cat_ru:TransportModeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TransportModeCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportNationalityCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны принадлежности (регистрации) транспортных средств по классификатору стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="cat_ru:TransportNationalityCode=99">
								<xsl:text>разные</xsl:text>
							</xsl:when>
							<xsl:when test="cat_ru:TransportNationalityCode=00">
								<xsl:text>неизвестна</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="cat_ru:TransportNationalityCode"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<div class="title marg-top">Базовый тип для описания транспортного средства в таможенных документах.</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title" bgcolor="silver">
					<td class="graphMain bordered">№ шасси (VIN)</td>
					<td class="graphMain bordered">Код типа ТС</td>
					<td class="graphMain bordered">Код марки ТС</td>
					<td class="graphMain bordered">ИД</td>
					<td class="graphMain bordered">Код страны</td>
					<td class="graphMain bordered">ИД активного ТС</td>
					<td class="graphMain bordered">№ свидетельства</td>
				</tr>
				<xsl:for-each select="rtpp:TransportMeansBase">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationType -->
	<xsl:template match="rtpp:Carrier|rtpp:Consignee|rtpp:Consignor">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="cat_ru:OKPOID">
			ОКПО <xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKATOCode">
			ОКАТО <xsl:value-of select="cat_ru:OKATOCode"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Address"/>
		<xsl:apply-templates select="cat_ru:Contact"/>
	</xsl:template>
	<!-- Шаблон для типа rtpp:ConsignmentType -->
	<xsl:template match="rtpp:Consignment">
		<tr bgcolor="#e3e3e3">
			<td class="graphMain bordered" rowspan="5">
				<xsl:value-of select="rtpp:LotID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:TTNNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rtpp:TTNDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:CustomsNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rtpp:GrossWeight, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rtpp:MeasureUnitQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rtpp:InvoicedAmount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:InvoicedCurrencyCode3"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:DispatchCountryCode2"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:DestinationCountryCode2"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:TotalPlaces"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:ConsignmentSerNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rtpp:NetWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:PI_RegID"/>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="13">
				<div class="title">Отправитель</div>
				<xsl:if test="rtpp:Consignor">
					<xsl:apply-templates select="rtpp:Consignor"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="13">
				<div class="title">Получатель</div>
				<xsl:if test="rtpp:Consignee">
					<xsl:apply-templates select="rtpp:Consignee"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="13">
				<div class="title">Перевозчик</div>
				<xsl:if test="rtpp:Carrier">
					<xsl:apply-templates select="rtpp:Carrier"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="13">
				<div class="title">Сведения о товаре</div>
				<table class="bordered w190">
					<tbody>
						<tr class="title" bgcolor="#eeeeee">
							<td class="graphMain bordered">№ п/п</td>
							<td class="graphMain bordered">Код</td>
							<td class="graphMain bordered">Вес брутто, кг</td>
							<td class="graphMain bordered">Фактурная ст-ть</td>
							<td class="graphMain bordered">Код валюты</td>
							<td class="graphMain bordered">Номер конт.</td>
							<td class="graphMain bordered">Вес нетто, кг</td>
							<td class="graphMain bordered">Описание товара</td>
							<td class="graphMain bordered">Код страны происх.</td>
							<td class="graphMain bordered">Тип решения</td>
							<td class="graphMain bordered">Кол-во в ДЕИ</td>
							<td class="graphMain bordered">Упаковка</td>
							<td class="graphMain bordered">№ ДТ</td>
							<td class="graphMain bordered">Св-во о рег.</td>
						</tr>
						<xsl:for-each select="rtpp:Goods">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
				<br/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rtpp:GoodsType -->
	<xsl:template match="rtpp:Goods">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:GoodsNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:TNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rtpp:GrossWeight, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rtpp:InvoicedAmount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:ContractCurrencyCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:ContainerIdentificator"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rtpp:NetWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:GoodsDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:OriginCountryCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="rtpp:InspectionResType=0">
						<xsl:text>Решение не определено</xsl:text>
					</xsl:when>
					<xsl:when test="rtpp:InspectionResType=1">
						<xsl:text>Ввоз разрешен (разрешение)</xsl:text>
					</xsl:when>
					<xsl:when test="rtpp:InspectionResType=2">
						<xsl:text>Вывоз разрешен (разрешение)</xsl:text>
					</xsl:when>
					<xsl:when test="rtpp:InspectionResType=3">
						<xsl:text>Транзит разрешен (разрешение)</xsl:text>
					</xsl:when>
					<xsl:when test="rtpp:InspectionResType=4">
						<xsl:text>Ввоз запрещен (запрет)</xsl:text>
					</xsl:when>
					<xsl:when test="rtpp:InspectionResType=5">
						<xsl:text>Вывоз запрещен (запрет)</xsl:text>
					</xsl:when>
					<xsl:when test="rtpp:InspectionResType=6">
						<xsl:text>Транзит запрещен (запрет)</xsl:text>
					</xsl:when>
					<xsl:when test="rtpp:InspectionResType=7">
						<xsl:text>Отправить на ветеринарный досмотр (запрет)</xsl:text>
					</xsl:when>
					<xsl:when test="rtpp:InspectionResType=8">
						<xsl:text>Досмотр невозможен по техническим причинам (разрешение)</xsl:text>
					</xsl:when>
					<xsl:when test="rtpp:InspectionResType=9">
						<xsl:text>Груз задержан (запрет)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="rtpp:InspectionResType"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="rtpp:SupplementaryQuantity">
					<xsl:apply-templates select="rtpp:SupplementaryQuantity"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="rtpp:PackingInformation">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()"><br/></xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="rtpp:RegNumberDT">
					<xsl:apply-templates select="rtpp:RegNumberDT"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="rtpp:StateRegistrationCertif">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()"><br/></xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rtpp:MDPInfoType -->
	<xsl:template match="rtpp:MDPInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:MDPSeriesNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:MDPNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtpp:MDPHolder"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:PackingInformationType -->
	<xsl:template match="rtpp:PackingInformation">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="rtpp:RegistrationNumber|rtpp:RegNumberDT">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="GTDdate">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="rtpp:ServiceInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор сообщения о  прибытии/убытии</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rtpp:TransportID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата подачи документов (для СВР ПП)/Дата формирования запроса на выявление рисков (для АИСТ-М)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date_time">
						<xsl:with-param name="dateIn" select="rtpp:CrossDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа (КТАМ)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rtpp:CustomsID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Направление перемещения: ИМ (прибытие)/ ЭК (убытие)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rtpp:CustomsProcedure"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа rtpp:StateRegistrationCertifType -->
	<xsl:template match="rtpp:StateRegistrationCertif">
		<xsl:if test="rtpp:CertificateNumber">
		№	<xsl:value-of select="rtpp:CertificateNumber"/>
		</xsl:if>
		<xsl:if test="rtpp:CertStatus">
		 статус <xsl:value-of select="translate(rtpp:CertStatus, '.', ',')"/>
		</xsl:if>		
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="rtpp:SupplementaryQuantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rtpp:TrainInformationType -->
	<xsl:template match="rtpp:TrainInformation">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rtpp:TransportModeCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер вагона</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="rtpp:WagonNumber">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа rtpp:TransportType -->
	<xsl:template match="rtpp:Transport">
		<xsl:if test="rtpp:Weight">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вес ТС с товарами по документам в кг</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(rtpp:Weight, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rtpp:BatchQuantity">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Количество партий</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rtpp:BatchQuantity"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rtpp:FactWeight">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вес ТС с товаром фактический (результат взвешивания) в кг</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(rtpp:FactWeight, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rtpp:PI_RegID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный идентификатор предварительной информации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rtpp:PI_RegID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rtpp:StatusCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Статус весогабаритного контроля</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="rtpp:StatusCode=1">
								<xsl:text>Ошибка в параметрах запроса</xsl:text>
							</xsl:when>
							<xsl:when test="rtpp:StatusCode=2">
								<xsl:text>Положительный результат проверки</xsl:text>
							</xsl:when>
							<xsl:when test="rtpp:StatusCode=3">
								<xsl:text>Не найдено действующее разрешение по гос</xsl:text>
							</xsl:when>
							<xsl:when test="rtpp:StatusCode=4">
								<xsl:text>Указанное разрешение не зарегистрировано</xsl:text>
							</xsl:when>
							<xsl:when test="rtpp:StatusCode=5">
								<xsl:text>Параметры АТС, дата или место проезда не соответствуют указанным в разрешении</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="rtpp:StatusCode"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rtpp:PermitDocumentStatus">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Статус разрешения на поездку</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="rtpp:PermitDocumentStatus=1">Действует</xsl:when>
							<xsl:when test="rtpp:PermitDocumentStatus=2">Истек срок действия</xsl:when>
							<xsl:when test="rtpp:PermitDocumentStatus=3">Приостановлено</xsl:when>
							<xsl:when test="rtpp:PermitDocumentStatus=4">Аннулировано</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="translate(rtpp:PermitDocumentStatus, '.', ',')"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rtpp:PermitStatus">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Статус разрешения ОГ/карточки допуска</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="rtpp:PermitStatus=1">
								<xsl:text>Действующий</xsl:text>
							</xsl:when>
							<xsl:when test="rtpp:PermitStatus=2">
								<xsl:text>Приостановлен</xsl:text>
							</xsl:when>
							<xsl:when test="rtpp:PermitStatus=3">
								<xsl:text>Аннулирован</xsl:text>
							</xsl:when>
							<xsl:when test="rtpp:PermitStatus=4">
								<xsl:text>Истек срок действия</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="rtpp:PermitStatus"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rtpp:CarInformation">
			<div class="title marg-top">Сведения об автомобильном транспорте</div>
		</xsl:if>
		<xsl:apply-templates select="rtpp:CarInformation"/>
		<xsl:if test="rtpp:TrainInformation">
			<div class="title marg-top">Сведения о железнодорожном транспорте</div>
		</xsl:if>
		<xsl:apply-templates select="rtpp:TrainInformation"/>
		<xsl:if test="rtpp:Carrier"/>
		<xsl:if test="rtpp:Carrier">
			<div class="title marg-top">Сведения о перевозчике товаров</div>
		</xsl:if>
		<xsl:apply-templates select="rtpp:Carrier"/>
		<xsl:if test="rtpp:MDPInfo">
			<div class="title marg-top">Информация о книжке МДП</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title" bgcolor="silver">
						<td class="graphMain bordered">Серия МДП</td>
						<td class="graphMain bordered">Номер книжки МДП</td>
						<td class="graphMain bordered">Номер держателя книжки МДП</td>
					</tr>
					<xsl:for-each select="rtpp:MDPInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:TransportMeansBaseType -->
	<xsl:template match="rtpp:TransportMeansBase">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:VIN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransportKindCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransportMarkCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransportIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransportRegNumber"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="$dateIn"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateIn, 12, 8)"/>
	</xsl:template>
	<xsl:template name="GTDdate">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
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
