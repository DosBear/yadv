<?xml version="1.0" encoding="utf-8"?>
<!-- edited with XMLSpy v2013 (http://www.altova.com) by  () -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:dw="urn:customs.ru:Information:DragWH:5.14.3">
	<!-- Шаблон для типа DragWHType -->
	<xsl:template match="dw:DragWH">
		<xsl:param name="w" select="267"/>
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
			width: 267mm;
			/*max-width:267mm;*/
			width: 100%;
			max-width: 100%;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
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
										<b>Сведения о маркированных лекарственных препаратах, размещенных на ВХ</b>
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
					<xsl:if test="dw:WarehouseOwner">
						<div class="title marg-top">Данные о владельце склада</div>
						<div>
							<xsl:apply-templates select="dw:WarehouseOwner">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="dw:DO1Report">
						<div class="title marg-top">Регистрационный номер отчета ДО-1</div>
						<div>
							<xsl:apply-templates select="dw:DO1Report">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="dw:CommerceDoc">
						<div class="title marg-top">Сведения о коммерческом документе</div>
						<div>
							<xsl:apply-templates select="dw:CommerceDoc">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="dw:TotalQuantity">
						<div class="title marg-top">Общее количество продукции</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Количество товара в единице измерения</td>
									<td class="graphMain bordered">Условное обозначение единицы измерения</td>
									<td class="graphMain bordered">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
								</tr>
								<xsl:for-each select="dw:TotalQuantity">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<div class="title marg-top">Список продукции</div>
					<table class="bordered" width="100%">
						<tbody>
							<tr>
								<td width="20%"/>
								<td width="15%"/>
								<td width="20%"/>
								<td width="20%"/>
								<td width="10%"/>
								<td width="15%"/>
							</tr>
							<tr align="center" class="title">
								<td class="graphMain bordered" rowspan="3">Индивидуальный серийный номер вторичной упаковки</td>
								<td rowspan="3" class="graphMain bordered">Количество товара</td>
								<td colspan="4" class="graphMain bordered">Сведения о транспортной упаковке</td>
							</tr>
							<tr align="center" class="title">
								<td rowspan="2" class="graphMain bordered">
									<xsl:text>Номер транспортной упаковки</xsl:text>
								</td>
								<td colspan="3" class="graphMain bordered">
									<xsl:text>Содержимое транспортной упаковки</xsl:text>
								</td>
							</tr>
							<tr align="center" class="title">
								<td class="graphMain bordered">
									<xsl:text>Идентификационный номер GS1</xsl:text>
								</td>
								<td class="graphMain bordered">
									<xsl:text>Количество товара</xsl:text>
								</td>
								<td class="graphMain bordered">
									<xsl:text>Номер производственной серии</xsl:text>
								</td>
							</tr>
							<xsl:for-each select="dw:Goods">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
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
					<td class="annot graphMain" style="width:50%">Вид документа, на основании которого осуществляет свою деятельность владелец склада</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="catWH_ru:CertificateKind='lic_Certificate'"> Свидетельство о включении в реестр владельцев СВХ </xsl:when>
							<xsl:when test="catWH_ru:CertificateKind='lic_Licence'"> Лицензия владельца СВХ </xsl:when>
							<xsl:when test="catWH_ru:CertificateKind='lic_Permition'"> Разрешение ТО на временное хранение в ином месте </xsl:when>
							<xsl:when test="catWH_ru:CertificateKind='lic_PermZtk'"> Приказ о создании ПЗТК</xsl:when>
							<xsl:when test="catWH_ru:CertificateKind='lic_TempZtk'"> Приказ о создании ВЗТК </xsl:when>
							<xsl:otherwise> Свидетельство о включении в реестр владельцев СВХ </xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер Свидетельства о включении в Реестр / Номер лицензии / Номер приказа о создании ЗТК</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catWH_ru:CertificateNumber"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catWH_ru:CertificateDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа, на основании которого разрешено хранение</td>
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
	<!-- Шаблон для типа catWH_ru:WarehouseCertificateType -->
	<xsl:template match="catWH_ru:WarehouseLicense">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Вид документа, на основании которого осуществляет свою деятельность владелец склада</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="catWH_ru:CertificateKind='lic_Certificate'"> Свидетельство о включении в реестр владельцев СВХ </xsl:when>
							<xsl:when test="catWH_ru:CertificateKind='lic_Licence'"> Лицензия владельца СВХ </xsl:when>
							<xsl:when test="catWH_ru:CertificateKind='lic_Permition'"> Разрешение ТО на временное хранение в ином месте </xsl:when>
							<xsl:when test="catWH_ru:CertificateKind='lic_PermZtk'"> Приказ о создании ПЗТК</xsl:when>
							<xsl:when test="catWH_ru:CertificateKind='lic_TempZtk'"> Приказ о создании ВЗТК </xsl:when>
							<xsl:otherwise> Свидетельство о включении в реестр владельцев СВХ </xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер Свидетельства о включении в Реестр / Номер лицензии / Номер приказа о создании ЗТК</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catWH_ru:CertificateNumber"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catWH_ru:CertificateDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа, на основании которого разрешено хранение</td>
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
						<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OGRN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
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
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="dw:CommerceDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
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
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="dw:DO1Report">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:GTDNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="dw:Goods">
		<div>
			<tr>
				<td width="20%" align="center" class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="dw:SGTIN">
							<xsl:value-of select="dw:SGTIN"/>
						</xsl:when>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td width="15%" class="graphMain bordered" align="center">
					<xsl:choose>
						<xsl:when test="dw:Quantity">
							<xsl:for-each select="dw:Quantity">
								<xsl:apply-templates mode="quantity_str" select="."/>
								<br/>
							</xsl:for-each>
						</xsl:when>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td width="20%" align="center" class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="dw:SSCCDetail">
							<xsl:value-of select="dw:SSCCDetail/dw:SSCC"/>
						</xsl:when>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td width="20%" align="center" class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="dw:SSCCDetail">
							<xsl:value-of select="dw:SSCCDetail/dw:GTINDetail/dw:GTIN"/>
						</xsl:when>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td width="10%" class="graphMain bordered" align="center">
					<xsl:choose>
						<xsl:when test="dw:SSCCDetail">
							<xsl:for-each select="dw:SSCCDetail/dw:GTINDetail/dw:Quantity">
								<br/>
								<xsl:apply-templates mode="quantity_str" select="."/>
							</xsl:for-each>
						</xsl:when>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td width="15%" class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="dw:SSCCDetail">
							<xsl:value-of select="dw:SSCCDetail/dw:GTINDetail/dw:Series"/>
						</xsl:when>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template mode="quantity_str" match="*">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:if test="cat_ru:MeasureUnitQualifierName">
				<xsl:text> (</xsl:text>
			</xsl:if>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:if test="cat_ru:MeasureUnitQualifierName">
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dw:Quantity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:MeasureUnitQualifierCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа dw:SSCCDetailType -->
	<xsl:template match="dw:SSCCDetail">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="dw:GTINDetail">
				<div class="title marg-top">Содержимое транспортной упаковки</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Идентификационный номер GS1</td>
							<td class="graphMain bordered">Количество товара</td>
							<td class="graphMain bordered">Номер производственной серии</td>
						</tr>
						<xsl:for-each select="dw:GTINDetail">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="dw:TotalQuantity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WarehouseOwnerType -->
	<xsl:template match="dw:WarehouseOwner">
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
				<div class="title marg-top">Действующий документ владельца СВХ.</div>
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
