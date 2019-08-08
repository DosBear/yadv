<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:DTInfo_req="urn:customs.ru:Information:SQDocuments:RosStandartDTInfoRes:5.13.1">
	<!-- Шаблон для типа RosStandartDTInfoResType -->
	<xsl:template match="DTInfo_req:RosStandartDTInfoRes">
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
					width: 270mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
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
					font-size: 10pt;
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
									<h2>Ответ на запрос сведений из декларации на товары и таможенного приходного ордера</h2>
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
					<xsl:if test="DTInfo_req:ResponseDescription">
						<div class="title marg-top">ПАРАМЕТРЫ ОТВЕТА</div>
						<xsl:apply-templates select="DTInfo_req:ResponseDescription"/>
					</xsl:if>
					<xsl:for-each select="DTInfo_req:Response">
						<div class="title marg-top">ОТВЕТ НА ЗАПРОС № <xsl:value-of select="position()"/></div>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа DTInfo_req:OrganizationType -->
	<xsl:template match="DTInfo_req:BranchDescription| DTInfo_req:Consignee| DTInfo_req:Consignor| DTInfo_req:Manufacturer">
		<table class="w190">
			<tr><td class="annot graphMain" style="border-top: 1px solid silver" colspan="2"/></tr>
			<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
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
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:Address">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес организации</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:Address"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="DTInfo_req:JuridicalAddress">
				<tr>
					<td class="annot graphMain" style="width:50%">Юридический адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="DTInfo_req:JuridicalAddress"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCard">
				<tr>
					<td class="annot graphMain" style="width:50%">Документ, удостоверяющий личность</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:IdentityCard"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:Contact">
				<tr>
					<td class="annot graphMain" style="width:50%">Контактная информация</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:Contact"/></td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="DTInfo_req:BranchDescription">
			<div class="marg-top"><i>Сведения об обособленном подразделении</i></div>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:98%"><xsl:apply-templates select="DTInfo_req:BranchDescription"/></td>
				</tr>
			</table>	
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:CUPresentedDocumentsType -->
	<xsl:template match="DTInfo_req:ESADout_CUPresentedDocument">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="catESAD_cu:ProvidingIndicationMark=0">документ не представлен при подаче ДТ<br/></xsl:when>
					<xsl:when test="catESAD_cu:ProvidingIndicationMark=1">документ представлен при подаче ДТ<br/></xsl:when>
					<xsl:when test="catESAD_cu:ProvidingIndicationMark=2">документ не представлен в соответствии с частью 2 п.4 ст. 183 ТК ТС<br/></xsl:when>
					<xsl:when test="catESAD_cu:ProvidingIndicationMark=3">документ представлен (будет представлен) после выпуска товаров<br/></xsl:when>
				</xsl:choose>
				(<xsl:value-of select="catESAD_cu:PresentedDocumentModeCode"/>)&#160;
				<xsl:value-of select="cat_ru:PrDocumentName"/>
				<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
				<xsl:if test="cat_ru:PrDocumentDate">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="catESAD_cu:CustomsCode">
					<br/>Код таможенного органа, зарегистрировавшего документ: <xsl:value-of select="catESAD_cu:CustomsCode"/>
				</xsl:if>
				<xsl:if test="catESAD_cu:DocumentBeginActionsDate or catESAD_cu:DocumentEndActionsDate">
					<br/>Период действия:&#160;
					<xsl:if test="catESAD_cu:DocumentBeginActionsDate">
						<xsl:text>c </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="catESAD_cu:DocumentEndActionsDate">
						<xsl:text>по </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
				<xsl:if test="catESAD_cu:PresentingLackingDate">
					<br/>Дата представления недостающего док-та:&#160;
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="catESAD_cu:PresentingLackingDate"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="catESAD_cu:TemporaryImportCode or catESAD_cu:TemporaryStorageImportDate">
					<br/>Срок временного ввоза/вывоза:&#160;
					<xsl:choose>
						<xsl:when test="catESAD_cu:TemporaryImportCode=1">(менее 1 года) </xsl:when>
						<xsl:when test="catESAD_cu:TemporaryImportCode=2">(более 1 года) </xsl:when>
					</xsl:choose>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="catESAD_cu:TemporaryStorageImportDate"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="catESAD_cu:SupplyStatus='11'"><br/><b>Опережающая поставка</b></xsl:if>
			</td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:CustomsPaymentModeCodeType"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:CountryCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:SpecialSimplifiedCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:TotalDocuments"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(catESAD_cu:ProcessingGoodsCost, '.', ',')"/></td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:PreferenciiDocID"/>
				<xsl:if test="catESAD_cu:PreferenciiCountryCode"> код страны: <xsl:value-of select="catESAD_cu:PreferenciiCountryCode"/></xsl:if>
			</td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:RecordID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:ExecutiveBodyID"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="catESAD_cu:LicenseGoods"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="catESAD_cu:RFG44PresentedDocId"/></td>
			<td class="graphMain bordered">
				<xsl:if test="catESAD_cu:TIRPageNumber">Номер листа книжки МДП: <xsl:value-of select="catESAD_cu:TIRPageNumber"/></xsl:if>
				<xsl:if test="catESAD_cu:TIRHolderID"> ID держателя: <xsl:value-of select="catESAD_cu:TIRHolderID"/></xsl:if>
				<xsl:if test="catESAD_cu:RegNumberDocument"> Рег. номер таможенного док-та: <xsl:value-of select="catESAD_cu:RegNumberDocument"/></xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:AutomobileType -->
	<xsl:template match="DTInfo_req:GoodsAutomobile">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:Model"/></td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:Mark"/>
				<xsl:if test="cat_ru:MarkCode"> (код: <xsl:value-of select="cat_ru:MarkCode"/>)</xsl:if>
			</td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:OfftakeYear"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(cat_ru:EngineVolumeQuanity, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:VINID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:BodyID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:EngineID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:ChassisID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:CabID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:EmergencyDeviceID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:IdentityCardNumber"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(catESAD_cu:CarCost, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(catESAD_cu:PowerWeightQuanity, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:PassedKilometerQuantity"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:GoodsGroupDescriptionType -->
	<xsl:template match="DTInfo_req:GoodsGroupDescription">
		<xsl:if test="catESAD_cu:RKTNVED">
			Код ТН ВЭД ЕАЭС: <xsl:value-of select="catESAD_cu:RKTNVED"/><br/>
		</xsl:if>
		<xsl:apply-templates select="catESAD_cu:GoodsDescription"/>
		<xsl:if test="catESAD_cu:GoodsGroupInformation">
			<div class="marg-top"><i>Характеристика товаров в группе</i></div>
			<table class="bordered w190">
				<tr class="title">
					<td class="graphMain bordered">Сведения о производителе</td>
					<td class="graphMain bordered">Тов. знак</td>
					<td class="graphMain bordered">Марка товара</td>
					<td class="graphMain bordered">Модель товара</td>
					<td class="graphMain bordered">Артикул товара</td>
					<td class="graphMain bordered">Стандарт</td>
					<td class="graphMain bordered">Сорт</td>
					<td class="graphMain bordered">Наименование сортимента</td>
					<td class="graphMain bordered">Порода древесины</td>
					<td class="graphMain bordered">Размеры</td>
					<td class="graphMain bordered">Дата выпуска</td>
					<td class="graphMain bordered">Серийный номер</td>
					<td class="graphMain bordered">Кол-во товаров</td>
				</tr>
				<xsl:for-each select="catESAD_cu:GoodsGroupInformation">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if>
		<br/>
	</xsl:template>
	<!-- Шаблон для типа DTInfo_req:GoodsInfoType -->
	<xsl:template match="DTInfo_req:GoodsInfo">
		<tr>
			<td class="annot graphMain" style="border-top: 1px solid silver" colspan="2">
				<i>Порядковый номер декларируемого товара <xsl:value-of select="DTInfo_req:GoodsNumeric"/></i><br/>
				<xsl:apply-templates select="DTInfo_req:GoodsDescription"/>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Вес товара, брутто (кг)</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(DTInfo_req:GrossWeightQuantity, '.', ',')"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Вес товара, нетто (кг)</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(DTInfo_req:NetWeightQuantity, '.', ',')"/></td>
		</tr>
		<xsl:if test="DTInfo_req:SupplementaryGoodsQuantity">
			<tr>
				<td class="annot graphMain" style="width:50%">Количество товара в ДЕИ</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="DTInfo_req:SupplementaryGoodsQuantity"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="DTInfo_req:SupplementaryGoodsQuantity1">
			<tr>
				<td class="annot graphMain" style="width:50%">Количество товара в ЕИ, отличной от основной и дополнительной</td>
				<td class="value graphMain" style="width:50%">
					<xsl:for-each select="DTInfo_req:SupplementaryGoodsQuantity1">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="DTInfo_req:ESADout_CUPresentedDocument">
			<tr>
				<td class="annot graphMain" colspan="2">
					<div class="marg-top"><i>Представленные документы</i></div>
					<table class="bordered w190">
						<tr class="title">
							<td class="graphMain bordered">Сведения о документе</td>
							<td class="graphMain bordered">Код вида ТП</td>
							<td class="graphMain bordered">Код страны</td>
							<td class="graphMain bordered">Код спец. упрощений</td>
							<td class="graphMain bordered">Общее кол-во док-тов</td>
							<td class="graphMain bordered">Стоимость операций по переработке товаров вне тамож. территории</td>
							<td class="graphMain bordered">ID документа</td>
							<td class="graphMain bordered">ID записи</td>
							<td class="graphMain bordered">ID исполнительного органа</td>
							<td class="graphMain bordered">Сведения о декларируемом товаре по лицензии</td>
							<td class="graphMain bordered">Дополнительные технологические ID</td>
							<td class="graphMain bordered">Книжка МДП</td>
						</tr>
						<xsl:for-each select="DTInfo_req:ESADout_CUPresentedDocument">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="DTInfo_req:GoodsAutomobile">
			<tr>
				<td class="annot graphMain" colspan="2">
					<div class="marg-top"><i>Сведения об автомобилях</i></div>
					<table class="bordered w190">
						<tr class="title">
							<td class="graphMain bordered">Марка, модель</td>
							<td class="graphMain bordered">Наименование марки ТС</td>
							<td class="graphMain bordered">Год изготовления</td>
							<td class="graphMain bordered">Раб. объем двигателя, куб. см</td>
							<td class="graphMain bordered">VIN</td>
							<td class="graphMain bordered">Номер кузова (прицепа)</td>
							<td class="graphMain bordered">Номер двигателя</td>
							<td class="graphMain bordered">Номер шасси (рамы)</td>
							<td class="graphMain bordered">Номер кабины</td>
							<td class="graphMain bordered">Номер устройства/системы вызова экстренных оперативных служб</td>
							<td class="graphMain bordered">Номер удостоверения</td>
							<td class="graphMain bordered">Стоимость транспортного средства</td>
							<td class="graphMain bordered">Примечание: грузоподъемность/мощность</td>
							<td class="graphMain bordered">Пробег</td>
						</tr>
						<xsl:for-each select="DTInfo_req:GoodsAutomobile">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</td>
			</tr>		
		</xsl:if>
		<xsl:if test="DTInfo_req:GoodsGroupDescription">
			<xsl:choose>
				<xsl:when test="count(DTInfo_req:GoodsGroupDescription)=1">
					<tr>
						<td class="annot graphMain" colspan="2"><div class="marg-top"><i>Описание и характеристика товаров</i></div></td>
					</tr>	
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td class="annot graphMain" colspan="2">
							<div class="marg-top"><i>Описание группы товаров одного наименования с отличающимися от других групп характеристиками</i></div>
						</td>
					</tr>	
				</xsl:otherwise>
			</xsl:choose>
			<tr>
				<td class="annot graphMain" colspan="2">
					<table class="bordered w190">
						<xsl:for-each select="DTInfo_req:GoodsGroupDescription">
							<tr>
								<td class="annot graphMain" style="width: 2%; border-top: 1px dotted silver"><xsl:value-of select="position()"/>.</td>
								<td class="annot graphMain" style="width: 98%; border-top: 1px dotted silver"><xsl:apply-templates select="."/></td>
							</tr>	
						</xsl:for-each>
					</table>
				</td>
			</tr>	
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address| DTInfo_req:JuridicalAddress">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="DTInfo_req:NumberDT">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
		<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа DTInfo_req:TPOIDType -->
	<xsl:template match="DTInfo_req:NumberTPO">
		<xsl:value-of select="DTInfo_req:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="DTInfo_req:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="DTInfo_req:TPONumber"/>
	</xsl:template>
	<!-- Шаблон для типа DTInfo_req:ResponseType -->
	<xsl:template match="DTInfo_req:Response">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%; border-top: 2px solid black">Регистрационный номер ДТ</td>
				<td class="value graphMain" style="width:50%; border-top: 2px solid black"><xsl:apply-templates select="DTInfo_req:NumberDT"/></td>
			</tr>
			<xsl:if test="DTInfo_req:NumberTPO">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер ТПО</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="DTInfo_req:NumberTPO"/></td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="DTInfo_req:Consignor">
			<div class="title marg-top">Отправитель/Экспортер</div>
			<xsl:apply-templates select="DTInfo_req:Consignor"/>
		</xsl:if>
		<xsl:if test="DTInfo_req:Consignee">
			<div class="title marg-top">Получатель/Импортер</div>
			<xsl:apply-templates select="DTInfo_req:Consignee"/>
		</xsl:if>
		<xsl:if test="DTInfo_req:Manufacturer">
			<div class="title marg-top">Сведения о производителе</div>
			<xsl:apply-templates select="DTInfo_req:Manufacturer"/>
		</xsl:if>
		<xsl:if test="DTInfo_req:GoodsInfo">
			<div class="title marg-top">Сведения о товаре/продукции</div>
			<table class="w190">
				<xsl:for-each select="DTInfo_req:GoodsInfo">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа DTInfo_req:ResponseDescriptionType -->
	<xsl:template match="DTInfo_req:ResponseDescription">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Наименование органа, направляющего ответ на запрос</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="DTInfo_req:OrgSender"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:48%">Способы удостоверения лица, направившего ответ на запрос</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="DTInfo_req:WaysIdentify"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:48%">Способ направления ответа на запрос</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="DTInfo_req:TransmittingCode=1">по каналам СМЭВ</xsl:when>
						<xsl:when test="DTInfo_req:TransmittingCode=2">по каналам РСМЭВ</xsl:when>
						<xsl:when test="DTInfo_req:TransmittingCode=3">по иным электронным каналам</xsl:when>
						<xsl:when test="DTInfo_req:TransmittingCode=4">по почте</xsl:when>
						<xsl:when test="DTInfo_req:TransmittingCode=5">по факсу</xsl:when>
						<xsl:when test="DTInfo_req:TransmittingCode=6">курьером</xsl:when>
						<xsl:when test="DTInfo_req:TransmittingCode=7">другое или сочетание способов</xsl:when>
						<xsl:otherwise><xsl:value-of select="DTInfo_req:TransmittingCode"/></xsl:otherwise>
					</xsl:choose>
				</td>
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Наименование органа, в адрес которого направляется ответ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="DTInfo_req:OrgReceiver"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Наименование запрашиваемого документа и (или) информации</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="DTInfo_req:NameRequestInfo"/></td>
			</tr>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Срок направления ответа на запрос</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="DTInfo_req:ReponsePeriod"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="DTInfo_req:SupplementaryGoodsQuantity| DTInfo_req:SupplementaryGoodsQuantity1| catESAD_cu:GoodsGroupQuantity">
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
	<!-- Шаблон для типа catESAD_cu:GoodsGroupInformationType -->
	<xsl:template match="catESAD_cu:GoodsGroupInformation">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:Manufacturer"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:TradeMark"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:GoodsMark"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:GoodsModel"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:GoodsMarking"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:GoodsStandard"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:GoodsSort"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:WoodSortiment"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:WoodKind"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catESAD_cu:Dimensions"/></td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="catESAD_cu:SerialNumber">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered"><xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:LicenseGoodsType -->
	<xsl:template match="catESAD_cu:LicenseGoods">
		Номер товара по перечню к лицензии: <xsl:value-of select="catESAD_cu:GoodsNumericLic"/>
		<xsl:if test="catESAD_cu:AppNumber"> в приложении/перечне № <xsl:value-of select="catESAD_cu:AppNumber"/> к лицензии</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:RFBasePresentedDocIDType -->
	<xsl:template match="catESAD_cu:RFG44PresentedDocId">
		<xsl:if test="catESAD_cu:ElectronicDocumentID">ID документа: <xsl:value-of select="catESAD_cu:ElectronicDocumentID"/></xsl:if>
		<xsl:if test="catESAD_cu:ElectronicArchID"> ID хранилища: <xsl:value-of select="catESAD_cu:ElectronicArchID"/></xsl:if>
		<xsl:if test="catESAD_cu:DocumentModeID"> Код вида док-та: <xsl:value-of select="catESAD_cu:DocumentModeID"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax"> факс: <xsl:value-of select="cat_ru:Fax"/></xsl:if>
		<xsl:if test="cat_ru:Telex"> телекс: <xsl:value-of select="cat_ru:Telex"/></xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="cat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">(<xsl:value-of select="cat_ru:IdentityCardCode"/>) </xsl:if>
		<xsl:if test="cat_ru:IdentityCardName"><xsl:value-of select="cat_ru:IdentityCardName"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries"> серия <xsl:value-of select="cat_ru:IdentityCardSeries"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber"> № <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName"> выдан 
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
			&#160;<xsl:value-of select="cat_ru:OrganizationName"/>
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
			<xsl:text>Номер справки об отсутствии НЗОУ: </xsl:text>
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
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
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
