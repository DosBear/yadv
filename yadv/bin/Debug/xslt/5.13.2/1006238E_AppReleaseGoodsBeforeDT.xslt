<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0"  xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.13.2" xmlns:argb="urn:customs.ru:Information:CustomsDocuments:AppReleaseGoodsBeforeDT:5.13.2">
<!-- 
&#160; - неразрывный пробел, 
&#8212; - длинное тире
-->

<!-- Шаблон для типа AppReleaseGoodsBeforeDTType -->
<xsl:template match="argb:AppReleaseGoodsBeforeDT">
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
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			div.page270 {
			width: 297mm;
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

			td.bordered_without_top
			{
				border-collapse: collapse;
				border-right: solid 1px windowtext;
				border-top: none;
				border-bottom: solid 1px windowtext;
				border-left: solid 1px windowtext;
			}

			td.bordered_without_bottom
			{
				border-collapse: collapse;
				border-right: solid 1px windowtext;
				border-top: solid 1px windowtext;
				border-bottom: none;
				border-left: solid 1px windowtext;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 9pt;
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
			font-size: small;
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
			font-size: 9pt;
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
			font-size: 8pt;
			}			

		</style>
	</head>
	<body>
		<div class="page">
			<table class="w190">
				<tbody align="center" class="graphHeader">
					<tr>
						<td>ЗАЯВЛЕНИЕ</td>
					</tr>
					<tr>
						<td>о выпуске товаров до подачи декларации на товары</td>
					</tr>
				</tbody>
			</table>
			<br/>

			<table class="w190" cellpadding="5">
				<col width="20%" valign="top"/>
				<col width="10%" valign="top"/>
				<col width="20%" valign="top"/>
				<col width="10%" valign="top"/>
				<col width="10%" valign="top"/>
				<col width="15%" valign="top"/>
				<col width="15%" valign="top"/>
				<tbody>

					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="1" class="bordered">
							<span class="bold">1. Заявление</span>
							<span class="normal">
								<br/>
								ЭД
							</span>
						</td>
						<td colspan="6" class="bordered" style="vertical-align: middle"><!--Графа А. Здесь должен быть регистрационный номер из CustomsMark. -->
							<span class="normal"><xsl:apply-templates select="argb:APPNumber"/></span>
						</td> 
					</tr>
					<tr>
						<td colspan="3" rowspan="2" class="bordered"><span class="bold">2. Заявитель / Декларант</span>
							<span class="normal">
								<xsl:apply-templates select="argb:DeclarantDetails" />
							</span>	
						</td>
						<td  colspan="2" class="bordered"><span class="bold">2a</span>
							<span class="normal">
								<br/>
								<xsl:if test="argb:DeclarantDetails/RUDECLcat:AEORegistryIdDetails">
									<xsl:apply-templates select="argb:DeclarantDetails/RUDECLcat:AEORegistryIdDetails" />
								</xsl:if>
							</span>	
						</td>
						<td  colspan="1" class="bordered"><span class="bold">3. Количество листов</span></td>
						<td  colspan="1" class="bordered">
							<span class="bold">4. Процедура</span>
							<span class="normal">
								<br/>
								<xsl:value-of select="argb:CustomsModeCode" />
							</span>	
						</td>
					</tr>
					<tr>
						<td  colspan="2" class="bordered">
							<span class="bold">2b</span>
								<br/>
								<span class="italic">обязуется до </span>
								<span class="normal">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="argb:EndDate" />
									</xsl:call-template>
								<br/>
								<span class="italic">подать ДТ</span>
							</span>
						</td>
						<td  colspan="1" class="bordered">
							<span class="bold">5.Всего товаров</span>
							<span class="normal">
								<br/>
								<xsl:value-of select="count(argb:GoodsShipmentDetails/RUDECLcat:GoodsItemDetails)" />
							</span>
						</td>
						<td  colspan="1" class="bordered">
							<span class="bold">6.Категория товаров</span>
							<span class="normal">
								<br/>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="3" class="bordered">
							<span class="bold">7. Отправитель</span>
							<span class="normal">
								<xsl:apply-templates select="argb:GoodsShipmentDetails/RUDECLcat:ConsignorDetails" />
							</span>
						</td>
						<td colspan="4" class="bordered">
							<span class="bold">8. Получатель</span>
							<xsl:choose>
								<xsl:when test="argb:GoodsShipmentDetails/RUDECLcat:ConsigneeDetails/RUDECLcat:EqualIndicator='true' or argb:GoodsShipmentDetails/RUDECLcat:ConsigneeDetails/RUDECLcat:EqualIndicator='1'">
									<br/>
									<span class="normal">см. графу 2 Заявления</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="normal">
										<xsl:apply-templates select="argb:GoodsShipmentDetails/RUDECLcat:ConsigneeDetails" />
									</span>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="bordered">
							<span class="bold">9. Страна отправления</span>
							<span class="normal">
								<xsl:apply-templates select="argb:GoodsShipmentDetails/RUDECLcat:DepartureCountry" />
							</span>
						</td>
						<td colspan="2" class="bordered">
							<span class="bold">10. Страна назначения</span>
							<span class="normal">
								<xsl:apply-templates select="argb:GoodsShipmentDetails/RUDECLcat:DestinationCountry" />
							</span>
						</td>
						<td colspan="3" class="bordered">
							<span class="bold">11. Предшествующий документ</span>
							<span class="normal">
								<xsl:call-template name="RUDECLcat:PrecedingDocDetails_info"/>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="bordered">
							<span class="bold">12. Общий вес брутто</span>
							<span class="normal">
								<br/>
								<xsl:choose>
									<xsl:when test="argb:GoodsShipmentDetails/RUDECLcat:UnifiedGrossMassMeasure &gt; 0">
										<xsl:value-of  select="format-number(argb:GoodsShipmentDetails/RUDECLcat:UnifiedGrossMassMeasure,'#.000000')"/> кг
									</xsl:when>
									<xsl:otherwise>0 кг</xsl:otherwise>
								</xsl:choose>
								
							</span>
						</td>
						<td colspan="2" class="bordered">
							<span class="bold">13. Общая стоимость</span>
							<span class="normal">
								<br/>
								<xsl:choose>
									<xsl:when test="argb:GoodsShipmentDetails/RUDECLcat:InvoiceValueDetails/RUScat_ru:ValueAmount &gt; 0">
										<xsl:value-of  select="translate(format-number(argb:GoodsShipmentDetails/RUDECLcat:InvoiceValueDetails/RUScat_ru:ValueAmount, '#,###.00'),',',' ')" />
									</xsl:when>
									<xsl:otherwise>0</xsl:otherwise>
								</xsl:choose>	
							</span>
						</td>
						<td colspan="3" class="bordered">
							<span class="bold">14. Валюта</span>
							<span class="normal">
								<br/>
								<xsl:value-of  select="argb:GoodsShipmentDetails/RUDECLcat:InvoiceValueDetails/RUScat_ru:ExchangeRate/RUScat_ru:CurrencyA3Code" />
							</span>
							
						</td>
					</tr>
					<tr>
						<td colspan="3" class="bordered">
							<span class="bold">15. Обеспечение исполнения обязанности по уплате таможенных пошлин, налогов</span>
							<span class="normal">
								<xsl:apply-templates select="argb:GoodsShipmentDetails/RUDECLcat:GuaranteeDetails" />
							</span>
						</td>
						<td colspan="4" class="bordered">
							<span class="bold">16. Место нахождения товаров</span>
							<span class="normal">
								<xsl:apply-templates select="argb:GoodsShipmentDetails/RUDECLcat:GoodsLocationDetails" />
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="7" class="bordered_without_bottom">
							<span class="bold">17. Сведения о лице, заполнившем заявление</span>
						</td>
					</tr>
					<tr>
						<td  colspan="3" class="bordered_without_top">
							<xsl:if test="argb:CustomsRepresentativeDetails/RUDECLcat:BrokerRegistryDocDetails">
								<span class="normal">
									<xsl:apply-templates select="argb:CustomsRepresentativeDetails/RUDECLcat:BrokerRegistryDocDetails" />
								</span>
							</xsl:if>
							<br/>	
							<xsl:if test="argb:CustomsRepresentativeDetails/RUDECLcat:RepresentativeContractDetails">
								<br/>
								<span class="italic">Договор таможенного представителя с декларантом (заявителем)</span>
								<span class="normal">:</span>
								<span class="normal">
									<xsl:apply-templates select="argb:CustomsRepresentativeDetails/RUDECLcat:RepresentativeContractDetails" />
								</span>
							</xsl:if>	
						</td>
						<td  colspan="4" class="bordered_without_top">
							<xsl:if test="argb:CustomsRepresentativeDetails/RUDECLcat:RepresentativePersonDetails">
								<span class="normal">
									<xsl:apply-templates select="argb:CustomsRepresentativeDetails/RUDECLcat:RepresentativePersonDetails" />
								</span>
							</xsl:if>
						</td>	
					</tr>
				</tbody>
			</table>
		</div>

		<div class="page270">
			<!-- ТОВАРЫ-->
			<table class="w270 border" cellpadding="5">
				<col width="5%" valign="top"/>
				<col width="30%" valign="top"/>
				<col width="10%" valign="top"/>
				<col width="6%" valign="top"/>
				<col width="11%" valign="top"/>
				<col width="12%" valign="top"/>
				<col width="16%" valign="top"/>
				<col width="10%" valign="top"/>
				<thead>
					<tr>
						<td colspan="8"><span class="bold">18. Сведения о товарах</span></td>
					</tr>
					<tr valign="middle" align="center" class="italic">
						<td rowspan="2">Номер товара</td>
						<td rowspan="2">Наименование, описание</td>
						<td rowspan="2">Код ТН ВЭД ЕАЭС</td>
						<td colspan="2">Кол-во доп. ед.</td>
						<td rowspan="2">Вес брутто</td>
						<td rowspan="2">Стоимость</td>
						<td rowspan="2">Страна происхождения</td>
					</tr>
					<tr valign="middle" align="center" class="italic">
						<td>кол-во</td>
						<td>доп. ед.</td>
					</tr>
					<tr valign="middle" align="center" class="italic">
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
						<td>8</td>
					</tr>
				</thead>

				<xsl:for-each select="argb:GoodsShipmentDetails/RUDECLcat:GoodsItemDetails">
					<tbody class="normal">
						<tr>
							<td align="center">
								<xsl:for-each select="RUScat_ru:GoodsNumeric">
									<xsl:value-of select="."/>
								</xsl:for-each>					
							</td>
							<td>
								<xsl:for-each select="RUScat_ru:GoodsDescription">
									<xsl:value-of select="."/>&#160;
								</xsl:for-each>
								<xsl:for-each select="RUDECLcat:CommodityDescriptionDetails">
									<xsl:apply-templates select="." />
								</xsl:for-each>
							</td>
							<td>
								<xsl:for-each select="RUScat_ru:GoodsTNVEDCode">
									<xsl:value-of select="."/>
								</xsl:for-each>					
							</td>
							<td align="right">
								<xsl:if test="RUScat_ru:GoodsMeasureDetails/cat_ru:GoodsQuantity">
									<xsl:value-of select="RUScat_ru:GoodsMeasureDetails/cat_ru:GoodsQuantity"/>
								</xsl:if>					
							</td>
							<td align="center">
								<xsl:if test="RUScat_ru:GoodsMeasureDetails/cat_ru:MeasureUnitQualifierName">
									<xsl:value-of select="RUScat_ru:GoodsMeasureDetails/cat_ru:MeasureUnitQualifierName"/>
								</xsl:if>
								<xsl:if test="RUScat_ru:GoodsMeasureDetails/cat_ru:MeasureUnitQualifierCode">
									<xsl:if test="string-length(RUScat_ru:GoodsMeasureDetails/cat_ru:MeasureUnitQualifierName) &gt; 0">
										<span> / </span>
									</xsl:if>
									<xsl:value-of select="RUScat_ru:GoodsMeasureDetails/cat_ru:MeasureUnitQualifierCode"/>
								</xsl:if>					
							</td>
							<td align="right">
								<xsl:if test="RUScat_ru:UnifiedGrossMassMeasure">
									<xsl:choose>
										<xsl:when test="RUScat_ru:UnifiedGrossMassMeasure &gt; 0.001">
											<xsl:value-of select="format-number(RUScat_ru:UnifiedGrossMassMeasure,'#.000')"/>
										</xsl:when>
										<xsl:when test="RUScat_ru:UnifiedGrossMassMeasure &gt; 0">
											<xsl:value-of select="format-number(RUScat_ru:UnifiedGrossMassMeasure,'#.000000')"/>
										</xsl:when>	
										<xsl:otherwise>0</xsl:otherwise>
									</xsl:choose>
								</xsl:if>					
							</td>
							<td align="right">
								<xsl:if test="RUDECLcat:ValueAmount/RUScat_ru:Amount">
									<xsl:choose>
										<xsl:when test="RUDECLcat:ValueAmount/RUScat_ru:Amount &gt; 0">
											<xsl:value-of select="translate(format-number(RUDECLcat:ValueAmount/RUScat_ru:Amount, '#,###.00'),',',' ')"/>
										</xsl:when>
										<xsl:otherwise>0</xsl:otherwise>
									</xsl:choose>
									<span>&#160;</span>
									<xsl:value-of select="RUDECLcat:ValueAmount/RUScat_ru:CurrencyCode"/>
								</xsl:if>					
							</td>
							<td>
								<!--xsl:if test="RUDECLcat:CommodityDescriptionDetails/RUScat_ru:ProductionPlaceName">
									<xsl:value-of select="RUDECLcat:CommodityDescriptionDetails/RUScat_ru:ProductionPlaceName"/>
								</xsl:if-->
							</td>
						</tr>
					</tbody>
				</xsl:for-each>					
			</table>
			<br/>
			
			<!-- ДОКУМЕНТЫ-->
			<table class="w270 border" cellpadding="5">
				<col width="4%" valign="top"/>
				<col width="6%" valign="top"/>
				<col width="25%" valign="top"/>
				<col width="31%" valign="top"/>
				<col width="10%" valign="top"/>
				<col width="15%" valign="top"/>
				<col width="10%" valign="top"/>
				<col width="5%" valign="top"/>
				<thead>
					<tr>
						<td colspan="8"><span class="bold">19. Сведения о документах</span></td>
					</tr>
					<tr valign="middle" align="center" class="italic">
						<td>№ п/п</td>
						<td>Код</td>
						<td>Признак</td>
						<td>Наименование</td>
						<td>Дата</td>
						<td>Номер</td>
						<td>Срок действия</td>
						<td>Номер товара</td>
					</tr>
					<tr valign="middle" align="center" class="italic">
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
						<td>8</td>
					</tr>
				</thead>

				<xsl:call-template name="RUDECLcat:PresentedDocDetails_table"/>
			</table>
		</div>
	</body>
</html>
</xsl:template>

<!-- Шаблон для типа argb:APPNumberType -->
<xsl:template match="argb:APPNumber">
	<xsl:value-of select="cat_ru:CustomsCode"/>
	<xsl:text>/</xsl:text>
	<xsl:call-template name="gtd_date">
		<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
	</xsl:call-template>
	<xsl:text>/</xsl:text>
	<xsl:value-of select="argb:AddNumber"/>
	<xsl:value-of select="cat_ru:GTDNumber"/>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:EECGoodsManufacturerDetailsType -->
<xsl:template match="RUDECLcat:CommodityDescriptionDetails">
	<br/>
	<xsl:if test="RUScat_ru:ManufacturerName">
		<br/>
		<span class="italic">Производитель</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:ManufacturerName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:TradeMarkName">
		<br/>
		<span class="italic">Товарный знак</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:TradeMarkName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:ProductionPlaceName">
		<br/>
		<span class="italic">Место происхождения</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:ProductionPlaceName" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ProductMarkName">
		<br/>
		<span class="italic">Марка</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:ProductMarkName" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ProductModelName">
		<br/>
		<span class="italic">Модель</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:ProductModelName" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ProductId">
		<br/>
		<span class="italic">Артикул</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:ProductId" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ProductSortName">
		<br/>
		<span class="italic">Сорт</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:ProductSortName" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:StandardName">
		<br/>
		<span class="italic">Стандарт</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:StandardName" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ProductInstanceId">
		<br/>
		<span class="italic">Серийный номер</span>
		<span class="normal">: </span>
		<span class="normal">
		<xsl:call-template name="RUDECLcat:ProductInstanceId" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ManufactureDate">
		<br/>
		<span class="italic">Дата производства</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUDECLcat:ManufactureDate" />
			</xsl:call-template>
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:IPObjectRegistryIdDetails">
		<br/>
		<br/>
		<span class="italic">Регистрационный номер ОИС</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:for-each select="RUDECLcat:IPObjectRegistryIdDetails">
				<br/>
				<xsl:if test="catESAD_cu:DocumentModeCode">
					<xsl:choose>
						<xsl:when test="catESAD_cu:DocumentModeCode = '1'">
							<span class="normal"> единый реестр, </span>
						</xsl:when>
						<xsl:when test="catESAD_cu:DocumentModeCode = '2'">
							<span class="normal"> национальный реестр, </span>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="catESAD_cu:CountryCode">
					<xsl:value-of select="catESAD_cu:CountryCode" />
					<span class="normal">, </span>
				</xsl:if>
				<xsl:if test="catESAD_cu:IPORegistryNumber">
					<span class="normal">№ </span>
					<xsl:value-of select="catESAD_cu:IPORegistryNumber" />
				</xsl:if>
			</xsl:for-each>
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:RepresentativePersonDetailsType строка -->
<xsl:template match="RUDECLcat:RepresentativePersonDetails">
	<span class="normal">
		<xsl:apply-templates select="RUDECLcat:SigningDetails" />
	</span>
	<xsl:if test="RUDECLcat:IdentityDocV3Details">
		<br/>
		<xsl:apply-templates select="RUDECLcat:IdentityDocV3Details" />
	</xsl:if>
	<xsl:if test="RUDECLcat:PowerOfAttorneyDetails">
		<br/>
		<span class="italic">Документ, удостоверяющий полномочия</span>
		<span class="normal">: </span>
		<br/>
		<xsl:apply-templates select="RUDECLcat:PowerOfAttorneyDetails" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:SigningDetailsType строка -->
<xsl:template match="RUDECLcat:SigningDetails">
	<br/>
	<xsl:if test="RUScat_ru:SigningDate">
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:SigningDate" />
			</xsl:call-template>
		</span>
	</xsl:if>
	<br/>
	<br/>
	<span class="normal">
		<xsl:value-of select="cat_ru:PersonSurname"/> 
	</span>
	<span class="normal">&#160;</span>
	<span class="normal">
		<xsl:value-of select="cat_ru:PersonName"/>
	</span>
	<xsl:if test="cat_ru:PersonMiddleName">
		<span class="normal">&#160;</span>
		<span class="normal">
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:PersonPost">
		<span class="normal">, </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:PersonPost"/>
		</span>
	</xsl:if>
	<br/>
	<xsl:if test="RUScat_ru:CommunicationDetails">
		<span class="normal">
			<xsl:for-each select="RUScat_ru:CommunicationDetails">
				<xsl:call-template name="CommunicationDetails"/>
			</xsl:for-each>
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:PowerOfAttorneyDetailsType -->
<xsl:template match="RUDECLcat:PowerOfAttorneyDetails|RUDECLcat:RepresentativeContractDetails">
	<br/>
	<xsl:if test="RUDECLcat:PresentedDocumentModeCode">
		<span class="normal">
			<span class="italic"> Код вида документа</span>
			<span class="normal">:</span>
			<xsl:value-of select="RUDECLcat:PresentedDocumentModeCode" />
			<br/>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:PrDocumentName">
		<span class="normal">
			<xsl:value-of select="cat_ru:PrDocumentName" />
		</span>
	</xsl:if>
	<xsl:if test="(string-length(cat_ru:PrDocumentNumber) &gt; 0) or (string-length(cat_ru:PrDocumentDate) &gt; 0)">
		<br/>
	</xsl:if>
	<xsl:if test="cat_ru:PrDocumentDate">
		<span class="normal"> от </span>
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
			</xsl:call-template>
		</span>
		<span class="normal">&#160;</span>
	</xsl:if>
	<xsl:if test="cat_ru:PrDocumentNumber">
		<span class="normal"> № </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:PrDocumentNumber" />
		</span>
	</xsl:if>
	<xsl:if test="(string-length(RUScat_ru:DocStartDate) &gt; 0) or (string-length(RUScat_ru:DocValidityDate) &gt; 0)">
		<br/>
		<span class="italic">действует с  </span>
		<xsl:choose>
			<xsl:when test="string-length(RUScat_ru:DocStartDate) &gt; 0">
				<span class="normal">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="RUScat_ru:DocStartDate" />
					</xsl:call-template>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<span class="normal">'не указано'</span>
			</xsl:otherwise>
		</xsl:choose>
		<span class="italic"> по  </span>
		<xsl:choose>
			<xsl:when test="string-length(RUScat_ru:DocValidityDate) &gt; 0">
				<span class="normal">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="RUScat_ru:DocValidityDate" />
					</xsl:call-template>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<span class="normal">'не указано'</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:if>
	<xsl:if test="RUScat_ru:CountryCode">
		<br/>
		<span class="italic">Код страны</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:CountryCode" />
		</span>
	</xsl:if>
	<xsl:if test="catESAD_cu:CustomsCode">
		<br/>
		<span class="italic">Код зарегистрировавшего ТО</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="catESAD_cu:CustomsCode" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:DocPresentKindCode">
		<br/>
		<span class="italic">Признак представления документа при подаче заявления</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:DocPresentKindCode" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:EDocCode">
		<br/>
		<span class="italic">Код вида электронного документа</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:EDocCode" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:CustomsDeclarationIdDetails">
		<br/>
		<span class="italic">Регистрационный номер таможенной декларации к которой был приложен представляемый документ</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:apply-templates select="RUDECLcat:CustomsDeclarationIdDetails"/>
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:GTDIDType -->
<xsl:template match="RUDECLcat:CustomsDeclarationIdDetails">
	<br/>
	<span class="normal">
		<xsl:value-of select="cat_ru:CustomsCode"/>
	</span>
	<span class="normal">/</span>
	<span class="normal">
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
	</span>
	<span class="normal">/</span>
	<span class="normal">
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</span>
</xsl:template>


<!-- Шаблон для типа cat_ru:ContactType строка -->
<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
	<br/>
	<xsl:if test="cat_ru:Phone">
		<span class="normal">Тел: </span>
		<span class="normal">
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<span class="normal">, </span>
			</xsl:for-each>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:Fax">
		<span class="normal">Факс: </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:Fax"/>
			<span class="normal">, </span>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:Telex">
		<span class="normal">Телекс: </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:Telex"/>
			<span class="normal">, </span>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:E_mail">
		<span class="normal">Email: </span>
		<span class="normal">
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<span class="normal">, </span>
			</xsl:for-each>
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:BrokerRegistryDocDetailsType -->
<xsl:template match="RUDECLcat:BrokerRegistryDocDetails">
	<br/>
	<xsl:choose>
		<xsl:when test="catESAD_cu:DocumentModeCode='2'">
			<span class="normal">Свидетельство таможенного представителя (брокера)</span>
			<br/>
		</xsl:when>
		<xsl:when test="catESAD_cu:DocumentModeCode='3'">
			<span class="normal">Свидетельство таможенного представителя</span>
			<br/>
		</xsl:when>
	</xsl:choose>
	<xsl:if test="cat_ru:PrDocumentName">
		<span class="normal">
			<xsl:value-of select="cat_ru:PrDocumentName" />
		</span>
	</xsl:if>
	<xsl:if test="(string-length(cat_ru:PrDocumentNumber) &gt; 0) or (string-length(cat_ru:PrDocumentDate) &gt; 0)">
		<br/>
	</xsl:if>
	<xsl:if test="cat_ru:PrDocumentDate">
		<span class="normal"> от </span>
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
			</xsl:call-template>
		</span>
		<span class="normal">&#160;</span>
	</xsl:if>
	<xsl:if test="cat_ru:PrDocumentNumber">
		<span class="normal"> № </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:PrDocumentNumber" />
		</span>
	</xsl:if>
	<br/>
	<br/>
	<span class="italic">Идентификатор ЮЛ</span>
	<span class="normal">:  </span>
	<xsl:value-of select="RUDECLcat:RegistrationNumberId" />
	<xsl:if test="RUDECLcat:ReregistrationCode">
		<br/>
		<br/>
		<span class="italic">Признак перерегистрации</span>
		<span class="normal">:  </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:ReregistrationCode" />
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:GoodsLocationDetailsType -->
<xsl:template match="RUDECLcat:GoodsLocationDetails">
	<br/>
	<table>
		<tr>
			<td width="5%"><span class="normal"><xsl:value-of select="RUDECLcat:GoodsLocationCode" /></span></td>
			<td width="15%"><span class="normal"><xsl:value-of select="RUDECLcat:CustomsOfficeCode" /></span></td>
			<td width="5%">
				<span class="normal">
					<xsl:if test="RUDECLcat:CountryCode">
						<span class="normal">  (</span>
						<xsl:value-of select="RUDECLcat:CountryCode" />
						<span class="normal">)</span>
					</xsl:if>
				</span>
			</td>
			<td></td>
		</tr>
		<xsl:if test="RUDECLcat:GoodsLocationName">
			<tr>
				<td colspan="4">
					<span class="normal">
						<xsl:apply-templates select="RUDECLcat:GoodsLocationName" />
					</span>
				</td>
			</tr>
		</xsl:if>	
		<xsl:if test="RUDECLcat:CustomsControlZoneId">
			<tr>
				<td colspan="4">
					<span class="normal">
						<xsl:apply-templates select="RUDECLcat:CustomsControlZoneId" />
					</span>
				</td>
			</tr>
		</xsl:if>	
		<xsl:if test="RUDECLcat:GoodsLocationDocDetails">
			<tr>
				<td colspan="4">
					<span class="normal">
						<xsl:apply-templates select="RUDECLcat:GoodsLocationDocDetails" />
					</span>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td colspan="4">
				<span class="normal">
					<xsl:apply-templates select="RUDECLcat:GoodLocationTransportMeansDetails" />
				</span>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<span class="normal">
					<xsl:for-each select="RUDECLcat:UnifiedAddressDetails">
						<xsl:call-template name="Address"/>
					</xsl:for-each>
				</span>
			</td>
		</tr>
	</table>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:GoodLocationTransportMeansDetailsType -->
<xsl:template match="RUDECLcat:GoodLocationTransportMeansDetails">
	<br/>
	<span class="normal">Транспорт: </span>
	<span class="normal">
		<xsl:if test="RUScat_ru:UnifiedTransportModeCode">
			<span class="normal">код вида </span>
			<xsl:value-of select="RUScat_ru:UnifiedTransportModeCode" />
		</xsl:if>
		<xsl:for-each select="RUScat_ru:TransportMeansRegId">
			<xsl:apply-templates select="." />
		</xsl:for-each>
	</span>	
</xsl:template>

<!-- Шаблон для типа RUScat_ru:TransportMeansRegIdType -->
<xsl:template match="RUScat_ru:TransportMeansRegId">
	<br/>
	<span class="normal">
		<xsl:value-of select="RUScat_ru:TransportMeansRegIdNumber" />
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode" />
			<span class="normal">)</span>
		</xsl:if>
	</span>	
