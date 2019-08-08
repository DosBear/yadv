<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:wh_ai="urn:customs.ru:Information:WarehouseDocuments:WHActInspectionRes:5.14.3" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа WHActInspectionResType -->
	<xsl:template match="wh_ai:WHActInspectionRes">
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
										<b>Выявленные в ходе таможенного досмотра (осмотра) несоответствия товаров, находящихся на временном хранении, ранее заявленным сведениям</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
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
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер акта таможенного досмотра (осмотра)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="wh_ai:ActNumber"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Типа акта:</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="wh_ai:ActType='0'">
										<xsl:text>таможенный досмотр</xsl:text>
									</xsl:when>
									<xsl:when test="wh_ai:ActType='1'">
										<xsl:text>таможенный осмотр</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="wh_ai:ActType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время таможенного досмотра (осмотра)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="wh_ai:InspectionDateTime"/></xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(wh_ai:InspectionDateTime, 12, 8)"/>
							</td>
						</tr>
					</table>
					<xsl:if test="wh_ai:WarehouseOwner">
						<div class="title marg-top">Данные о владельце склада (иного меcта) ВХ, на котором находятся товары</div>
						<div>
							<xsl:apply-templates select="wh_ai:WarehouseOwner">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="wh_ai:DO1Report">
						<div class="title marg-top">Данные об отчете о принятии по форме ДО-1, товары из которого были досмотрены / осмотрены</div>
						<div>
							<xsl:apply-templates select="wh_ai:DO1Report">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="wh_ai:Consignee">
						<div class="title marg-top">Данные о получателе товаров</div>
						<div>
							<xsl:apply-templates select="wh_ai:Consignee">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="wh_ai:Document">
						<div class="title marg-top">Данные о товаросопроводительном документе</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование документа</td>
									<td class="graphMain bordered">Номер документа</td>
									<td class="graphMain bordered">Дата документа</td>
									<td class="graphMain bordered">Код вида представляемого документа</td>
								</tr>
								<xsl:for-each select="wh_ai:Document">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="wh_ai:Good">
						<div class="title marg-top">Данные о результатах таможенного досмотра (осмотра) товара</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Валовый №</td>
									<td class="graphMain bordered">Код ТН ВЭД ЕАЭС</td>
									<td class="graphMain bordered">Фактурная стоимость</td>
									<td class="graphMain bordered">Описание товара</td>
									<td class="graphMain bordered">Номер МПО</td>
									<td class="graphMain bordered">Номер емкости</td>
									<td class="graphMain bordered">Сведения о грузовых  местах</td>
									<td class="graphMain bordered">Вес брутто / объем</td>
									<td class="graphMain bordered">Кол-во в ДЕИ</td>
									<td class="graphMain bordered">Вес брутто (кг.)</td>
									<td class="graphMain bordered">Товаро- сопроводит. накладная</td>
									<td class="graphMain bordered">Признак и описание поврежд.</td>
									<!--td class="graphMain bordered">Описание поврежд.</td-->
									<td class="graphMain bordered">Признак и описание выявленных несоотв.</td>
									<!--td class="graphMain bordered">Описание иных  признаков несоответствия</td-->
								</tr>
								<xsl:for-each select="wh_ai:Good">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="wh_ai:Container">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номера контейнеров</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="wh_ai:Container">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WarehouseCertificateType -->
	<xsl:template match="catWH_ru:ActualWarehouseLicense">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Вид документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="catWH_ru:CertificateKind = 'lic_Certificate'">Свидетельство о включении в реестр владельцев СВХ</xsl:when>
							<xsl:when test="catWH_ru:CertificateKind = 'lic_Licence'">Лицензия владельца СВХ</xsl:when>
							<xsl:when test="catWH_ru:CertificateKind = 'lic_Permition'">Разрешение ТО на временное хранение в ином месте</xsl:when>
							<xsl:when test="catWH_ru:CertificateKind = 'lic_PermZtk'">Номер приказа о создании постоянной зоны таможенного контроля</xsl:when>
							<xsl:when test="catWH_ru:CertificateKind = 'lic_TempZtk'">Номер приказа о создании временной зоны таможенного контроля</xsl:when>
							<xsl:otherwise><xsl:value-of select="catWH_ru:CertificateKind"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catWH_ru:CertificateNumber"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catWH_ru:CertificateDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="catWH_ru:CertificateDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
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
						<td class="annot graphMain" style="width:50%">Буквенный код страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны</td>
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
						<td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ</td>
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
	<!-- Шаблон для типа catWH_ru:WHSuppQuantityType -->
	<xsl:template match="catWH_ru:BruttoVolQuant">
		<div class="annot graphMain">
			<xsl:value-of select="translate(catWH_ru:GoodsQuantity, '.', ',')"/>
			<xsl:if test="catWH_ru:MeasureUnitQualifierName">&#160;<xsl:value-of select="catWH_ru:MeasureUnitQualifierName"/>
			</xsl:if>
			<xsl:if test="catWH_ru:MeasureUnitQualifierCode"> (<xsl:value-of select="catWH_ru:MeasureUnitQualifierCode"/>)</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WHCargoPlaceType -->
	<xsl:template match="catWH_ru:CargoPlace">
		<div class="annot graphMain">
			<xsl:if test="catWH_ru:PlaceNumber">
				<xsl:value-of select="catWH_ru:PlaceNumber"/>
			</xsl:if>
			<xsl:if test="catWH_ru:PackageCode"> (<xsl:value-of select="catWH_ru:PackageCode"/>)</xsl:if>
			<xsl:if test="catWH_ru:PlaceDescription">&#160;<xsl:value-of select="catWH_ru:PlaceDescription"/>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:TransportDocRegNumType -->
	<xsl:template match="catWH_ru:CustomNumber">
		<div class="annot graphMain">
			<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
			<xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
			<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
			<br>
				<xsl:if test="catWH_ru:WaybillNumPP">№ по ЖР: <xsl:value-of select="catWH_ru:WaybillNumPP"/>
				</xsl:if>
			</br>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="catWH_ru:IdentityCard">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:IdentityCardCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:IdentityCardCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименованиеь</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:IdentityCardName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCardSeries">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Серия документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:IdentityCardSeries"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCardNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:IdentityCardNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCardDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата выдачи</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationName"/>
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
		<div class="annot graphMain">
			<xsl:value-of select="translate(catWH_ru:GoodsQuantity, '.', ',')"/>
			<xsl:if test="catWH_ru:MeasureUnitQualifierName">&#160;<xsl:value-of select="catWH_ru:MeasureUnitQualifierName"/>
			</xsl:if>
			<xsl:if test="catWH_ru:MeasureUnitQualifierCode"> (<xsl:value-of select="catWH_ru:MeasureUnitQualifierCode"/>)</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WarehouseCertificateType -->
	<xsl:template match="catWH_ru:WarehouseLicense">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Вид документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="catWH_ru:CertificateKind = 'lic_Certificate'">Свидетельство о включении в реестр владельцев СВХ</xsl:when>
							<xsl:when test="catWH_ru:CertificateKind = 'lic_Licence'">Лицензия владельца СВХ</xsl:when>
							<xsl:when test="catWH_ru:CertificateKind = 'lic_Permition'">Разрешение ТО на временное хранение в ином месте</xsl:when>
							<xsl:when test="catWH_ru:CertificateKind = 'lic_PermZtk'">Номер приказа о создании постоянной зоны таможенного контроля</xsl:when>
							<xsl:when test="catWH_ru:CertificateKind = 'lic_TempZtk'">Номер приказа о создании временной зоны таможенного контроля</xsl:when>
							<xsl:otherwise><xsl:value-of select="catWH_ru:CertificateKind"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catWH_ru:CertificateNumber"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catWH_ru:CertificateDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="catWH_ru:CertificateDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="catWH_ru:WarehousePerson">
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
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CategoryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KATOCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН</td>
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
						<td class="annot graphMain" style="width:50%">ИНН, ПИН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="cat_ru:KGINN='ИНН'">
									<xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
								</xsl:when>
								<xsl:when test="cat_ru:KGINN='ПИН'">
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
						<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО)</td>
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
						<td class="annot graphMain" style="width:50%">УНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:UNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">НЗОУ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:SocialServiceNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер справки об отсутствии НЗОУ</td>
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
						<td class="annot graphMain" style="width:50%">УНП</td>
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
						<td class="annot graphMain" style="width:50%">БИН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:BIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИИН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:IIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITN">
				<div class="title marg-top">ИТН</div>
				<div>
					<xsl:apply-templates select="cat_ru:ITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WhBillDocumentType -->
	<xsl:template match="wh_ai:BillDocument">
		<div class="annot graphMain">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate"> от <xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="catWH_ru:PresentedDocumentModeCode"> (<xsl:value-of select="catWH_ru:PresentedDocumentModeCode"/>)</xsl:if>
			<xsl:if test="catWH_ru:CustomNumber">Рег.номер: <xsl:apply-templates select="catWH_ru:CustomNumber"/>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:ConsigneeType -->
	<xsl:template match="wh_ai:Consignee">
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
			<xsl:if test="catWH_ru:Address">
				<div class="title marg-top">Адрес получателя</div>
				<div>
					<xsl:apply-templates select="catWH_ru:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catWH_ru:IdentityCard">
				<div class="title marg-top">Документ, удостоверяющий личность</div>
				<div>
					<xsl:apply-templates select="catWH_ru:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WareHouseReportLinkDataType -->
	<xsl:template match="wh_ai:DO1Report">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата составления отчета</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер отчета</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catWH_ru:ReportNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WhPresentDocType -->
	<xsl:template match="wh_ai:Document">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="annot graphMain bordered">
					<xsl:value-of select="cat_ru:PrDocumentName"/>
				</td>
				<td class="annot graphMain bordered">
					<xsl:value-of select="cat_ru:PrDocumentNumber"/>
				</td>
				<td class="annot graphMain bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</td>
				<td class="annot graphMain bordered">
					<xsl:value-of select="catWH_ru:PresentedDocumentModeCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа wh_ai:GoodInspectionResultType -->
	<xsl:template match="wh_ai:Good">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<tr>
				<td class="annot graphMain bordered">
					<xsl:value-of select="catWH_ru:GoodsNumber"/>
				</td>
				<td class="annot graphMain bordered">
					<xsl:value-of select="catWH_ru:GoodsTNVEDCode"/>
				</td>
				<td class="annot graphMain bordered">
					<xsl:value-of select="translate(catWH_ru:InvoiceCost, '.', ',')"/>
					<xsl:if test="catWH_ru:CurrencyCode"/> (<xsl:value-of select="catWH_ru:CurrencyCode"/>)</td>
				<td class="annot graphMain bordered">
					<xsl:for-each select="catWH_ru:GoodsDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
				<td class=" annot graphMain bordered">
					<xsl:apply-templates select="catWH_ru:MPONumber">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class=" annot graphMain bordered">
					<xsl:value-of select="catWH_ru:MPOCaseNum"/>
				</td>
				<td class=" annot graphMain bordered">
					<xsl:if test="catWH_ru:CargoPlace">
						<xsl:apply-templates select="catWH_ru:CargoPlace">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="catWH_ru:BruttoVolQuant">
						<xsl:apply-templates select="catWH_ru:BruttoVolQuant">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class=" annot graphMain bordered">
					<xsl:if test="catWH_ru:MeasureQuantity">
						<xsl:apply-templates select="catWH_ru:MeasureQuantity">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class=" annot graphMain bordered">
					<xsl:value-of select="translate(wh_ai:DocBruttoWeight, '.', ',')"/>
				</td>
				<td class=" annotgraphMain bordered">
					<xsl:if test="wh_ai:BillDocument">
						<xsl:apply-templates select="wh_ai:BillDocument">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="annot graphMain bordered">
					<xsl:choose>
						<xsl:when test="wh_ai:GoodsDamageFlag='true' or wh_ai:GoodsDamageFlag='1'">
							<xsl:text>ДА</xsl:text>
						</xsl:when>
						<xsl:when test="wh_ai:GoodsDamageFlag='false' or wh_ai:GoodsDamageFlag='0'">
							<xsl:text>НЕТ</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="wh_ai:GoodsDamageFlag"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="wh_ai:DamageDesc">
						<br/>
						<xsl:for-each select="wh_ai:DamageDesc">
							<xsl:if test="position()!=1">
								<br/>
							</xsl:if>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</xsl:if>
				</td>
				<!--td class=" annot graphMain bordered">
					<xsl:for-each select="wh_ai:DamageDesc">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td-->
				<td class=" annot graphMain bordered">
					<xsl:choose>
						<xsl:when test="wh_ai:GoodsViolationFlag='1'">
							<xsl:text>по весу нетто</xsl:text>
						</xsl:when>
						<xsl:when test="wh_ai:GoodsViolationFlag='2'">
							<xsl:text>по количеству товаров</xsl:text>
						</xsl:when>
						<xsl:when test="wh_ai:GoodsViolationFlag='3'">
							<xsl:text>по описанию</xsl:text>
						</xsl:when>
						<xsl:when test="wh_ai:GoodsViolationFlag='4'">
							<xsl:text>по иным признакам</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="wh_ai:GoodsViolationFlag"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="wh_ai:GoodsViolationDesc">
						<br/>
						<xsl:for-each select="wh_ai:GoodsViolationDesc">
							<xsl:if test="position()!=1">
								<br/>
							</xsl:if>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</xsl:if>
				</td>
				<!--td class=" annot graphMain bordered">
					<xsl:for-each select="wh_ai:GoodsViolationDesc">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td-->
			</tr>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WarehouseOwnerType -->
	<xsl:template match="wh_ai:WarehouseOwner">
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
			<xsl:if test="catWH_ru:Address">
				<div class="title marg-top">Адрес места хранения</div>
				<div>
					<xsl:apply-templates select="catWH_ru:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catWH_ru:WarehouseLicense">
				<div class="title marg-top">Документ, на основании которого разрешено временное хранение</div>
				<div>
					<xsl:apply-templates select="catWH_ru:WarehouseLicense">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catWH_ru:ActualWarehouseLicense">
				<div class="title marg-top">Действующий документ владельца СВХ</div>
				<div>
					<xsl:apply-templates select="catWH_ru:ActualWarehouseLicense">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catWH_ru:WarehousePerson">
				<div class="title marg-top">Представитель СВХ</div>
				<div>
					<xsl:apply-templates select="catWH_ru:WarehousePerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
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
