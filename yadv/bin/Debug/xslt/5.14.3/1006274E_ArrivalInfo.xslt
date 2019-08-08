<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:ai="urn:customs.ru:Information:CustomsDocuments:ArrivalInfo:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ArrivalInfoType -->
	<xsl:template match="ai:ArrivalInfo">
		<xsl:param name="w" select="190"/>
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
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



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
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Информация о прибытии товаров на таможенную территорию</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Код таможенного органа в месте прибытия</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ai:ArrivalCustomsCode"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время прибытия</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ai:ArrivalDateTime"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(ai:ArrivalDateTime, 12,8)"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ai:Header">
						<div class="title marg-top">Заголовок информации</div>
						<div>
							<xsl:apply-templates select="ai:Header">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Товарно-транспортная накладная</div>
					<!--table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Наименование документа</td>
								<td class="graphMain bordered">Номер документа</td>
								<td class="graphMain bordered">Дата документа</td>
								<td class="graphMain bordered">Код вида представляемого документа. Заполняется в соответствии с классификатором видов документов, используемых при заявлении сведений в графе 44 ДТ (справочник docg44.dbf). Допускается не заполнять для авиа-транспорта в случае прилета груза без документов</td>
								<td class="graphMain bordered">Информация о размещении документа в электронном архиве</td>
								<td class="graphMain bordered">Описание товара</td>
								<td class="graphMain bordered">Описание контейнера</td>
								<td class="graphMain bordered">Представляемый документ</td>
							</tr-->
							<!--xsl:for-each select="ai:Consigment"-->
								<xsl:apply-templates select="ai:Consigment">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							<!--/xsl:for-each-->
						<!--/tbody>
					</table-->
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ai:ArchDocInfoType -->
	<xsl:template match="ai:ArchDocInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ai:ArchID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИД ЭА декларанта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="ai:ArchID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ai:ArchDocID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИД документа в ЭА декларанта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="ai:ArchDocID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WHCarrierType -->
	<xsl:template match="ai:Carrier">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Цифровой код страны перевозчика (по справочнику ОКСМ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catWH_ru:CountryCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catWH_ru:Address">
				<div class="title marg-top">Адрес лица, помещающего  товары на ВХ</div>
				<div>
					<xsl:apply-templates select="catWH_ru:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catWH_ru:CarrierPerson">
				<div class="title marg-top">Представитель перевозчика</div>
				<div>
					<xsl:apply-templates select="catWH_ru:CarrierPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ai:ConsigmentType -->
	<xsl:template match="ai:Consigment">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<!--tr-->
				<xsl:if test="position()!=1"><br/></xsl:if>
				<div class="title marg-top" style="width:100%;background-color:#aaa;">#<xsl:value-of select="position()"/></div>
				<xsl:if test="cat_ru:PrDocumentName">
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:PrDocumentName"/>
							</td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="cat_ru:PrDocumentNumber">
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:PrDocumentNumber"/>
							</td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="cat_ru:PrDocumentDate">
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="catWH_ru:PresentedDocumentModeCode">
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Код вида представляемого документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="catWH_ru:PresentedDocumentModeCode"/>
							</td>
						</tr>
					</table>
				</xsl:if>
				
				<xsl:if test="catWH_ru:CompletteList">
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номера связанных ТТН</td>
							<td class="value graphMain" style="width:50%">
								<xsl:for-each select="catWH_ru:CompletteList">
									<xsl:if test="position()!=1">, </xsl:if>
									<xsl:value-of select="."/>
								</xsl:for-each>
							</td>
						</tr>
					</table>
				</xsl:if>
				
				<xsl:if test="catWH_ru:CustomNumber">
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Регистрационный номер</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="catWH_ru:CustomNumber" mode="reg_num"/>
							</td>
						</tr>
					</table>
				</xsl:if>
				
				<xsl:if test="catWH_ru:Consignor">
					<div class="title marg-top">Отправитель</div>
					<xsl:apply-templates select="catWH_ru:Consignor">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</xsl:if>
				
				<xsl:if test="catWH_ru:Consignee">
					<div class="title marg-top">Получатель</div>
					<xsl:apply-templates select="catWH_ru:Consignee">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</xsl:if>
				
				<xsl:if test="catWH_ru:ArrivalCargoWithoutDocsIndicator">
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Признак прилета груза без документов</td>
							<td class="value graphMain" style="width:50%">
								<xsl:if test="catWH_ru:ArrivalCargoWithoutDocsIndicator = 1 or catWH_ru:ArrivalCargoWithoutDocsIndicator = 'true'">есть</xsl:if>
								<xsl:if test="catWH_ru:ArrivalCargoWithoutDocsIndicator = 0 or catWH_ru:ArrivalCargoWithoutDocsIndicator = 'false'">нет</xsl:if>
							</td>
						</tr>
					</table>
				</xsl:if>

					<xsl:if test="ai:ArchDocInfo">
						<div class="title marg-top">Информация о размещении документа в электронном архиве</div>
						<xsl:apply-templates select="ai:ArchDocInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>

					<xsl:if test="ai:Good">
						<div class="title marg-top">Описание товара</div>
						<table>
							<tbody>
								<tr class="title">
									<td class="bordered">Номер</td>
									<td class="bordered">Код ТН ВЭД</td>
									<td class="bordered">Стоимость</td>
									<td class="bordered">Код валюты</td>
									<td class="bordered">Описание</td>
									<td class="bordered">Номер МПО</td>
									<td class="bordered">Номер емкости</td>
									<td class="bordered">Грузовые места</td>
									<td class="bordered">Вес брутто / объем</td>
									<td class="bordered">Кол-во в ДЕИ</td>
								</tr>
								<xsl:for-each select="ai:Good">
									<tr>
										<td class="bordered">
											<xsl:value-of select="catWH_ru:GoodsNumber"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="catWH_ru:GoodsTNVEDCode"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="catWH_ru:InvoiceCost"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="catWH_ru:CurrencyCode"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="catWH_ru:GoodsDescription"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="catWH_ru:MPONumber" mode="reg_num"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="catWH_ru:MPOCaseNum"/>
										</td>
										<td class="bordered">
											<xsl:for-each select="catWH_ru:CargoPlace/*">
												<xsl:if test="position() &gt; 1">/</xsl:if>
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="catWH_ru:BruttoVolQuant" mode="quantity"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="catWH_ru:MeasureQuantity" mode="quantity"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>

					<xsl:if test="ai:Container">
						<div class="title marg-top">Описание контейнера</div>
						<table>
							<tbody>
								<tr class="title">
									<td class="bordered">Номер контейнера</td>
									<td class="bordered">Код размера контейнера по ГОСТ 52524-2005</td>
									<td class="bordered">Код типа контейнера по ГОСТ 52524-2005</td>
									<td class="bordered">Вес брутто (кг) всех товаров в контейнере</td>
								</tr>
								<xsl:for-each select="ai:Container">
									<tr>
										<td class="bordered">
											<xsl:value-of select="catWH_ru:ContainerNumber"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="catWH_ru:SizeCode"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="catWH_ru:KindCode"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="catWH_ru:GrossWeightQuantity"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>

					<xsl:if test="ai:ProducedDocument">
						<div class="title marg-top">Представленный документ</div>
						<table>
							<tbody>
								<tr class="title">
									<td class="bordered">Наименование</td>
									<td class="bordered">Номер</td>
									<td class="bordered">Дата</td>
									<td class="bordered">Код вида</td>
									<td class="bordered" colspan="2">Информация о размещении документа в электронном архиве</td>
								</tr>
								<tr class="title">
									<td class="bordered">ЭАД</td>
									<td class="bordered">ID в ЭАД</td>
								</tr>
								<xsl:for-each select="ai:ProducedDocument">
									<tr>
										<td class="bordered">
											<xsl:value-of select="cat_ru:PrDocumentName"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="cat_ru:PrDocumentNumber"/>
										</td>
										<td class="bordered">
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
										</td>
										<td class="bordered">
											<xsl:value-of select="ai:DocumentKind"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="ai:ArchDocInfo/ai:ArchID"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="ai:ArchDocInfo/ai:ArchDocID"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>

			<!--/tr-->
		</div>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:value-of select="catWH_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="catWH_ru:MeasureUnitQualifierName"/>
		<xsl:if test="catWH_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="catWH_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="catWH_ru:Consignee">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации</div>
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:if>
			<xsl:if test="catWH_ru:Address">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catWH_ru:Address" mode="address"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:IdentityCard">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catWH_ru:IdentityCard" mode="identityCard"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	
	<xsl:template match="catWH_ru:Consignor">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catWH_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:Address">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catWH_ru:Address" mode="address"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	
	<xsl:template match="*" mode="identityCard">
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date"><xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/></xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WHContainerInformationType -->
	<xsl:template match="ai:Container">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:value-of select="catWH_ru:ContainerNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="catWH_ru:SizeCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="catWH_ru:KindCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="translate(catWH_ru:GrossWeightQuantity, '.', ',')"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ai:HeaderType -->
	<xsl:template match="ai:Header">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ai:DepartureCountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код страны отправления</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="ai:DepartureCountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ai:DestinationCountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код страны назначения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="ai:DestinationCountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<div class="title marg-top">Транспортное средство</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров</td>
						<td class="graphMain bordered">Номер ТС (для морского транспорта указывается наименование судна, для авиа - номер борта, для железной дороги - номер вагона и т.д.)</td>
						<td class="graphMain bordered">Подробности для авиа</td>
						<td class="graphMain bordered">Подробности для авто</td>
						<td class="graphMain bordered">Подробности для ж/д</td>
						<td class="graphMain bordered">Подробности для моря/реки</td>
					</tr>
					<xsl:for-each select="ai:Transport">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<xsl:if test="ai:Carrier">
				<div class="title marg-top">Перевозчик</div>
				<div>
					<xsl:apply-templates select="ai:Carrier">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ai:ParticipantID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор участника ВЭД, использованный перевозчиком для представления документов при прибытии</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="ai:ParticipantID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ai:PI_RegID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регистрационный идентификатор предварительной информации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="ai:PI_RegID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ai:ProducedDocumentType -->
	<xsl:template match="ai:ProducedDocument">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
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
				<td class="graphMain bordered">
					<xsl:value-of select="ai:DocumentKind"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ai:ArchDocInfo">
						<xsl:apply-templates select="ai:ArchDocInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WhTransportType -->
	<xsl:template match="ai:Transport">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:value-of select="catWH_ru:TransportModeCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="catWH_ru:TransportIdentifier=авиа">
							<xsl:text>номер борта</xsl:text>
						</xsl:when>
						<xsl:when test="catWH_ru:TransportIdentifier=дороги">
							<xsl:text>номер вагона и т</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="catWH_ru:TransportIdentifier"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catWH_ru:Avia">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catWH_ru:Avto">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catWH_ru:RailRoad">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catWH_ru:Sea">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WHAddressType -->
	<xsl:template match="catWH_ru:Address">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PostalCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PostalCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:CounryName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Region">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:Region"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:City"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:StreetHouse">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:StreetHouse"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:TerritoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:TerritoryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:AddressLine">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Информация об адресе организации в виде одной строки</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:AddressLine"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:AviaParticularsType -->
	<xsl:template match="catWH_ru:Avia">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<xsl:if test="catWH_ru:FlightNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер рейса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:FlightNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:FlightDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата рейса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="catWH_ru:FlightDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:AvtoParticularsType -->
	<xsl:template match="catWH_ru:Avto">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catWH_ru:TrailerIdentifier">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор (номер) прицепного транспортного средства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:TrailerIdentifier"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:SecondTrailerIdentifier">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор (номер) второго прицепного транспортного средства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:SecondTrailerIdentifier"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WHSuppQuantityType -->
	<xsl:template match="catWH_ru:BruttoVolQuant">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара в единице измерения.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(catWH_ru:GoodsQuantity, '.', ',')"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catWH_ru:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование единицы измерения.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:MeasureUnitQualifierCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в Таможенном тарифе Российской Федерации..</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:MeasureUnitQualifierCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="catWH_ru:Captain">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WHCargoPlaceType -->
	<xsl:template match="catWH_ru:CargoPlace">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catWH_ru:PlaceNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество грузовых мест</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:PlaceNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:PackageCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида упаковки (груза)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:PackageCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:PlaceDescription">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Вид  грузовых  мест - описание</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:PlaceDescription"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="catWH_ru:CarrierPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:MPONumberType -->
	<xsl:template match="catWH_ru:MPONumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"/>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WHSuppQuantityType -->
	<xsl:template match="catWH_ru:MeasureQuantity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара в единице измерения.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(catWH_ru:GoodsQuantity, '.', ',')"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catWH_ru:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование единицы измерения.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:MeasureUnitQualifierCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в Таможенном тарифе Российской Федерации..</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:MeasureUnitQualifierCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:RailRoadParticularsType -->
	<xsl:template match="catWH_ru:RailRoad">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catWH_ru:RailStation">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код станции отправления (для прибытия) или назначения (для убытия)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:RailStation"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:SeaParticularsType -->
	<xsl:template match="catWH_ru:Sea">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catWH_ru:EntryNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер прихода/ухода</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:EntryNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Данные о стране принадлежности судна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catWH_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catWH_ru:Captain">
				<div class="title marg-top">Данные о капитане</div>
				<div>
					<xsl:apply-templates select="catWH_ru:Captain">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CategoryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KATOCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:RNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ITNReserv"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:KGINN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="cat_ru:KGINN=ИНН">
									<xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
								</xsl:when>
								<xsl:when test="cat_ru:KGINN=ПИН">
									<xsl:text>персональный идентификационный номер</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="cat_ru:KGINN"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KGOKPO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:KGOKPO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:UNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:SocialServiceNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:UNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RBIdentificationNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OGRN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OGRN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:BIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:BIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<table>
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
				<div>
					<xsl:apply-templates select="cat_ru:ITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template name="num_date">
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