</xsl:template>

<!-- Шаблон для типа RUDECLcat:GuaranteeDetailsType -->
<xsl:template match="RUDECLcat:GuaranteeDetails">
	<br/>
	<span class="normal">
		<xsl:choose>
			<xsl:when test="RUDECLcat:GuaranteeIndicator = 'true' or RUDECLcat:GuaranteeIndicator = '1'">
				<table>
					<tr>
						<td class="bordered" width="6%" align="center"><span class="normal">V</span></td>
						<td><span class="normal"> - признак предоставления обеспечения</span></td>
					</tr>
				</table>
			</xsl:when>
			<xsl:otherwise>
				<table>
					<tr>
						<td class="bordered" width="6%" align="center"><span class="normal">&#160;</span></td>
						<td><span class="normal"> - признак предоставления обеспечения</span></td>
					</tr>
				</table>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="RUDECLcat:PaymentGuaranteeDetails">
			<xsl:for-each select="RUDECLcat:PaymentGuaranteeDetails">
				<xsl:apply-templates select="." />
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUDECLcat:AdditionalInfoText">
			<br/>
			<span class="italic">Основания по которым обеспечение не предоставляется</span>
			<span class="normal">: </span>
			<span class="normal"><xsl:value-of select="RUDECLcat:AdditionalInfoText" /></span>
		</xsl:if>
	</span>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:PaymentGuaranteeDetailsType -->
