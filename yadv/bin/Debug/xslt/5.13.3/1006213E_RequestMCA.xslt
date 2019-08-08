<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:itsri="urn:customs.ru:Information:CustomsDocuments:RequestMCA:5.12.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="itsri:RequestMCA">
		<html>
			<head>
			<title>Информация о ДТ и документе по запросу</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
			<style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #ffffff;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 8pt;
							}
				.graph1 {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
			</head>
			<body>
			<div class="album_page">
			    <table align="center">
					<tr>
						<td style="border:solid 0pt" class="graph" colspan="16" align="center"><font face="Times new roman" size="5"><b><i>Информация о ДТ и документе по запросу</i></b></font></td>
					</tr>
					<tr>
						<td align="center" style="border:solid 0pt" class="graph" colspan="30">&#160;</td>
					</tr>
					<tr>
						<td style="border:solid 0pt" class="graph1" colspan="16">Направление перемещения: <xsl:value-of select="itsri:TransitDirectionCode"/></td>
					</tr>
					<xsl:if test="itsri:CurrencyCode">
					<tr>
						<td style="border:solid 0pt" class="graph1" colspan="16">Код валюты договора: <xsl:value-of select="itsri:CurrencyCode"/></td>
					</tr></xsl:if>
					<tr>
						<td style="border:solid 0pt" class="graph1" colspan="16">Регистрационный номер ДТ: <xsl:apply-templates select="itsri:DTRegNumber"/></td>
					</tr>
					<tr>
						<td style="border:solid 0pt" class="graph1" colspan="16">
						    <xsl:choose>
								<xsl:when test="itsri:PaymentsFact='1' or itsri:PaymentsFact='t' or itsri:PaymentsFact='true'">В ДТС имеются лицензионные платежи.</xsl:when>
								<xsl:otherwise>В ДТС отсутствуют лицензионные платежи.</xsl:otherwise>
							</xsl:choose>&#160;
							<xsl:choose>
								<xsl:when test="itsri:OtherPaymentsFact='1' or itsri:OtherPaymentsFact='t' or itsri:OtherPaymentsFact='true'">ДТ содержит иные платежи.</xsl:when>
								<xsl:otherwise>ДТ не содержит иные платежи.</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<xsl:if test="itsri:VendorInfo">
					<tr>
						<td style="border:solid 0pt" class="graph1" colspan="16">Описание продавца: <xsl:value-of select="itsri:VendorInfo"/></td>
					</tr></xsl:if>
					<tr>
						<td align="center" style="border:solid 0pt" class="graph1" colspan="16">&#160;</td>
					</tr>
			    <xsl:if test="itsri:Consigner">
					<tr>
						<td style="border:solid 0pt" class="graph1" colspan="16"><b>Отправитель товара:</b><xsl:apply-templates select="itsri:Consigner"/></td>
					</tr></xsl:if>
					<xsl:if test="itsri:Consignee">
					<tr>
						<td style="border:solid 0pt" class="graph1" colspan="16"><b>Получатель товара:</b><xsl:apply-templates select="itsri:Consignee"/></td>
					</tr></xsl:if>
					<xsl:if test="itsri:ContractHolder">
					<tr>
						<td style="border:solid 0pt" class="graph1" colspan="16"><b>Контрактодержатель:</b><xsl:apply-templates select="itsri:ContractHolder"/></td>
					</tr></xsl:if>
					<xsl:if test="itsri:Buyer">
					<tr>
						<td style="border:solid 0pt" class="graph1" colspan="16"><b>Покупатель:</b><xsl:apply-templates select="itsri:Buyer"/></td>
					</tr></xsl:if>
				</table>
				<table>
					<tr>
						<td style="border:solid 0pt" class="graph" colspan="16">&#160;</td>
					</tr>
					<tr>
						<td style="border:solid 0pt" class="graph1" colspan="16" align="center"><font size="3"><b>Информация о товарной позиции по запросу</b></font></td>
					</tr>
					</table>
					<table align="center" style="border-top:solid 2pt #000000; border-bottom:solid 2pt #000000; border-right:solid 2pt #000000; border-left:solid 2pt #000000;">
					<tr>
                     
                     <td align="center" rowspan="2">
                        <span class="graph">Номер товар<br/>ной позиции</span>
                     </td>
                     <td align="center" rowspan="2">
                        <span class="graph">Код ТНВЭДТС</span>
                     </td>
                     <td align="center" rowspan="2">
                        <span class="graph">Код<br/>таможенной<br/>процедуры</span>
                     </td>
                     <td align="center" rowspan="2">
                        <span class="graph">Код<br/>страны<br/>происхож<br/>дения</span>
                     </td>
                     <td align="center" rowspan="2">
                        <span class="graph">Код<br/>страны<br/>отправ<br/>ления</span>
                     </td>
                     <!--<td align="center" colspan="2" width="20mm">
                        <span class="graph">Получатель<br/> товара<br/> по дове<br/>ренности</span>
                     </td>-->
                     <td align="center" rowspan="2">
                        <span class="graph">Код вида<br/>транспор<br/>та на границе
						</span>
                     </td>
                     <td align="center" rowspan="2">
                        <span class="graph">Номер МДП</span>
                     </td>
                     <td align="center" rowspan="2">
                        <span class="graph">Паспорт сделки</span>
                     </td>
                     <td align="center" rowspan="2">
                        <span class="graph">Фактурная стоимость</span>
                     </td>
                     <td rowspan="2" align="center">
                        <span class="graph">Количест<br/>во грузо<br/>вых мест</span>
                     </td>
                     <!--<td align="center" colspan="13">
                        <span class="graph">Характеристика товаров в группе</span>
                     </td>-->
                     <td align="center" rowspan="2">
                        <span class="graph">Контракт</span>
                     </td>
                     <td align="center" rowspan="2">
                        <span class="graph">Инвойс</span>
                     </td>
                     <td align="center" colspan="4">
                        <span class="graph">Информация о количественных характеристиках товарной позиции</span>
                     </td>
                  </tr>
                  <tr>
                     <td align="center">
                        <span class="graph">Вес нетто</span>
                     </td>
                     <td align="center">
                        <span class="graph">Вес брутто</span>
                     </td>
                     <td align="center">
                        <span class="graph">Таможенная стоимость, руб.</span>
                     </td>
                     <td align="center">
                        <span class="graph">Количество (Код ДЕИ)</span>
                     </td>
                  </tr>
                  
                 <xsl:for-each select="itsri:ITSInfo">
                     <tr>
                        <td style="border-top: 2px solid black; border-left: 2px solid black;" align="center">
                           <span class="graph">
                                       <xsl:value-of select="itsri:GoodsNumeric"/>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;" align="center">
                           <span class="graph">
                                 <xsl:if test="itsri:GoodsTNVEDCode">
                                       <xsl:value-of select="itsri:GoodsTNVEDCode"/>
                                    </xsl:if>
                           </span>
                        </td>
                         <td style="border-top: 2px solid black;" align="center">
                           <span class="graph">
                                       <xsl:value-of select="itsri:CustomsModeCode"/>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;" align="center">
                           <span class="graph">
                              <xsl:if test="itsri:OriginCountryCode">
                                 <xsl:value-of select="itsri:OriginCountryCode"/>
                              </xsl:if>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;" align="center">
                           <span class="graph">
                                 <xsl:if test="itsri:DispatchCountryCode">
                                    <xsl:value-of select="itsri:DispatchCountryCode"/>
                                 </xsl:if>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;" align="center">
                           <span class="graph">
                              <xsl:if test="itsri:TransportModeCode">
                                 <xsl:value-of select="itsri:TransportModeCode"/>
                              </xsl:if>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;">
                           <span class="graph">
                           <xsl:for-each select="itsri:MDPNum">
                                 <xsl:value-of select="."/>
                                 <xsl:if test="position()!=last()">, </xsl:if>
                                 </xsl:for-each>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;">
                           <span class="graph">
                              <xsl:for-each select="itsri:PassportDeal">
                                 <xsl:value-of select="."/>
                                 <xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
                                 </xsl:for-each>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;">
                           <span class="graph">
                              <xsl:if test="itsri:InvoiceCost">
                                 <xsl:value-of select="itsri:InvoiceCost"/>
                              </xsl:if>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;">
                           <span class="graph">
                              <xsl:if test="itsri:PlacesKol">
                                 <xsl:value-of select="itsri:PlacesKol"/>
                              </xsl:if>
                           </span>
                        </td>
                        <!---->
                        <!--<td style="border-top: 2px solid black;"/>-->
                        <td style="border-top: 2px solid black;">
                           <span class="graph">
                           <xsl:for-each select="itsri:Contract">
                           <xsl:apply-templates select="."/>
                           <xsl:if test="position()!=last()"><br/></xsl:if>
                           </xsl:for-each>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;">
                           <span class="graph">
                           <xsl:for-each select="itsri:Invoice">
                           <xsl:apply-templates select="."/>
                           <xsl:if test="position()!=last()"><br/></xsl:if>
                           </xsl:for-each>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;">
                           <span class="graph">
                              <xsl:if test="itsri:ITSRequest/itsri:NetWeight">
                                <xsl:value-of select="itsri:ITSRequest/itsri:NetWeight"/>
                              </xsl:if>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;">
                           <span class="graph">
                              <xsl:if test="itsri:ITSRequest/itsri:GrossWeight">
                                <xsl:value-of select="itsri:ITSRequest/itsri:GrossWeight"/>
                              </xsl:if>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black;">
                           <span class="graph">
                              <xsl:if test="itsri:ITSRequest/itsri:CustomsCostRUB">
                                <xsl:value-of select="itsri:ITSRequest/itsri:CustomsCostRUB"/>
                              </xsl:if>
                           </span>
                        </td>
                        <td style="border-top: 2px solid black; border-right: 2px solid black;">
                           <span class="graph">
                              <xsl:if test="itsri:ITSRequest/itsri:GoodsQuantity">
                                <xsl:apply-templates select="itsri:ITSRequest/itsri:GoodsQuantity"/>
                              </xsl:if>
                           </span>
                        </td>
                     </tr>
                     <xsl:if test="itsri:GoodsGroupInformation">
                     <tr>
						<td colspan="16" align="center" class="graph" style="border-left: 2px solid black; border-right: 2px solid black; border-bottom: 0px solid black;">Описание товара в группе</td>
					</tr></xsl:if>
                     <xsl:for-each select="itsri:GoodsGroupInformation">
                     <!--<xsl:choose>
							<xsl:when test="position()=last">-->
                    <tr>
						<td colspan="16" style="border-right: 2px solid black; border-left: 2px solid black; border-bottom: 0px solid white; border-top: 0px solid black;" class="graph">
						    <table>
						    <xsl:if test="catESAD_cu:Manufacturer">
						    <tr>
                    <td style="border:solid 0pt">
                        <span class="graph">Сведения о производителе: <xsl:value-of select="catESAD_cu:Manufacturer"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:TradeMark">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Тов. знак, место происхождения, объект авторского права, и.т.д.: <xsl:value-of select="catESAD_cu:TradeMark"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:GoodsMark">  
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Марка товара: <xsl:value-of select="catESAD_cu:GoodsMark"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:GoodsModel">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Модель товара: <xsl:value-of select="catESAD_cu:GoodsModel"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:GoodsMarking">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph"> Артикул товара: <xsl:value-of select="catESAD_cu:GoodsMarking"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:GoodsStandard">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Стандарт (ГОСТ, ОСТ, СПП, СТО, ТУ): <xsl:value-of select="catESAD_cu:GoodsStandard"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:GoodsSort">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Сорт/сорт или группа сортов (для лесо- и пиломатериалов): <xsl:value-of select="catESAD_cu:GoodsSort"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:WoodSortiment">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph"> Наименование сортимента (для лесоматериалов товарной позиции 4403): <xsl:value-of select="catESAD_cu:WoodSortiment"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:WoodKind">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Порода древесины: <xsl:value-of select="catESAD_cu:WoodKind"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:Dimensions">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Размеры: <xsl:value-of select="catESAD_cu:Dimensions"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:DateIssue">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Дата выпуска: 
                        <xsl:call-template name="russian_date">
                                     <xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
                                 </xsl:call-template>
                        </span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:SerialNumber">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Серийный номер: 
                        <xsl:for-each select="catESAD_cu:SerialNumber">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()">, </xsl:if>
                                 </xsl:for-each>
                        </span>
                     </td></tr></xsl:if>
                     
                     <xsl:if test="catESAD_cu:GoodsGroupQuantity">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Количество товаров. Гр. 31 первый подраздел: <xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/></span>
                     </td></tr></xsl:if><br/><br/>
							</table>
						</td>
					</tr><!--</xsl:when>
					<xsl:when test="position()!=last()">
					<tr>
						<td colspan="16" style="border-right: 2px solid black; border-left: 2px solid black; border-top: 0px solid black; border-bottom: 0px solid black;" class="graph">
						    <table>
						    <xsl:if test="catESAD_cu:Manufacturer">
						    <tr>
                    <td style="border:solid 0pt">
                        <span class="graph">Сведения о производителе: <xsl:value-of select="catESAD_cu:Manufacturer"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:TradeMark">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Тов. знак, место происхождения, объект авторского права, и.т.д.: <xsl:value-of select="catESAD_cu:TradeMark"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:GoodsMark">  
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Марка товара: <xsl:value-of select="catESAD_cu:GoodsMark"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:GoodsModel">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Модель товара: <xsl:value-of select="catESAD_cu:GoodsModel"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:GoodsMarking">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph"> Артикул товара: <xsl:value-of select="catESAD_cu:GoodsMarking"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:GoodsStandard">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Стандарт (ГОСТ, ОСТ, СПП, СТО, ТУ): <xsl:value-of select="catESAD_cu:GoodsStandard"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:GoodsSort">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Сорт/сорт или группа сортов (для лесо- и пиломатериалов): <xsl:value-of select="catESAD_cu:GoodsSort"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:WoodSortiment">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph"> Наименование сортимента (для лесоматериалов товарной позиции 4403): <xsl:value-of select="catESAD_cu:WoodSortiment"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:WoodKind">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Порода древесины: <xsl:value-of select="catESAD_cu:WoodKind"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:Dimensions">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Размеры: <xsl:value-of select="catESAD_cu:Dimensions"/></span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:DateIssue">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Дата выпуска: 
                        <xsl:call-template name="russian_date">
                                     <xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
                                 </xsl:call-template>
                        </span>
                     </td></tr></xsl:if>
                     <xsl:if test="catESAD_cu:SerialNumber">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Серийный номер: 
                        <xsl:for-each select="catESAD_cu:SerialNumber">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()">, </xsl:if>
                                 </xsl:for-each>
                        </span>
                     </td></tr></xsl:if>
                     
                     <xsl:if test="catESAD_cu:GoodsGroupQuantity">
                     <tr>
                     <td style="border:solid 0pt">
                        <span class="graph">Количество товаров. Гр. 31 первый подраздел: <xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/></span>
                     </td></tr></xsl:if>
							</table>
						</td>
					</tr>
					</xsl:when>
					</xsl:choose>-->
					</xsl:for-each>
                  </xsl:for-each>
				</table>
			</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="itsri:DTRegNumber"><!--код/дата/номер-->
	<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/><xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
	<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
</xsl:template>
<xsl:template match="itsri:Consigner | itsri:Consignee | itsri:ContractHolder | itsri:Buyer">
	<!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
	<xsl:value-of select="cat_ru:OrganizationName"/>
	<xsl:if test="cat_ru:ShortName">
		<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
		<xsl:value-of select="cat_ru:ShortName"/>
		<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
	</xsl:if>&#160;
	
	<xsl:choose>
		<xsl:when test="cat_ru:RFOrganizationFeatures"><xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/></xsl:when>
		<xsl:when test="cat_ru:RKOrganizationFeatures"><xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/></xsl:when>
		<xsl:when test="cat_ru:RBOrganizationFeatures"><xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/></xsl:when>
	</xsl:choose>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
	<xsl:if test="cat_ru:OGRN">
		<span>ОГРН: <xsl:value-of select="cat_ru:OGRN" /></span>&#160;
	</xsl:if>
	<xsl:if test="cat_ru:INN">
		<span>ИНН: <xsl:value-of select="cat_ru:INN" /></span>&#160;
	</xsl:if>
	<xsl:if test="cat_ru:KPP">
		<span>	КПП: <xsl:value-of select="cat_ru:KPP" /></span>&#160;
	</xsl:if>
</xsl:template>

<xsl:template match="cat_ru:RBOrganizationFeatures">
	<xsl:if test="cat_ru:UNP">
		<span>УНП: <xsl:value-of select="cat_ru:UNP" /></span>&#160;
	</xsl:if>
	<xsl:if test="cat_ru:RBIdentificationNumber">
		<span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber" /></span>&#160;
	</xsl:if>
</xsl:template>

<xsl:template match="cat_ru:RKOrganizationFeatures">
	<xsl:if test="cat_ru:BIN">
		<span>БИН: <xsl:value-of select="cat_ru:BIN" /></span>&#160;
	</xsl:if>
	<xsl:if test="cat_ru:IIN">
		<span>ИИН: <xsl:value-of select="cat_ru:IIN" /></span>&#160;
	</xsl:if>
	<xsl:for-each select="cat_ru:ITN">
		<span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode" />/<xsl:value-of select="cat_ru:KATOCode" />/<xsl:value-of select="cat_ru:RNN" /><xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/></xsl:if>
			</span>&#160;
	</xsl:for-each>
</xsl:template>

<xsl:template match="itsri:Contract | itsri:Invoice"><!--номер, дата, название документа-->
	<span>
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>&#160;
		<xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</span><br/>
</xsl:template>
<xsl:template name="russian_date">
	<xsl:param name="dateIn"/>
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of
				select="substring($dateIn,1,4)"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match="catESAD_cu:GoodsGroupQuantity | itsri:GoodsQuantity"><!--кол-ко, ед-ца, код-->
	<xsl:value-of select="cat_ru:GoodsQuantity"/>
	<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
	<xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
</xsl:template>
</xsl:stylesheet>
