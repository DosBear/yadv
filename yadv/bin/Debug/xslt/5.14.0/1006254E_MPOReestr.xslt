<?xml version="1.0" encoding="utf-8"?>
<!-- Приложение № 1 к Порядку использования Единой автоматизированной информационной системы таможенных органов при совершении таможенных операций в отношении товаров для личного пользования, приобретенных физическим лицом в рамках международной электронной торговли, пересылаемых в международных почтовых отправлениях-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.14.0" xmlns:mpre="urn:customs.ru:Information:CustomsDocuments:MPOReestr:5.14.0">
	<!-- Шаблон для типа MPOReestrType -->
	<xsl:template match="mpre:MPOReestr">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-size: 9pt;
					}

					div.page {
					/*width: 297mm;*/
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
					font-size:10pt
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
									<b>РЕЕСТР<br/>
										ДОКУМЕНТОВ, ПРЕДУСМОТРЕННЫХ АКТАМИ ВСЕМИРНОГО ПОЧТОВОГО СОЮЗА И СОПРОВОЖДАЮЩИХ МЕЖДУНАРОДНЫЕ ПОЧТОВЫЕ<br/> ОТПРАВЛЕНИЯ, И СВЕДЕНИЙ ПО НЕСКОЛЬКИМ МЕЖДУНАРОДНЫМ ПОЧТОВЫМ ОТПРАВЛЕНИЯМ
									</b>
									<br/>
									№ <span style="border-bottom: 1px solid;"><xsl:value-of select="mpre:Reestr_ID"/></span>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td class="value" align="center">
									<xsl:apply-templates select="mpre:AuthorizedOperator"/>
								</td>
							</tr>
							<tr>
								<td style="font-size: 7pt;" align="center">(наименование уполномоченного оператора и место его нахождения; идентификационный номер налогоплательщика (ИНН), общероссийский классификатор предприятий и организаций (ОКПО) и код причины постановки на учет (КПП)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr align="center" valign="top">
								<td rowspan="2" class="bordered">№ п/п</td>
								<td rowspan="2" class="bordered">Уникальный номер МПО</td>
								<td rowspan="2" class="bordered">Отправитель (наименование организации либо Ф.И.О. отправителя)</td>
								<td rowspan="2" class="bordered">Страна отправления</td>
								<td rowspan="2" class="bordered">Адрес отправителя</td>
								<td rowspan="2" class="bordered">Ф.И.О. получателя</td>
								<td rowspan="2" class="bordered">Адрес физического лица - получателя товаров</td>
								<td rowspan="2" class="bordered">Идентификационный номер налогоплательщика<sup>1</sup> - получателя товаров</td>
								<td rowspan="2" class="bordered">Сведения о документе, удостоверяющем личность получателя<sup>2</sup></td>
								<td rowspan="2" class="bordered">Наименование товара<sup>3</sup></td>
								<td rowspan="2" class="bordered">Наименование объекта интеллектуальной собственности</td>
								<td rowspan="2" class="bordered">Код товара по ТН ВЭД ЕАЭС<sup>4</sup></td>
								<td rowspan="2" class="bordered">Кол-во товара</td>
								<td rowspan="2" class="bordered">Вес нетто товаров, кг</td>
								<td rowspan="2" class="bordered">Вес брутто МПО, кг</td>
								<td colspan="2" class="bordered">Стоимость</td>
								<td rowspan="2" class="bordered">Общая стоимость и общий вес товаров за календарный месяц, ранее поступивших в адрес получателя</td>
								<td rowspan="2" class="bordered">Расчет таможенных пошлин, налогов</td>
								<td rowspan="2" class="bordered">Применение запретов и ограничений<sup>5</sup></td>
								<td rowspan="2" class="bordered">Номер и дата заказа товара<sup>6</sup></td>
								<td rowspan="2" class="bordered">Информация о размещения МПО в зоне таможенного контроля ММПО<sup>7</sup></td>
								<td rowspan="2" class="bordered">Примечание<sup>8</sup></td>
							</tr>
							<tr>
								<td class="bordered">евро</td>
								<td class="bordered">рубли</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
								<td class="bordered">6</td>
								<td class="bordered">7</td>
								<td class="bordered">8</td>
								<td class="bordered">9</td>
								<td class="bordered">10</td>
								<td class="bordered">11</td>
								<td class="bordered">12</td>
								<td class="bordered">13</td>
								<td class="bordered">14</td>
								<td class="bordered">15</td>
								<td class="bordered">16</td>
								<td class="bordered">17</td>
								<td class="bordered">18</td>
								<td class="bordered">19</td>
								<td class="bordered">20</td>
								<td class="bordered">21</td>
								<td class="bordered">22</td>
								<td class="bordered">23</td>
							</tr>
							<xsl:for-each select="mpre:MPODetail">
								<xsl:variable name="cols" select="count(mpre:MPODecl/mpco:Goods)"/>
								<tr valign="top">
									<td class="bordered" rowspan="{$cols}">
										<xsl:value-of select="mpre:RecNum"/>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:value-of select="mpre:MPO_ID"/>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:value-of select="mpre:MPODecl/mpco:Consignor/cat_ru:OrganizationName"/>
										<xsl:if test="not(mpre:MPODecl/mpco:Consignor/cat_ru:OrganizationName) and mpre:MPODecl/mpco:Consignor/cat_ru:ShortName">
											<xsl:value-of select="mpre:MPODecl/mpco:Consignor/cat_ru:ShortName"/>
										</xsl:if>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:value-of select="mpre:MPODecl/mpco:DepartureCountry"/>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:for-each select="mpre:MPODecl/mpco:Consignor/cat_ru:Address/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:value-of select="mpre:MPODecl/mpco:Consignee/cat_ru:OrganizationName"/>
										<xsl:if test="not(mpre:MPODecl/mpco:Consignee/cat_ru:OrganizationName) and mpre:MPODecl/mpco:Consignee/cat_ru:ShortName">
											<xsl:value-of select="mpre:MPODecl/mpco:Consignee/cat_ru:ShortName"/>
										</xsl:if>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:for-each select="mpre:MPODecl/mpco:Consignee/cat_ru:Address/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:value-of select="mpre:MPODecl/mpco:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:for-each select="mpre:MPODecl/mpco:Consignee/cat_ru:IdentityCard/*">
											<xsl:choose>
												<xsl:when test="contains(local-name(.),'Date')">
													<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
											</xsl:choose>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="mpre:MPODecl/mpco:Goods[1]/mpco:GoodDescription"/>
										<xsl:if test="not(mpre:MPODecl/mpco:Goods[1]/mpco:GoodDescription) and mpre:MPODecl/mpco:Goods[1]/mpco:GoodDescriptionForeign">
											<xsl:apply-templates select="mpre:MPODecl/mpco:Goods[1]/mpco:GoodDescriptionForeign"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:value-of select="mpre:MPODecl/mpco:Goods[1]/mpco:TradeMark"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="mpre:MPODecl/mpco:Goods[1]/mpco:TNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="mpre:MPODecl/mpco:Goods[1]/mpco:GoodsQuantity"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="mpre:MPODecl/mpco:Goods[1]/mpco:NetWeight"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="mpre:MPODecl/mpco:Goods[1]/mpco:GrossWeight"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="mpre:MPODecl/mpco:Goods[1]/mpco:CostEURO"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="mpre:MPODecl/mpco:Goods[1]/mpco:CostRUS"/>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:if test="mpre:MPODecl/mpco:TotalCostEURO">
											<xsl:value-of select="mpre:MPODecl/mpco:TotalCostEURO"/>
											<xsl:text> евро, </xsl:text>
										</xsl:if>
										<xsl:if test="mpre:MPODecl/mpco:TotalCostRUS">
											<xsl:value-of select="mpre:MPODecl/mpco:TotalCostRUS"/>
											<xsl:text> руб, </xsl:text>
										</xsl:if>
										<xsl:if test="mpre:MPODecl/mpco:TotalGrossWeight">
											<xsl:value-of select="mpre:MPODecl/mpco:TotalGrossWeight"/>
											<xsl:text> кг</xsl:text>
										</xsl:if>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:for-each select="mpre:MPODecl/mpco:CustomsDuties">
											<xsl:for-each select="*">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">&#160;</xsl:if>
											</xsl:for-each>
											<xsl:if test="position()!=last()">;<br/></xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:for-each select="mpre:MPODecl/mpco:DocumentInfo">
											<xsl:for-each select="*">
												<xsl:choose>
													<xsl:when test="contains(local-name(.),'Date')"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
													<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
												</xsl:choose>
												<xsl:if test="position()!=last()">&#160;</xsl:if>
											</xsl:for-each>
											<xsl:if test="position()!=last()">;<br/></xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:value-of select="mpre:MPODecl/mpco:OrderNumber"/>
										<xsl:if test="mpre:MPODecl/mpco:OrderDate">
											<xsl:text> от </xsl:text>
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpre:MPODecl/mpco:OrderDate"/></xsl:call-template>
										</xsl:if>
										<xsl:if test="mpre:MPODecl/mpco:URLShop">
											<br/>
											<xsl:value-of select="mpre:MPODecl/mpco:URLShop"/>
										</xsl:if>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:value-of select="mpre:MPODecl/mpco:MMPOName"/>
									</td>
									<td class="bordered" rowspan="{$cols}">
										<xsl:for-each select="mpre:MPODecl">
											<xsl:if test="mpco:ReceiptNumber or mpco:ReceiptDate">
												квитация плательщика
												<xsl:if test="mpco:ReceiptNumber"> № <xsl:value-of select="mpco:ReceiptNumber"/></xsl:if>
												<xsl:if test="mpco:ReceiptDate"> от &#32;
													<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpco:ReceiptDate"/></xsl:call-template>
												</xsl:if>
											</xsl:if>
											<xsl:if test="mpco:Comment">
												<br/>
												<xsl:value-of select="mpco:Comment"/>
											</xsl:if>
											<xsl:for-each select="mpco:Information/mpco:PackingState">
												<br/>
												<xsl:choose>
													<xsl:when test="mpco:Value=0 or mpco:Value='false'">упаковка нарушена </xsl:when>
													<xsl:when test="mpco:Value=1 or mpco:Value='true'">упаковка целостна </xsl:when>
												</xsl:choose>
												<xsl:value-of select="mpco:Remark"/>
											</xsl:for-each>
											<xsl:if test="mpco:DispatchNumber">
												<br/>номер депеши: <xsl:value-of select="mpco:DispatchNumber"/>
											</xsl:if>
											<xsl:if test="mpco:MPOKind">
												<br/>вид отправления: &#32;
												<xsl:for-each select="mpco:MPOKind/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()"> </xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="mpco:ConsignmentCategory">
												<br/>категория отправления: &#32;
												<xsl:for-each select="mpco:ConsignmentCategory/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()"> </xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="mpco:MPO_Registration">
												<br/>исходный МПО № <xsl:apply-templates select="mpco:MPO_Registration"/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<xsl:for-each select="mpre:MPODecl/mpco:Goods[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered">
											<xsl:apply-templates select="mpco:GoodDescription"/>
											<xsl:if test="not(mpco:GoodDescription) and mpco:GoodDescriptionForeign">
												<xsl:apply-templates select="mpco:GoodDescriptionForeign"/>
											</xsl:if>
										</td>
										<td class="bordered">
											<xsl:value-of select="mpco:TradeMark"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="mpco:TNVEDCode"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="mpco:GoodsQuantity"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="mpco:NetWeight"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="mpco:GrossWeight"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="mpco:CostEURO"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="mpco:CostRUS"/>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<div class="value" style="width: 50mm;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div><br/>
					<div style="font-size:7pt;">
						<sup>1</sup> Идентификационный номер налогоплательщика (ИНН) для граждан Российской Федерации.
						<br/>
						<sup>2</sup> При наличии (для резидентов указывается паспорт гражданина Российской Федерации (серия и номер) или универсальной электронной карты. Для нерезидентов паспортные данные указываются слитно (без разделения серии и номера).
						<br/>
						<sup>3</sup> Торговое, коммерческое или иное традиционное наименование товара с добавлением сведений о товарном знаке, марке, модели товара.
						<br/>
						<sup>4</sup> При наличии.
						<br/>
						<sup>5</sup> Заполняется при наличии товаров, в отношении которых применяются запреты и ограничения. В случае наличия таких товаров указываются сведения о документах, подтверждающих соблюдение запретов и ограничений (вид, номер и дата выдачи документа).
						<br/>
						<sup>6</sup> Номер и дата документа, свидетельствующего приобретение товара физическим лицом в рамках международной электронной торговли с указанием ссылки на интернет-страницу.
						<br/>
						<sup>7</sup> Указывается код таможенного органа, в регионе деятельности которого расположена зона таможенного контроля ММПО, дата и время размещения МПО в зоне таможенного контроля ММПО.  
						<br/>
						<sup>8</sup> В графе «Примечание» указываются номер квитанции плательщика (при наличии), номер и дата документа, определенного актами Всемирного почтового союза, оформленного назначенным оператором почтовой связи, предусмотренного пунктом 2 статьи 371 Кодекса Союза (при наличии), и иные сведения, используемые таможенным органом для принятия решения о выпуске товаров, а также принятое таможенным органом решение.
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="mpco:GoodsQuantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if> 
		
	</xsl:template>
	
	<xsl:template match="mpre:AuthorizedOperator">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="cat_ru:Address">
			<xsl:text> адрес: </xsl:text>
			<xsl:for-each select="cat_ru:Address/*">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<xsl:text> ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="mpco:OKPO">
			<xsl:text> ОКПО: </xsl:text>
			<xsl:value-of select="mpco:OKPO"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
			<xsl:text> КПП: </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="mpco:MPO_Registration">
		<xsl:value-of select="mpco:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="mpco:RegistrationDate"/></xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="mpco:MPO_Number"/>
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