<xsl:template match="RUDECLcat:PaymentGuaranteeDetails">
	<br/>
	<table>
		<tr>
			<td width="5%"><span class="normal"><xsl:value-of select="RUDECLcat:PaymentGuaranteeMethodCode" /></span></td>
			<td width="20%">
				<span class="normal">
					<xsl:choose>
						<xsl:when test="RUDECLcat:GuaranteeAmount/RUScat_ru:Amount &gt; 0">
							<xsl:value-of select="translate(format-number(RUDECLcat:GuaranteeAmount/RUScat_ru:Amount, '#,###.00'),',',' ')" />
						</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</span>
			</td>
			<td width="15%"><span class="normal"><xsl:value-of select="RUDECLcat:GuaranteeAmount/RUScat_ru:CurrencyCode" /></span></td>
		</tr>
		<tr>
			<td colspan="3">
				<span class="normal">
					<xsl:apply-templates select="RUDECLcat:GuaranteeDocDetails" />
				</span>
			</td>
		</tr>
	</table>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:DocBaseType -->
<xsl:template match="RUDECLcat:GuaranteeDocDetails|RUDECLcat:GoodsLocationDocDetails">
	<span class="normal">
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:value-of select="RUScat_ru:CountryCode" />
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName" />
		</xsl:if>
		<xsl:if test="(string-length(cat_ru:PrDocumentNumber) &gt; 0) or (string-length(cat_ru:PrDocumentDate) &gt; 0)">
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<span class="normal"> № </span>
			<xsl:value-of select="cat_ru:PrDocumentNumber" />
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<span class="normal"> от </span>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
				</xsl:call-template>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="(string-length(RUScat_ru:DocStartDate) &gt; 0) or (string-length(RUScat_ru:DocValidityDate) &gt; 0)">
			<br/>
			<span class="italic">действует с  </span>
			<xsl:choose>
				<xsl:when test="string-length(RUScat_ru:DocStartDate) &gt; 0">
					<span class="normal">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="RUScat_ru:DocStartDate" />
						</xsl:call-template>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<span class="normal">'не указано'</span>
				</xsl:otherwise>
			</xsl:choose>
			<span class="italic"> по  </span>
			<xsl:choose>
				<xsl:when test="string-length(RUScat_ru:DocValidityDate) &gt; 0">
					<span class="normal">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="RUScat_ru:DocValidityDate" />
						</xsl:call-template>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<span class="normal">'не указано'</span>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</span>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:CountryDetailsType -->
