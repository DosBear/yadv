<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.14.3" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.14.3" xmlns:cshi="urn:customs.ru:Information:TransportDocuments:Sea:CommissionShipment:5.14.3">
	<!-- Шаблон для типа CommissionShipmentType -->
	<xsl:template match="cshi:CommissionShipment">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									background: #ffffff;
									/*border: solid 1pt #000000;*/
									font-family: Arial;
									font-size: 8pt;
									}

									div.pagebook 
									{
									width: 190mm;
									padding: 10mm;
									}

									div.pagelandscape
									{
									width: 260mm;
									padding: 5mm;
									}

									.marg-top
									{
									margin-top:5mm;
									font-size: 10pt;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									font-family: Arial;
									font-size: 8pt;
									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {}

									.value
									{
									border-bottom: solid 1px black;
									}

									.value_b
									{
									border: 1px solid gray;
									font-size: 10pt;
									}

									div.title, tr.title td 
									{
									font-weight:bold;  
									}
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px gray;
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
				<div class="pagebook">
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
					<table class="borderer w190">
						<tr class="title">
							<td class="graphMain bordered" colspan="2" style="width: 35.3%">
								SHIPPER / ON BEHALF OF SHIPPER<br/>Отправитель / Представитель отправителя
							</td>
							<td align="center" class="graphMain" colspan="8" rowspan="4" style="vertical-align: middle; border-top: 1px solid gray; border-right: 1px solid gray; width: 65.62%">
								<b>
								<font size="3">
									<xsl:text>ПОРУЧЕНИЕ № ____________</xsl:text>
									<br/>
								</font>	
								<font size="2">
									<xsl:text>НА ОТГРУЗКУ ЭКСПОРТНЫХ ТОВАРОВ</xsl:text>
									<br/><br/>
									<xsl:text>Экспортное разрешение № </xsl:text>
									<xsl:value-of select="cshi:DocumentNumber"/>
									<xsl:text> от </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cshi:DocumentDate"/>
									</xsl:call-template>
								</font>
								</b>
							</td>
						</tr>
						<tr>
							<td class="graphMain value_b" colspan="2" style="width: 35.3%">
								<xsl:apply-templates select="cshi:Consignor"/>
							</td>
						</tr>
						<tr class="title">
							<td class="graphMain bordered" colspan="2" style="width: 35.3%">
								CONSIGNEE / ON BEHALF OF CONSIGNEE<br/>Получатель / Представитель получателя
							</td>
						</tr>
						<tr>
							<td class="graphMain value_b" colspan="2" style="width: 35.3%">
								<xsl:apply-templates select="cshi:Consignee"/>
							</td>
						</tr>
						<tr class="title">
							<td class="graphMain bordered" colspan="2" style="width: 35.3%">
								NOTIFY PARTY<br/>Уведомить
							</td>
							<td colspan="2" style="width: 11.6%"/>
							<td class="graphMain bordered" colspan="6" style="vertical-align: middle; width: 53.1%">
								Расписка администратора судна
							</td>
						</tr>
						<tr>
							<td class="graphMain value_b" colspan="2" style="width: 35.3%">
								<xsl:apply-templates select="cshi:WhomNotify"/>
							</td>
							<td colspan="2" style="width: 11.6%"/>
							<td class="graphMain value_b" colspan="6" style="width: 53.1%">
								<xsl:text>Груз принял: </xsl:text>
								<xsl:apply-templates select="cshi:AdministrationInfo"/>
							</td>
						</tr>
						<tr class="title">
							<td class="graphMain bordered" colspan="3" style="width: 41.1%">SHIPOWNER<br/>Судовладелец</td>
							<td class="graphMain bordered" colspan="7" style="width: 58.9%">FLAG<br/>Флаг</td>
						</tr>
						<tr>
							<td class="graphMain value_b" colspan="3" style="width: 41.1%">
								<xsl:apply-templates select="cshi:Carrier"/>
							</td>
							<td class="graphMain value_b" colspan="7" style="width: 58.9%">
								<xsl:value-of select="cshi:Vessel/catTrans_ru:NationalityVessel"/>
							</td>
						</tr>
						<tr class="title">
							<td class="graphMain bordered" style="width: 29.5%">
								VESSEL<br/>Название судна
							</td>
							<td class="graphMain bordered" colspan="2" style="width: 11.6%">
								VOYAGE<br/>Рейс судна
							</td>
							<td class="graphMain bordered" colspan="4" style="width: 29.32%">
								PORT OF LOADING<br/>Порт погрузки
							</td>
							<td class="graphMain bordered" colspan="3" style="width: 29.58%">
								NUMBER OF OR. B/L<br/>Количество оригиналов к/с
							</td>
						</tr>
						<tr>
							<td class="graphMain value_b" style="width: 29.5%">
								<xsl:value-of select="cshi:Vessel/catTrans_ru:Name"/>
							</td>
							<td class="graphMain value_b" colspan="2" style="width: 11.6%"><br/></td>
							<td class="graphMain value_b" colspan="4" style="width: 29.32%">
								<xsl:apply-templates select="cshi:LoadingPort"/>
							</td>
							<td class="graphMain value_b" colspan="3" style="width: 29.58%">
								<xsl:value-of select="count(cshi:AccompanyingDocument)"/><br/>
								<xsl:apply-templates select="cshi:AccompanyingDocument"/>
							</td>
						</tr>
						<tr class="title">
							<td class="graphMain bordered" colspan="3" style="width: 41.1%">
								PORT OF DISCHARGE<br/>Порт выгрузки
							</td>
							<td class="graphMain bordered" colspan="7" style="width: 58.9%">
								FINAL DESTINATION<br/>Пункт назначения груза
							</td>
						</tr>
						<tr>
							<td class="graphMain value_b" colspan="3" style="width: 41.1%">
								<xsl:apply-templates select="cshi:Carrier"/>
							</td>
							<td class="graphMain value_b" colspan="7" style="width: 58.9%">
								<xsl:value-of select="cshi:DeliveryTerms/cat_ru:DeliveryPlace"/>
								<xsl:if test="cat_ru:TransferPlace">
									<xsl:text> / </xsl:text>
									<xsl:value-of select="cshi:DeliveryTerms/cat_ru:TransferPlace"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" colspan="10" style="width: 100%"><br/></td>
						</tr>
						<tr class="title" align="center">
							<td class="graphMain bordered" style="width: 29.5%; vertical-align: middle">
								QUANTITY AND TYPE OF CONTAINERS<br/>Количество и тип контейнеров
							</td>
							<td class="graphMain bordered" colspan="4" style="width: 29.16%; vertical-align: middle">
								KIND OF PACKAGES AND DESCRIPTION OF GOODS<br/>Описание груза и род упаковки
							</td>
							<td class="graphMain bordered" colspan="3"  style="width: 29.34%; vertical-align: middle">
								WEIGHT, KG<br/>Масса, кг
							</td>
							<td class="graphMain bordered" colspan="2" style="width: 12%; vertical-align: middle">
								MEASUREMENT, m3<br/>Объем, m3
							</td>
						</tr>
						<tr align="center">
							<td class="graphMain value_b" rowspan="4" style="width: 29.5%; vertical-align: middle">
								<xsl:value-of select="cshi:TotalPlacesQuantity"/>
							</td>
							<td class="graphMain value_b" colspan="4" rowspan="4" style="width: 29.16%; vertical-align: middle">
								<xsl:for-each select="cshi:GoodsDescription">
									<xsl:value-of select="."/>
								</xsl:for-each>
							</td>
							<td class="graphMain bordered" colspan="2" style="width: 17.58%; vertical-align: middle">
								Netto weight, KG<br/>Вес нетто груза, кг
							</td>
							<td class="graphMain value_b" style="width: 11.76%; vertical-align: middle">
								<xsl:value-of select="translate(cshi:TotalNetWeightQuantity, '.', ',')"/>
							</td>
							<td class="graphMain value_b" colspan="2" rowspan="3" style="width: 12%; vertical-align: middle">
								<xsl:value-of select="translate(cshi:TotalVolumeQuantity, '.', ',')"/>
							</td>
						</tr>
						<tr align="center">
							<td class="graphMain bordered" colspan="2" style="width: 17.58%; vertical-align: middle">
								Gross weight, KG<br/>Вес брутто груза, кг
							</td>
							<td class="graphMain value_b" style="width: 11.76%; vertical-align: middle">
								<xsl:value-of select="translate(cshi:TotalGrossWeightQuantity, '.', ',')"/>
							</td>
						</tr>
						<tr align="center">
							<td class="graphMain bordered" colspan="2" style="width: 17.58%; vertical-align: middle">
								Container weight, KG<br/>Вес контейнера, кг
							</td>
							<td class="graphMain value_b" style="width: 11.76%; vertical-align: middle"><br/></td>
						</tr>
						<tr align="center">
							<td class="graphMain bordered" colspan="2" style="width: 17.58%; vertical-align: middle">
								Total unit weight, KG<br/>Общий вес, кг
							</td>
							<td class="graphMain value_b" style="width: 11.76%; vertical-align: middle"><br/></td>
							<td class="graphMain value_b" style="width: 6%; vertical-align: middle"><br/></td>
							<td class="graphMain value_b" style="width: 6%; vertical-align: middle"><br/></td>
						</tr>
						<tr>
							<td class="graphMain value_b" colspan="10" style="width: 100%">
								<xsl:if test="cshi:CSHBorderCustoms">
									<xsl:text>Погрузка разрешена </xsl:text>
									<xsl:apply-templates select="cshi:CSHBorderCustoms"/>
									<br/><br/>
								</xsl:if>
								<xsl:if test="cshi:TotalGoodsNumber">
									<xsl:text>Общее количество грузовых мест товара: </xsl:text>
									<xsl:value-of select="cshi:TotalPlacesQuantity"/>
									<xsl:text> </xsl:text>
								</xsl:if>
								<xsl:if test="cshi:TotalPlacesQuantity">
									<xsl:text>всего наименований товаров: </xsl:text>
									<xsl:value-of select="cshi:TotalGoodsNumber"/>
									<xsl:text> </xsl:text>
								</xsl:if>
								<xsl:if test="cshi:TotalGrossWeightQuantity or cshi:TotalNetWeightQuantity or cshi:TotalVolumeQuantity"><br/></xsl:if>
								<xsl:if test="cshi:TotalGrossWeightQuantity">
									<xsl:text>Вес брутто: </xsl:text>
									<xsl:value-of select="translate(cshi:TotalGrossWeightQuantity, '.', ',')"/>
									<xsl:text> кг.  </xsl:text>
								</xsl:if>
								<xsl:if test="cshi:TotalNetWeightQuantity">
									<xsl:text>нетто: </xsl:text>
									<xsl:value-of select="translate(cshi:TotalNetWeightQuantity, '.', ',')"/>
									<xsl:text> кг.  </xsl:text>
								</xsl:if>
								<xsl:if test="cshi:TotalVolumeQuantity">
									<xsl:text>объем: </xsl:text>
									<xsl:value-of select="translate(cshi:TotalVolumeQuantity, '.', ',')"/>
									<xsl:text> м3</xsl:text>
								</xsl:if>
								<xsl:if test="cshi:Reload">
									<br/>
									<xsl:text>Информация о перегрузке: </xsl:text>
									<xsl:value-of select="cshi:Reload"/>
								</xsl:if>
								<xsl:if test="cshi:DeliveryTerms">
									<br/>
									<xsl:text>Условия поставки товаров: </xsl:text>
									<xsl:value-of select="cshi:DeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
								</xsl:if>
								<xsl:if test="cshi:Contract">
									<br/>
									<xsl:text>Дата и номер контракта: </xsl:text>
									<xsl:apply-templates select="cshi:Contract"/>
								</xsl:if>
								<xsl:if test="cshi:ContainerLine">
									<br/>
									<xsl:text>Контейнерная линия: </xsl:text>
									<xsl:value-of select="cshi:ContainerLine"/>
								</xsl:if>
								<xsl:if test="cshi:RegNumBook">
									<br/>
									<xsl:text>Регистрационный номер бронирования: </xsl:text>
									<xsl:value-of select="cshi:RegNumBook"/>
								</xsl:if>
								<xsl:if test="cshi:IMOSea">
									<br/>
									<xsl:text>Номер регистрации судоходства (ИМО): </xsl:text>
									<xsl:value-of select="cshi:IMOSea"/>
								</xsl:if>
								<xsl:if test="cshi:FrDescription">
									<br/>
									<xsl:text>Примечания экспедитора: </xsl:text>
									<xsl:for-each select="cshi:FrDescription">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="cshi:CustomsMark">
									<br/>
									<xsl:text>Таможенные отметки: </xsl:text>
									<xsl:for-each select="cshi:CustomsMark">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="cshi:BorderServiceMark">
									<br/>
									<xsl:text>Отметки пограничной службы: </xsl:text>
									<xsl:for-each select="cshi:BorderServiceMark">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="cshi:ServiceCenterMark">
									<br/>
									<xsl:text>Отметки сервисного центра: </xsl:text>
									<xsl:for-each select="cshi:ServiceCenterMark">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</xsl:if>								
							</td>
						</tr>
						<tr class="title" align="center">
							<td class="graphMain bordered" rowspan="2" style="width: 29.5%; vertical-align: middle">
								THE FREIGHTS PAYMENT TERMS<br/>Условия оплаты фрахта
							</td>
							<td class="graphMain bordered" rowspan="2" colspan="5" style="width: 40.92%; vertical-align: middle">
								DESCRIPTION OF GOODS AND NUMBER OF PACKAGES<br/>Наименование груза, число мест
							</td>
							<td class="graphMain bordered" colspan="4"  style="width: 29.58%; vertical-align: middle">
								WEIGHT, KG<br/>Масса, кг
							</td>
						</tr>
						<tr class="title" align="center">
							<td class="graphMain bordered" colspan="2"  style="width: 17.58%; vertical-align: middle">
								Netto weight, KG<br/>Вес нетто груза, кг
							</td>
							<td class="graphMain bordered" colspan="2"  style="width: 12%; vertical-align: middle">
								Cargo weight, KG<br/>Вес брутто груза, кг
							</td>
						</tr>
						<tr align="center">
							<td class="graphMain value_b" style="width: 29.5%; vertical-align: middle"><br/></td>
							<td class="graphMain value_b" colspan="5" style="width: 40.92%; vertical-align: middle">
								<xsl:for-each select="cshi:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
								<xsl:if test="cshi:TotalPlacesQuantity">
									<br/>Всего грузовых мест:
									<xsl:value-of select="cshi:TotalPlacesQuantity"/>
								</xsl:if>
							</td>
							<td class="graphMain value_b" colspan="2"  style="width: 17.58%; vertical-align: middle">
								<xsl:value-of select="translate(cshi:TotalNetWeightQuantity, '.', ',')"/>
							</td>
							<td class="graphMain value_b" colspan="2"  style="width: 12%; vertical-align: middle">
								<xsl:value-of select="translate(cshi:TotalGrossWeightQuantity, '.', ',')"/>
							</td>
						</tr>
						<tr>
							<td class="graphMain" colspan="2" style="width: 35.3%; border-left: 1px solid gray">
								<b>Manager/менеджер (конт. телефон):<br/><br/>ДАТА ПОДПИСАНИЯ</b>
							</td>
							<td class="graphMain" colspan="8" style="width: 65.7%; border-right: 1px solid gray">
								<xsl:apply-templates select="cshi:DocumentSignatureFR"/>
							</td>
						</tr>
						<tr class="title" align="center">
							<td class="graphMain bordered" style="width: 29.5%; vertical-align: middle">Документы направить</td>
							<td class="graphMain bordered" style="width: 5.8%; vertical-align: middle">Ориг.<br/>к/с</td>
							<td class="graphMain bordered" style="width: 5.8%; vertical-align: middle">Копии<br/>к/с</td>
							<td class="graphMain bordered" style="width: 5.8%; vertical-align: middle">Спец.</td>
							<td class="graphMain bordered" style="width: 11.76%; vertical-align: middle">Расп. кап</td>
							<td class="graphMain bordered" style="width: 11.76%; vertical-align: middle">Серт. кач-ва</td>
							<td class="graphMain bordered" style="width: 5.82%; vertical-align: middle">Серт. проис.</td>
							<td class="graphMain bordered" style="width: 11.76%; vertical-align: middle">Код счета</td>
							<td class="graphMain bordered" style="width: 6%; vertical-align: middle"><br/></td>
							<td class="graphMain bordered" style="width: 6%; vertical-align: middle">Гр. план</td>
						</tr>
						<tr align="center">
							<td class="graphMain bordered" style="width: 29.5%; vertical-align: middle">Судовой почтой</td>
							<td class="graphMain bordered" style="width: 5.8%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 5.8%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 5.8%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 11.76%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 11.76%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 5.82%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 11.76%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 6%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 6%; vertical-align: middle"/>
						</tr>
						<tr align="center">
							<td class="graphMain bordered" style="width: 29.5%; vertical-align: middle">FIT</td>
							<td class="graphMain bordered" style="width: 5.8%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 5.8%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 5.8%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 11.76%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 11.76%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 5.82%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 11.76%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 6%; vertical-align: middle"/>
							<td class="graphMain bordered" style="width: 6%; vertical-align: middle"/>
						</tr>
					</table>
				</div>
				<div class="pagelandscape">
					<xsl:if test="cshi:CommissionShipmentGoods">
						<div class="title marg-top">Товары</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">№ по ДТ</td>
									<td class="graphMain bordered">п\п №</td>
									<td class="graphMain bordered">Код по ТН ВЭД ЕАЭС</td>
									<td class="graphMain bordered">Там. процедура</td>
									<td class="graphMain bordered">Код там. процедуры</td>
									<td class="graphMain bordered">Наименования товара</td>
									<td class="graphMain bordered">Артикул</td>
									<!--td class="graphMain bordered">Габариты</td-->
									<td class="graphMain bordered">Кол-во товара</td>
									<td class="graphMain bordered">Груз. мест</td>
									<td class="graphMain bordered">Объём</td>
									<td class="graphMain bordered">Вес брутто (кг)</td>
									<td class="graphMain bordered">Вес нетто (кг)</td>
									<td class="graphMain bordered">Вес без упаковки, брутто (кг)</td>
									<td class="graphMain bordered">Вес упаковки</td>
									<!--td class="graphMain bordered">Наименование СВХ</td>
									<td class="graphMain bordered">Номер пломбы</td>
									<td class="graphMain bordered">Документы, по которым перевозится товар</td>
									<td class="graphMain bordered">Информация об опасности груза<br/>Класс опасности груза по МОПОГ/ДОПОГ для опасных грузов</td-->
									<td class="graphMain bordered">Инф-ия о контейнерах</td>
									<td class="graphMain bordered">Номер декларации</td>
								</tr>
								<xsl:for-each select="cshi:CommissionShipmentGoods">
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
	<xsl:template match="cat_ru:Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			<xsl:value-of select="cat_ru:CountryCode"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CounryName"><xsl:text>, </xsl:text></xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:Region or cat_ru:CounryName"><xsl:text>, </xsl:text></xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:Region or cat_ru:CounryName or cat_ru:City"><xsl:text>, </xsl:text></xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<xsl:if test="cat_ru:Region or cat_ru:CounryName or cat_ru:City or cat_ru:StreetHouse"><xsl:text>, </xsl:text></xsl:if>
			<xsl:value-of select="cat_ru:TerritoryCode"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>телефон: </xsl:text>
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
			<xsl:text> e-mail: </xsl:text>
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
		<xsl:text> категория лица: </xsl:text>
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text> код КАТО: </xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text> РНН: </xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text> ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text> НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text> Номер справки об отсутствии НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> Идентификационный номер физического лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text> ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<b><xsl:text>ИТН: </xsl:text></b>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cshi:AccompanyingDocumentType -->
	<xsl:template match="cshi:AccompanyingDocument">
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
		<xsl:if test="cshi:DocumentKind">
			<xsl:text> (тип: </xsl:text>
			<xsl:choose>
				<xsl:when test="cshi:DocumentKind='1'"><xsl:text>Коносамент</xsl:text></xsl:when>
				<xsl:when test="cshi:DocumentKind='2'"><xsl:text>Копия коносамента</xsl:text></xsl:when>
				<xsl:when test="cshi:DocumentKind='3'"><xsl:text>Спецификация для погрузки</xsl:text></xsl:when>
				<xsl:when test="cshi:DocumentKind='4'"><xsl:text>Сертификат для погрузки</xsl:text></xsl:when>
				<xsl:when test="cshi:DocumentKind='5'"><xsl:text>Разрешение капитана на погрузку на судно</xsl:text></xsl:when>
				<xsl:when test="cshi:DocumentKind='6'"><xsl:text>Накладная для получателя</xsl:text></xsl:when>
				<xsl:when test="cshi:DocumentKind='7'"><xsl:text>Копия накладной для получателя</xsl:text></xsl:when>
				<xsl:when test="cshi:DocumentKind='8'"><xsl:text>Спецификация для получателя</xsl:text></xsl:when>
				<xsl:when test="cshi:DocumentKind='9'"><xsl:text>Сертификат для получателя</xsl:text></xsl:when>
				<xsl:when test="cshi:DocumentKind='10'"><xsl:text>Разрешение капитана на выгрузку с судна</xsl:text></xsl:when>
				<xsl:when test="cshi:DocumentKind='99'"><xsl:text>иное</xsl:text></xsl:when>
				<xsl:otherwise><xsl:value-of select="cshi:DocumentKind"/></xsl:otherwise>
			</xsl:choose>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cshi:AdministrationInfoType -->
	<xsl:template match="cshi:AdministrationInfo">
		<xsl:if test="cshi:SignatureAdministration">
			<u><xsl:value-of select="cshi:SignatureAdministration"/></u>
		</xsl:if>
		<xsl:if test="cshi:Note">
			<br/><i>
			<xsl:text>Примечания: </xsl:text>
			<xsl:for-each select="cshi:Note">
				<xsl:value-of select="."/>
			</xsl:for-each>
			</i>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cshi:CommissionShipmentGoodsType -->
	<xsl:template match="cshi:CommissionShipmentGoods">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="cshi:GoodsNumericDT"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cshi:GoodsNumeric"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cshi:GoodsTNVEDCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cshi:CustomsProcedure"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cshi:CustomsModeCode"/></td>
			<td class="graphMain bordered">
				<xsl:for-each select="cshi:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
			</td>
			<td class="graphMain bordered"><xsl:value-of select="cshi:GoodsMarking"/></td>
			<!--td class="graphMain bordered"><xsl:value-of select="cshi:Dimensions"/></td-->
			<td class="graphMain bordered"><xsl:apply-templates select="cshi:GoodsQuantity"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="cshi:Places"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(cshi:VolumeQuantity, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(cshi:GrossTareWeightQuantity, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(cshi:NetWeightQuantity, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(cshi:GrossWeightQuantity, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(cshi:WeightTareQuantity, '.', ',')"/></td>
			<!--td class="graphMain bordered"><xsl:value-of select="cshi:WarehouseName"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cshi:SealID"/></td>
			<td class="graphMain bordered">
				<xsl:for-each select="cshi:GoodsDocuments"><xsl:apply-templates select="."/><br/></xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="cshi:DangerousCargo"><xsl:apply-templates select="."/><br/></xsl:for-each>
			</td-->
			<td class="graphMain bordered">
				<xsl:for-each select="cshi:ContainerInfo"><xsl:apply-templates select="."/><br/></xsl:for-each>
			</td>
			<td class="graphMain bordered"><xsl:apply-templates select="cshi:DTNumber"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationType -->
	<xsl:template match="cshi:Consignee| cshi:Consignor| cshi:Carrier| cshi:WhomNotify">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName or cat_ru:OrganizationName"><br/></xsl:if>
		<!--xsl:if test="cat_ru:OrganizationLanguage">
			<xsl:value-of select="cat_ru:OrganizationLanguage"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:OKPOID"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:OKATOCode">
			<xsl:text>ОКАТО: </xsl:text>
			<xsl:value-of select="cat_ru:OKATOCode"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID or cat_ru:OKATOCode"><br/></xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<xsl:text>Особенности РФ: </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<xsl:text>Особенности РК: </xsl:text>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<xsl:text>Особенности РБ: </xsl:text>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<xsl:text>Особенности РА: </xsl:text>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<xsl:text>Особенности КР: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			<br/>
		</xsl:if-->
		<xsl:if test="cat_ru:Address">
			<!--xsl:text>Адрес </xsl:text-->
			<xsl:apply-templates select="cat_ru:Address"/>
			<br/>
		</xsl:if>
		<!--xsl:if test="cat_ru:Contact">
			<xsl:text>Контактная информация</xsl:text>
			<xsl:apply-templates select="cat_ru:Contact"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cshi:ContainerInfoType -->
	<xsl:template match="cshi:ContainerInfo">
		<xsl:value-of select="cshi:ContainerID"/>
		<xsl:if test="cshi:EmptyIndicator and (cshi:EmptyIndicator='true' or cshi:EmptyIndicator='1')">
			<xsl:text> (порожний)</xsl:text>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cshi:ContainerKind"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="cshi:Contract">
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
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="cshi:CSHBorderCustoms">
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
	<!-- Шаблон для типа cshi:DangerousCargoType -->
	<xsl:template match="cshi:DangerousCargo">
		<xsl:value-of select="cshi:DangerIMO"/>
		<xsl:text> (код класса опасности: </xsl:text>
		<xsl:value-of select="cshi:UNNO"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DeliveryTermsType -->
	<xsl:template match="cshi:DeliveryTerms">
		<xsl:if test="cat_ru:DeliveryPlace">
			<xsl:text>Описание / Название географического пункта</xsl:text>
			<xsl:value-of select="cat_ru:DeliveryPlace"/>
		</xsl:if>
		<xsl:if test="cat_ru:DeliveryTermsStringCode">
			<xsl:text>Код условий поставки в соответствии с классификатором условий поставки</xsl:text>
			<xsl:value-of select="cat_ru:DeliveryTermsStringCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:DeliveryTermsRBCode">
			<xsl:text>Код вида поставки товаров в соответствии с классификатором видов поставок товаров, подлежащих учету при осуществлении экспортных операций, применяемым в Республике Беларусь</xsl:text>
			<xsl:value-of select="cat_ru:DeliveryTermsRBCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:TransferPlace">
			<xsl:text>Место передачи товара в соответствии с условиями договора (контракта)</xsl:text>
			<xsl:value-of select="cat_ru:TransferPlace"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cshi:DocumentSignatureFRType -->
	<xsl:template match="cshi:DocumentSignatureFR">
		<xsl:value-of select="cshi:NamePersonSignature"/>
		<xsl:if test="cshi:Phone">
			<xsl:text> тел.: </xsl:text>
			<xsl:for-each select="cshi:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<br/>
		<xsl:if test="cshi:PostPersonSignature">
			<xsl:value-of select="cshi:PostPersonSignature"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cshi:Forwarder">
			<xsl:value-of select="cshi:Forwarder"/>
		</xsl:if>
		<br/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cshi:IssueDate"/>
		</xsl:call-template>
		<!--xsl:if test="cshi:FWDocument">
			<div class="title marg-top">Разрешительные документы</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование документа</td>
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Дата документа</td>
					</tr>
					<xsl:for-each select="cshi:FWDocument">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="cshi:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="cshi:FWDocument">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cshi:GoodsDocumentType -->
	<xsl:template match="cshi:GoodsDocuments">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cshi:DocumentModeCode">
			<xsl:text> (код вида док-та: </xsl:text>
			<xsl:value-of select="cshi:DocumentModeCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="cshi:GoodsQuantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cshi:PortType -->
	<xsl:template match="cshi:LoadingPort| cshi:UnloadingPort">
		<xsl:if test="cshi:PortCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cshi:PortCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:value-of select="cshi:PortName"/>
	</xsl:template>
	<!-- Шаблон для типа cshi:PlacesType -->
	<xsl:template match="cshi:Places">
		<xsl:value-of select="translate(cshi:PakageQuantity, '.', ',')"/>
		<xsl:if test="cshi:PackageDescription">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cshi:PackageDescription"/>
		</xsl:if>
		<xsl:if test="cshi:PackageCode">
			<xsl:text> (код: </xsl:text>						
			<xsl:value-of select="cshi:PackageCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catTrans_ru:VesselType -->
	<xsl:template match="cshi:Vessel">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование судна</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catTrans_ru:Name"/>
				</td>
			</tr>
		</table>
		<xsl:if test="catTrans_ru:Shipmaster">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия капитана судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catTrans_ru:Shipmaster"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catTrans_ru:NationalityCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны принадлежности судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catTrans_ru:NationalityCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catTrans_ru:NationalityVessel">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Национальная принадлежность судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catTrans_ru:NationalityVessel"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catTrans_ru:NationalityVesselCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны принадлежности судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catTrans_ru:NationalityVesselCode"/>
					</td>
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
</xsl:stylesheet>
