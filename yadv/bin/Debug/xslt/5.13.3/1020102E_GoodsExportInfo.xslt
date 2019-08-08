<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="GExInf" version="1.0" xmlns:GExInf="urn:customs.ru:Information:CustomsDocuments:GoodsExportInfo:5.10.0" xmlns:catSCVV="urn:customs.ru:SCVVCommonAggregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Информация о фактически вывезенных товарах  -->
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
   <xsl:template match="GExInf:GoodsExportInfo">
      <html>
         <head>
            <title>
Информация о фактически вывезенных товарах
</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					    div.page {
					    width:185mm;
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
						
						p {
						text-indent: 5pt;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 11pt;
						}
						
				</style>
         </head>
         <body>
            <!--Отдельная страница на каждую партию-->
            <xsl:for-each select="GExInf:ExportInfo">
               <div class="page">
                  <h2>Информация о фактически вывезенных товарах<br/><!--ДТ № <xsl:value-of select="catSCVV:DTID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_td">
                        <xsl:with-param name="dateIn" select="catSCVV:DTID/cat_ru:RegistrationDate"/>
                     </xsl:call-template>/<xsl:value-of select="catSCVV:DTID/cat_ru:GTDNumber"/>-->
                  </h2>
                  <!--Основная таблица -->
                  <xsl:choose>
                     <xsl:when test="catSCVV:ShipmentFactInfo">
                        <xsl:for-each select="catSCVV:ShipmentFactInfo">
                           <p align="center">Партия №<xsl:value-of select="position()"/>
                           </p>
                           <table>
                              <tbody>
                                 <tr>
                                    <td class="bheader" style="width:80mm;">
				    Поле
					</td>
                                    <td class="bheader" style="width:100mm;">
					Значение
					</td>
                                 </tr>
					<!--tr>
						<td style="width:80mm;" class="b1h">
						Номер ДТ
						</td>
						<td style="width:100mm;" class="btext">
						<xsl:value-of select="catSCVV:DTID/catSCVV:CustomsCode"/>
						<xsl:text>/</xsl:text>
						<xsl:call-template name="russian_date_td">
							<xsl:with-param name="dateIn" select="catSCVV:DTID/cat_ru:RegistrationDate"/>
						</xsl:call-template>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="catSCVV:DTID/cat_ru:GTDNumber"/>
						</td>
					</tr-->
                    <!--<tr>
						<td style="width:80mm;" class="b1h">
						Таможенный номер накладной
						</td>
						<td style="width:100mm;" class="btext">
						<xsl:value-of select="catSCVV:CustomsNumber"/>
						</td>
					</tr>-->
                                 <tr>
                                    <td class="b1" style="width:80mm;">
						Дата фактического вывоза товаров
						</td>
                                    <td class="btext" style="width:100mm;">
										<xsl:call-template name="russian_date">
										   <xsl:with-param name="dateIn" select="catSCVV:ExportDate"/>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="b1" style="width:80mm;">
						Таможенный № накладной
						</td>
                                    <td class="btext" style="width:100mm;">
                                       <xsl:value-of select="catSCVV:CustomsNumber"/>
                                    </td>
                                 </tr>
                                 <xsl:for-each select="catSCVV:DispatchCountryCode">
                                    <tr>
                                       <td class="b1" style="width:80mm;">
						Страна отправления
						</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="."/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                                 <xsl:for-each select="catSCVV:DestinationCountryCode">
                                    <tr>
                                       <td class="b1" style="width:80mm;">
						Страна назначения
						</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="."/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                                 <xsl:for-each select="catSCVV:TotalGoodsWeight">
                                    <tr>
                                       <td class="b1" style="width:80mm;">
						Общий вес товаров (брутто)
						</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="."/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                                 <!--Инф-я об отправителе -->
                                 <xsl:for-each select="catSCVV:Consignor">
                                    <tr>
                                       <td class="b1" style="width:80mm;">
                                          <i>Отправитель</i>
                                       </td>
                                       <td class="btext" style="width:100mm;">
                                          <br/>
                                       </td>
                                    </tr>
                                    <xsl:for-each select="cat_ru:OrganizationName">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						Наименование организации / Ф.И.О. физического лица
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                    <xsl:for-each select="cat_ru:ShortName">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						Краткое наименование организации
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                    <xsl:if test="cat_ru:RBOrganizationFeatures">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						УНП
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						ОГРН
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						ИНН
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						КПП
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						БИН
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						ИИН
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						ИТН
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                 </xsl:for-each>
                                 <!--Инф-я о получателе-->
                                 <xsl:for-each select="catSCVV:Consignee">
                                    <tr>
                                       <td class="b1" style="width:80mm;">
                                          <i>Получатель</i>
                                       </td>
                                       <td class="btext" style="width:100mm;">
                                          <br/>
                                       </td>
                                    </tr>
                                    <xsl:for-each select="cat_ru:OrganizationName">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						Наименование организации / Ф.И.О. физического лица
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                    <xsl:for-each select="cat_ru:ShortName">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						Краткое наименование организации
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                    <xsl:if test="cat_ru:RBOrganizationFeatures">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						УНП
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						ОГРН
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						ИНН
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						КПП
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						БИН
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						ИИН
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						ИТН
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                 </xsl:for-each>
                                 <!--Представленные документы-->
                                 <xsl:if test="catSCVV:PresentedDocument">
                                    <tr>
                                       <td class="b1" style="width:80mm;">
						Представленные документы
						</td>
                                       <td class="btext" style="width:100mm;">
                                          <br/>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:for-each select="catSCVV:PresentedDocument">
                                    <tr>
                                       <td class="b2" style="width:80mm;">
                                          <xsl:value-of select="position()"/>. Вид документа
						</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="catSCVV:PresentedDocumentModeCode"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="b2" style="width:80mm;">
						Наименование
						</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="b2" style="width:80mm;">
						Номер
						</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="b2" style="width:80mm;">
						Дата
						</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="cat_ru:PrDocumentDate"/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                                 <!--Транспортные средства-->
                                 <xsl:if test="catSCVV:DepartureTransport">
                                    <tr>
                                       <td class="b1" style="width:80mm;">
						Транспортные средства при убытии
						</td>
                                       <td class="btext" style="width:100mm;">
                                          <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:for-each select="catSCVV:DepartureTransport">
                                    <tr>
                                       <td class="b2" style="width:80mm;">
                                          <xsl:value-of select="position()"/>. Вид ТС
						</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="catSCVV:TransportModeCode"/>
                                       </td>
                                    </tr>
                                    <xsl:for-each select="catSCVV:TransportIdentifier">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						Основное ТС / тягач
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                    <xsl:for-each select="catSCVV:TrailerIdentifier">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						Прицеп
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                    <xsl:for-each select="catSCVV:SecondTrailerIdentifier">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						Второй прицеп
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                    <xsl:for-each select="catSCVV:TransportMeansNationalityCode">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
						Страна регистрации
						</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </xsl:for-each>
                                 <!--Товары из партии-->
                                 <xsl:for-each select="catSCVV:GoodsFactInfo">
                                    <tr>
                                       <td class="b1h" style="width:80mm;">
				Товар №<xsl:value-of select="cat_ru:GoodsNumeric"/>
                                       </td>
                                       <td class="btext" style="width:100mm;">
                                          <br/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="b2" style="width:80mm;">
				Код ТН ВЭД
				</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="cat_ru:GoodsTNVEDCode"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="b2" style="width:80mm;">
				Наименование товара
				</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="cat_ru:GoodsDescription"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="b2" style="width:80mm;">
				Вес товара брутто (кг)
				</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="cat_ru:GrossWeightQuantity"/>
                                       </td>
                                    </tr>
                                    <xsl:for-each select="cat_ru:NetWeightQuantity">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
				Вес товара нетто (кг)
				</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                    <tr>
                                       <td class="b2" style="width:80mm;">
				Таможенная стоимость
				</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="catSCVV:Amount"/>
                                       </td>
                                    </tr>
                                    <xsl:for-each select="catSCVV:GoodsAddTNVEDCode">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
											Код по классификатору доп. тамож. информации
											</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                    <xsl:for-each select="catSCVV:SupplementaryGoodsQuantity">
                                       <tr>
                                          <td class="b2" style="width:80mm;">
											Количество товара в дополнительной единице измерения 
											</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:GoodsQuantity"/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="b2" style="width:80mm;">
											Код единицы измерения
											</td>
                                          <td class="btext" style="width:100mm;">
                                             <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:if test="cat_ru:MeasureUnitQualifierName">(<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>)</xsl:if>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </xsl:for-each>
                                 <!--ТОО и УДЛ ТОО-->
                                 <tr>
                                    <td class="b1h" style="width:80mm;">
				Код таможенного органа места убытия
				</td>
                                    <td class="btext" style="width:100mm;">
                                       <xsl:value-of select="catSCVV:Customs/cat_ru:Code"/> (<xsl:value-of select="catSCVV:Customs/cat_ru:OfficeName"/>)
				</td>
                                 </tr>
                                 <xsl:if test="catSCVV:BorderPointCode">
                                    <tr>
                                       <td class="b2" style="width:80mm;">
				Пункт пропуска
				</td>
                                       <td class="btext" style="width:100mm;">
                                          <xsl:value-of select="catSCVV:BorderPointCode"/>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <tr>
                                    <td class="b1h" style="width:80mm;">
				Комментарий
				</td>
                                    <td class="btext" style="width:100mm;">
                                       <xsl:value-of select="catSCVV:AddInfo"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="b1h" style="width:80mm;">
				Должностное лицо
				</td>
                                    <td class="btext" style="width:100mm;">
                                       <br/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="b2" style="width:80mm;">
				Ф.И.О.
				</td>
                                    <td class="btext" style="width:100mm;">
                                       <xsl:value-of select="catSCVV:CustomsPerson/cat_ru:PersonName"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="b2" style="width:80mm;">
				ЛНП
				</td>
                                    <td class="btext" style="width:100mm;">
                                       <xsl:value-of select="catSCVV:CustomsPerson/cat_ru:LNP"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <p>Информации о вывозах по указанной ДТ не найдено</p>
                     </xsl:otherwise>
                  </xsl:choose>
               </div>
            </xsl:for-each>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