<xsl:template match="RUDECLcat:DepartureCountry|RUDECLcat:DestinationCountry">
	<br/>
	<span class="normal"><xsl:value-of select="RUScat_ru:CountryCode" /></span> 
	<xsl:if test="RUScat_ru:CountryName">
		<br/>
		<span class="normal"><xsl:value-of select="RUScat_ru:CountryName" /></span> 
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:RUAddressType -->
<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
	<xsl:if test="RUScat_ru:AddressKindCode">
		<span class="italic"> (код вида адреса</span>
		<span class="normal">: </span> 
		<span class="normal"><xsl:value-of select="RUScat_ru:AddressKindCode" /></span> 
		<span class="normal">) </span>
	</xsl:if>
	<span class="normal">: </span> 
	<xsl:if test="RUScat_ru:PostalCode">
		<span class="normal"><xsl:value-of select="RUScat_ru:PostalCode" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:CountryCode">
		<span class="normal"><xsl:value-of select="RUScat_ru:CountryCode" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:CounryName">
		<span class="normal"><xsl:value-of select="RUScat_ru:CounryName" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:Region">
		<span class="normal"><xsl:value-of select="RUScat_ru:Region" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:District">
		<span class="normal"><xsl:value-of select="RUScat_ru:District" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:Town">
		<span class="normal"><xsl:value-of select="RUScat_ru:Town" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:City">
		<span class="normal"><xsl:value-of select="RUScat_ru:City" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:StreetHouse">
		<span class="normal"><xsl:value-of select="RUScat_ru:StreetHouse" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:House">
		<span class="normal"><xsl:value-of select="RUScat_ru:House" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:Room">
		<span class="normal"><xsl:value-of select="RUScat_ru:Room" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:AddressText">
		<span class="normal"><xsl:value-of select="RUScat_ru:AddressText" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:OKTMO">
		<span class="normal">ОКТМО </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:OKTMO" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:OKATO">
		<span class="normal">OKАTO </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:OKATO" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:KLADR">
		<span class="normal">КЛАДР </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:KLADR" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:AOGUID">
		<span class="normal">Глобальный идентификатор адресного объекта по ФИАС </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:AOGUID" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:TerritoryCode">
		<span class="normal">Код единицы административно-территориального деления </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:TerritoryCode" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:PostOfficeBoxId">
		<span class="normal">а/я </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:PostOfficeBoxId" /></span> 
		<span class="normal">, </span>
	</xsl:if>
