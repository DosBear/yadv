<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:PIRWCU="urn:customs.ru:Information:CustomsDocuments:PIRWInformationCU:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0">
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
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
   </xsl:template>
   <xsl:template match="PIRWCU:PIRWInformationCU">
      <html>
         <head>
            <title>Предварительная информация о товарах, ввозимых  на таможенную территорию Евразийского экономического союза железнодорожным транспортом</title>
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
				height: 210mm;
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
				/*border: 2px solid gray;*/
				font-family: Arial, serif;
				font-size: 7pt;
				vertical-align:top;
			}
			
			th {
				font-weight: bold;
				border: 1px solid gray;
				font-family: Arial, serif;
				font-size: 10pt;
				
			}
			
			.low {
				font: 12;
				font-family: Arial, serif;
			}
			
			.text {
				font-family: Courier, serif;
			}
			
			.auxiliary tbody tr td {
				border: 0;
			}
		</style>
         </head>
         <body>
            <div class="page">
               <table border="1">
                  <tbody>
                     <tr>
                        <th colspan="4" height="30px">
							Предварительная информация о товарах,<br/>ввозимых  на таможенную территорию Евразийского экономического союза<br/>железнодорожным транспортом
								</th>
                     </tr>
                     <!-- Транспортное средство -->
                     <tr>
                        <th colspan="4">Транспортное средство (ТС)</th>
                     </tr>
                     <tr>
                        <xsl:for-each select="PIRWCU:TrainInfo">
                           <td>
								№ поезда<br/>
                              <span class="text">
                                 <xsl:value-of select="PIRWCU:TrainNumber"/>
                              </span>
                           </td>
                           <td>
								Индекс поезда<br/>
                              <span class="text">
                                 <xsl:value-of select="PIRWCU:TrainIndex"/>
                              </span>
                           </td>
                           <td>
								№ ППВ<br/>
                              <span class="text">
                                 <xsl:value-of select="PIRWCU:PPVNumber"/>
                              </span>
                           </td>
                           <td>
								Ориентировочная дата прибытия<br/>
                              <span class="text">
                                 <!--xsl:value-of select="PIRWCU:ArrivalDate"/-->
								   <xsl:call-template name="russian_date">
									  <xsl:with-param name="dateIn" select="//PIRWCU:DateExpectedArrival"/>
								   </xsl:call-template>
								   <xsl:text> </xsl:text>
								   <xsl:value-of select="substring(//PIRWCU:TimeExpectedArrival,1,8)"/>
                              </span>
                           </td>
                        </xsl:for-each>
                     </tr>
                     <tr>
                        <th colspan="4">Вагон</th>
                     </tr>
                     <xsl:for-each select="PIRWCU:TrainInfo/PIRWCU:CarriageInfo">
                        <!-- Вагон -->
                        <tr>
                           <td>
								№ вагона<br/>
                              <span class="text">
                                 <xsl:value-of select="PIRWCU:CarriageNumber"/>
                              </span>
                           </td>
                           <td>
								Буквенный код страны регистрации<br/>
                              <span class="text">
                                 <xsl:value-of select="PIRWCU:CountryRegistrationCode"/>
                              </span>
                           </td>
                           <td>
								Станция отправления<br/>
                              <span class="text">
                                 <xsl:value-of select="PIRWCU:DepartureStation"/>
                              </span>
                           </td>
                           <td>
								Станция назначения<br/>
                              <span class="text">
                                 <xsl:value-of select="PIRWCU:DestinationStation"/>
                              </span>
                           </td>
                        </tr>
                        <tr>
                           <td>
								Примечания<br/>
                              <span class="text">
                                 <xsl:value-of select="PIRWCU:AddInformaition"/>
                              </span>
                           </td>
                           <td>
								Признак порожний (да/нет)<br/>
                              <span class="text">
                                 <xsl:choose>
                                    <xsl:when test="(PIRWCU:EmptyIndicator='0') or (PIRWCU:EmptyIndicator='f') or (PIRWCU:EmptyIndicator='false')">нет</xsl:when>
                                    <xsl:otherwise>да</xsl:otherwise>
                                 </xsl:choose>
                              </span>
                           </td>
                           <td>
								Вес груза<br/>
                              <span class="text">
                                 <xsl:value-of select="PIRWCU:GoodsWeightQuantity"/>
                              </span>
                           </td>
                           <td>
								Порядковый № вагона в составе<br/>
                              <span class="text">
                                 <xsl:value-of select="PIRWCU:CarriageNumeric"/>
                              </span>
                           </td>
                        </tr>
                        <xsl:if test="PIRWCU:ContainerNumbers">
                           <tr>
                              <td colspan="4">
								Номера контейнеров<br/>
                                 <xsl:for-each select="PIRWCU:ContainerNumbers">
                                    <xsl:if test="position()>1">; </xsl:if>
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="count(//PIRWCU:TrainInfo/PIRWCU:CarriageInfo)>1">
                           <tr>
                              <th colspan="4" style="border-bottom: .5pt solid windowtext;"/>
                           </tr>
                        </xsl:if>
                     </xsl:for-each>
                     <tr>
                        <th colspan="4">Информация о товарных партиях</th>
                     </tr>
                     <xsl:for-each select="PIRWCU:PICU_GoodsShipment">
                        <tr>
                           <td colspan="4">
								Название и буквенный код страны отправления товаров<br/>
							  <xsl:value-of select="PIRWCU:PICUConsignment/PIRWCU:DispatchCountryName"/>
                              <xsl:if test="PIRWCU:PICUConsignment/PIRWCU:DispatchCountryName or PIRWCU:PICUConsignment/PIRWCU:DispatchCountryCode"> / </xsl:if>
                              <xsl:value-of select="PIRWCU:PICUConsignment/PIRWCU:DispatchCountryCode"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4">
								Название и буквенный код страны назначения товаров <br/>
                              <xsl:value-of select="PIRWCU:PICUConsignment/PIRWCU:DestinationCountryName"/>
                              <xsl:if test="PIRWCU:PICUConsignment/PIRWCU:DestinationCountryName or PIRWCU:PICUConsignment/PIRWCU:DestinationCountryCode"> / </xsl:if>
                              <xsl:value-of select="PIRWCU:PICUConsignment/PIRWCU:DestinationCountryCode"/>
                           </td>
                        </tr>
                        <!-- грузополучатель -->
                        <xsl:if test="PIRWCU:Consignee">
                           <tr>
                              <th colspan="4">Информация о получателе</th>
                           </tr>
                           <xsl:apply-templates select="PIRWCU:Consignee"/>
                        </xsl:if>
                        <!-- отправитель -->
                        <xsl:if test="PIRWCU:Consignor">
                           <tr>
                              <th colspan="4">Информация об отправителе товара</th>
                           </tr>
                           <xsl:apply-templates select="PIRWCU:Consignor"/>
                        </xsl:if>
                        <!-- Пункт назначения товаров >
                        <xsl:apply-templates select="PIRWCU:PIoutDestination"/-->
                        <!-- СВХ места назначения >
                        <xsl:if test="PIRWCU:PIoutDestination/PIRWCU:DestinationWarehouse">
                           <xsl:apply-templates select="PIRWCU:PIoutDestination/PIRWCU:DestinationWarehouse"/>
                        </xsl:if-->
                        <!-- Сведения о товарах -->
                        <tr>
                           <th colspan="4">Сведения о товарах</th>
                        </tr>
                        <xsl:apply-templates select="PIRWCU:PIGoods"/>
                        <xsl:if test="count(//PIRWCU:GoodsShipment)>1">
                           <tr>
                              <th colspan="4"/>
                           </tr>
                        </xsl:if>
                     </xsl:for-each>
					<!--Сведения о предполагаемом месте прибытия товарова-->
                     <xsl:apply-templates select="PIRWCU:CheckPointInfo"/>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="PIRWCU:CheckPointInfo">
      <tr>
         <th colspan="4">Сведения о предполагаемом месте прибытия товарова</th>
      </tr>
      <xsl:if test="PIRWCU:BorderRWStation">
         <tr>
            <td>
			Наименование ЖД станции назначения<br/>
               <span class="text">
                  <xsl:value-of select="PIRWCU:BorderRWStation/PIRWCU:StationCode"/>
               </span>
            </td>
            <td>
			Код ЖД станции назначения<br/>
               <span class="text">
                  <xsl:value-of select="PIRWCU:BorderRWStation/PIRWCU:StationName"/>
               </span>
            </td>
            <td colspan="2">
			Наименование места назначения<br/>
               <span class="text">
                  <xsl:value-of select="PIRWCU:BorderRWStation/PIRWCU:RailwayCode"/>
               </span>
            </td>
         </tr>
      </xsl:if>
      <tr>
         <td colspan="2">
			Наименование таможенного органа назначения товаров<br/>
            <span class="text">
               <xsl:value-of select="PIRWCU:PPBorderCustoms/cat_ru:OfficeName"/>
            </span>
         </td>
         <td colspan="2">
			Код таможенного органа назначения товаров<br/>
            <span class="text">
               <xsl:value-of select="PIRWCU:PPBorderCustoms/cat_ru:Code"/>
            </span>
         </td>
      </tr>
      <tr>
         <td>
			Наименование пункта пропуска<br/>
            <span class="text">
               <xsl:value-of select="PIRWCU:CheckPoint/PIRWCU:CheckPointName"/>
            </span>
         </td>
         <td colspan="3">
			Код пункта пропуска<br/>
            <span class="text">
               <xsl:value-of select="PIRWCU:CheckPoint/PIRWCU:CheckPointCode"/>
            </span>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="PIRWCU:DestinationWarehouse">
      <tr>
         <th colspan="4">СВХ места назначения</th>
      </tr>
      <tr>
         <td colspan="3">
			№ свидетельства о включении в Реестр владельцев СВХ/ ТС/ № лицензии <br/>
            <span class="text">
               <xsl:value-of select="cat_ru:PrDocumentNumber"/>
            </span>
         </td>
         <td>
			Дата выдачи свидетельства/лицензии <br/>
            <span class="text">
               <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
               </xsl:call-template>
            </span>
         </td>
      </tr>
   </xsl:template>
   <!--xsl:template match="PIRWCU:DestinationCountry | PIRWCU:DispatchCountry">
      <span class="text">
         <xsl:value-of select="cat_ru:CountryName"/>
         <xsl:if test="cat_ru:CountryName and cat_ru:CountryACode"> / </xsl:if>
         <xsl:value-of select="cat_ru:CountryACode"/>
      </span>
   </xsl:template-->
   <xsl:template match="PIRWCU:PIGoods">
      <xsl:for-each select=".">
         <tr>
            <td style="border-right: 3px solid gray; border-bottom: 3px solid gray;">
			Код товара по ТН ВЭД ЕАЭС<br/>
               <span class="text">
                  <xsl:value-of select="cat_ru:GoodsTNVEDCode"/>
               </span>
            </td>
            <td>
			Описание товара<br/>
               <span class="text">
                  <xsl:for-each select="cat_ru:GoodsDescription">
                     <xsl:value-of select="."/> </xsl:for-each>
               </span>
            </td>
            <td>
			Вес товара брутто (кг)<br/>
               <span class="text">
                  <xsl:value-of select="cat_ru:GrossWeightQuantity"/>
               </span>
            </td>
            <td>
			Вес товара нетто (кг)<br/>
               <span class="text">
                  <xsl:value-of select="cat_ru:NetWeightQuantity"/>
               </span>
            </td>
         </tr>
         <tr>
            <td>
			<!--Буквенный код страны происхождения товара<br/-->
			Стоимость товара<br/>
               <span class="text">
                  <xsl:value-of select="PIRWCU:InvoiceValue"/>
               </span>
            </td>
            <td>
			Буквенный код валюты<br/>
               <span class="text">
                  <xsl:value-of select="PIRWCU:CurrencyCode"/>
               </span>
            </td>
            <!--td>
			Фактурная стоимость<br/>
               <span class="text">
                  <xsl:value-of select="cat_ru:InvoicedCost"/>
               </span>
            </td>
            <td>
			Курс валюты<br/>
               <span class="text">
                  <xsl:value-of select="cat_ru:CurrencyRate"/>
               </span>
            </td-->
            <td colspan="2"> 
            Кол-во товара в доп. ед. измерения<br/>
               <span class="text">
				   <xsl:for-each select="PIRWCU:SupplementaryQuantity">
					   <xsl:if test="position()>1">; </xsl:if>
					   <xsl:value-of select="cat_ru:GoodsQuantity"/>
					   <xsl:if test="cat_ru:MeasureUnitQualifierName">
						   <xsl:text> </xsl:text>
						   <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
					   </xsl:if>
					   <xsl:if test="cat_ru:MeasureUnitQualifierCode"> (код: <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
				   </xsl:for-each>
               </span>
            </td>
        </tr>
         <tr>
            <!--td>
			Кол-во товара в ед измерения<br/>
               <span class="text">
                  <xsl:value-of select="PIRWCU:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
               </span>
            </td>
            <td>
			Краткое название и код ед измерения<br/>
					<span class="text">
                  <xsl:value-of select="PIRWCU:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> <xsl:value-of select="PIRWCU:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
               </span>
            </td-->
            <td>
			Номера контейнеров<br/>
               <span class="text">
                  <xsl:for-each select="PIRWCU:ContainerNumber">
                     <xsl:if test="position()>1">; </xsl:if>
                     <xsl:value-of select="catESAD_cu:ContainerIdentificaror"/>
                     <xsl:if test="catESAD_cu:FullIndicator">
						 <xsl:choose>
								<xsl:when test="catESAD_cu:FullIndicator='1'"> (полный)</xsl:when>
								<xsl:when test="catESAD_cu:FullIndicator='2'"> (товар занимает часть контейнера)</xsl:when>
							</xsl:choose>
                     </xsl:if>
                  </xsl:for-each>
               </span>
            </td>
            <xsl:apply-templates select="PIRWCU:PIGoodsPackaging"/>
         </tr>
         
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="PIRWCU:PIGoodsPackaging">
         <td>
			Код вида груза<br/>
            <span class="text">
               <xsl:value-of select="PIRWCU:PackageCode"/>
            </span>
         </td>
         <!--td>
			Описание вида груза<br/>
            <span class="text">
               <xsl:value-of select="PIRWCU:CargoInfo"/>
            </span>
         </td-->
         <td>
			Кол-во грузовых мест <br/>
            <span class="text">
               <xsl:value-of select="PIRWCU:PakageQuantity"/>
            </span>
         </td>
         <td>
            <table border="0" class="auxilary">
                  <tr>
                     <td>Код вида упаковки</td>
                     <td>Кол-во упаковок</td>
                     <td>Маркировка грузовых мест</td>
                  </tr>
                  <xsl:for-each select="PIRWCU:PackingInformation">
                     <tr>
                        <td class="text"><xsl:value-of select="catESAD_cu:PalleteCode"/></td>
                        <td class="text"><xsl:value-of select="catESAD_cu:PalleteQuantity"/></td>
                        <td class="text"><xsl:value-of select="PIRWCU:PackageMark"/></td>
                     </tr>
                  </xsl:for-each>
            </table>
         </td>
   </xsl:template>
   <xsl:template match="PIRWCU:Consignee | PIRWCU:Consignor">
      <xsl:if test="cat_ru:OrganizationName">
         <tr>
            <td colspan="4">
				Наименование организации/ФИО физ лица 
				<span style="width:5mm"/>
               <span class="text">
                  <xsl:value-of select="cat_ru:OrganizationName"/>
               </span>
            </td>
         </tr>
      </xsl:if>
      <xsl:for-each select="PIRWCU:Address">
         <xsl:if test="../cat_ru:ShortName or cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName">
            <tr>
               <td>
					Краткое наименование организации<br/>
                  <span class="text">
                     <xsl:value-of select="../cat_ru:ShortName"/>
                  </span>
               </td>
               <td width="22%">
					Почтовый индекс <br/>
                  <span class="text">
                     <xsl:value-of select="cat_ru:PostalCode"/>
                  </span>
               </td>
               <td>
					Буквенный код страны <br/>
                  <span class="text">
                     <xsl:value-of select="cat_ru:CountryCode"/>
                  </span>
               </td>
               <td>
					Краткое наименование страны <span style="width:5mm"/>
                  <span class="text">
                     <xsl:value-of select="cat_ru:CounryName"/>
                  </span>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="../cat_ru:OrganizationLanguage or cat_ru:Region or cat_ru:City or cat_ru:StreetHouse">
            <tr>
               <td>
					Код языка для заполнения наименования <br/>
                  <span class="text">
                     <xsl:value-of select="../cat_ru:OrganizationLanguage"/>
                  </span>
               </td>
               <td width="22%">
					Область (регион, штат, провинция и т.п.)<br/>
                  <span class="text">
                     <xsl:value-of select="cat_ru:Region"/>
                  </span>
               </td>
               <td>
					Населенный пункт <br/>
                  <span class="text">
                     <xsl:value-of select="cat_ru:City"/>
                  </span>
               </td>
               <td>
					Улица, номер дома, номер офиса <br/>
                  <span class="text">
                     <xsl:value-of select="cat_ru:StreetHouse"/>
                  </span>
               </td>
            </tr>
         </xsl:if>
      </xsl:for-each>
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
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <tr>
         <td>Сведения об организации. Особенности РФ</td>
         <td width="22%">
			ОГРН/ГРНИП. Основной гос регистрационный номер
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <span class="text">
               <xsl:value-of select="cat_ru:OGRN"/>
            </span>
         </td>
         <td>
			ИНН <br/>
            <span class="text">
               <xsl:value-of select="cat_ru:INN"/>
            </span>
         </td>
         <td>
			КПП <br/>
            <span class="text">
               <xsl:value-of select="cat_ru:KPP"/>
            </span>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <tr>
         <td rowspan="3">Сведения об организации. Особенности Республики Казахстан</td>
         <td width="22%">
			Бизнес-идентификационный номер - БИН
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <span class="text">
               <xsl:value-of select="cat_ru:BIN"/>
            </span>
         </td>
         <td>
			Индивидуальный идентификационный № - ИИН
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <span class="text">
               <xsl:value-of select="cat_ru:IIN"/>
            </span>
         </td>
         <td>
			Резерв для ИТН
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <span class="text">
               <xsl:value-of select="cat_ru:ITN/cat_ru:ITNReserv"/>
            </span>
         </td>
      </tr>
      <tr>
         <td colspan="3">Идентификационный таможенный № - ИТН</td>
      </tr>
      <tr>
         <td width="22%">
			Категория лица
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <span class="text">
               <xsl:value-of select="cat_ru:ITN/cat_ru:CategoryCode"/>
            </span>
         </td>
         <td>
			Код КАТО 
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <span class="text">
               <xsl:value-of select="cat_ru:ITN/cat_ru:KATOCode"/>
            </span>
         </td>
         <td>
			РНН 
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <span class="text">
               <xsl:value-of select="cat_ru:ITN/cat_ru:RNN"/>
            </span>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <tr>
         <td>Сведения об организации. Особенности Республики Беларусь</td>
         <td colspan="2">
			УНП
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <span class="text">
               <xsl:value-of select="cat_ru:UNP"/>
            </span>
         </td>
         <td>
			Идентификационный № физического лица
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <span class="text">
               <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
            </span>
         </td>
      </tr>
   </xsl:template>
</xsl:stylesheet>
