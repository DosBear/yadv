<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:kt_req="urn:customs.ru:Information:SEMDocuments:SEM_KTRequest:5.12.0" xmlns:sem_cat="urn:customs.ru:Information:SEMDocuments:SEMCommonAggregateTypes:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="kt_req:SEM_KTRequest">
      <html>
         <head>
            <title>Запрос по наличию категорий товаров включенных во внутрисистемный список товаров, запрещенных или ограниченных к перемещению через таможенную границу РФ</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        background: #cccccc;
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
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
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
                        font: 10;
                    }
                    
                    .in_table {
						border-bottom:0; 
						border-top:0;
                    }
                    
					
                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                    
                    .low {
					font: 12;
					font-family: Arial, serif;
				}

                </style>
         </head>
         <body>
            <div class="page">
               <h2>Запрос по наличию категорий товаров включенных во внутрисистемный список товаров, запрещенных или ограниченных к перемещению через таможенную границу РФ</h2>
               <p class="remark">
                  <xsl:choose>
                     <xsl:when test="sem_cat:AccelerationIndicator='true' or sem_cat:AccelerationIndicator='t' or sem_cat:AccelerationIndicator='1' ">Ускоренная обработка</xsl:when>
                     <xsl:otherwise>Обычная обработка</xsl:otherwise>
                  </xsl:choose>
               </p>
               <!-- Ограничительные коэффициенты -->
               <xsl:call-template name="CalculationSettings"/>
               <!-- Отправитель / Получатель -->
               <xsl:if test="sem_cat:Consignee or sem_cat:Consignor">
                  <span class="header">Сведения об отправителе и получателе</span>
                  <table>
                     <tbody>
                        <tr>
                           <td width="50%">Отправитель</td>
                           <td width="50%">Получатель</td>
                        </tr>
                        <tr>
                           <td>
                              <xsl:choose>
                                 <xsl:when test="sem_cat:Consignor">
                                    <xsl:apply-templates select="sem_cat:Consignor"/>
                                 </xsl:when>
                                 <xsl:otherwise>НЕТ СВЕДЕНИЙ</xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td>
                              <xsl:choose>
                                 <xsl:when test="sem_cat:Consignor">
                                    <xsl:apply-templates select="sem_cat:Consignee"/>
                                 </xsl:when>
                                 <xsl:otherwise>НЕТ СВЕДЕНИЙ</xsl:otherwise>
                              </xsl:choose>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <br/>
               </xsl:if>
               <!-- Декларанте (представителе) / Лицо ответственное за финансовое урегулирование -->
               <xsl:if test="sem_cat:Declarant or sem_cat:FinancialAdjustingResponsiblePerson">
                  <span class="header">Сведения о декларанте и лице ответственном за финансовое урегулирование</span>
                  <table>
                     <tbody>
                        <tr>
                           <td width="50%">Декларант</td>
                           <td width="50%">Лицо ответственное за финансовое урегулирование</td>
                        </tr>
                        <tr>
                           <td>
                              <xsl:choose>
                                 <xsl:when test="sem_cat:Declarant">
                                    <xsl:apply-templates select="sem_cat:Declarant"/>
                                 </xsl:when>
                                 <xsl:otherwise>НЕТ СВЕДЕНИЙ</xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td>
                              <xsl:choose>
                                 <xsl:when test="sem_cat:FinancialAdjustingResponsiblePerson">
                                    <xsl:apply-templates select="sem_cat:FinancialAdjustingResponsiblePerson"/>
                                 </xsl:when>
                                 <xsl:otherwise>НЕТ СВЕДЕНИЙ</xsl:otherwise>
                              </xsl:choose>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </xsl:if>
            </div>
            <div class="album_page">
               <h2>Информация о товарах</h2>
               <table border="1" style="table-layout:fixed;word-wrap:break-word; width:100%;">
                  <tr>
                     <th class="value" style="width:20mm">Порядковый номер товара</th>
                     <th class="value" style="width:15mm">Номер товара в списке</th>
                     <th class="value">Наименование</th>
                     <th class="value">Вес брутто</th>
                     <th class="value">Вес нетто / Вес без упаковки</th>
                     <th class="value">Цена / Стоимость</th>
                     <th class="value">Таможенная стоимость</th>
                     <th class="value">Статистическая стоимость</th>
                     <th class="value">Код по ТН ВЭД ЕАЭС</th>
                     <th class="value">Код товара</th>
                  </tr>
                  <xsl:for-each select="kt_req:Goods">
                     <xsl:if test="position()>1">
                        <tr>
                           <td colspan="10" height="20px"/>
                        </tr>
                     </xsl:if>
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="CalculationSettings">
      <xsl:choose>
         <xsl:when test="sem_cat:CalculationSettings">
            <span class="header">Ограничительные коэффициенты</span>
            <table>
               <tbody>
                  <tr>
                     <td>№</td>
                     <td>Наименование</td>
                     <td>Тип</td>
                     <td>Значение</td>
                  </tr>
                  <xsl:for-each select="sem_cat:CalculationSettings">
                     <tr>
                        <td>
                           <xsl:value-of select="position()"/>
                        </td>
                        <td>
                           <xsl:value-of select="sem_cat:Name"/>
                        </td>
                        <td>
                           <xsl:value-of select="sem_cat:Type"/>
                        </td>
                        <td>
                           <xsl:value-of select="sem_cat:Value"/>
                        </td>
                     </tr>
                  </xsl:for-each>
               </tbody>
            </table>
         </xsl:when>
         <xsl:otherwise>
            <span>Ограничительные коэффициенты - НЕТ</span>
         </xsl:otherwise>
      </xsl:choose>
      <br/>
   </xsl:template>
   <xsl:template match="sem_cat:Consignee | sem_cat:Consignor | sem_cat:Declarant | sem_cat:FinancialAdjustingResponsiblePerson">
      <xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/>
         <br/>
         <br/>
      </xsl:if>
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
         <br/>
      </xsl:if>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="catESAD_ru:ITN">
         <span>ИТН субъекта ВЭД: <xsl:value-of select="catESAD_ru:ITN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="catESAD_ru:OKATO">
         <span>Код ОКАТО: <xsl:value-of select="catESAD_ru:OKATO"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="catESAD_ru:Address">
         <br/>
         <xsl:apply-templates select="catESAD_ru:Address"/>
         <br/>
      </xsl:if>
      <xsl:if test="catESAD_ru:IdentityCard">
         <xsl:apply-templates select="catESAD_ru:IdentityCard"/>
      </xsl:if>
      <xsl:if test="sem_cat:BranchDescription">
         <xsl:apply-templates select="sem_cat:BranchDescription"/>
      </xsl:if>
      <xsl:if test="sem_cat:BowelsINN">
         <span>ИНН недропользователя: <xsl:value-of select="sem_cat:BowelsINN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="sem_cat:BowelsOKPO">
         <span>ОКПО недропользователя: <xsl:value-of select="sem_cat:BowelsOKPO"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="sem_cat:ContractorIndicator">
         <span>
            <xsl:choose>
               <xsl:when test="sem_cat:ContractorIndicator = '1'">КОНТРАГЕНТ</xsl:when>
               <xsl:when test="sem_cat:ContractorIndicator = '2'">Разные по списку</xsl:when>
            </xsl:choose>
            <br/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
      <br/>
   </xsl:template>
   <xsl:template match="catESAD_ru:Address">
      <span class="header">Адрес:</span>
      <br/>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="catESAD_ru:IdentityCard">
      <span class="header">Документ, удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
            <xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="sem_cat:BranchDescription">
      <span class="header">Сведения об обособленном подразделении:</span>
      <br/>
      <span>
         <xsl:value-of select="catESAD_ru:OrganizationName"/>
      </span>
      <br/>
      <xsl:if test="catESAD_ru:KPP">
         <span>КПП: <xsl:value-of select="catESAD_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="catESAD_ru:Address">
         <xsl:apply-templates select="catESAD_ru:Address"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="kt_req:Goods">
      <tr>
         <th style="border-bottom:0">Товар <xsl:value-of select="catESAD_cu:GoodsNumeric"/>
         </th>
         <td>
            <xsl:value-of select="catESAD_cu:ListNumeric"/>
         </td>
         <td>
            <xsl:for-each select="catESAD_cu:GoodsDescription">
               <xsl:value-of select="."/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </xsl:for-each>
         </td>
         <td>
            <xsl:value-of select="catESAD_cu:GrossWeightQuantity"/>
         </td>
         <td>
            <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
            <xsl:if test="../kt_req:Goods/catESAD_cu:NetWeightQuantity2 and ../kt_req:Goods/catESAD_cu:NetWeightQuantity"> / </xsl:if>
            <xsl:value-of select="catESAD_cu:NetWeightQuantity2"/>
         </td>
         <td>
            <xsl:value-of select="catESAD_cu:InvoicedCost"/>
         </td>
         <td>
            <xsl:value-of select="catESAD_cu:CustomsCost"/>
         </td>
         <td>
            <xsl:value-of select="catESAD_cu:StatisticalCost"/>
         </td>
         <td>
            <xsl:value-of select="sem_cat:GoodsTNVEDCode"/>
         </td>
         <td>
            <xsl:value-of select="sem_cat:GoodsAddTNVEDCode"/>
         </td>
      </tr>
      <xsl:if test="sem_cat:GoodsGroupDescription">
         <tr>
            <td style="border-bottom:0; border-top:0;"/>
            <td class="low" colspan="9">Описание и характеристика товаров / Описание группы товаров одного наименования с отличающимися от других групп характеристиками</td>
         </tr>
         <tr>
            <td style="border-top:0;"/>
            <td colspan="9">
               <table border="0" style="table-layout:fixed;word-wrap:break-word; width:101%; margin-top:-1px; margin-left:-1px; ">
                  <tbody>
                     <tr>
                        <!--<td class="value" style="width:10mm">Код ТН ВЭД ЕАЭС</td>-->
                        <td/>
                        <td class="value">Производитель</td>
                        <td class="value">Товарный знак</td>
                        <td class="value">Марка</td>
                        <td class="value">Модель</td>
                        <td class="value">Артикул</td>
                        <td class="value">Стандарт</td>
                        <td class="value">Сорт</td>
                        <td class="value">Сортимент</td>
                        <td class="value">Порода древесины</td>
                        <td class="value">Размеры</td>
                        <td class="value">Дата выпуска</td>
                        <td class="value">Серийный номер</td>
                        <td class="value">Количество</td>
                     </tr>
                     <xsl:for-each select="sem_cat:GoodsGroupDescription">
                        <!--<td class="in_table" style="width:10mm;"><xsl:value-of select="catESAD_cu:RKTNVED"/></td>-->
                        <xsl:choose>
                           <xsl:when test="catESAD_cu:GoodsGroupInformation">
                              <xsl:for-each select="catESAD_cu:GoodsGroupInformation">
                                 <tr>
                                    <xsl:choose>
                                       <xsl:when test="position() = 1">
                                          <td style="border-bottom:0;">
                                             <xsl:for-each select="../catESAD_cu:GoodsDescription">
                                                <xsl:value-of select="."/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </xsl:for-each>
                                          </td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td style="border-top:0; border-bottom:0;"/>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                    <td style="border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:Manufacturer"/>
                                    </td>
                                    <td style="border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:TradeMark"/>
                                    </td>
                                    <td style="border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:GoodsMark"/>
                                    </td>
                                    <td style="border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:GoodsModel"/>
                                    </td>
                                    <td style="border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:GoodsMarking"/>
                                    </td>
                                    <td style="border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:GoodsStandard"/>
                                    </td>
                                    <td style="border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:GoodsSort"/>
                                    </td>
                                    <td style="border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:WoodSortiment"/>
                                    </td>
                                    <td style="border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:WoodKind"/>
                                    </td>
                                    <td style="border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:Dimensions"/>
                                    </td>
                                    <td style="border-bottom:0;">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
                                       </xsl:call-template>
                                    </td>
                                    <td style="width:10mm; border-bottom:0;">
                                       <xsl:value-of select="catESAD_cu:SerialNumber"/>
                                    </td>
                                    <td style="width:10mm; border-bottom:0; border:right:0">
                                       <xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
                                          <xsl:value-of select="cat_ru:GoodsQuantity"/>
                                          <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
                                          <xsl:if test="cat_ru:MeasureUnitQualifierCode">
														(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
													</xsl:if>
                                       </xsl:for-each>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </xsl:when>
                           <xsl:otherwise>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:for-each>
                  </tbody>
               </table>
            </td>
         </tr>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