</xsl:template>


<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
	<br/>
	<span class="italic">Код ОПФ: </span>
	<xsl:value-of select="RUScat_ru:UnifiedCode" />
	<xsl:if test="RUScat_ru:CodeListId">
		<span class="normal"> (</span>
		<span class="italic"> по справ. </span>
		<xsl:value-of select="RUScat_ru:CodeListId" />
		<span class="normal">)</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
<xsl:template match="RUScat_ru:IdentityCard|RUDECLcat:IdentityDocV3Details">
	<br/>
	<span class="italic">Документ, удостоверяющий полномочия</span>
	<span class="normal">: </span>
	<br/>
	<xsl:if test="cat_ru:IdentityCardCode">
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardCode" />
		</span>
		<span class="normal">&#160;</span>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardName">
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:FullIdentityCardName">
		<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
			<span class="normal"> (</span>
		</xsl:if>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:FullIdentityCardName" />
		</span>
		<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
			<span class="normal">)</span>
		</xsl:if>
	</xsl:if>
		
	<xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
		<br/>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardSeries">
		<span class="normal">серия</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardSeries" />
		</span>
		<xsl:if test="string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">&#160;</span>
		</xsl:if>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardNumber">
		<span class="normal">№</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardNumber" />
		</span>
	</xsl:if>
	<xsl:if test="string-length(cat_ru:IdentityCardDate) &gt; 0 or string-length(cat_ru:OrganizationName) &gt; 0">
		<!--xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
		<br/>
		<span class="italic">выдан</span>
		<span class="normal">: </span>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardDate">
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate" />
			</xsl:call-template>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:OrganizationName">	
		<span class="normal">&#160;</span>
		<span class="normal">
			<xsl:value-of select="cat_ru:OrganizationName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:IssuerCode">	
		<br/>
		<span class="italic">код подразделения</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:IssuerCode" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:AuthorityId">	
		<br/>
		<span class="italic">идентификатор организации</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:AuthorityId" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:CountryCode">	
		<br/>
		<span class="italic">страна в уд.личности</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:CountryCode" />
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:UITN40Type -->
<xsl:template match="RUScat_ru:UITN">
	<br/>
	<span class="italic">УИТН</span>
	<span class="normal">: </span>
	<xsl:value-of select="RUScat_ru:UITNCode" />
	<xsl:if test="RUScat_ru:CountryCode">
		<span class="normal">( </span>
		<span class="italic">страна </span>
		<xsl:value-of select="RUScat_ru:CountryCode" />
		<span class="normal">)</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:AEORegistryIdDetailsType -->
