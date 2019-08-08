<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.13.3" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rqpi="urn:customs.ru:Information:PriorInformation:RevealingTransportPI:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RevealingTransportPIType -->
	<xsl:template match="rqpi:RevealingTransportPI">
		<html>
			<head>
				<style>
									body {
									background: #e3e3e3;
									}

									div
									{
									/*white-space: nowrap;*/
									}

									div.page {
									width: 270mm;
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
					<xsl:if test="rqpi:ServiceInfo">
						<div class="title marg-top">Служебная информация</div>
						<xsl:apply-templates select="rqpi:ServiceInfo"/>
					</xsl:if>
					<xsl:if test="rqpi:CarInformation">
						<div class="title marg-top">Сведения об автомобильном транспорте</div>
						<xsl:apply-templates select="rqpi:CarInformation"/>
					</xsl:if>
					<xsl:if test="rqpi:Consignment">
						<div class="title marg-top">Сведения о товарной партии</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title" bgcolor="silver">
									<td class="graphMain bordered">ИД</td>
									<td class="graphMain bordered">№</td>
									<td class="graphMain bordered">Код страны отпр.</td>
									<td class="graphMain bordered">Код страны назн.</td>
									<td class="graphMain bordered">Стоимость</td>
									<td class="graphMain bordered">Кол-во отг. спец-й</td>
									<td class="graphMain bordered">Кол-во товаров</td>
									<td class="graphMain bordered">Общее кол-во грузовых мест</td>
									<td class="graphMain bordered">Признак конт. перевозки</td>
									<td class="graphMain bordered">Код валюты контракта</td>
									<td class="graphMain bordered">Дата сост. накл.</td>
									<td class="graphMain bordered">Кол-во наим. товаров в партии</td>
									<td class="graphMain bordered">Вес брутто, кг</td>
									<td class="graphMain bordered">Вес нетто, кг</td>
									<td class="graphMain bordered">Пункт назн.</td>
									<td class="graphMain bordered">Код страны</td>
									<td class="graphMain bordered">Код ТО</td>
									<!--td class="graphMain bordered">Получатель</td>
									<td class="graphMain bordered">Отправитель</td-->
									<!--td class="graphMain bordered">Сведения о товаре</td-->
									<!--td class="graphMain bordered">Адрес</td-->
									<!--td class="graphMain bordered">Перевозчик</td>
									<td class="graphMain bordered">Декларант</td>
									<td class="graphMain bordered">Продавец</td-->
								</tr>
								<xsl:for-each select="rqpi:Consignment">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address|rqpi:TTNAddress">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<br/>
		<xsl:if test="cat_ru:Phone">
			тел: 
						<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			факс:  <xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			телекс: <xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			email: 
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
			ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			ИНН:  <xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			КПП: <xsl:value-of select="cat_ru:KPP"/>
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
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:ITN"/>
	</xsl:template>
	<!-- Шаблон для типа rqpi:CarInformationType -->
	<xsl:template match="rqpi:CarInformation">
		<xsl:if test="rqpi:TIRHolder">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер держателя книжки МДП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rqpi:TIRHolder"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<div class="title marg-top">Базовый тип для описания транспортного средства в таможенных документах.</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title" bgcolor="silver">
					<td class="graphMain bordered">Номер основного ТС</td>
					<td class="graphMain bordered">Номер прицепного ТС</td>
					<td class="graphMain bordered">Номер второго прицепного ТС</td>
					<td class="graphMain bordered">Номер ТС(VIN)</td>
					<td class="graphMain bordered">Код вида ТС</td>
					<td class="graphMain bordered">Код страны</td>
				</tr>
				<xsl:for-each select="rqpi:TransportMeans">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationType -->
	<xsl:template match="rqpi:Carrier|rqpi:Consignee|rqpi:Consignor|rqpi:Declarant|rqpi:Seller">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<br/>
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="cat_ru:OKPOID">
			ОКПО: <xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKATOCode">
			ОКАТО: <xsl:value-of select="cat_ru:OKATOCode"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:Address">
			<div class="title marg-top">Адрес </div>
		</xsl:if-->
		<xsl:apply-templates select="cat_ru:Address"/>
		<xsl:apply-templates select="cat_ru:Contact"/>
	</xsl:template>
	<!-- Шаблон для типа rqpi:ConsignmentType -->
	<xsl:template match="rqpi:Consignment">
		<tr class="title" bgcolor="silver" align="center">
			<td class="graphMain bordered">1</td>
			<td class="graphMain bordered">2</td>
			<td class="graphMain bordered">3</td>
			<td class="graphMain bordered">4</td>
			<td class="graphMain bordered">5</td>
			<td class="graphMain bordered">6</td>
			<td class="graphMain bordered">7</td>
			<td class="graphMain bordered">8</td>
			<td class="graphMain bordered">9</td>
			<td class="graphMain bordered">10</td>
			<td class="graphMain bordered">11</td>
			<td class="graphMain bordered">12</td>
			<td class="graphMain bordered">13</td>
			<td class="graphMain bordered">14</td>
			<td class="graphMain bordered">15</td>
			<td class="graphMain bordered">16</td>
			<td class="graphMain bordered">17</td>
		</tr>
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:LotID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:ConsignmentSerNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:DispatchCountryCode2"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:DestinationCountryCode2"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rqpi:TotalInvoicedCost, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:ShipSpecifQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:ShipSpecifGoodsQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:TotalPackageQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="rqpi:ContainerIndicator='true' or rqpi:ContainerIndicator='1'">
						<xsl:text>есть</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>нет</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:ContractCurrencyCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rqpi:TTNDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:CountGoodsNames"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rqpi:GrossWeight, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rqpi:NetWeight, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:PIoutDestination"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:ReloadCountryCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:ReloadCustomsCode"/>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="17">
				<div class="title">Адрес</div>
				<xsl:if test="rqpi:TTNAddress">
					<xsl:apply-templates select="rqpi:TTNAddress"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="17">
				<div class="title">Отправитель</div>
				<xsl:if test="rqpi:Consignor">
					<xsl:apply-templates select="rqpi:Consignor"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="17">
				<div class="title">Получатель</div>
				<xsl:if test="rqpi:Consignee">
					<xsl:apply-templates select="rqpi:Consignee"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="17">
				<div class="title">Перевозчик</div>
				<xsl:if test="rqpi:Carrier">
					<xsl:apply-templates select="rqpi:Carrier"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="17">
				<div class="title">Декларант</div>
				<xsl:if test="rqpi:Declarant">
					<xsl:apply-templates select="rqpi:Declarant"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="17">
				<div class="title">Продавец</div>
				<xsl:if test="rqpi:Seller">
					<xsl:apply-templates select="rqpi:Seller"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="17">
				<div class="title">Сведения о товаре</div>
				<table class="bordered w190">
					<tbody>
						<tr class="title">
							<tr>
								<td class="graphMain bordered" bgcolor="#eeeeee">№ п/п</td>
								<td class="graphMain bordered" bgcolor="#eeeeee">Код</td>
								<td class="graphMain bordered" bgcolor="#eeeeee">Вес брутто, кг</td>
								<td class="graphMain bordered" bgcolor="#eeeeee">Вес нетто, кг</td>
								<td class="graphMain bordered" bgcolor="#eeeeee">Наименование</td>
								<td class="graphMain bordered" bgcolor="#eeeeee">Номер контейнера</td>
								<td class="graphMain bordered" bgcolor="#eeeeee">Описание</td>
								<td class="graphMain bordered" bgcolor="#eeeeee">Кол-во в ДЕИ</td>
								<td class="graphMain bordered" bgcolor="#eeeeee">Документы</td>
								<td class="graphMain bordered" bgcolor="#eeeeee">Упаковка</td>
							</tr>
						</tr>
						<xsl:for-each select="rqpi:Goods">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rqpi:GoodsType -->
	<xsl:template match="rqpi:Goods">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:GoodsNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:TNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rqpi:GrossWeight, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rqpi:NetWeight, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:GoodsDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:ContainerID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rqpi:CargoDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="rqpi:SupplementaryQuantity">
					<xsl:apply-templates select="rqpi:SupplementaryQuantity"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="rqpi:PresentedDocument">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="rqpi:PackingInformation">
					<xsl:apply-templates select="rqpi:PackingInformation"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:PackingInformationType -->
	<xsl:template match="rqpi:PackingInformation">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:PresentedDocumentsType -->
	<xsl:template match="rqpi:PresentedDocument">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа rqpi:ServiceInfoType -->
	<xsl:template match="rqpi:ServiceInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Уникальный идентификационный номер предварительной информации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rqpi:TransportID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации предварительной информации на уровне ФТС России</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="rqpi:CrossDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, в котором планируется прибытие товаров на таможенную территорию Таможенного союза (КТАМ)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rqpi:CustomsArriveID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время планируемого прибытия товара на таможенную территорию Таможенного союза</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date_time">
						<xsl:with-param name="dateIn" select="rqpi:ArriveDateTime"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="rqpi:Exp_DTNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер экспортной декларации на товары</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rqpi:Exp_DTNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="rqpi:SupplementaryQuantity">
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
	<!-- Шаблон для типа catpi_ru:TransportMeansType -->
	<xsl:template match="rqpi:TransportMeans">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TransportIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TrailerIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:SecondTrailerIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:VINID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TransportModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TransportMeansNationalityCode"/>
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
