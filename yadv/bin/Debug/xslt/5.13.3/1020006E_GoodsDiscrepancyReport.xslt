<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="DisRep" version="1.0" xmlns:DisRep="urn:customs.ru:Information:CustomsDocuments:GoodsDiscrepancyReport:5.10.0" xmlns:catSCVV="urn:customs.ru:SCVVCommonAggregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Отчет о найденных расхождениях по вывозимым товарам -->
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <!--шаблон для преобразования даты формата "yyyy-mm-dd" в формат "dd.mm.yyyy"-->
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
   <!--шаблон для преобразования даты формата "yyyy-mm-dd" в формат "ddmmyy" для использования в регистрационных номерах-->
   <xsl:template name="russian_date_td">
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
   <xsl:template match="DisRep:GoodsDiscrepancyReport">
      <html>
         <head>
            <title>
Отчет о найденных расхождениях по вывозимым товарам
</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					    div.page {
						border: solid 1pt #000000;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm;
						padding-left: 15mm;
						background: #ffffff;
						}
						
						table { 
						width:180mm 
						border: solid  2pt #ffffff;
						border-collapse: collapse; 
						cellspacing:0;
						}
							
						.bheader {
						border: solid 1pt #bbbbbb;
						padding-left:	5pt;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						background: #CFECEC;
						}			
						
						p {
						text-indent: 5pt;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 11pt;
						}
						
					    .b0 {
						border: solid 1pt #bbbbbb;
						text-indent: 5pt;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						background: #ffffff;
   					    }
					    
					    .b1 {
						border: solid 1pt #bbbbbb;
					    text-indent: 20pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
					    .b1h {
						border: solid 1pt #bbbbbb;
					    text-indent: 20pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						background: #ffffff;
						}
						
						.b2 {
						border: solid 1pt #bbbbbb;
					    padding-left: 40pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
						
						.b3 {
						border: solid 1pt #bbbbbb;
					    text-indent: 60pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;						
						}
						
						.b4 {
						border: solid 1pt #bbbbbb;
					    text-indent: 80pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;						
						}
						
						.btext {
						border: solid 1pt #bbbbbb;
					    padding-left:	5pt;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
				</style>
         </head>
         <body>
            <xsl:choose>
               <xsl:when test="DisRep:DiscrepancyIndicator='0' or DisRep:DiscrepancyIndicator='f' or DisRep:DiscrepancyIndicator='false'">
                  <div class="page">
                     <h2>Отчет о найденных расхождениях по вывозимым товарам</h2>
                     <p>Все заявленные к вывозу товары соответствуют ДТ.</p>
                  </div>
               </xsl:when>
               <xsl:when test="DisRep:DiscrepancyIndicator='1' or DisRep:DiscrepancyIndicator='t' or DisRep:DiscrepancyIndicator='true'">
                  <!--Отдельная страница на каждую партию-->
                  <xsl:for-each select="DisRep:ShipmentDiscrepancyInfo">
                     <div class="page">
                        <h2>Отчет о расхождениях по товарной партии №<xsl:value-of select="position()"/>
                        </h2>
                        <p align="left">Декларация на товары №
						<xsl:value-of select="catSCVV:DTID/catSCVV:CustomsCode"/>/<xsl:call-template name="russian_date_td">
                              <xsl:with-param name="dateIn" select="catSCVV:DTID/catSCVV:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="catSCVV:DTID/catSCVV:GTDNumber"/>
                        </p>
                        <p align="left">Таможенная накладная № <xsl:value-of select="catSCVV:CustomsNumber"/>
                        </p>
                        <!--Определение вида расхождения по каждой партии-->
                        <p align="center">
                           <xsl:choose>
                              <xsl:when test="catSCVV:ShipmentDiscrepancyCode='00'">Сведения о вывозимых товарах по данной партии соответствуют заявленным в ДТ</xsl:when>
                              <xsl:when test="catSCVV:ShipmentDiscrepancyCode='10'">ДТ с указанным номером не найдена в ЦБД ДТ</xsl:when>
                              <xsl:when test="catSCVV:ShipmentDiscrepancyCode='20'">Найдены расхождения в товарных позициях</xsl:when>
                              <xsl:when test="catSCVV:ShipmentDiscrepancyCode='04'">АПС «СКВВ» не работает с ЦБД деклараций на товары за указанный год выпуска ДТ</xsl:when>
                           </xsl:choose>
                        </p>
                        <!--Отдельная таблица на каждый товар-->
                        <xsl:for-each select="catSCVV:GoodsDiscrepancyInfo">
                           <p align="center" style="font-weight: bold;">Расхождения по товару №<xsl:value-of select="position()"/>
                              <br/>(<xsl:choose>
                                 <xsl:when test="catSCVV:GoodsDiscrepancyIndicator='11'">товар с указанным порядковым номером не найден в ДТ</xsl:when>
                                 <xsl:when test="catSCVV:GoodsDiscrepancyIndicator='12'">код товара по ТН ВЭД не совпадает с указанным в ДТ</xsl:when>
                                 <xsl:when test="catSCVV:GoodsDiscrepancyIndicator='13'">превышен вес брутто по ДТ</xsl:when>
                                 <xsl:when test="catSCVV:GoodsDiscrepancyIndicator='14'">превышен вес нетто по ДТ</xsl:when>
                                 <xsl:when test="catSCVV:GoodsDiscrepancyIndicator='15'">превышено количество товара в ДЕИ</xsl:when>
                                 <xsl:when test="catSCVV:GoodsDiscrepancyIndicator='16'">таможенная стоимость товара не совпадает с заявленной в ДТ</xsl:when>
                              </xsl:choose>)</p>
                           <table cols="3">
                              <tbody>
                                 <tr>
                                    <td class="bheader" style="width:60mm;">Показатель</td>
                                    <td class="bheader" style="width:60mm;">Фактическое значение</td>
                                    <td class="bheader" style="width:60mm;">Остаток (или значение по ДТ)</td>
                                 </tr>
                                 <tr>
                                    <td class="btext" style="width:60mm;">Номер товара по порядку</td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:PlanFactGoodsInfo/cat_ru:GoodsNumeric"/>
                                    </td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:Balance/cat_ru:GoodsNumeric"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="btext" style="width:60mm;">Код товара по ТН ВЭД ЕАЭС</td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:PlanFactGoodsInfo/cat_ru:GoodsTNVEDCode"/>
                                    </td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:Balance/cat_ru:GoodsTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="btext" style="width:60mm;">Описание</td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:PlanFactGoodsInfo/cat_ru:GoodsDescription"/>
                                    </td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:Balance/cat_ru:GoodsDescription"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="btext" style="width:60mm;">Вес (брутто)</td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:PlanFactGoodsInfo/cat_ru:GrossWeightQuantity"/>
                                    </td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:Balance/cat_ru:GrossWeightQuantity"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="btext" style="width:60mm;">Вес (нетто)</td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:PlanFactGoodsInfo/cat_ru:NetWeightQuantity"/>
                                    </td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:Balance/cat_ru:NetWeightQuantity"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="btext" style="width:60mm;">Таможенная стоимость</td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:PlanFactGoodsInfo/catSCVV:Amount"/>
                                    </td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:Balance/catSCVV:Amount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="btext" style="width:60mm;">Код товара по классификатору<br/>доп. тамож. информации</td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:PlanFactGoodsInfo/catSCVV:GoodsAddTNVEDCode"/>
                                    </td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:Balance/catSCVV:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="btext" style="width:60mm;">Количество в ДЕИ</td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:PlanFactGoodsInfo/catSCVV:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/> (в ДЕИ <xsl:value-of select="catSCVV:PlanFactGoodsInfo/catSCVV:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)</td>
                                    <td class="btext" style="width:60mm;">
                                       <xsl:value-of select="catSCVV:Balance/catSCVV:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/> (в ДЕИ <xsl:value-of select="catSCVV:Balance/catSCVV:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)</td>
                                 </tr>
                              </tbody>
                           </table>
                        </xsl:for-each>
                     </div>
                  </xsl:for-each>
               </xsl:when>
            </xsl:choose>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