<xsl:template match="RUDECLcat:AEORegistryIdDetails">
	<span class="italic">Код типа реестра</span>
	<span class="normal">: </span>
	<xsl:value-of select="RUScat_ru:RegistryOwnerCode" />
	<xsl:if test="RUScat_ru:CountryA2Code">
		<br/>
		<span class="italic">Код страны</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:CountryA2Code" />
	</xsl:if>
	<br/>
	<span class="italic">№ св-ва УЭО</span>
	<span class="normal">: </span>
	<xsl:value-of select="RUScat_ru:DocId" />
	<br/>
	<span class="italic">Код типа св-ва УЭО</span>
	<span class="normal">: </span>
	<xsl:value-of select="RUScat_ru:AEORegistryKindCode" />
</xsl:template>

<!-- Шаблон для типа RUDECLcat:AEODeclarantDetailsType -->
<xsl:template match="argb:DeclarantDetails">
	<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RKOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RBOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RAOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:KGOrganizationFeatures" />

	<xsl:if test="cat_ru:OrganizationName">
		<br/>
		<br/>
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
	<br/>

	<xsl:if test="RUScat_ru:CountryA2Code">
		<br/>
		<span class="italic">Код страны</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:CountryA2Code" />
	</xsl:if>

	<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
		<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode" />
	</xsl:if>

	<xsl:if test="RUScat_ru:BusinessEntityTypeName">
		<br/>
		<span class="italic">ОПФ</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:BusinessEntityTypeName" />
	</xsl:if>
	
	<xsl:if test="RUScat_ru:UITN">
		<xsl:apply-templates select="RUScat_ru:UITN" />
	</xsl:if>

	<xsl:if test="RUScat_ru:PersonId">
		<br/>
		<span class="italic">УИ ФЛ</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:PersonId" />
	</xsl:if>

	<xsl:if test="RUScat_ru:IdentityCard">
		<xsl:apply-templates select="RUScat_ru:IdentityCard" />
	</xsl:if>

	<xsl:if test="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<xsl:call-template name="Address"/>
		</xsl:for-each>
	</xsl:if>

	<xsl:if test="RUScat_ru:CommunicationDetails">
		<span class="normal">
			<xsl:for-each select="RUScat_ru:CommunicationDetails">
				<xsl:call-template name="CommunicationDetails"/>
			</xsl:for-each>
		</span>
	</xsl:if>
	
</xsl:template>

