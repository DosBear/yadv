<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catWH_ru cat_ru do2r" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:do2r="urn:customs.ru:Information:WarehouseDocuments:DO2Report:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <!--Шаблоны-->
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
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
   <xsl:template name="DO3_date">
      <xsl:param name="year"/>
      <!--xsl:value-of select="substring (., 7, 2)"/>&#160;-->
      <!--xsl:variable name="month" select="substring($month,6, 2)"/-->
      <xsl:choose>
         <xsl:when test="$year=1">января</xsl:when>
         <xsl:when test="$year=2">февраля</xsl:when>
         <xsl:when test="$year=3">марта</xsl:when>
         <xsl:when test="$year=4">апреля</xsl:when>
         <xsl:when test="$year=5">мая</xsl:when>
         <xsl:when test="$year=6">июня</xsl:when>
         <xsl:when test="$year=7">июля</xsl:when>
         <xsl:when test="$year=8">августа</xsl:when>
         <xsl:when test="$year=9">сентября</xsl:when>
         <xsl:when test="$year=10">октября</xsl:when>
         <xsl:when test="$year=11">ноября</xsl:when>
         <xsl:when test="$year=12">декабря</xsl:when>
      </xsl:choose>                                                    
        <xsl:value-of select="substring($year, 1, 4)"/> г.
	</xsl:template>
   <xsl:template name="DO3_month">
      <xsl:param name="month"/>
      <!--xsl:value-of select="substring ($month, 6, 2)"/--> 
        
      <!--xsl:variable name="month" select="substring(., 6, 2)"/-->
      <xsl:choose>
         <xsl:when test="$month=1">января</xsl:when>
         <xsl:when test="$month=2">февраля</xsl:when>
         <xsl:when test="$month=3">марта</xsl:when>
         <xsl:when test="$month=4">апреля</xsl:when>
         <xsl:when test="$month=5">мая</xsl:when>
         <xsl:when test="$month=6">июня</xsl:when>
         <xsl:when test="$month=7">июля</xsl:when>
         <xsl:when test="$month=8">августа</xsl:when>
         <xsl:when test="$month=9">сентября</xsl:when>
         <xsl:when test="$month=10">октября</xsl:when>
         <xsl:when test="$month=11">ноября</xsl:when>
         <xsl:when test="$month=12">декабря</xsl:when>
      </xsl:choose>                                                    
	</xsl:template>
   <xsl:template name="DO2R">
      <table width="270mm">
         <tbody>
            <!--tr align="center">
				<td align="center" width="270mm">
					<span style="aligh:center">ОТЧЕТ № 
						<xsl:value-of select="catWH_ru:ReportNumber"/>&#160;
						ОТ <xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
						</xsl:call-template>
					&#160;О ВЫДАЧЕ ТОВАРОВ С СВХ 
					</span>
				</td>
			</tr>
			<tr>
				<td width="270mm">Транспортный документ (вид, дата и номер) 
					<xsl:value-of select="donr:TransportDoc/cat_ru:PrDocumentName"/>
					<xsl:value-of select="donr:TransportDoc/cat_ru:PrDocumentNumber"/>
					<xsl:value-of select="donr:TransportDoc/cat_ru:PrDocumentDate"/>
				</td>
			</tr-->
            <tr>
               <td>
                  <xsl:choose>
                     <xsl:when test="(do2r:GoodsShipment/do2r:MPOSign=0) or (do2r:GoodsShipment/do2r:MPOSign='f') or (do2r:GoodsShipment/do2r:MPOSign='false')">
                        <table border="1" style="width:250mm">
                           <tr>
                              <td>  </td>
                              <td align="center" colspan="11" style="width:155mm">
                                 <b>Приход</b>
                              </td>
                              <td align="center" colspan="6" style="width:85mm">
                                 <b>Расход</b>
                              </td>
                              <td align="center" colspan="3" style="width:40mm">
                                 <b>Остаток</b>
                              </td>
                           </tr>
                           <tr>
                              <!--1-->
                              <td style="width:5mm">№п/п</td>
                              <!--2-->
                              <td style="width:11mm">Дата и время поме-щения на склад</td>
                              <!--3-->
                              <td style="width:8mm">Номер отчета по форме ДО1мв</td>
                              <!--4-->
                              <td style="width:10mm">Поряд-ковый номер товаров в отч-ете по форме ДО1мв</td>
                              <!--5-->
                              <td style="width:18mm">Наиме-нование товара</td>
                              <!--6-->
                              <td style="width:15mm">Код товара в соответствии с ГС или ТН ВЭД ЕАЭС</td>
                              <!--7-->
                              <td style="width:11mm">Склад-ской номер товара</td>
                              <!--8-->
                              <td style="width:7mm">Коли-чество грузовых мест</td>
                              <!--9-->
                              <td style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
                              <!--10-->
                              <td style="width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
                              <!--11-->
                              <td style="width:10mm">Буквенный код валюты</td>
                              <!--12-->
                              <td style="width:12mm">Дата оконча-ния вре-менного хранения</td>
                              <!--13-->
                              <td style="width:12mm">Дата и время выдачи товара со склада</td>
                              <!--14-->
                              <td style="width:7mm">Коли-чество грузовых мест</td>
                              <!--15-->
                              <td style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
                              <!--16-->
                              <td style="width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
                              <!--17-->
                              <td style="width:17mm">Вид,дата и номер документа, по которому разрешена выдача то-варов со склада</td>
                              <!--18-->
                              <td style="width:18mm">Наиме-нование полу-чателя</td>
                              <!--19-->
                              <td style="width:7mm">Коли-чество гру-зовых мест</td>
                              <!--20-->
                              <td style="width:17mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
                              <!--21-->
                              <td style="width:18mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
                           </tr>
                           <tr>
                              <td align="center">1</td>
                              <td align="center">2</td>
                              <td align="center">3</td>
                              <td align="center">4</td>
                              <td align="center">5</td>
                              <td align="center">6</td>
                              <td align="center">7</td>
                              <td align="center">8</td>
                              <td align="center">9</td>
                              <td align="center">10</td>
                              <td align="center">11</td>
                              <td align="center">12</td>
                              <td align="center">13</td>
                              <td align="center">14</td>
                              <td align="center">15</td>
                              <td align="center">16</td>
                              <td align="center">17</td>
                              <td align="center">18</td>
                              <td align="center">19</td>
                              <td align="center">20</td>
                              <td align="center">21</td>
                           </tr>
                           <xsl:for-each select="do2r:GoodsShipment/do2r:Goods">
                              <xsl:variable name="Input" select="count(do2r:Input)"/>
                              <xsl:for-each select="do2r:Input">
                                 <xsl:variable name="pos" select="position()"/>
                                 <tr>
                                    <!--1 №п/п-->
                                    <td style="width:5mm">
                                       <xsl:value-of select="catWH_ru:GoodsNumber"/>
                                    </td>
                                    <!-- 2 Дата и время помещения на склад-->
                                    <td style="width:11mm">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="do2r:DO1GoodLink/do2r:DO1Date"/>
                                       </xsl:call-template>
                                       <!--br/>
                                       <xsl:value-of select="do2r:DO1GoodLink/do2r:DO1Time"/-->
                                    </td>
                                    <!--3 Номер отчета по форме ДО1мв-->
                                    <td style="width:8mm">
                                       <xsl:value-of select="do2r:DO1GoodLink/do2r:DO1Number"/>
                                    </td>
                                    <!--4 Порядковый номер товаров в отчете по форме ДО1мв-->
                                    <td style="width:10mm">
                                       <xsl:value-of select="do2r:DO1GoodLink/do2r:DO1GoodNumber"/>
                                    </td>
                                    <!--5 Наименование товара-->
                                    <td style="width:18mm">
                                       <xsl:value-of select="catWH_ru:GoodsDescription"/>
                                    </td>
                                    <!--6 Код товара в соответствии с ГС или ТН ВЭД ЕАЭС-->
                                    <td style="width:15mm">
                                       <xsl:value-of select="catWH_ru:GoodsTNVEDCode"/>
                                    </td>
                                    <!--7 складской номер-->
                                    <td style="width:11mm">
                                       <xsl:value-of select="do2r:WHNumber"/>
                                    </td>
                                    <!--8 Количество грузовых мест -->
                                    <td style="width:7mm">
                                       <xsl:value-of select="catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
                                    </td>
                                    <!--9  Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
                                    <td style="width:16mm">
                                       <xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                                       <br/>
                                       <xsl:value-of select="catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
                                    </td>
                                    <!--10  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                                    <td style="width:17mm">
                                       <xsl:value-of select="catWH_ru:InvoiceCost"/>
                                    </td>
                                    <!--11 Буквенный код валюты-->
                                    <td style="width:10mm">
                                       <xsl:value-of select="catWH_ru:CurrencyCode"/>
                                    </td>
                                    <!--12 Дата окончания временного хранения-->
                                    <td style="width:12mm">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="do2r:KeepingLimit/do2r:DeadLineDate"/>
                                       </xsl:call-template>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="$pos=1">
                                          <!--13 Дата и время выдачи товара со склада-->
                                          <td style="width:12mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="../do2r:Output/do2r:OutputDate"/>
                                             </xsl:call-template>
                                             <br/>
                                             <xsl:value-of select="../do2r:Output/do2r:OutputTime"/>
                                          </td>
                                          <!--14 Количество грузовых мест -->
                                          <td style="width:7mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:value-of select="../do2r:Output/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
                                          </td>
                                          <!--15 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
                                          <td style="width:16mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:value-of select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                                             <br/>
                                             <xsl:value-of select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
                                          </td>
                                          <!--16  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                                          <td style="width:17mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:value-of select="../do2r:Output/do2r:Cost"/> 
						<xsl:value-of select="../do2r:Output/do2r:CurrencyCode"/>
                                          </td>
                                          <!--17 Вид,дата и номер документа, по которому разрешена выдача товаров со склада-->
                                          <td style="width:17mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <!--xsl:variable name="doc" select="../../do2r:GoodsCustomDocsLinks/do2r:CustomDocNumber"/><xsl:value-of select="$doc"/-->
                                             <xsl:variable name="Num" select="catWH_ru:GoodsNumber"/>
                                             <xsl:for-each select="(../../do2r:GoodsCustomDocsLinks)">
                                                <xsl:variable name="doc" select="do2r:CustomDocNumber"/>
                                                <xsl:if test="(do2r:GoodNumber)=$Num">
                                                   <xsl:for-each select="../do2r:CustomsDocs[position()=$doc]">
                                                      <xsl:value-of select="cat_ru:PrDocumentName"/> 
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>	 
														<xsl:call-template name="russian_date">
                                                         <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                      </xsl:call-template> 
														<xsl:value-of select="catWH_ru:DocumentCode"/> 	
														<xsl:value-of select="catWH_ru:VttCustomsCode"/>
                                                   </xsl:for-each>
                                                </xsl:if>
                                             </xsl:for-each>
                                             <!--xsl:value-of select="../do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentName"/>
												<br/>
												<xsl:value-of select="../do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentNumber"/>
												<br/>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="../do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentDate"/>
												</xsl:call-template-->
                                          </td>
                                          <!--18 Наиме-нование полу-чателя -->
                                          <td style="width:18mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:value-of select="../do2r:Output/do2r:Consignee/cat_ru:OrganizationName"/>
                                          </td>
                                          <!--19 Количество грузовых мест-->
                                          <td style="width:17mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:value-of select="../do2r:Result/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
                                          </td>
                                          <!--20 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения) -->
                                          <td style="width:17mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:value-of select="../do2r:Result/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="../do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="../do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                                             <br/>
                                             <xsl:value-of select="../do2r:Result/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="../do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="../do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
                                          </td>
                                          <!--21  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                                          <td style="width:18mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:value-of select="../do2r:Result/do2r:Cost"/> 
						<xsl:value-of select="../do2r:Result/do2r:CurrencyCode"/>
                                          </td>
                                       </xsl:when>
                                       <!--xsl:otherwise><td><xsl:text disable-output-escaping="yes"> </xsl:text>   </td></xsl:otherwise-->
                                    </xsl:choose>
                                 </tr>
                              </xsl:for-each>
                           </xsl:for-each>
                        </table>
                     </xsl:when>
                     <xsl:when test="(do2r:GoodsShipment/do2r:MPOSign=1) or (do2r:GoodsShipment/do2r:MPOSign='t') or (do2r:GoodsShipment/do2r:MPOSign='true')">
                        <table border="1" style="width:250mm">
                           <tr>
                              <td>  </td>
                              <td align="center" colspan="8">
                                 <b>Приход</b>
                              </td>
                              <td align="center" colspan="5">
                                 <b>Расход</b>
                              </td>
                              <!--td colspan="3" align="center"><b>Остаток</b></td-->
                           </tr>
                           <tr>
                              <!--1-->
                              <td style="width:5mm">№п/п</td>
                              <!--2-->
                              <td style="width:11mm">Дата и время поме-щения на склад</td>
                              <!--3-->
                              <td style="width:8mm">Номер отчета по форме ДО1мв</td>
                              <!--4-->
                              <td style="width:10mm">Поряд-ковый номер МПО в отч-ете по форме ДО1мв</td>
                              <!--5-->
                              <td style="width:18mm">Номер МПО</td>
                              <!--6-->
                              <!--td style= "width:15mm">Код товара в соответствии с ГС или ТН ВЭД ЕАЭС</td-->
                              <!--7-->
                              <td style="width:11mm">Номер емкости МПО</td>
                              <!--8-->
                              <td style="width:7mm">Коли-чество грузовых мест</td>
                              <!--9-->
                              <td style="width:16mm">Вес МПО либо вес емкости </td>
                              <!--10-->
                              <!--td style= "width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
                              <!--11-->
                              <!--td style= "width:10mm">Буквенный код валюты</td-->
                              <!--12-->
                              <td style="width:12mm">Предельный срок вре-менного хранения</td>
                              <!--13-->
                              <td style="width:12mm">Дата и время выдачи МПО со склада</td>
                              <!--14-->
                              <td style="width:7mm">Коли-чество грузовых мест</td>
                              <!--15-->
                              <td style="width:16mm">Вес МПО либо вес емкости </td>
                              <!--16-->
                              <!--td style= "width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
                              <!--17-->
                              <td style="width:17mm">Вид,дата и номер документа, по которому разрешена выдача МПО со склада</td>
                              <!--18-->
                              <td style="width:18mm">Наиме-нование полу-чателя</td>
                              <!--19-->
                              <!--td style= "width:7mm">Коли-чество гру-зовых мест</td-->
                              <!--20-->
                              <!--td style= "width:17mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td-->
                              <!--21-->
                              <!--td style= "width:18mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
                           </tr>
                           <tr>
                              <td align="center">1</td>
                              <td align="center">2</td>
                              <td align="center">3</td>
                              <td align="center">4</td>
                              <td align="center">5</td>
                              <!--td align="center">6</td-->
                              <td align="center">7</td>
                              <td align="center">8</td>
                              <td align="center">9</td>
                              <!--td align="center">10</td>
					<td align="center">11</td-->
                              <td align="center">12</td>
                              <td align="center">13</td>
                              <td align="center">14</td>
                              <td align="center">15</td>
                              <!--td align="center">16</td-->
                              <td align="center">17</td>
                              <td align="center">18</td>
                              <!--td align="center">19</td>
					<td align="center">20</td>
					<td align="center">21</td-->
                           </tr>
                           <xsl:for-each select="do2r:GoodsShipment/do2r:Goods">
                              <xsl:variable name="Input" select="count(do2r:Input)"/>
                              <xsl:for-each select="do2r:Input">
                                 <xsl:variable name="pos" select="position()"/>
                                 <tr>
                                    <!--1 №п/п-->
                                    <td style="width:5mm">
                                       <!--xsl:number value="position()"/-->
                                       <xsl:value-of select="catWH_ru:GoodsNumber"/>
                                    </td>
                                    <!-- 2 Дата и время помещения на склад-->
                                    <td style="width:11mm">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="do2r:DO1GoodLink/do2r:DO1Date"/>
                                       </xsl:call-template>
                                       <!--br/>
                                       <xsl:value-of select="do2r:DO1GoodLink/do2r:DO1Time"/-->
                                    </td>
                                    <!--3 Номер отчета по форме ДО1мв-->
                                    <td style="width:8mm">
                                       <xsl:value-of select="do2r:DO1GoodLink/do2r:DO1Number"/>
                                    </td>
                                    <!--4 Порядковый номер товаров в отчете по форме ДО1мв-->
                                    <td style="width:10mm">
                                       <xsl:value-of select="do2r:DO1GoodLink/do2r:MPOIndexNum"/>
                                    </td>
                                    <!--5 Наименование товара-->
                                    <td style="width:18mm">
                                       <xsl:if test="catWH_ru:MPONumber">
                                          <xsl:value-of select="catWH_ru:MPONumber/catWH_ru:ServiceIndicator"/>/
													<xsl:value-of select="catWH_ru:MPONumber/catWH_ru:SerialNumber"/>/
													<xsl:value-of select="catWH_ru:MPONumber/catWH_ru:CountryCode"/>
                                       </xsl:if>
                                       <xsl:if test="catWH_ru:MPOCaseNum">
                                          <xsl:value-of select="catWH_ru:MPOCaseNum"/>/
												</xsl:if>
                                    </td>
                                    <!--6 Код товара в соответствии с ГС или ТН ВЭД ЕАЭС-->
                                    <!--td>
						<xsl:value-of select="do2r:Input/catWH_ru:GoodsTNVEDCode"/>
					</td-->
                                    <!--7 складской номер-->
                                    <td style="width:11mm">
                                       <xsl:value-of select="do2r:MPOCaseNum"/>
                                    </td>
                                    <!--8 Количество грузовых мест -->
                                    <td style="width:7mm">
						1
					</td>
                                    <!--9  Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
                                    <td style="width:16mm">
                                       <xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                                       <br/>
                                       <xsl:value-of select="catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
                                    </td>
                                    <!--10  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                                    <!--td>
						<xsl:value-of select="do2r:Input/catWH_ru:InvoiceCost"/>
					</td-->
                                    <!--11 Буквенный код валюты-->
                                    <!--td>
						<xsl:value-of select="do2r:Input/catWH_ru:CurrencyCode"/>
					</td-->
                                    <!--12 Дата окончания временного хранения-->
                                    <td style="width:12mm">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="do2r:KeepingLimit/do2r:DeadLineDate"/>
                                       </xsl:call-template>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="$pos=1">
                                          <!--13 Дата и время выдачи товара со склада-->
                                          <td style="width:12mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="../do2r:Output/do2r:OutputDate"/>
                                             </xsl:call-template>
                                             <br/>
                                             <xsl:value-of select="../do2r:Output/do2r:OutputTime"/>
                                          </td>
                                          <!--14 Количество грузовых мест -->
                                          <td style="width:7mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
						1
					</td>
                                          <!--15 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
                                          <td style="width:16mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:value-of select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                                             <br/>
                                             <xsl:value-of select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
                                          </td>
                                          <!--16  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                                          <!--td>
						<xsl:value-of select="do2r:Output/do2r:Cost"/>&#160;
						<xsl:value-of select="do2r:Output/do2r:CurrencyCode"/>
					</td-->
                                          <!--17 Вид,дата и номер документа, по которому разрешена выдача товаров со склада-->
                                          <td style="width:17mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:variable name="Num" select="catWH_ru:GoodsNumber"/>
                                             <xsl:for-each select="(../../do2r:GoodsCustomDocsLinks)">
                                                <xsl:variable name="doc" select="do2r:CustomDocNumber"/>
                                                <xsl:if test="(do2r:GoodNumber)=$Num">
                                                   <xsl:for-each select="../do2r:CustomsDocs[position()=$doc]">
                                                      <xsl:value-of select="cat_ru:PrDocumentName"/> 
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>	 
														<xsl:call-template name="russian_date">
                                                         <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                      </xsl:call-template> 
														<xsl:value-of select="catWH_ru:DocumentCode"/> 	
														<xsl:value-of select="catWH_ru:VttCustomsCode"/>
                                                   </xsl:for-each>
                                                </xsl:if>
                                             </xsl:for-each>
                                             <!--xsl:value-of select="../do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentName"/>
												<br/>
												<xsl:value-of select="../do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentNumber"/>
												<br/>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="../do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentDate"/>
												</xsl:call-template-->
                                          </td>
                                          <!--18 Наиме-нование полу-чателя -->
                                          <td style="width:18mm">
                                             <xsl:attribute name="rowspan">
                                                <xsl:value-of select="$Input"/>
                                             </xsl:attribute>
                                             <xsl:value-of select="../do2r:Output/do2r:Consignee/cat_ru:OrganizationName"/>
                                          </td>
                                          <!--19 Количество грузовых мест-->
                                          <!--td>
						<xsl:value-of select="do2r:Result/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
					</td-->
                                          <!--20 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения) -->
                                          <!--td>
						<xsl:value-of select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/>&#160;
						<xsl:value-of select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>&#160;
						<xsl:value-of select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/><br/>
						<xsl:value-of select="do2r:Result/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/>&#160;
						<xsl:value-of select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/>&#160;
						<xsl:value-of select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
					</td-->
                                          <!--21  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                                          <!--td>
						<xsl:value-of select="do2r:Result/do2r:Cost"/>&#160;
						<xsl:value-of select="do2r:Result/do2r:CurrencyCode"/>
					</td-->
                                       </xsl:when>
                                       <!--xsl:otherwise><td><xsl:text disable-output-escaping="yes"> </xsl:text>   </td></xsl:otherwise-->
                                    </xsl:choose>
                                 </tr>
                              </xsl:for-each>
                           </xsl:for-each>
                        </table>
                     </xsl:when>
                  </xsl:choose>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="DO2R_title">
      <table width="270mm">
         <tbody>
            <tr align="center">
               <td>
                  <b>Отчет № </b>
                  <u>
                     <xsl:value-of select="catWH_ru:ReportNumber"/> </u>
                  <b>от </b>
                  <u>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
                     </xsl:call-template>
                  </u>
					 <b>о выдаче товаров с СВХ </b>
               </td>
            </tr>
            <!--tr>
					<td>Транспортный документ (вид, дата и номер) 
						<xsl:value-of select="do2r:GoodsShipment/do2r:Goods/do2r:TransportDoc/cat_ru:PrDocumentName"/>
						<xsl:value-of select="do2r:GoodsShipment/do2r:Goods/do2r:TransportDoc/cat_ru:PrDocumentNumber"/>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="do2r:GoodsShipment/do2r:Goods/do2r:TransportDoc/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</td>
				</tr-->
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="DO2Radd">
      <tr>
         <td align="center">
            <b>Добавочный лист №</b>
            <u>
               <xsl:value-of select="do2r:AddedListNumber"/>
               <xsl:text> </xsl:text>
            </u>
            <b>к отчету №</b>
            <u>
               <xsl:value-of select="catWH_ru:ReportNumber"/>
               <xsl:text> </xsl:text>
            </u>
            <b>от</b>
            <u>
               <xsl:value-of select="catWH_ru:ReportDate"/>
               <xsl:text> </xsl:text>
            </u>
            <b>о выдаче товаров с СВХ</b>
            <br/>
            <br/>
         </td>
      </tr>
      <br/>
      <tr>
         <td>
            <xsl:choose>
               <xsl:when test="(do2r:GoodsShipment/do2r:MPOSign=0) or (do2r:GoodsShipment/do2r:MPOSign='f') or (do2r:GoodsShipment/do2r:MPOSign='false')">
                  <table border="1" width="250mm">
                     <tr>
                        <td>  </td>
                        <td align="center" colspan="12">
                           <b>Приход</b>
                        </td>
                        <td align="center" colspan="5">
                           <b>Расход</b>
                        </td>
                        <td align="center" colspan="3">
                           <b>Остаток</b>
                        </td>
                     </tr>
                     <tr>
                        <!--1-->
                        <td style="width:5mm">№п/п</td>
                        <!--2-->
                        <td style="width:11mm">Дата и время поме-щения на склад</td>
                        <!--3-->
                        <td style="width:8mm">Номер отчета по форме ДО1мв</td>
                        <!--4-->
                        <td style="width:10mm">Поряд-ковый номер товаров в отч-ете по форме ДО1мв</td>
                        <!--5-->
                        <td style="width:18mm">Наиме-нование товара</td>
                        <!--6-->
                        <td style="width:15mm">Код товара в соответствии с ГС или ТН ВЭД ЕАЭС</td>
                        <!--7-->
                        <td style="width:11mm">Склад-ской номер товара</td>
                        <!--8-->
                        <td style="width:7mm">Коли-чество грузовых мест</td>
                        <!--9-->
                        <td style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
                        <!--10-->
                        <td style="width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
                        <!--11-->
                        <td style="width:10mm">Буквенный код валюты</td>
                        <!--12-->
                        <td style="width:12mm">Дата оконча-ния вре-менного хранения</td>
                        <!--13-->
                        <td style="width:12mm">Дата и время выдачи товара со склада</td>
                        <!--14-->
                        <td style="width:7mm">Коли-чество грузовых мест</td>
                        <!--15-->
                        <td style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
                        <!--16-->
                        <td style="width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
                        <!--17-->
                        <td style="width:17mm">Вид,дата и номер документа, по которому разрешена выдача то-варов со склада</td>
                        <!--18-->
                        <td style="width:18mm">Наиме-нование полу-чателя</td>
                        <!--19-->
                        <td style="width:7mm">Коли-чество гру-зовых мест</td>
                        <!--20-->
                        <td style="width:17mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
                        <!--21-->
                        <td style="width:18mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
                     </tr>
                     <tr>
                        <td align="center">1</td>
                        <td align="center">2</td>
                        <td align="center">3</td>
                        <td align="center">4</td>
                        <td align="center">5</td>
                        <td align="center">6</td>
                        <td align="center">7</td>
                        <td align="center">8</td>
                        <td align="center">9</td>
                        <td align="center">10</td>
                        <td align="center">11</td>
                        <td align="center">12</td>
                        <td align="center">13</td>
                        <td align="center">14</td>
                        <td align="center">15</td>
                        <td align="center">16</td>
                        <td align="center">17</td>
                        <td align="center">18</td>
                        <td align="center">19</td>
                        <td align="center">20</td>
                        <td align="center">21</td>
                     </tr>
                     <xsl:for-each select="do2r:GoodsShipment/do2r:Goods">
                        <tr>
                           <!--1 №п/п-->
                           <td>
                              <xsl:number value="position()"/>
                           </td>
                           <!-- 2 Дата и время помещения на склад-->
                           <td>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Date"/>
                              </xsl:call-template>
                              <br/>
                              <xsl:value-of select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Time"/>
                           </td>
                           <!--3 Номер отчета по форме ДО1мв-->
                           <td>
                              <xsl:value-of select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Number"/>
                           </td>
                           <!--4 Порядковый номер товаров в отчете по форме ДО1мв-->
                           <td>
                              <xsl:value-of select="do2r:Input/do2r:DO1GoodLink/do2r:DO1GoodNumber"/>
                           </td>
                           <!--5 Наименование товара-->
                           <td>
                              <xsl:value-of select="do2r:Input/catWH_ru:GoodsDescription"/>
                           </td>
                           <!--6 Код товара в соответствии с ГС или ТН ВЭД ЕАЭС-->
                           <td>
                              <xsl:value-of select="do2r:Input/catWH_ru:GoodsTNVEDCode"/>
                           </td>
                           <!--7 складской номер-->
                           <td>
                              <xsl:value-of select="do2r:Input/do2r:WHNumber"/>
                           </td>
                           <!--8 Количество грузовых мест -->
                           <td>
                              <xsl:value-of select="do2r:Input/catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
                           </td>
                           <!--9  Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
                           <td>
                              <xsl:value-of select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                              <br/>
                              <xsl:value-of select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
                           </td>
                           <!--10  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                           <td>
                              <xsl:value-of select="do2r:Input/catWH_ru:InvoiceCost"/>
                           </td>
                           <!--11 Буквенный код валюты-->
                           <td>
                              <xsl:value-of select="do2r:Input/catWH_ru:CurrencyCode"/>
                           </td>
                           <!--12 Дата окончания временного хранения-->
                           <td>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="do2r:Input/do2r:KeepingLimit/do2r:DeadLineDate"/>
                              </xsl:call-template>
                           </td>
                           <!--13 Дата и время выдачи товара со склада-->
                           <td>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="do2r:Input/do2r:OutputDate"/>
                              </xsl:call-template>
                              <br/>
                              <xsl:value-of select="do2r:Input/do2r:OutputTime"/>
                           </td>
                           <!--14 Количество грузовых мест -->
                           <td>
                              <xsl:value-of select="do2r:Output/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
                           </td>
                           <!--15 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
                           <td>
                              <xsl:value-of select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                              <br/>
                              <xsl:value-of select="do2r:Output/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
                           </td>
                           <!--16  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                           <td>
                              <xsl:value-of select="do2r:Output/do2r:Cost"/> 
						<xsl:value-of select="do2r:Output/do2r:CurrencyCode"/>
                           </td>
                           <!--17 Вид,дата и номер документа, по которому разрешена выдача товаров со склада-->
                           <td>
                              <xsl:value-of select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentName"/>
                              <br/>
                              <xsl:value-of select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentNumber"/>
                              <br/>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </td>
                           <!--18 Наиме-нование полу-чателя -->
                           <td>
                              <xsl:value-of select="do2r:Output/do2r:Consignee/cat_ru:OrganizationName"/>
                           </td>
                           <!--19 Количество грузовых мест-->
                           <td>
                              <xsl:value-of select="do2r:Result/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
                           </td>
                           <!--20 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения) -->
                           <td>
                              <xsl:value-of select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                              <br/>
                              <xsl:value-of select="do2r:Result/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
                           </td>
                           <!--21  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                           <td>
                              <xsl:value-of select="do2r:Result/do2r:Cost"/> 
						<xsl:value-of select="do2r:Result/do2r:CurrencyCode"/>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </table>
               </xsl:when>
               <xsl:when test="(do2r:GoodsShipment/do2r:MPOSign=1) or (do2r:GoodsShipment/do2r:MPOSign='t') or (do2r:GoodsShipment/do2r:MPOSign='true')">
                  <table border="1" width="250mm">
                     <tr>
                        <td>  </td>
                        <td align="center" colspan="9">
                           <b>Приход</b>
                        </td>
                        <td align="center" colspan="4">
                           <b>Расход</b>
                        </td>
                        <!--td colspan="3" align="center"><b>Остаток</b></td-->
                     </tr>
                     <tr>
                        <!--1-->
                        <td style="width:5mm">№п/п</td>
                        <!--2-->
                        <td style="width:11mm">Дата и время поме-щения на склад</td>
                        <!--3-->
                        <td style="width:8mm">Номер отчета по форме ДО1мв</td>
                        <!--4-->
                        <td style="width:10mm">Поряд-ковый номер МПО в отч-ете по форме ДО1мв</td>
                        <!--5-->
                        <td style="width:18mm">Номер МПО</td>
                        <!--6-->
                        <!--td style= "width:15mm">Код товара в соответствии с ГС или ТН ВЭД ЕАЭС</td-->
                        <!--7-->
                        <td style="width:11mm">Номер емкости МПО</td>
                        <!--8-->
                        <td style="width:7mm">Коли-чество грузовых мест</td>
                        <!--9-->
                        <td style="width:16mm">Вес МПО либо вес емкости </td>
                        <!--10-->
                        <!--td style= "width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
                        <!--11-->
                        <!--td style= "width:10mm">Буквенный код валюты</td-->
                        <!--12-->
                        <td style="width:12mm">Предельный срок вре-менного хранения</td>
                        <!--13-->
                        <td style="width:12mm">Дата и время выдачи МПО со склада</td>
                        <!--14-->
                        <td style="width:7mm">Коли-чество грузовых мест</td>
                        <!--15-->
                        <td style="width:16mm">Вес МПО либо вес емкости </td>
                        <!--16-->
                        <!--td style= "width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
                        <!--17-->
                        <td style="width:17mm">Вид,дата и номер документа, по которому разрешена выдача МПО со склада</td>
                        <!--18-->
                        <td style="width:18mm">Наиме-нование полу-чателя</td>
                        <!--19-->
                        <!--td style= "width:7mm">Коли-чество гру-зовых мест</td-->
                        <!--20-->
                        <!--td style= "width:17mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td-->
                        <!--21-->
                        <!--td style= "width:18mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
                     </tr>
                     <tr>
                        <td align="center">1</td>
                        <td align="center">2</td>
                        <td align="center">3</td>
                        <td align="center">4</td>
                        <td align="center">5</td>
                        <!--td align="center">6</td-->
                        <td align="center">7</td>
                        <td align="center">8</td>
                        <td align="center">9</td>
                        <!--td align="center">10</td>
					<td align="center">11</td-->
                        <td align="center">12</td>
                        <td align="center">13</td>
                        <td align="center">14</td>
                        <td align="center">15</td>
                        <!--td align="center">16</td-->
                        <td align="center">17</td>
                        <td align="center">18</td>
                        <!--td align="center">19</td>
					<td align="center">20</td>
					<td align="center">21</td-->
                     </tr>
                     <xsl:for-each select="do2r:GoodsShipment/do2r:Goods">
                        <tr>
                           <!--1 №п/п-->
                           <td>
                              <xsl:number value="position()"/>
                           </td>
                           <!-- 2 Дата и время помещения на склад-->
                           <td>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Date"/>
                              </xsl:call-template>
                              <br/>
                              <xsl:value-of select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Time"/>
                           </td>
                           <!--3 Номер отчета по форме ДО1мв-->
                           <td>
                              <xsl:value-of select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Number"/>
                           </td>
                           <!--4 Порядковый номер товаров в отчете по форме ДО1мв-->
                           <td>
                              <xsl:value-of select="do2r:Input/do2r:DO1GoodLink/do2r:MPOIndexNum"/>
                           </td>
                           <!--5 Наименование товара-->
                           <td>
                              <xsl:value-of select="do2r:Input/catWH_ru:GoodsDescription"/>
                           </td>
                           <!--6 Код товара в соответствии с ГС или ТН ВЭД ЕАЭС-->
                           <!--td>
						<xsl:value-of select="do2r:Input/catWH_ru:GoodsTNVEDCode"/>
					</td-->
                           <!--7 складской номер-->
                           <td>
                              <xsl:value-of select="do2r:Input/do2r:MPOCaseNum"/>
                           </td>
                           <!--8 Количество грузовых мест -->
                           <td>
						1
					</td>
                           <!--9  Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
                           <td>
                              <xsl:value-of select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                              <br/>
                              <xsl:value-of select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
                           </td>
                           <!--10  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                           <!--td>
						<xsl:value-of select="do2r:Input/catWH_ru:InvoiceCost"/>
					</td-->
                           <!--11 Буквенный код валюты-->
                           <!--td>
						<xsl:value-of select="do2r:Input/catWH_ru:CurrencyCode"/>
					</td-->
                           <!--12 Дата окончания временного хранения-->
                           <td>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="do2r:Input/do2r:KeepingLimit/do2r:DeadLineDate"/>
                              </xsl:call-template>
                           </td>
                           <!--13 Дата и время выдачи товара со склада-->
                           <td>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="do2r:Input/do2r:OutputDate"/>
                              </xsl:call-template>
                              <br/>
                              <xsl:value-of select="do2r:Input/do2r:OutputTime"/>
                           </td>
                           <!--14 Количество грузовых мест -->
                           <td>
						1
					</td>
                           <!--15 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
                           <td>
                              <xsl:value-of select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                              <br/>
                              <xsl:value-of select="do2r:Output/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:value-of select="do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:value-of select="do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
                           </td>
                           <!--16  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                           <!--td>
						<xsl:value-of select="do2r:Output/do2r:Cost"/>&#160;
						<xsl:value-of select="do2r:Output/do2r:CurrencyCode"/>
					</td-->
                           <!--17 Вид,дата и номер документа, по которому разрешена выдача товаров со склада-->
                           <td>
                              <xsl:value-of select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentName"/>
                              <br/>
                              <xsl:value-of select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentNumber"/>
                              <br/>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </td>
                           <!--18 Наиме-нование полу-чателя -->
                           <td>
                              <xsl:value-of select="do2r:Output/do2r:Consignee/cat_ru:OrganizationName"/>
                           </td>
                           <!--19 Количество грузовых мест-->
                           <!--td>
						<xsl:value-of select="do2r:Result/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
					</td-->
                           <!--20 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения) -->
                           <!--td>
						<xsl:value-of select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/>&#160;
						<xsl:value-of select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>&#160;
						<xsl:value-of select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/><br/>
						<xsl:value-of select="do2r:Result/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/>&#160;
						<xsl:value-of select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/>&#160;
						<xsl:value-of select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
					</td-->
                           <!--21  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
                           <!--td>
						<xsl:value-of select="do2r:Result/do2r:Cost"/>&#160;
						<xsl:value-of select="do2r:Result/do2r:CurrencyCode"/>
					</td-->
                        </tr>
                     </xsl:for-each>
                  </table>
               </xsl:when>
            </xsl:choose>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="SignatureAndSheets">
      <table width="270mm">
         <tr>
            <td style="width:135mm">Количество добавочных листов отчета
					<xsl:value-of select="do2r:AddedListsCount"/>
            </td>
            <td>
               <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
               </xsl:call-template>
            </td>
            <td>
               <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/> 
					<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/> 
					<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/> 
					<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/> 
				</td>
         </tr>
         <tr align="right">
            <td/>
            <td>(дата)
				</td>
            <td>(подпись, инициалы, фамилия, и должность уполномоченного работника склада)
				</td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="Signature">
      <table width="180mm">
         <!--tr align="right">
					<td style="width:185mm">
					</td>
					<td>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
						</xsl:call-template>
					</td>
					<td>
						<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/>&#160;
						<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>&#160;
						<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/>&#160;
					</td>
				</tr>
				<tr  align="right">
					<td>
					</td>
					<td>(дата)
					</td>
					<td>(подпись, инициалы, фамилия, и должность уполномоченного работника склада)
					</td>
				</tr-->
         <tbody>
            <tr>
               <td align="center" class="underlined">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
                  </xsl:call-template>
               </td>
               <td align="center" class="underlined">
                  <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/> 
						<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost">
                     <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph">(дата)</td>
               <td align="center" class="graph">(подпись, инициалы, фамилия и должность уполномоченного работника склада)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="do2r:DO2Report">
      <html>
         <head>
            <title>DO2Report</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					@media print {
					  .page {
						-ms-transform: rotate(270deg);
						/* IE 9 */
						-webkit-transform: rotate(270deg);
						/* Chrome, Safari, Opera */
						transform: rotate(270deg);
						top: 1.5in;
						left: -1in;
					  }
					}
					
					body {	text-align: center; background: #ffffff; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 9.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 9.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 8.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .5pt solid black; }
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					span.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 10.0pt; font-family: Courier; color: windowtext; }
					div.page { /*width: 297mm; height: 210mm;*/ margin-top: 6pt; margin-bottom: 6pt; padding:5mm; padding-left:5mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
         </head>
         <body>
            <!--div class="page"-->
               <table border="0" cellpadding="3" cellspacing="0" width="270mm">
                  <tr>
                     <td style="width:270mm">
                        <table border="0" cellpadding="3" cellspacing="0" width="270mm">
                           <tbody>
                              <!--Информация о СВХ (верхний левый угол)-->
                              <tr>
                                 <td>
                                    <table border="0" cellpadding="3" cellspacing="0" width="250mm">
                                       <tr>
                                          <td align="center" height="30mm" rowspan="3" style="width:160mm;border:solid 1pt #000000;">
                                             <b>СВХ </b>
                                             <u>
                                                <xsl:value-of select="catWH_ru:WarehouseOwner/cat_ru:OrganizationName"/>
                                             </u>
                                             <br/>
                                             <b> Свидетельство о включении в реестр владельцев СВХ от </b>
                                             <u>
                                                <xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate">
                                                   <xsl:call-template name="russian_date">
                                                      <xsl:with-param name="dateIn" select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate"/>
                                                   </xsl:call-template>
                                                </xsl:if>
                                             </u>
                                             <b> № </b>
                                             <u>
                                                <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/>
                                             </u>
                                             <xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:ActualWarehouseLicense">
												<br/>
												<b> Действующее свидетельство о включении в реестр владельцев СВХ от </b>
												<u>
                                                <xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:ActualWarehouseLicense/catWH_ru:CertificateDate">
                                                   <xsl:call-template name="russian_date">
                                                      <xsl:with-param name="dateIn" select="catWH_ru:WarehouseOwner/catWH_ru:ActualWarehouseLicense/catWH_ru:CertificateDate"/>
                                                   </xsl:call-template>
                                                </xsl:if>
                                             </u>
                                             <b> № </b>
                                             <u>
                                                <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:ActualWarehouseLicense/catWH_ru:CertificateNumber"/>
                                             </u>
                                             </xsl:if>
                                             <br/>
                                             <span class="graph">(при хранении товаров в ином месте временного хранения указывается номер разрешения таможни)</span>
                                          </td>
                                          <td/>
                                          <td rowspan="1" style="width:23mm;border:solid 1pt #000000;">
                                             <b>Форма ДО2</b>
                                          </td>
                                       </tr>
                                       <tr/>
                                       <tr/>
                                    </table>
                                 </td>
                              </tr>
                              <br/>
                              <br/>
                              <!--Тело документа -->
                              <tr>
                                 <td>
                                    <table>
                                       <tbody>
                                          <tr>
                                             <td>
                                                <xsl:call-template name="DO2R_title"/>
                                                <br/>
                                                <br/>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td>
                                                <xsl:call-template name="DO2R"/>
                                                <br/>
                                                <br/>
                                             </td>
                                          </tr>
                                          <tr align="right">
                                             <td align="right" style="width:180mm">
                                                <xsl:call-template name="Signature"/>
                                                <br/>
                                                <br/>
                                             </td>
                                          </tr>
                                          <!--tr>
															<td>
																<xsl:call-template name="DO2Radd"/>
																<br/>
																<br/>
															</td>
														</tr>
														<tr align="right">
															<td align="right" style="width:180mm;">
																<xsl:call-template name="Signature"/>
															</td>
														</tr-->
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
               </table>
            <!--/div-->
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
