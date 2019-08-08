<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gode="urn:customs.ru:Information:CustomsDocuments:GoodsDeclaration:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="sub_time">
      <xsl:param name="timeLn"/>
      <xsl:choose>
         <xsl:when test="substring($timeLn,11, 1)='Z' ">
            <xsl:value-of select="substring($timeLn, 1, 8)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$timeLn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="ddmmyy">
      <xsl:param name="reg"/>
      <xsl:choose>
         <xsl:when test="substring($reg,5,1)='-' ">
            <xsl:value-of select="substring($reg,9,2)"/>
            <xsl:value-of select="substring($reg,6,2)"/>
            <xsl:value-of select="substring($reg,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$reg"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="gode:GoodsDeclaration">
      <html>
         <head>
            <title>Данные декларации на товары</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
						.page {
							width: 210mm;
							/*height: 297mm;*/
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding: 10mm;
							padding-left: 20mm;
							background: #ffffff;
							border: solid 1pt #000000;
						}
						
						.page1 {
							width: 297mm;
							/*height: 297mm;*/
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding: 10mm;
							padding-left: 20mm;
							background: #ffffff;
							border: solid 1pt #000000;
						}
						
						.space {
							width: 30px;
						}
						
						.spec_column {
							border-bottom: 0px; 
							border-left:0px; 
							border-right:0px; 
							font-size: 10pt;
						}
						
						.header {
							font-weight: bold;
						}
						
						.docs td {
							padding:5px
						}
						
						.goods tr td {
							vertical-align: top;
							padding: 5px;
						}
                   </style>
         </head>
         <body>
            <div class="page">
               <h2 align="center">Данные декларации на товары</h2>
               <span>Регистрационный номер</span>
               <span style="width:30px"/>
               <span>
                  <xsl:value-of select="gode:GTDID/cat_ru:CustomsCode"/>/
						<xsl:call-template name="ddmmyy">
                     <xsl:with-param name="reg" select="gode:GTDID/cat_ru:RegistrationDate"/>
                  </xsl:call-template>/
						<xsl:value-of select="gode:GTDID/cat_ru:GTDNumber"/>
               </span>
               <!-- Грузополучатель -->
               <p class="header">Грузополучатель</p>
               <xsl:apply-templates select="gode:Consignee"/>
               <!-- Грузоотправитель -->
               <p class="header">Грузоотправитель</p>
               <xsl:apply-templates select="gode:Consigner"/>
               <!-- Таможенный орган убытия -->
               <p class="header">Таможенный орган убытия</p>
               <xsl:apply-templates select="gode:Customs"/>
               <!-- Станция отправления -->
               <p class="header">Станция отправления</p>
               <xsl:apply-templates select="gode:DepartureStation"/>
               <!-- Станция назначения -->
               <p class="header">Станция назначения</p>
               <xsl:apply-templates select="gode:DestinationStation"/>
               <xsl:if test="gode:BorderStation">
                  <!-- Пограничная станция -->
                  <p class="header">Пограничная станция</p>
                  <xsl:apply-templates select="gode:BorderStation"/>
               </xsl:if>
            </div>
            <div class="page1">
               <!-- Сведения о товаре -->
               <p class="header">Сведения о товаре</p>
               <table border="1" style="border-collapse: collapse; width: 100%">
                  <tbody class="goods">
                     <tr>
                        <td width="10%">Наименование</td>
                        <xsl:if test="gode:GoodsList/gode:GoodsTNVEDCode">
                           <td width="3%">Код товара по ТН ВЭД ЕАЭС</td>
                        </xsl:if>
                        <xsl:if test="gode:GoodsList/gode:GrossWeightQuantity">
                           <td width="3%">Вес товара, брутто (кг)</td>
                        </xsl:if>
                        <xsl:if test="gode:GoodsList/gode:SupplementaryQuantity">
                           <td width="3%">Количество товара в дополнительной единице измерения</td>
                           <xsl:if test="gode:GoodsList/gode:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
                              <td width="3%">Условное обозначение дополнительной единицы измерения</td>
                           </xsl:if>
                           <xsl:if test="gode:GoodsList/gode:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
                              <td width="3%">Код единицы измерения (ТН ВЭД ЕАЭС)</td>
                           </xsl:if>
                        </xsl:if>
						<!--Упаковка, поддоны -->
                        <xsl:if test="gode:GoodsList/gode:GoodsPackaging">
                           <xsl:if test="gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PakageQuantity">
                              <td width="5%">Общее количество грузовых мест, занятых товаром</td>
                           </xsl:if>
                           <xsl:if test="gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PakagePartQuantity">
                              <td width="5%">Количество грузовых мест, частично занятых товаром</td>
                           </xsl:if>
                           <xsl:if test="gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0']">
                              <td width="3%">Код вида упаковки товаров</td>
                              <td width="3%">Количество упаковок</td>
                           </xsl:if>
                           <xsl:if test="gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
                              <td width="3%">Количество поддонов</td>
                              <td width="10%">Описание поддонов</td>
                              <td width="3%">Код вида поддона</td>
                           </xsl:if>
                           <xsl:if test="gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
                              <td width="3%">Код вида индивидуальной упаковки товаров</td>
                              <td width="5%">Количество индивидуальных упаковок</td>
                           </xsl:if>
                           <xsl:if test="gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='2']">
                              <td width="3%">Код вида упаковки товаров (при перевозе без упаковки)</td>
                              <td width="5%">Количество упаковок (при перевозке без упаковки)</td>
                           </xsl:if>
                        </xsl:if>
                        <xsl:if test="gode:GoodsList/gode:Container">
                           <xsl:if test="gode:GoodsList/gode:Container/catESAD_cu:ContainerQuantity">
                              <td width="5%">Количество контейнеров</td>
                           </xsl:if>
                           <xsl:if test="gode:GoodsList/gode:Container/catESAD_cu:ContainerKind">
                              <td width="3%">Тип контейнера</td>
                           </xsl:if>
                           <td width="100px">Номер контейнера (заполненность)</td>
                        </xsl:if>
                     </tr>
                     <xsl:for-each select="gode:GoodsList">
						 <xsl:apply-templates select="."/>
					 </xsl:for-each>	 
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="gode:Consigner | gode:Consignee">
      <div>
         <table style="margin-top:-15px" width="100%">
            <tbody>
               <xsl:if test="cat_ru:OrganizationName">
                  <tr>
                     <td width="55%">Наименование организации / ФИО физического лица</td>
                     <td>
                        <xsl:value-of select="cat_ru:OrganizationName"/>
                     </td>
                  </tr>
               </xsl:if>
               <xsl:if test="cat_ru:ShortName">
                  <tr>
                     <td>Краткое наименование организации</td>
                     <td>
                        <xsl:value-of select="cat_ru:ShortName"/>
                     </td>
                  </tr>
               </xsl:if>
               <xsl:if test="cat_ru:OrganizationLanguage">
                  <tr>
                     <td>Код языка для заполнения наименования </td>
                     <td>
                        <xsl:value-of select="cat_ru:OrganizationLanguage"/>
                     </td>
                  </tr>
               </xsl:if>
               <xsl:choose>
                  <xsl:when test="cat_ru:RFOrganizationFeatures">
                     <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
                  </xsl:when>
                  <xsl:when test="cat_ru:RKOrganizationFeatures">
                     <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:if test="gode:Code">
                  <tr>
                     <td>Код грузоотправителя</td>
                     <td>
                        <xsl:value-of select="gode:Code"/>
                     </td>
                  </tr>
               </xsl:if>
               <xsl:if test="gode:Address">
                  <tr>
                     <td colspan="2">
                        <b>Адрес</b>
                     </td>
                  </tr>
                  <xsl:if test="gode:Address/cat_ru:PostalCode">
                     <tr>
                        <td>Почтовый индекс</td>
                        <td>
                           <xsl:value-of select="gode:Address/cat_ru:PostalCode"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="gode:Address/cat_ru:CountryCode">
                     <tr>
                        <td>Код страны</td>
                        <td>
                           <xsl:value-of select="gode:Address/cat_ru:CountryCode"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="gode:Address/cat_ru:CounryName">
                     <tr>
                        <td>Краткое название страны</td>
                        <td>
                           <xsl:value-of select="gode:Address/cat_ru:CounryName"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="gode:Address/cat_ru:Region">
                     <tr>
                        <td>Область</td>
                        <td>
                           <xsl:value-of select="gode:Address/cat_ru:Region"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="gode:Address/cat_ru:City">
                     <tr>
                        <td>Населенный пункт</td>
                        <td>
                           <xsl:value-of select="gode:Address/cat_ru:City"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="gode:Address/cat_ru:StreetHouse">
                     <tr>
                        <td>Улица, номер дома, номер офиса</td>
                        <td>
                           <xsl:value-of select="gode:Address/cat_ru:StreetHouse"/>
                        </td>
                     </tr>
                  </xsl:if>
               </xsl:if>
            </tbody>
         </table>
      </div>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <tr>
            <td>БИН</td>
            <td>
               <xsl:value-of select="cat_ru:BIN"/>
            </td>
         </tr>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <tr>
            <td>ИИН</td>
            <td>
               <xsl:value-of select="cat_ru:IIN/cat_ru:CategoryCode"/>
					/<xsl:value-of select="cat_ru:IIN/cat_ru:KATOCode"/>
					/<xsl:value-of select="cat_ru:IIN/cat_ru:RNN"/>
               <xsl:if test="cat_ru:IIN/cat_ru:ITNReserv">
						/<xsl:value-of select="cat_ru:IIN/cat_ru:ITNReserv"/>
               </xsl:if>
            </td>
         </tr>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <tr>
            <td>УНП</td>
            <td>
               <xsl:value-of select="cat_ru:UNP"/>
            </td>
         </tr>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <tr>
            <td>Идентификационный номер физического лица</td>
            <td>
               <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
            </td>
         </tr>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <tr>
            <td>ОГРН/ОГРНИП</td>
            <td>
               <xsl:value-of select="cat_ru:OGRN"/>
            </td>
         </tr>
      </xsl:if>
      <xsl:if test="cat_ru:OGRN">
         <tr>
            <td>ИНН</td>
            <td>
               <xsl:value-of select="cat_ru:INN"/>
            </td>
         </tr>
      </xsl:if>
      <xsl:if test="cat_ru:OGRN">
         <tr>
            <td>КПП</td>
            <td>
               <xsl:value-of select="cat_ru:KPP"/>
            </td>
         </tr>
      </xsl:if>
   </xsl:template>
   <xsl:template match="gode:DepartureStation | gode:DestinationStation | gode:BorderStation">
      <table style="margin-top:-15px" width="100%">
         <tbody>
            <tr>
               <td width="55%">Наименование станции</td>
               <td>
                  <xsl:value-of select="gode:RailwayStationName"/>
               </td>
            </tr>
            <tr>
               <td>Код станции</td>
               <td>
                  <xsl:value-of select="gode:RailwayStationCode"/>
               </td>
            </tr>
            <xsl:if test="gode:RailwayCode">
               <tr>
                  <td>Код железной дороги</td>
                  <td>
                     <xsl:value-of select="gode:RailwayCode"/>
                  </td>
               </tr>
            </xsl:if>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="gode:Customs">
      <table style="margin-top:-15px" width="100%">
         <tbody>
            <xsl:if test="cat_ru:OfficeName">
               <tr>
                  <td>Наименование таможенного органа</td>
                  <td>
                     <xsl:value-of select="cat_ru:OfficeName"/>
                  </td>
               </tr>
            </xsl:if>
            <tr>
               <td width="55%">Код таможенного органа</td>
               <td>
                  <xsl:value-of select="cat_ru:Code"/>
               </td>
            </tr>
            <xsl:if test="cat_ru:CustomsCountryCode">
               <tr>
                  <td>Код государства</td>
                  <td>
                     <xsl:value-of select="cat_ru:CustomsCountryCode"/>
                  </td>
               </tr>
            </xsl:if>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="gode:GoodsList">
      <tr>
         <td>
            <xsl:for-each select="gode:GoodsDescription">
               <xsl:value-of select="."/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </xsl:for-each>
         </td>
         <xsl:if test="../gode:GoodsList/gode:GoodsTNVEDCode">
            <td>
               <xsl:value-of select="gode:GoodsTNVEDCode"/>
            </td>
         </xsl:if>
         <xsl:if test="../gode:GoodsList/gode:GrossWeightQuantity">
            <td>
               <xsl:value-of select="gode:GrossWeightQuantity"/>
            </td>
         </xsl:if>
         <xsl:if test="../gode:GoodsList/gode:SupplementaryQuantity">
            <td>
               <xsl:value-of select="gode:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
            </td>
            <xsl:if test="../gode:GoodsList/gode:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
               <td>
                  <xsl:value-of select="gode:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
               </td>
            </xsl:if>
            <xsl:if test="../gode:GoodsList/gode:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
               <td>
                  <xsl:value-of select="gode:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
               </td>
            </xsl:if>
         </xsl:if>
         <xsl:if test="../gode:GoodsList/gode:GoodsPackaging">
            <xsl:if test="../gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PakageQuantity">
               <td>
                  <xsl:value-of select="gode:GoodsPackaging/catESAD_cu:PakageQuantity"/>
               </td>
            </xsl:if>
            <xsl:if test="../gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PakagePartQuantity">
               <td>
                  <xsl:value-of select="gode:GoodsPackaging/catESAD_cu:PakagePartQuantity"/>
               </td>
            </xsl:if>
            <xsl:if test="../gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0']">
				<td colspan="2">
					<table width="100%" border="1" style="border:0; border-collapse:collapse; margin: -5px;">
						<tbody>
							<xsl:for-each select="gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0']">
								<tr>
									<td width="50%"><xsl:value-of select="catESAD_cu:PalleteCode"/></td>
									<td width="50%"><xsl:value-of select="catESAD_cu:PalleteQuantity"/></td>
								</tr>	
							</xsl:for-each>
						</tbody>
					</table>
				</td>
			</xsl:if>
            <xsl:if test="../gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
				<td colspan="3">
					<table width="100%" border="1" style="border:0; border-collapse:collapse; margin: -5px;">
						<tbody>
							<xsl:for-each select="gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
								<tr>
									<td width="35%"><xsl:value-of select="catESAD_cu:PalleteQuantity"/></td>
									<td width="45%"><xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/></td>
									<td width="20%"><xsl:value-of select="catESAD_cu:PalleteCode"/></td>
								</tr>	
							</xsl:for-each>
						</tbody>
					</table>
				</td>
			</xsl:if>
            <xsl:if test="../gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
				<td colspan="2">
					<table width="100%" border="1" style="border:0; border-collapse:collapse; margin: -5px;">
						<tbody>
							<xsl:for-each select="gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
								<tr>
									<td width="50%"><xsl:value-of select="catESAD_cu:PalleteCode"/></td>
									<td width="50%"><xsl:value-of select="catESAD_cu:PalleteQuantity"/></td>
								</tr>	
							</xsl:for-each>
						</tbody>
					</table>
				</td>
			</xsl:if>
            <xsl:if test="../gode:GoodsList/gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='2']">
				<td colspan="2">
					<table width="100%" border="1" style="border:0; border-collapse:collapse; margin: -5px;">
						<tbody>
							<xsl:for-each select="gode:GoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='2']">
								<tr>
									<td width="37.5%"><xsl:value-of select="catESAD_cu:PalleteCode"/></td>
									<td width="62.5%"><xsl:value-of select="catESAD_cu:PalleteQuantity"/></td>
								</tr>	
							</xsl:for-each>
						</tbody>
					</table>
				</td>
			</xsl:if>
         </xsl:if>
         <xsl:if test="../gode:GoodsList/gode:Container">
            <xsl:if test="../gode:GoodsList/gode:Container/catESAD_cu:ContainerQuantity">
               <td>
                  <xsl:value-of select="gode:Container/catESAD_cu:ContainerQuantity"/>
               </td>
            </xsl:if>
            <xsl:if test="../gode:GoodsList/gode:Container/catESAD_cu:ContainerKind">
               <td>
                  <xsl:value-of select="gode:Container/catESAD_cu:ContainerKind"/>
               </td>
            </xsl:if>
            <td>
               <xsl:for-each select="gode:Container/catESAD_cu:ContainerNumber">
                  <xsl:value-of select="catESAD_cu:ContainerIdentificaror"/>
                  <xsl:choose>
                     <xsl:when test="catESAD_cu:FullIndicator = 1">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								(весь контейнер)
							</xsl:when>
                     <xsl:when test="catESAD_cu:FullIndicator = 2">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								(часть контейнера)
							</xsl:when>
                  </xsl:choose>
                  <br/>
                  <br/>
               </xsl:for-each>
            </td>
         </xsl:if>
      </tr>
   </xsl:template>
</xsl:stylesheet>