<!-- Шаблон для типа RUScat_ru:SubjectBranchDetailsType -->
<xsl:template match="RUDECLcat:ConsignorDetails|RUDECLcat:ConsigneeDetails">
	<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RKOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RBOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RAOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:KGOrganizationFeatures" />

	<xsl:if test="cat_ru:OrganizationName">
		<br/>
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
	<br/>

	<xsl:if test="RUScat_ru:CountryA2Code">
		<br/>
		<span class="italic">Код страны</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:CountryA2Code" />
	</xsl:if>

	<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
		<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode" />
	</xsl:if>

	<xsl:if test="RUScat_ru:BusinessEntityTypeName">
		<br/>
		<span class="italic">ОПФ</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:BusinessEntityTypeName" />
	</xsl:if>
	
	<xsl:if test="RUScat_ru:UITN">
		<xsl:apply-templates select="RUScat_ru:UITN" />
	</xsl:if>

	<xsl:if test="RUScat_ru:PersonId">
		<br/>
		<span class="italic">УИ ФЛ</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:PersonId" />
	</xsl:if>

	<xsl:if test="RUScat_ru:IdentityCard">
		<xsl:apply-templates select="RUScat_ru:IdentityCard" />
	</xsl:if>

	<xsl:if test="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<xsl:call-template name="Address"/>
		</xsl:for-each>
	</xsl:if>
	
</xsl:template>

<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
<xsl:template match="cat_ru:RFOrganizationFeatures">
	<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
		<br/>
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
	<xsl:if test="cat_ru:OGRN">
		<br/>
		<span class="italic">ОГРН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:OGRN" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
<xsl:template match="cat_ru:RKOrganizationFeatures">
	<xsl:if test="cat_ru:BIN">
		<br/>
		<span class="italic">БИН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:BIN" />
	</xsl:if>
	<xsl:if test="cat_ru:IIN">
		<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
			<span class="normal"> / </span>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:BIN) = 0">
			<br/>
		</xsl:if>
		<span class="italic">ИИН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:IIN" />
	</xsl:if>
	<xsl:if test="cat_ru:ITN">
		<br/>
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
		<br/>
		<span class="italic">УНП</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:UNP" />
	</xsl:if>
	<xsl:if test="cat_ru:RBIdentificationNumber">
		<br/>
		<span class="italic">ИНФЛ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:RBIdentificationNumber" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
<xsl:template match="cat_ru:RAOrganizationFeatures">
	<xsl:if test="cat_ru:UNN">
		<br/>
		<span class="italic">УНН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:UNN" />
	</xsl:if>
	<xsl:if test="cat_ru:SocialServiceNumber">
		<br/>
		<span class="italic">НЗОУ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:SocialServiceNumber" />
	</xsl:if>
	<xsl:if test="cat_ru:SocialServiceCertificate">
		<br/>
		<span class="italic">№ справки об отсутв. НЗОУ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:SocialServiceCertificate" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
<xsl:template match="cat_ru:KGOrganizationFeatures">
	<xsl:if test="cat_ru:KGINN">
		<br/>
		<span class="italic">ИНН(ПИН)</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:KGINN" />
	</xsl:if>
	<xsl:if test="cat_ru:KGOKPO">
		<br/>
		<span class="italic">ОКПО</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:KGOKPO" />
	</xsl:if>
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

<xsl:template name="Address">
	<br/>
	<span class="italic">Адрес</span>
	<span class="normal">: </span>
	<xsl:variable name="temp">
		<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
	</xsl:variable>
	<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
</xsl:template>

<xsl:template name="CommunicationDetails">
	<br/>
	<span class="italic">Контактные данные</span>
	<span class="normal">: </span>
	<xsl:variable name="temp">
		<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
	</xsl:variable>
	<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
</xsl:template>

<xsl:template name="RUDECLcat:ProductInstanceId"> 
	<xsl:for-each select="RUDECLcat:ProductInstanceId">
		<xsl:value-of select="." />
		<xsl:if test="not(position()=last())">, </xsl:if>
	</xsl:for-each>
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
 
