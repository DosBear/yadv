<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.14.0" xmlns:piaut="urn:customs.ru:Information:PriorInformation:PI_AutoArrive:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0">
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
   <xsl:template match="piaut:PI_AutoArrive">
      <html>
         <head>
            <title>Предварительная информация для перевозок автотранспортом</title>
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
				
				.graph {
				font-family: Arial;
				font-size: 10pt;
				}

				.value
				{
				border-bottom: solid 1px black;
				}
				
				td.bordered
				{
				border: solid 1px windowtext;
				}
			</style>
         </head>
         <body>
            <div class="page">
               <table border="1">
                  <tbody>
                     <tr>
                        <th colspan="4" height="30px" style="text-decoration:underline;">Предварительная информация для перевозок автотранспортом</th>
                     </tr>
                     <xsl:if test="piaut:PI_URN/child::comment()[1]">
						 <tr>
							<td colspan="4" align="center">
								<xsl:variable name="bmpData" select="substring(piaut:PI_URN/child::comment()[1],8)"/>
								<img>
									<xsl:attribute name="src">
										<xsl:value-of select="concat('data:image/bmp;base64,', $bmpData)"/>
									</xsl:attribute>
								</img> 
							</td>
						</tr>
                     </xsl:if>
                     <tr>
                        <td rowspan="2">
								Номер экспортной ДТ и код страны экспорта <br/>
                           <span class="text">
                              <xsl:value-of select="piaut:Exp_DTNumber"/>
                              <xsl:if test="piaut:Exp_DTNumber and piaut:Exp_CountryCode">, </xsl:if>
                              <xsl:value-of select="piaut:Exp_CountryCode"/>
                           </span>
                        </td>
                        <td colspan="3">№ предварительной декларации на товары</td>
                     </tr>
                     <tr>
                        <td width="22%">
								Код органа, зарегистрировавшего документ <br/>
                           <span class="text">
                              <xsl:value-of select="piaut:PI_DTNumber/cat_ru:CustomsCode"/>
                           </span>
                        </td>
                        <td width="22%">
								Дата регистрации документа <br/>
                           <span class="text">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="piaut:PI_DTNumber/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                           </span>
                        </td>
                        <td width="22%">
								Порядковый № документа <br/>
                           <span class="text">
                              <xsl:value-of select="piaut:PI_DTNumber/cat_ru:GTDNumber"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <th colspan="4">Информация о получателе</th>
                     </tr>
                     <xsl:apply-templates select="piaut:Consignee"/>
                     <tr>
                        <th colspan="4">Информация об отправителе товара</th>
                     </tr>
                     <xsl:apply-templates select="piaut:Consignor"/>
                     <tr>
                        <th colspan="4">Информация о перевозчике</th>
                     </tr>
                     <xsl:apply-templates select="piaut:Carrier"/>
                     <tr>
                        <th colspan="4">Транспортное средство (ТС)</th>
                     </tr>
                     <xsl:apply-templates select="piaut:ShippingInformation/piaut:BorderTransport"/>
                     <tr>
                        <td colspan="4">
								Название и буквенный код страны отправления товаров 
								<xsl:apply-templates select="piaut:ShippingInformation/piaut:DispatchCountry"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="4">
								Название и буквенный код страны назначения товаров 
								<xsl:apply-templates select="piaut:ShippingInformation/piaut:DestinationCountry"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
								Всего наименований товаров 
								<span class="text">
                              <xsl:value-of select="piaut:GoodsInform/piaut:TotalGoodsNameQuantity"/>
                           </span>
                        </td>
                        <td>
								Кол-во отгрузочных спецификаций 
								<span class="text">
                              <xsl:value-of select="piaut:GoodsInform/piaut:ShipSpecifQuantity"/>
                           </span>
                        </td>
                        <td>
								Кол-во товаров по отгрузочным спецификациям 
								<span class="text">
                              <xsl:value-of select="piaut:GoodsInform/piaut:ShipSpecifGoodsQuantity"/>
                           </span>
                        </td>
                        <td>
								Дата  и время ожидаемого прибытия товаров и ТС
								<span class="text">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="piaut:GoodsInform/piaut:DateExpectedArrival"/>
                              </xsl:call-template>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="substring(piaut:GoodsInform/piaut:TimeExpectedArrival, 1, 8)"/>
                           </span>
                        </td>
                     </tr>
                     <xsl:if test="piaut:ShippingInformation/piaut:TransControl">
						 <tr>
							<td colspan="4">
								<table>
									<tbody>
										<tr class="title">
											<td class="graphMain bordered">Разрешение для иностранных перевозчиков</td>
											<td class="graphMain bordered">Тип разрешения для иностранных перевозчиков</td>
											<td class="graphMain bordered">Cпециальное разрешение на перевозку опасных грузов</td>
											<td class="graphMain bordered">Cпециальное разрешение на перевозку опасных грузов</td>
											<td class="graphMain bordered">Cпециальное разрешение на перевозку тяжеловесных грузов</td>
											<td class="graphMain bordered">Карточка допуска российского транспортного средства к международным перевозкам грузов</td>
										</tr>
										<xsl:apply-templates select="piaut:ShippingInformation/piaut:TransControl"/>
									</tbody>
								</table>
							</td>
						</tr> 
					</xsl:if>
                     <tr>
                        <th colspan="4">Сведения о товарах</th>
                     </tr>
                     <xsl:apply-templates select="piaut:GoodsInform/piaut:Goods"/>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="piaut:Consignee | piaut:Consignor | piaut:Carrier">
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
      <xsl:for-each select="piaut:Address">
         <xsl:if test="../cat_ru:ShortName or catpi_ru:PostalCode or catpi_ru:CountryCode or catpi_ru:CounryName">
            <tr>
               <td>
					Краткое наименование организации<br/>
                  <span class="text">
                     <xsl:value-of select="../cat_ru:ShortName"/>
                  </span>
               </td>
               <td>
					Почтовый индекс <br/>
                  <span class="text">
                     <xsl:value-of select="catpi_ru:PostalCode"/>
                  </span>
               </td>
               <td>
					Буквенный код страны <br/>
                  <span class="text">
                     <xsl:value-of select="catpi_ru:CountryCode"/>
                  </span>
               </td>
               <td>
					Краткое наименование страны <span style="width:5mm"/>
                  <span class="text">
                     <xsl:value-of select="catpi_ru:CounryName"/>
                  </span>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="../cat_ru:OrganizationLanguage or catpi_ru:Region or catpi_ru:City or catpi_ru:StreetHouse">
            <tr>
               <td>
					Код языка для заполнения наименования <br/>
                  <span class="text">
                     <xsl:value-of select="../cat_ru:OrganizationLanguage"/>
                  </span>
               </td>
               <td>
					Область (регион, штат, провинция и т.п.)<br/>
                  <span class="text">
                     <xsl:value-of select="catpi_ru:Region"/>
                  </span>
               </td>
               <td>
					Населенный пункт <br/>
                  <span class="text">
                     <xsl:value-of select="catpi_ru:City"/>
                  </span>
               </td>
               <td>
					Улица, номер дома, номер офиса <br/>
                  <span class="text">
                     <xsl:value-of select="catpi_ru:StreetHouse"/>
                  </span>
               </td>
            </tr>
         </xsl:if>
      </xsl:for-each>
	<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
            <tr>
               <td>
					Сведения об организации
               </td>
               <td colspan="3">
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
               </td>
            </tr>
	</xsl:if>
   </xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures| RUScat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures| RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures| RUScat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures| RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures| RUScat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
   <xsl:template match="piaut:BorderTransport">
      <tr>
         <td style="border-bottom: 3px solid gray">
			Идентификатор/№ основного транспортного средства 
			<span class="text">
               <xsl:value-of select="catpi_ru:TransportIdentifier"/>
            </span>
         </td>
         <td colspan="2" style="border-bottom: 3px solid gray">
			Идентификатор/№ второго прицепного транспортного средства 
			<span class="text">
               <xsl:value-of select="catpi_ru:SecondTrailerIdentifier"/>
            </span>
         </td>
         <td style="border-bottom: 3px solid gray">Код вида ТС по классификатору видов ТС <span class="text">
               <xsl:value-of select="catpi_ru:TransportModeCode"/>
            </span>
         </td>
      </tr>
      <tr>
         <td>
			Идентификационный номер ТС  (VIN) 
			<span class="text">
               <xsl:value-of select="catpi_ru:VINID"/>
            </span>
         </td>
         <td colspan="2">
			Идентификатор/№ прицепного транспортного средства 
			<span class="text">
               <xsl:value-of select="catpi_ru:TrailerIdentifier"/>
            </span>
         </td>
         <td>Буквенный код страны ТС <span class="text">
               <xsl:value-of select="catpi_ru:TransportMeansNationalityCode"/>
            </span>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="piaut:DispatchCountry | piaut:DestinationCountry">
      <span class="text">
         <xsl:value-of select="catpi_ru:CountryName"/>
         <xsl:if test="catpi_ru:CountryName"> / </xsl:if>
         <xsl:value-of select="catpi_ru:CountryACode"/>
         <xsl:if test="catpi_ru:CountryPlace"> / </xsl:if>
         <xsl:value-of select="catpi_ru:CountryPlace"/>
      </span>
   </xsl:template>
   <xsl:template match="piaut:GoodsInform/piaut:Goods">
      <tr>
         <td style="border-bottom: 3px solid gray">
			Код таможенного органа прибытия товаров 
			<span class="text">
               <xsl:value-of select="../piaut:BorderCustoms/cat_ru:Code"/>
            </span>
         </td>
         <td style="border-bottom: 3px solid gray">
			Наименование таможенного органа прибытия товаров
			<span class="text">
               <xsl:value-of select="../piaut:BorderCustoms/cat_ru:OfficeName"/>
            </span>
         </td>
         <td style="border-bottom: 3px solid gray">
			Код государства члена Таможенного союза <br/>
            <span class="text">
               <xsl:value-of select="../piaut:BorderCustoms/cat_ru:CustomsCountryCode"/>
            </span>
         </td>
         <td style="border-bottom: 3px solid gray">
			Перевозчик контейнерной перевозки (0-нет/1 - да) <br/>
            <span class="text">
               <xsl:choose>
                  <xsl:when test="../../piaut:ShippingInformation/piaut:ContainerIndicator = 'true' or ../../piaut:ShippingInformation/piaut:ContainerIndicator = '1' or ../../piaut:ShippingInformation/piaut:ContainerIndicator = 't' ">1</xsl:when>
                  <xsl:otherwise>0</xsl:otherwise>
               </xsl:choose>
            </span>
         </td>
      </tr>
      <tr>
         <td>
			Код товара по ТН ВЭД ЕАЭС 
			<span class="text">
               <xsl:value-of select="catpi_ru:GoodsTNVEDCode"/>
            </span>
         </td>
         <td rowspan="2">
			Описание товара <br/>
            <span class="text">
               <xsl:for-each select="catpi_ru:GoodsDescription">
                  <xsl:value-of select="."/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </xsl:for-each>
            </span>
         </td>
         <td rowspan="2">
			Кол-во товара в ед измерения 
			<span class="text">
               <xsl:value-of select="catpi_ru:GoodsMeasureQuantity/catpi_ru:GoodsQuantity"/>
            </span>
         </td>
         <td rowspan="2">
			Краткое название и код ед измерения 
			<span class="text">
               <xsl:value-of select="catpi_ru:GoodsMeasureQuantity/catpi_ru:MeasureUnitQualifierName"/>
	           <xsl:if test="catpi_ru:GoodsMeasureQuantity/catpi_ru:MeasureUnitQualifierCode">
	           		<xsl:text> / </xsl:text>
	           		<xsl:value-of select="catpi_ru:GoodsMeasureQuantity/catpi_ru:MeasureUnitQualifierCode"/>
               </xsl:if>
            </span>
         </td>
      </tr>
      <tr>
         <td>Номер товара по порядку <span class="text">
               <xsl:value-of select="catpi_ru:GoodsNumeric"/>
            </span>
         </td>
      </tr>
      <tr>
         <td>
			Торговое название товара <br/>
            <span class="text">
                <xsl:value-of select="piaut:GoodsName"/>
            </span>
         </td>
         <td>
			Буквенный код страны происхождения товара
			<span class="text">
               <xsl:value-of select="catpi_ru:OriginCountryCode"/>
            </span>
         </td>
         <td>
			Вес товара брутто (кг)
			<span class="text">
               <xsl:value-of select="catpi_ru:GrossWeightQuantity"/>
            </span>
         </td>
         <td>
			Вес товара нетто (кг)
			<span class="text">
               <xsl:value-of select="catpi_ru:NetWeightQuantity"/>
            </span>
         </td>
      </tr>
      <tr>
          <td>
			Номера контейнеров <br/>
            <span class="text">
               <xsl:for-each select="catpi_ru:ContainerNumbers">
                  <xsl:if test="position() > 1">; </xsl:if>
                  <xsl:value-of select="."/>
               </xsl:for-each>
            </span>
         </td>
        <td>
			Курс валюты:  
			<span class="text">
               <xsl:value-of select="catpi_ru:CurrencyRate"/>
            </span>
         </td>
         <td>Фактурная стоимость <span class="text">
               <xsl:value-of select="catpi_ru:InvoicedCost"/>
               <xsl:text> </xsl:text>
               <xsl:value-of select="catpi_ru:CurrencyCode"/>
            </span>
         </td>
         <td>Идентификатор ПИ товара <br/>
			 <span class="text">
               <xsl:value-of select="catpi_ru:PIId"/>
            </span>
         </td>
      </tr>
      <xsl:for-each select="catpi_ru:GoodsPackaging">
         <tr>
            <td rowspan="2">
				Код вида груза<br/>
               <span class="text">
                  <xsl:value-of select="catpi_ru:CargoCode"/>
               </span>
            </td>
            <td rowspan="2">
				Описание вида груза<br/>
               <span class="text">
                  <xsl:value-of select="catpi_ru:CargoDescription"/>
               </span>
            </td>
            <td>
				Кол-во грузовых мест <br/>
               <span class="text">
                  <xsl:value-of select="catpi_ru:PakageQuantity"/>
               </span>
            </td>
            <td rowspan="2">
               <table border="0" class="auxilary">
                  <tbody>
                     <tr>
                        <td>Код вида упаковки</td>
                        <td>Кол-во упаковок</td>
                        <td>Маркировка грузовых мест</td>
                     </tr>
                     <xsl:for-each select="catpi_ru:PackingInformation">
                        <tr>
                           <td class="text">
                              <xsl:value-of select="catpi_ru:PackingCode"/>
                           </td>
                           <td class="text">
                              <xsl:value-of select="catpi_ru:PakingQuantity"/>
                           </td>
                           <td class="text">
                              <xsl:value-of select="catpi_ru:PackingMark"/>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
            </td>
         </tr>
		<tr>
			<td>
				Номера пломб: <br/>
			   <span class="text">
				  <xsl:for-each select="catpi_ru:Seal">
					  <xsl:value-of select="."/>
					  <xsl:if test="position()!=last()">, </xsl:if>
				  </xsl:for-each>
			   </span>
			</td>
		</tr>
      </xsl:for-each>
      <tr>
			<td colspan="4">
				<xsl:apply-templates select="catpi_ru:ControlNoCustoms"/>
			</td>
		</tr>
   </xsl:template>
	
	<!-- Шаблон для типа catpi_ru:ControlNoCustomsType -->
	<xsl:template match="catpi_ru:ControlNoCustoms">
		<xsl:if test="catpi_ru:SanitaryQuarantine">
			<div class="title marg-top"><u>Cанитарно-карантинный контроль</u></div>
			<xsl:apply-templates select="catpi_ru:SanitaryQuarantine"/>
			<br/>
		</xsl:if>
		<xsl:if test="catpi_ru:Veterinary">
			<div class="title marg-top"><u>Ветеринарный контроль</u></div>
			<xsl:apply-templates select="catpi_ru:Veterinary"/>
			<br/>
		</xsl:if>
		<xsl:if test="catpi_ru:FitoSanitary">
			<div class="title marg-top"><u>Фитосанитарный контроль</u></div>
			<xsl:apply-templates select="catpi_ru:FitoSanitary"/>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:DocPermitType -->
	<xsl:template match="catpi_ru:DocPermit| catpi_ru:FitoSanitaryDoc">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="catpi_ru:PresentedDocumentModeCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="catpi_ru:PresentedDocumentModeCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="catpi_ru:ExpiredDate">
			<xsl:text> срок действия: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="catpi_ru:ExpiredDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="catpi_ru:NetWeightQuantity">
			<xsl:text> вес нетто: </xsl:text>
			<xsl:value-of select="translate(catpi_ru:NetWeightQuantity, '.', ',')"/>
			<xsl:text> кг.</xsl:text>
		</xsl:if>
		<xsl:if test="catpi_ru:GrossWeightQuantity">
			<xsl:text> вес брутто: </xsl:text>
			<xsl:value-of select="translate(catpi_ru:GrossWeightQuantity, '.', ',')"/>
			<xsl:text> кг.</xsl:text>
		</xsl:if>
		<xsl:if test="catpi_ru:GoodsMeasureQuantity">
			<xsl:text> кол-во товара в ДЕИ: </xsl:text>
			<xsl:apply-templates select="catpi_ru:GoodsMeasureQuantity"/>
		</xsl:if>
		<xsl:if test="catpi_ru:CodeFOIV or catpi_ru:FOIVName">
			<xsl:text> выдан: </xsl:text>
			<xsl:if test="catpi_ru:CodeFOIV">(<xsl:value-of select="catpi_ru:CodeFOIV"/>)	</xsl:if>
			<xsl:value-of select="catpi_ru:FOIVName"/>		
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:FitoSanitaryType -->
	<xsl:template match="catpi_ru:FitoSanitary">
		<xsl:if test="catpi_ru:FitoSanitaryDoc">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Фитосанитарный сертификат страны-экспортера</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catpi_ru:FitoSanitaryDoc"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:FitoCountryCode or catpi_ru:FitoCountryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Страна, выдавшая сертификат</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="catpi_ru:FitoCountryCode">(<xsl:value-of select="catpi_ru:FitoCountryCode"/>) </xsl:if>
						<xsl:value-of select="catpi_ru:FitoCountryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:OriginPlace">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Место происхождения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catpi_ru:OriginPlace"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:DepartDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата отгрузки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catpi_ru:DepartDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:DisinfectionInfo">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация об обеззараживании </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catpi_ru:DisinfectionInfo"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:Marking">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о маркировке</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:Marking">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:GoodsMeasureQuantityType -->
	<xsl:template match="catpi_ru:GoodsMeasureQuantity">
			<xsl:value-of select="translate(catpi_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="catpi_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="catpi_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="catpi_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="catpi_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:GoodsPackagingType -->
	<xsl:template match="catpi_ru:GoodsPackaging">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(catpi_ru:PakageQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:CargoCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:CargoDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:Seal"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:PackingInformation">
					<div class="title marg-top">Сведения об упаковке товаров. Код, Количество. Маркировка</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Код вида упаковки товаров в соответствии с  классификатором видов груза, упаковки и упаковочных материалов.</td>
									<td class="graphMain bordered">Количество упаковок.</td>
									<td class="graphMain bordered">Маркировка грузовых мест</td>
								</tr>
							</tr>
							<xsl:for-each select="catpi_ru:PackingInformation">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа RUOrganizationNameAddrType -->
	<xsl:template match="catpi_ru:Manufacturer" mode="table">
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="not(RUScat_ru:OrganizationName)"><xsl:value-of select="RUScat_ru:ShortName"/></xsl:if>
		<xsl:if test="RUScat_ru:RFOrganizationFeatures or RUScat_ru:RKOrganizationFeatures or RUScat_ru:RBOrganizationFeatures or RUScat_ru:RAOrganizationFeatures or RUScat_ru:KGOrganizationFeatures">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Address">
			<xsl:text>, адрес: </xsl:text>
			<xsl:value-of select="RUScat_ru:Address"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:PackingInformationType -->
	<xsl:template match="catpi_ru:PackingInformation">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:PackingCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:PakingQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:PackingMark"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:CountryPortInfoType -->
	<xsl:template match="catpi_ru:DangerPort| catpi_ru:Ports">
		<xsl:value-of select="catpi_ru:CountryCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="catpi_ru:PortName"/>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:SanitaryQuarantineType -->
	<xsl:template match="catpi_ru:SanitaryQuarantine">
		<xsl:if test="catpi_ru:DocPermit">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Cвидетельство о государственной регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catpi_ru:DocPermit"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:OriginPlace">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Место производства / выращивания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catpi_ru:OriginPlace"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:GoodsPurpose">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Назначение товаров</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:GoodsPurpose">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:GoodsScope">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Область применения товаров</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:GoodsScope">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:FoodGoods">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Характеристика пищевых продуктов</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:FoodGoods">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:PromGoods">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Характеристика промышленных товаров</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:PromGoods">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:DateSeaDecl">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата морской медико-санитарной декларации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catpi_ru:DateSeaDecl"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:Producer">
			<div class="marg-top"><i>Изготовитель</i></div>
			<xsl:apply-templates select="catpi_ru:Producer"/>
		</xsl:if>
		<xsl:if test="catpi_ru:Ports">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%"><div class="marg-top"><i>Порты захода</i></div></td>
					<td class="value graphMain" style="width:50%">
					<xsl:for-each select="catpi_ru:Ports">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:DangerPort or catpi_ru:DangerDate">
			<div class="marg-top"><i>Информация о заходе судна на зараженную территорию</i></div>
		</xsl:if>
		<xsl:if test="catpi_ru:DangerPort">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Порты захода (на зараженной территории)</td>
					<td class="value graphMain" style="width:50%">
					<xsl:for-each select="catpi_ru:DangerPort">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:DangerDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата захода судна на зараженную территорию</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catpi_ru:DangerDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<br/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:30%">Признак наличия действующего Свидетельства об освобождении судна от санитарного контроля / Свидетельства о прохождении судном санитарного контроля</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:Immunity='true' or catpi_ru:Immunity='1'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак достаточности и эффективности проведенных экипажем мер по устранению ранее выявленных и указанных в свидетельстве рисков в области санитарно-эпидемиологического благополучия</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:Effect='true' or catpi_ru:Effect='1' or catpi_ru:Effect='t'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак необходимости размещения на санитарном причале (рейде)</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:Raid='true' or catpi_ru:Raid='1'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:30%">Признак принятия решения о разрешении свободной практики в порту в отношении пассажиров и членов экипажа</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:FreePass='true' or catpi_ru:FreePass='1'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак противоэпидемической готовности транспортных средств (наличие противоэпидемического имущества)</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:Equipment='true' or catpi_ru:Equipment='1'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак достаточности инсектицидных препаратов и средств индивидуальной защиты</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:insecticide='true' or catpi_ru:insecticide='1'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:30%">Признак подготовки членов экипажей судов по вопросам профилактики и проведения противоэпидемических мероприятий</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:Prevention='true' or catpi_ru:Prevention='1'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак защиты водного судна от проникновения и распространения насекомых – переносчиков возбудителей инфекционных болезней</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:Insects='true' or catpi_ru:Insects='1'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак проведения профилактической дезинсекции судна и по эпидемиологическим показаниям</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:Disinfestation='true' or catpi_ru:Disinfestation='1'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:30%">Признак наличия сертификата дезинсекции с последействием</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:DisinfestationSert='true' or catpi_ru:DisinfestationSert='1'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак необходимости повторной инспекции</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190"><tr><td class="graphMain bordered" align="center">
						<xsl:choose>
							<xsl:when test="catpi_ru:RepeatInspection='true' or catpi_ru:RepeatInspection='1'">V</xsl:when>
							<xsl:otherwise><br/></xsl:otherwise>
						</xsl:choose>
					</td></tr></table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%"/>
				<td class="annot graphMain" style="width:2%"/>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:VeterinaryType -->
	<xsl:template match="catpi_ru:Veterinary">
		<xsl:if test="catpi_ru:DocPermit">
			<xsl:variable name="row" select="count(catpi_ru:DocPermit)"/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%" rowspan="{$row}">Разрешение на ввоз</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="catpi_ru:DocPermit[position()=1]"/>
					</td>
				</tr>
				<tr>
					<td class="graphMain value" style="width:50%">		
						<xsl:for-each select="catpi_ru:DocPermit[position() &gt; 1]">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:Marking">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о маркировке</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:Marking">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:VeterinaryAdd">
			<div class="marg-top"><i>Ветеринарный сопроводительный документ</i></div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование документа</td>
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Дата документа</td>
						<td class="graphMain bordered">Код вида документа</td>
						<td class="graphMain bordered">Срок действия документа</td>
						<td class="graphMain bordered">Вес нетто по документу</td>
						<td class="graphMain bordered">Вес брутто по документу</td>
						<td class="graphMain bordered">Кол-во товара  в ДЕИ</td>
						<td class="graphMain bordered">ФОИВ, выдавший документ</td>
					</tr>
					<xsl:for-each select="catpi_ru:VeterinaryAdd">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:Manufacturer">
			<xsl:for-each select="catpi_ru:Manufacturer">
				<div class="marg-top"><i>Производитель/Переработчик № <xsl:value-of select="position()"/></i></div>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catpi_ru:VeterinaryInfo">
			<div class="marg-top"><i>Сведения о лекарственном препарате, субстанции, добавке, корме</i></div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование документа</td>
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Дата документа</td>
						<td class="graphMain bordered">Срок действия документа</td>
						<td class="graphMain bordered">Торговое наименование</td>
						<td class="graphMain bordered">Учетная серия добавки</td>
						<td class="graphMain bordered">Производитель</td>
					</tr>
					<xsl:for-each select="catpi_ru:VeterinaryInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsTypee -->
	<xsl:template match="catpi_ru:Producer| catpi_ru:Manufacturer">
		<table class="w190">
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName"> (</xsl:if>
						<xsl:value-of select="cat_ru:ShortName"/>
						<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName">)</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="catpi_ru:ManufacturerKind">
				<tr>
					<td class="annot graphMain" style="width:50%">Тип предприятия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="catpi_ru:ManufacturerKind=0">бойня</xsl:when>
							<xsl:when test="catpi_ru:ManufacturerKind=1">холодильник</xsl:when>
							<xsl:when test="catpi_ru:ManufacturerKind=2">перерабатывающее предприятие</xsl:when>
							<xsl:when test="catpi_ru:ManufacturerKind=3">производитель</xsl:when>
							<xsl:when test="catpi_ru:ManufacturerKind=9">иное</xsl:when>
							<xsl:otherwise><xsl:value-of select="catpi_ru:ManufacturerKind"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="catpi_ru:ManufacturerInfo">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание предприятия</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="catpi_ru:ManufacturerInfo"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="catpi_ru:ManufacturerNum">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="catpi_ru:ManufacturerNum"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryA2Code">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:CountryA2Code"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
				<tr>
					<td class="annot graphMain" style="width:50%">Организационно-правовая форма, в которой зарегистрирован хозяйствующий субъект</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
						<xsl:if test="RUScat_ru:BusinessEntityTypeName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:UITN">
				<tr>
					<td class="annot graphMain" style="width:50%">Таможенный номер, присвоенный юридическому или физическому лицу</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="RUScat_ru:UITN"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:PersonId">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:PersonId"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о документе, удостоверяющем личность физического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="RUScat_ru:IdentityCard"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<tr>
						<td class="annot graphMain" style="width:50%"><xsl:if test="position()=1">Адрес</xsl:if> </td>
						<td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</xsl:if>
		</table>	
		<br/>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:DocPermitType -->
	<xsl:template match="catpi_ru:VeterinaryAdd">
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
				<xsl:value-of select="catpi_ru:PresentedDocumentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catpi_ru:ExpiredDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(catpi_ru:NetWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(catpi_ru:GrossWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:GoodsMeasureQuantity">
					<xsl:apply-templates select="catpi_ru:GoodsMeasureQuantity"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:CodeFOIV">(<xsl:value-of select="catpi_ru:CodeFOIV"/>)	</xsl:if>
				<xsl:value-of select="catpi_ru:FOIVName"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:VeterinaryInfoType -->
	<xsl:template match="catpi_ru:VeterinaryInfo">
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
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catpi_ru:ExpiredDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:Description"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:Series"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:Manufacturer">
					<xsl:apply-templates select="catpi_ru:Manufacturer" mode="table"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="catpi_ru:ForeignDoc|catpi_ru:DangerDoc|catpi_ru:HeavyweightDoc|catpi_ru:OversizedDoc|catpi_ru:RusPermitDoc">
		<xsl:if test="cat_ru:PrDocumentName">
			<!--table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование </td>
					<td class="value graphMain" style="width:50%"-->
						<xsl:value-of select="cat_ru:PrDocumentName"/>
					<!--/td>
				</tr>
			</table-->
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<!--table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер </td>
					<td class="value graphMain" style="width:50%"-->
					<xsl:text> № </xsl:text>
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
					<!--/td>
				</tr>
			</table-->
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<!--table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата </td>
					<td class="value graphMain" style="width:50%"-->
						<xsl:text> от </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					<!--/td>
				</tr>
			</table-->
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:TransControlType -->
	<xsl:template match="piaut:TransControl">
		<tr>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:ForeignDoc">
					<xsl:apply-templates select="catpi_ru:ForeignDoc"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="catpi_ru:ForeignKind=1">
						<xsl:text>двустороннее</xsl:text>
					</xsl:when>
					<xsl:when test="catpi_ru:ForeignKind=2">
						<xsl:text>транзитное</xsl:text>
					</xsl:when>
					<xsl:when test="catpi_ru:ForeignKind=3">
						<xsl:text>в/из третьих стран</xsl:text>
					</xsl:when>
					<xsl:when test="catpi_ru:ForeignKind=9">
						<xsl:text>иное</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="catpi_ru:ForeignKind"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:DangerDoc">
					<xsl:apply-templates select="catpi_ru:DangerDoc"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:OversizedDoc">
					<xsl:apply-templates select="catpi_ru:OversizedDoc"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:HeavyweightDoc">
					<xsl:apply-templates select="catpi_ru:HeavyweightDoc"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:RusPermitDoc">
					<xsl:apply-templates select="catpi_ru:RusPermitDoc"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text>код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<xsl:text>серия </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>				
		<xsl:if test="cat_ru:IdentityCardNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName or RUScat_ru:IssuerCode">выдан </xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or RUScat_ru:IssuerCode">
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName"><xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId"> выдан <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
