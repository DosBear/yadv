<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:afr="urn:customs.ru:Information:AEOFinReport:5.14.3">
	<!-- Шаблон для типа AEOFinReportType -->
	<xsl:template match="afr:AEOFinReport">
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
                  
				  .graphLittle {
				  font-family: Arial;
				  font-size: 8pt;
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
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Данные системы учета юридического лица/УЭО</b>
									</font>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="afr:AuthoriziedOperatorDetails">
						<div class="title marg-top">Сведения об уполномоченном экономическом операторе</div>
						<table style="width:70%" class="bordered">
							<tbody>
								<tr>
									<td valign="top" style="width:20%" class="annot">Наименование юр. лица/УЭО</td>
									<td style="width:50%" class="value">
										<xsl:apply-templates select="afr:AuthoriziedOperatorDetails" mode="organization"/>
									</td>
								</tr>
								<tr>
									<td class="annot graphMain">ИНН/КПП</td>
									<td class="value">
										<xsl:value-of select="afr:AuthoriziedOperatorDetails/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
										<xsl:value-of select="afr:AuthoriziedOperatorDetails/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</td>
								</tr>
								<tr>
									<td class="graphMain" colspan="2">
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<table style="width:25%" class="bordered">
						<tbody>
							<tr>
								<td style="width:20%" valign="top" rowspan="2" align="center" class="annot graphMain bordered">Период <br>формирования:</br>
								</td>
								<td style="width:15%" align="center" class="annot graphMain bordered">дата начала <br>периода</br>
								</td>
								<td style="width:15%" align="center" class="annot graphMain bordered">дата окончания<br>периода</br>
								</td>
							</tr>
							<tr>
								<td align="center" class="annot graphMain bordered">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="afr:DODate/afr:StartDate"/>
									</xsl:call-template>
								</td>
								<td align="center" class="annot graphMain bordered">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="afr:DODate/afr:EndDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="3">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="annot graphMain bordered">Дата формирования сведений</td>
								<td class="annot graphMain bordered">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="afr:CreateDate"/>
									</xsl:call-template>
								</td>
								<td class="graphMain"/>
							</tr>
						</tbody>
					</table>
					<xsl:if test="afr:InRestGood">
						<table class="bordered" style="width:50%">
							<tbody>
								<tr>
									<td colspan="8" align="center" class="title marg-top">
										<br/>Входящий остаток<br/>
									</td>
								</tr>
								<tr class="title" align="center">
									<td class="graphMain bordered">Наименование товара</td>
									<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС*</td>
									<td class="graphMain bordered">ОКПД 2 товара</td>
									<td class="graphMain bordered">Количество товара </td>
									<td class="graphMain bordered">Единица измерения</td>
									<td class="graphMain bordered">Вес нетто, кг*</td>
									<td class="graphMain bordered">Цена (тариф) за единицу измерения, валюта согласно учетной политике</td>
									<td class="graphMain bordered">Стоимость товара, руб</td>
								</tr>
								<tr class="title" align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
									<td class="bordered">6</td>
									<td class="bordered">7 </td>
									<td class="bordered">8</td>
								</tr>
								<xsl:for-each select="afr:InRestGood">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="afr:PostingPart">
						<br/>
						<br/>
						<table class="bordered">
							<tbody>
								<tr>
									<td align="center" colspan="27" class="title marg-top">
										<br/>
										<br/>
										<xsl:text>Приход</xsl:text>
									</td>
								</tr>
								<tr class="title" align="center" style="bordered">
									<td class="bordered">Дата операции в системе учета</td>
									<td class="bordered">Номер заявления о выпуске товара до подачи ДТ и/или номер ДТ</td>
									<td class="bordered">Номер идентификатора (в том числе электронного)*</td>
									<td class="bordered">Полное наименование товара </td>
									<td class="bordered">Марка и/или модель, и/или артикул, и/или товарный знак</td>
									<td class="bordered">Номер товара в ДТ*</td>
									<td class="bordered">Код товара по ТН ВЭД ЕАЭС*</td>
									<td class="bordered">Количество товара</td>
									<td class="bordered">Единица измерения </td>
									<td class="bordered">Вес нетто, кг*</td>
									<td class="bordered">Вес брутто, кг* </td>
									<td class="bordered">Цена (тариф) товара за единицу измерения, валюта согласно учетной политике</td>
									<td class="bordered">Буквенный код валюты </td>
									<td class="bordered">Стоимость товара, руб.</td>
									<td class="bordered">Стоимость расходов на перевозку, тыс. руб.*</td>
									<td class="bordered">Стоимость расходов на страхование груза, тыс. руб.*</td>
									<td class="bordered">Стоимость доп. расходов, тыс. руб.*</td>
									<td class="bordered">Сумма уплаченных таможенных платежей, тыс. руб</td>
									<td class="bordered">Дата перехода прав собственности</td>
									<td class="bordered">Наименование первичного документа об оприходовании товаров</td>
									<td class="bordered">Дата первичного документа об оприходовании товаров</td>
									<td class="bordered">Номер первичного документа об оприходовании товаров</td>
									<td class="bordered">Сумма оплаты товара и/или услуг, валюта коммерческого документа или иного применимого документа</td>
									<td class="bordered">Дата документа об оплате товара и/или услуг </td>
									<td class="bordered">Номер документа об оплате товара и/или услуг</td>
									<td class="bordered">Номер счета по дебету</td>
									<td class="bordered">Номер счета по кредиту</td>
								</tr>
								<tr class="title" align="center">
									<td align="center" class="bordered">1</td>
									<td align="center" class="bordered">2</td>
									<td align="center" class="bordered">3</td>
									<td align="center" class="bordered">4</td>
									<td align="center" class="bordered">5</td>
									<td align="center" class="bordered">6</td>
									<td align="center" class="bordered">7 </td>
									<td align="center" class="bordered">8</td>
									<td align="center" class="bordered">9</td>
									<td align="center" class="bordered">10</td>
									<td align="center" class="bordered">11</td>
									<td align="center" class="bordered">12</td>
									<td align="center" class="bordered">13</td>
									<td align="center" class="bordered">14</td>
									<td align="center" class="bordered">15</td>
									<td align="center" class="bordered">16</td>
									<td align="center" class="bordered">17</td>
									<td align="center" class="bordered">18</td>
									<td align="center" class="bordered">19</td>
									<td align="center" class="bordered">20</td>
									<td align="center" class="bordered">21</td>
									<td align="center" class="bordered">22</td>
									<td align="center" class="bordered">23</td>
									<td align="center" class="bordered">24</td>
									<td align="center" class="bordered">25</td>
									<td align="center" class="bordered">26</td>
									<td align="center" class="bordered">27</td>
								</tr>
								<xsl:for-each select="afr:PostingPart">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="afr:Expense">
						<table class="bordered">
							<tbody>
								<tr>
									<td align="center" colspan="29" class="title marg-top">
										<br/>
										<br/>
										<xsl:text>Расход</xsl:text>
									</td>
								</tr>
								<tr align="center" class="title">
									<td class="bordered">Дата операции в системе учета</td>
									<td class="bordered">Номер идентификатора (в том числе электронного)</td>
									<td bgcolor="#C0C0C0" class="bordered">Номер ДТ</td>
									<td class="bordered">Наименование товара </td>
									<td class="bordered">Код товара по ТН ВЭД ЕАЭС*</td>
									<td class="bordered">ОКПД 2 товара</td>
									<td class="bordered">Количество товара</td>
									<td class="bordered">Единица измерения</td>
									<td class="bordered">Вес нетто, кг*</td>
									<td class="bordered">Цена (тариф) товара за единицу измерения, валюта согласно учетной политике</td>
									<td class="bordered">Буквенный код валюты</td>
									<td class="bordered">Стоимость товара, руб</td>
									<td class="bordered">Наименование коммерческого документа </td>
									<td class="bordered">Дата коммерческого документа</td>
									<td class="bordered">Номер коммерческого документа</td>
									<td class="bordered">Наименование покупателя</td>
									<td class="bordered">ИНН покупателя</td>
									<td class="bordered">КПП покупателя</td>
									<td bgcolor="#C0C0C0" class="bordered">Наименование продавца</td>
									<td bgcolor="#C0C0C0" class="bordered">ИНН продавца</td>
									<td bgcolor="#C0C0C0" class="bordered">КПП продавца</td>
									<td class="bordered">Наименование грузополучателя</td>
									<td class="bordered">ИНН грузополучателя</td>
									<td class="bordered">КПП грузополучателя</td>
									<td class="bordered">Наименование первичного документа</td>
									<td class="bordered">Дата первичного документа</td>
									<td class="bordered">Номер первичного документа</td>
									<td class="bordered">Номер первичного документа</td>
									<td class="bordered">Номер счета по кредиту</td>
								</tr>
								<tr class="title" align="center">
									<td align="center" class="bordered">1</td>
									<td align="center" class="bordered">2</td>
									<td align="center" class="bordered">3</td>
									<td align="center" class="bordered">4</td>
									<td align="center" class="bordered">5</td>
									<td align="center" class="bordered">6</td>
									<td align="center" class="bordered">7 </td>
									<td align="center" class="bordered">8</td>
									<td align="center" class="bordered">9</td>
									<td align="center" class="bordered">10</td>
									<td align="center" class="bordered">11</td>
									<td align="center" class="bordered">12</td>
									<td align="center" class="bordered">13</td>
									<td align="center" class="bordered">14</td>
									<td align="center" class="bordered">15</td>
									<td align="center" class="bordered">16</td>
									<td align="center" class="bordered">17</td>
									<td align="center" class="bordered">18</td>
									<td align="center" class="bordered">19</td>
									<td align="center" class="bordered">20</td>
									<td align="center" class="bordered">21</td>
									<td align="center" class="bordered">22</td>
									<td align="center" class="bordered">23</td>
									<td align="center" class="bordered">24</td>
									<td align="center" class="bordered">25</td>
									<td align="center" class="bordered">26</td>
									<td align="center" class="bordered">27</td>
									<td align="center" class=" bordered">28</td>
									<td align="center" class="bordered">29</td>
								</tr>
								<xsl:for-each select="afr:Expense">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="afr:OutRestGoods">
						<table class="bordered" style="width:50%">
							<tbody>
								<tr>
									<td colspan="11">
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="11" align="center" class="title marg-top">Исходящий остаток</td>
								</tr>
								<tr class="title" align="center">
									<td class="bordered">Дата операции в системе учета</td>
									<td class="bordered">Номер идентификатора (в том числе электронноо)</td>
									<td bgcolor="#C0C0C0" class="bordered">Номер заявления о выпуске товара до подачи ДТ и/или номер ДТ</td>
									<td class="bordered">Наименование товара</td>
									<td class="bordered">Код товара по ТН ВЭД ЕАЭС*</td>
									<td class="bordered">ОКПД 2 товара</td>
									<td class="bordered">Количество товара </td>
									<td class="bordered">Единица измерения</td>
									<td class="bordered">Вес нетто, кг*</td>
									<td class="bordered">Цена (тариф) за единицу измерения, валюта согласно учетной политике</td>
									<td class="bordered">Стоимость товара, руб</td>
								</tr>
								<tr class="title" align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
									<td class="bordered">6</td>
									<td class=" bordered">7 </td>
									<td class="bordered">8</td>
									<td class="bordered">9</td>
									<td class="bordered">10</td>
									<td class="bordered">11</td>
								</tr>
								<xsl:for-each select="afr:OutRestGoods">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
								<tr>
									<td align="left" colspan="11" class="graphLittle">
										<br>* графы заполняются в случае наличия сведения</br>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="afr:WarehouseGoods">
						<table class="bordered">
							<tbody>
								<tr>
									<td align="center" colspan="16" class="title marg-top">
										<br/>
										<br/>
										<xsl:text>Временное хранение</xsl:text>
									</td>
								</tr>
								<tr class="title" align="center">
									<td class="bordered">Дата операции в системе учета</td>
									<td class="bordered">Дата помещения на временное хранение</td>
									<td class=" bordered">Наименование товара</td>
									<td class="bordered">Марка и/или модель, и/или артикул, и/или товарный знак</td>
									<td class="bordered">Количество товара</td>
									<td class="bordered">Единица измерения принятия товаров на временное хранение</td>
									<td class="bordered">Вес нетто, кг*</td>
									<td class="bordered">Наименование первичного документа о принятии на склад временного хранения</td>
									<td class=" bordered">Дата первичного документа о принятии на склад временного хранения</td>
									<td class="bordered">Номер первичного документа о принятии на склад временного хранения</td>
									<td class="bordered">Дата акта приема-передачи выполненных работ (услуг)</td>
									<td class="bordered">Номер акта приема-передачи выполненных работ (услуг)</td>
									<td class="bordered">Дата документа об утрате товара (при порче, браке)</td>
									<td class="bordered">Номер документа об утрате товара (при порче, браке)</td>
									<td class="bordered">Номер счета по дебету</td>
									<td class="bordered">Номер счета по кредиту</td>
								</tr>
								<tr class="title" align="center">
									<td align="center" class="bordered">1</td>
									<td align="center" class="bordered">2</td>
									<td align="center" class="bordered">3</td>
									<td align="center" class="bordered">4</td>
									<td align="center" class="bordered">5</td>
									<td align="center" class="bordered">6</td>
									<td align="center" class="bordered">7 </td>
									<td align="center" class="bordered">8</td>
									<td align="center" class="bordered">9</td>
									<td align="center" class="bordered">10</td>
									<td align="center" class="bordered">11</td>
									<td align="center" class="bordered">12</td>
									<td align="center" class="bordered">13</td>
									<td align="center" class="bordered">14</td>
									<td align="center" class="bordered">15</td>
									<td align="center" class="bordered">16</td>
								</tr>
								<xsl:for-each select="afr:WarehouseGoods">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
								<tr>
									<td class="graphLittle" colspan="16">
										<br>Заполняется в случае, когда организация планирует пользоваться (пользуется) специальными упрощениями, предусмотренными подпунктами 1, 2 пункта 3 статьи 437 ТК ЕАЭС</br>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="afr:Signatures">
						<table style="width:50%">
							<tbody>
								<tr>
									<td colspan="5">
										<br/>
										<br/>
									</td>
								</tr>
								<tr align="center">
									<td class="value" style="width=15%">
										<xsl:value-of select="afr:Signatures/cat_ru:PersonPost"/>
									</td>
									<td style="width=3%"/>
									<td class="value" style="width=15%"/>
									<td style="width=3%"/>
									<td class="value" style="width=15%">
										<xsl:value-of select="afr:Signatures/cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="afr:Signatures/cat_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="afr:Signatures/cat_ru:PersonMiddleName"/>
									</td>
								</tr>
								<tr align="center" valign="top" class="graphLittle">
									<td>(Должность лица, передавшего сведения)</td>
									<td/>
									<td>(подпись)</td>
									<td/>
									<td>(И.О. Фамилия, электронная подпись)</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:AEORegistryIdDetailsType -->
	<xsl:template match="RUDECLcat:AEORegistryIdDetails">
		<xsl:value-of select="catESAD_cu:DocId"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="catESAD_cu:AEORegistryKindCode"/>
		<xsl:text>) код типа реестра: </xsl:text>
		<xsl:value-of select="catESAD_cu:RegistryOwnerCode"/>
		<xsl:if test="catESAD_cu:CountryA2Code">
			<xsl:text> код страны: </xsl:text>
			<xsl:value-of select="catESAD_cu:CountryA2Code"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUDECLcat:AEODeclarantDetailsType -->
	<xsl:template match="afr:AuthoriziedOperatorDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUDECLcat:AEORegistryIdDetails">
				<div class="title marg-top">Номер свидетельства о включении в реестр уполномоченных экономических операторов</div>
				<div>
					<xsl:apply-templates select="RUDECLcat:AEORegistryIdDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа afr:DTInfoType -->
	<xsl:template match="afr:DTinfo">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
		<xsl:if test="afr:AddNumber">&#160;<xsl:value-of select="afr:AddNumber"/>
		</xsl:if>
		<xsl:if test="afr:GoodsNumeric">
			<xsl:text> &#160;№ тов.:</xsl:text>
			<xsl:value-of select="afr:GoodsNumeric"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа afr:ExpenseType -->
	<xsl:template match="afr:Expense">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr class="annot graphMain" valign="middle" align="center">
				<td class="bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="afr:DateOperation"/>
					</xsl:call-template>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:Id"/>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:DTinfo">
						<br/>
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>; </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:GoodsDescription">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsTNVEDCode"/>
				</td>
				<td class=" bordered">
					<xsl:value-of select="afr:OKPD2"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsQuantity/cat_ru:GoodsQuantity"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
					<xsl:if test="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:NetWeight, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:IdenticalDealNationalPrice, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:PriceCurrencyCode"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:Cost, '.', ',')"/>
				</td>
				<td class=" bordered">
					<xsl:value-of select="afr:CommDocumentInfo/cat_ru:PrDocumentName"/>
				</td>
				<td class=" bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="afr:CommDocumentInfo/cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</td>
				<td class=" bordered">
					<xsl:value-of select="afr:CommDocumentInfo/cat_ru:PrDocumentNumber"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:BayerName"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:BayerINN"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:BayerKPP"/>
				</td>
				<td class="bordered"/>
				<td class="bordered"/>
				<td class="bordered"/>
				<td class="bordered">
					<xsl:value-of select="afr:ConsigneeName"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:ConsigneeINN"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:ConsigneeKPP"/>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:DocumentInfo">
						<br/>
						<xsl:value-of select="cat_ru:PrDocumentName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:DocumentInfo">
						<br/>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:DocumentInfo">
						<br/>
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:Debit"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:Credit"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа afr:InRestGoodType -->
	<xsl:template match="afr:InRestGood">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr class="annot graphMain" align="center">
				<td class="bordered">
					<xsl:for-each select="afr:GoodsDescription">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsTNVEDCode"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:OKPD2"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsQuantity/cat_ru:GoodsQuantity"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
					<xsl:if test="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:Weight, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:IdenticalDealNationalPrice, '.', ',')"/>
					<xsl:if test="afr:PriceCurrencyCode">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="afr:PriceCurrencyCode"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:Cost, '.', ',')"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа afr:OutRestGoodsType -->
	<xsl:template match="afr:OutRestGoods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr class="annot graphMain" align="center">
				<td class="bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="afr:DateOperation"/>
					</xsl:call-template>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:Id"/>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:DTinfo">
						<br/>
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>; </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:GoodsDescription">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsTNVEDCode"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:OKPD2"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsQuantity/cat_ru:GoodsQuantity"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
					<xsl:if test="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:Weight, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:IdenticalDealNationalPrice, '.', ',')"/>
					<xsl:if test="afr:PriceCurrencyCode">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="afr:PriceCurrencyCode"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:Cost, '.', ',')"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="afr:PayDocument">
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
	<!-- Шаблон для типа afr:PostingPartType -->
	<xsl:template match="afr:PostingPart">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr class="annot graphMain" align="center">
				<td class="bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="afr:DateOperation"/>
					</xsl:call-template>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:DTinfo">
						<br/>
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>; </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:Id"/>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:GoodsDescription">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:TradeMark"/>
					<xsl:if test="afr:GoodsMark">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="afr:GoodsMark"/>
					</xsl:if>
					<xsl:if test="afr:GoodsModel">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="afr:GoodsModel"/>
					</xsl:if>
					<xsl:if test="afr:GoodsMarking">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="afr:GoodsMarking"/>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:DTinfo/afr:GoodsNumeric"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsTNVEDCode"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsQuantity/cat_ru:GoodsQuantity"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
					<xsl:if test="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:NetWeight, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:GrossWeight, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:IdenticalDealNationalPrice, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:PriceCurrencyCode"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:Cost, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:TransportCost, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:InsCost, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:AddCost, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:CustPay, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="afr:DateOwner"/>
					</xsl:call-template>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:DocumentInfo">
						<br/>
						<xsl:value-of select="cat_ru:PrDocumentName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:DocumentInfo">
						<br/>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:DocumentInfo">
						<br/>
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:AmountPay, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="afr:PayDocument/cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:PayDocument/cat_ru:PrDocumentNumber"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:Debit"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:Credit"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="afr:Signatures">
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
			<xsl:if test="cat_ru:IssueDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата подписания</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа afr:WarehouseGoodsType -->
	<xsl:template match="afr:WarehouseGoods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr align="center" class="annot graphMain">
				<td class="bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="afr:DateOperation"/>
					</xsl:call-template>
				</td>
				<td class="bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="afr:WHDate"/>
					</xsl:call-template>
				</td>
				<td class="bordered">
					<xsl:for-each select="afr:GoodsDescription">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:TradeMark"/>
					<xsl:if test="afr:GoodsMark">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="afr:GoodsMark"/>
					</xsl:if>
					<xsl:if test="afr:GoodsModel">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="afr:GoodsModel"/>
					</xsl:if>
					<xsl:if test="afr:GoodsMarking">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="afr:GoodsMarking"/>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsQuantity/cat_ru:GoodsQuantity"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
					<xsl:if test="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="afr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:value-of select="translate(afr:NetWeight, '.', ',')"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:DocumentInfo/cat_ru:PrDocumentName"/>
				</td>
				<td class="bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param select="afr:DocumentInfo/cat_ru:PrDocumentDate" name="dateIn"/>
					</xsl:call-template>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:DocumentInfo/cat_ru:PrDocumentNumber"/>
				</td>
				<td class="bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param select="afr:ActDocument/cat_ru:PrDocumentDate" name="dateIn"/>
					</xsl:call-template>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:ActDocument/cat_ru:PrDocumentNumber"/>
				</td>
				<td class="bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param select="afr:LossDocument/cat_ru:PrDocumentDate" name="dateIn"/>
					</xsl:call-template>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:LossDocument/cat_ru:PrDocumentNumber"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="afr:Debit"/>
				</td>
				<td class=" bordered">
					<xsl:value-of select="afr:Credit"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">,&#032;Код страны:&#032;<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">,&#032;ОПФ:&#032;<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:apply-templates mode="spaceSeparated" select="RUScat_ru:IdentityCard"/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates mode="ru_address" select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<xsl:for-each select="RUScat_ru:CommunicationDetails">
				<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectBranch">
			<br>Обособленное подразделение:</br>
			<xsl:apply-templates select="RUScat_ru:SubjectBranch" mode="organization"/>
		</xsl:if>
		<xsl:if test="RUDECLcat:AEORegistryIdDetails">
			<br>Cвидетельство о включении в реестр УЭО: </br>
			<xsl:apply-templates select="RUDECLcat:AEORegistryIdDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">,&#032;УИТН:&#032;<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#032;(<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode"> Код ОПФ: <xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:value-of select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:value-of select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:value-of select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email: <xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">,&#032;</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position() > 1">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
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