<xsl:key match="argb:GoodsShipmentDetails/RUDECLcat:GoodsItemDetails/RUDECLcat:PresentedDocDetails" name="rows_Presented" use="."/>
<!-- Таблица представленных документов -->   
<xsl:template name="RUDECLcat:PresentedDocDetails_table">
    <xsl:copy>

		<xsl:for-each select="argb:GoodsShipmentDetails/RUDECLcat:GoodsItemDetails/RUDECLcat:PresentedDocDetails[generate-id(key('rows_Presented',.)[1])=generate-id()]">
			<xsl:sort select="cat_ru:PrDocumentName"/>
			<xsl:sort select="cat_ru:PrDocumentDate"/>
			<xsl:sort select="cat_ru:PrDocumentNumber"/>

				<tbody class="normal">
					<tr>
						<td class="bordered" align="center">
							<xsl:number value="position()"/>
               			</td>
						<td class="bordered" align="center">
							<xsl:if test="catESAD_cu:PresentedDocumentModeCode">
								<xsl:value-of select="catESAD_cu:PresentedDocumentModeCode"/>
							</xsl:if>
						</td>
						<td class="bordered" align="center">
							<xsl:if test="RUDECLcat:AppProvidingIndicationMark">
								<xsl:value-of select="RUDECLcat:AppProvidingIndicationMark"/>
								<xsl:choose>
									<xsl:when test="RUDECLcat:AppProvidingIndicationMark='1'">
										<span class="normal"> (</span>
										<span class="italic">документ представлен</span>
										<span class="normal">)</span>
									</xsl:when>
									<xsl:when test="RUDECLcat:AppProvidingIndicationMark='2'">
										<span class="normal"> (</span>
										<span class="italic">документ не представлен (ранее был представлен в таможенный орган)</span>
										<span class="normal">)</span>
									</xsl:when>
									<xsl:when test="RUDECLcat:AppProvidingIndicationMark='3'">
										<span class="normal"> (</span>
										<span class="italic">документ не представлен (будет представлен до выпуска товаров (для документов, подтверждающих сведения о происхождении товаров, соблюдении запретов и ограничений), после выпуска товаров (когда соблюдение запретов и ограничений в соответствии с Договором о Евразийском экономическом союзе от 29 мая 2014 года и (или) законодательством государств - членов Союза может быть подтверждено после выпуска товаров)</span>
										<span class="normal">)</span>
									</xsl:when>
									<xsl:when test="RUDECLcat:AppProvidingIndicationMark='4'">
										<span class="normal"> (</span>
										<span class="italic">документ не представлен в соответствии с пунктом 2 статьи 80 Кодекса (может быть получен из информационных систем таможенного органа (для документов, выдаваемых таможенным органом))</span>
										<span class="normal">)</span>
									</xsl:when>
									<xsl:when test="RUDECLcat:AppProvidingIndicationMark='5'">
										<span class="normal"> (</span>
										<span class="italic">документ не представлен в соответствии с пунктом 2 статьи 80 Кодекса (может быть получен из информационных систем государственных органов (организаций) в рамках информационного взаимодействия таможенных органов и государственных органов (организаций) государств - членов Союза)</span>
										<span class="normal">)</span>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="RUDECLcat:AppProvidingIndicationMark='2'">
										<xsl:if test="string-length(RUDECLcat:CustomsDeclarationIdDetails) &gt; 0">
											<span class="normal"> / </span>
											<xsl:apply-templates select="RUDECLcat:CustomsDeclarationIdDetails"/>
										</xsl:if>
									</xsl:when>
									<xsl:when test="RUDECLcat:AppProvidingIndicationMark='3'">
										<xsl:if test="string-length(catESAD_cu:PresentingLackingDate) &gt; 0">
											<span class="normal"> / </span>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="catESAD_cu:PresentingLackingDate" />
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
								</xsl:choose>
							</xsl:if>
						</td>
						<xsl:choose>
							<xsl:when test="cat_ru:PrDocumentName">
								<td class="bordered">
									<xsl:value-of select="cat_ru:PrDocumentName"/>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="bordered" align="center">
									<span>&#8212;</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="cat_ru:PrDocumentDate">
								<td class="bordered">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
									</xsl:call-template>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="bordered" align="center">
									<span>&#8212;</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="cat_ru:PrDocumentNumber">
								<td class="bordered">
									<xsl:value-of select="cat_ru:PrDocumentNumber"/>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="bordered" align="center">
									<span>&#8212;</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="bordered" align="center">
							<xsl:if test="catESAD_cu:DocumentEndActionsDate">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate" />
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="bordered" align="center">
							<xsl:call-template name="GetGoodsNumberForPresentedDocDetails">
								<xsl:with-param name="PresentedDocDetails" select="." />
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
		</xsl:for-each>
    </xsl:copy>
</xsl:template>

<xsl:key match="argb:GoodsShipmentDetails/RUDECLcat:GoodsItemDetails/RUDECLcat:PrecedingDocDetails" name="rows_Preceding" use="concat(RUDECLcat:PrecedingDocumentName,'-',RUDECLcat:PrecedingDocumentModeCode,'-',RUDECLcat:Country2ACode,'-',RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentCustomsCode,'-',RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentDate,'-',RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentNumber,'-',RUDECLcat:PrecedingDocumentOther/RUDECLcat:DocId,'-',RUDECLcat:PrecedingDocumentOther/RUDECLcat:DocCreationDate)"/>
<!-- Таблица предшествующих документов -->   
<xsl:template name="RUDECLcat:PrecedingDocDetails_info">
    <xsl:copy>

		<xsl:for-each select="argb:GoodsShipmentDetails/RUDECLcat:GoodsItemDetails/RUDECLcat:PrecedingDocDetails[generate-id(key('rows_Preceding',concat(RUDECLcat:PrecedingDocumentName,'-',RUDECLcat:PrecedingDocumentModeCode,'-',RUDECLcat:Country2ACode,'-',RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentCustomsCode,'-',RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentDate,'-',RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentNumber,'-',RUDECLcat:PrecedingDocumentOther/RUDECLcat:DocId,'-',RUDECLcat:PrecedingDocumentOther/RUDECLcat:DocCreationDate))[1])=generate-id()]">
		
			<xsl:sort select="RUDECLcat:PrecedingDocumentName"/>
			<xsl:sort select="RUDECLcat:PrecedingDocumentModeCode"/>
			<xsl:sort select="RUDECLcat:Country2ACode"/>
			<xsl:sort select="RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentCustomsCode"/>
			<xsl:sort select="RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentDate"/>
			<xsl:sort select="RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentNumber"/>
			<xsl:sort select="RUDECLcat:PrecedingDocumentOther/RUDECLcat:DocId"/>
			<xsl:sort select="RUDECLcat:PrecedingDocumentOther/RUDECLcat:DocCreationDate"/>

			<br/>
			<span class="normal">
				<xsl:if test="RUDECLcat:PrecedingDocumentName">
					<xsl:value-of select="RUDECLcat:PrecedingDocumentName"/>
					<br/>
				</xsl:if>
				<xsl:if test="RUDECLcat:PrecedingDocumentModeCode">
					<xsl:value-of select="RUDECLcat:PrecedingDocumentModeCode"/>&#160;
				</xsl:if>
				<xsl:if test="RUDECLcat:Country2ACode">
					(<xsl:value-of select="RUDECLcat:Country2ACode"/>)&#160;
				</xsl:if>
				<xsl:if test="RUDECLcat:PrecedingDocumentCustoms">
					<xsl:if test="RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentCustomsCode">
						<xsl:value-of select="RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentCustomsCode"/>
					</xsl:if>
					<span class="normal">/</span>
					<xsl:if test="RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentDate">
						<xsl:call-template name="gtd_date">
							<xsl:with-param name="dateIn" select="RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentDate"/>
						</xsl:call-template>
					</xsl:if>
					<span class="normal">/</span>
					<xsl:if test="RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentNumber">
						<xsl:value-of select="RUDECLcat:PrecedingDocumentCustoms/RUDECLcat:PrecedingDocumentNumber"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="RUDECLcat:PrecedingDocumentOther">
					<xsl:if test="RUDECLcat:PrecedingDocumentOther/RUDECLcat:DocCreationDate">
						<span class="normal">от </span>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="RUDECLcat:PrecedingDocumentOther/RUDECLcat:DocCreationDate" />
						</xsl:call-template>&#160;
					</xsl:if>
					<xsl:if test="RUDECLcat:PrecedingDocumentOther/RUDECLcat:DocId">
						<span class="normal">№ </span>
						<xsl:value-of select="RUDECLcat:PrecedingDocumentOther/RUDECLcat:DocId"/>
					</xsl:if>
				</xsl:if>
			</span>
			<br/>
		</xsl:for-each>
    </xsl:copy>
</xsl:template>

<xsl:template name="GetGoodsNumberForPresentedDocDetails"> 
	<xsl:param name="PresentedDocDetails"/>
	<xsl:for-each select="//argb:AppReleaseGoodsBeforeDT/argb:GoodsShipmentDetails/RUDECLcat:GoodsItemDetails[RUDECLcat:PresentedDocDetails=$PresentedDocDetails]/RUScat_ru:GoodsNumeric">
			<xsl:value-of select="." />
			<xsl:if test="not(position()=last())">, </xsl:if>
	</xsl:for-each>
</xsl:template>
 
</xsl:stylesheet>