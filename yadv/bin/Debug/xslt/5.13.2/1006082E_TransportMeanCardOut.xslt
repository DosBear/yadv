<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="TMCout cat_ru catESAD_ru" version="1.0" xmlns:TMCout="urn:customs.ru:Information:CustomsDocuments:TransportMeanCardOut:5.12.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 1.5 от 26.11.2008.   -->
   <!-- Для  xmlns=urn:customs.ru:Information:CustomsDocuments:TransportMeanCardOut:4.7.0  -->
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
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
   <xsl:template match="TMCout:TransportMeanCardOut">
      <html>
         <head>
            <title>Карточка транспортного средства - внешний формат</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: {210*$k}mm;
							height: {297*$k}mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid 1pt #000000;
							}
						
						div.goods {
							background: #ffffff;
							}
							
						.bordered {
							border: solid 1pt #000000;
							padding-top:4pt;
							padding-bottom:4pt;
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.underlined {
							border-bottom: solid 0.8pt #000000;
							}
							
						p.NumberDate {
							font-weight: bold;
							}
							
						.graph {
							font-family: Arial;
							font-size: 9pt;
							}
						.graphColumn {
							font-family: Arial;
							font-size: 6.5pt;
							}
							
						td {
							font-family:Courier;
							}
		
						.graphMain {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.graphNum {
							font-family: Arial;
							font-size: 7pt;
							font-weight: bold;
							}
							
						.graphNo {
							font-size: 7pt;
							font-weight: bold;
							}
					</style>
         </head>
         <body>
            <div class="page">
               <h3>КАРТОЧКА ТРАНСПОРТНОГО СРЕДСТВА </h3>
               <br/>
               <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Владелец транспортного средства</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:OwnerModeCode"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="TMCout:TransportOwner/catESAD_ru:OwnerModeCode='Ф'">
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Lastname"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:FirstName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Patronymicname"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:IdentityCard/catESAD_ru:IdentityCardName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:IdentityCard/catESAD_ru:IdentityCardSeries"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:IdentityCard/catESAD_ru:IdentityCardNumber"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:IdentityCard/catESAD_ru:IdentityCardDate"/>
                              </xsl:call-template>
                              <!--xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:IdentityCard/catESAD_ru:IdentityCardDate"/-->
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:IdentityCard/catESAD_ru:OrganizationName"/>
                              <br/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address/cat_ru:PostalCode">
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address/cat_ru:PostalCode"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address/cat_ru:CountryCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address/cat_ru:CounryName">
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address/cat_ru:CounryName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address/cat_ru:Region">
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address/cat_ru:Region"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address/cat_ru:City">
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address/cat_ru:City"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address/cat_ru:StreetHouse"/>
                           </xsl:if>
                           <xsl:if test="TMCout:TransportOwner/catESAD_ru:OwnerModeCode='Ю'">
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:OrganizationName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:ShortName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:OGRN">
                                 <span class="graph"> № </span>
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:OGRN"/>
                              </xsl:if>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="(TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:RFOrganizationFeatures/cat_ru:INN) or (TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:RFOrganizationFeatures/cat_ru:KPP)">
                                 <br/>
                                 <span class="graph">№ </span>
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                 <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                    <xsl:text> / </xsl:text>
                                    <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                 </xsl:if>
                              </xsl:if>
                              <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:OKPO">
                                 <span class="graph"> ОКПO  </span>
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:OKPO"/>
                              </xsl:if>
                              <br/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address/cat_ru:PostalCode">
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address/cat_ru:PostalCode"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address/cat_ru:CountryCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address/cat_ru:CounryName">
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address/cat_ru:CounryName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address/cat_ru:Region">
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address/cat_ru:Region"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:if test="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address/cat_ru:City">
                                 <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address/cat_ru:City"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:value-of select="TMCout:TransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address/cat_ru:StreetHouse"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Изготовитель транспортного средства</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:TransportManufacturer/catESAD_ru:TransportManufacturerCode"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:TransportManufacturer/catESAD_ru:TransportManufacturerName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:TransportManufacturer/catESAD_ru:ManufacturerCountryCode"/>
                           <br/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="TMCout:TransportManufacturer/catESAD_ru:Address/cat_ru:PostalCode">
                              <xsl:value-of select="TMCout:TransportManufacturer/catESAD_ru:Address/cat_ru:PostalCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:if>
                           <xsl:value-of select="TMCout:TransportManufacturer/catESAD_ru:Address/cat_ru:CountryCode"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="TMCout:TransportManufacturer/catESAD_ru:Address/cat_ru:CounryName">
                              <xsl:value-of select="TMCout:TransportManufacturer/catESAD_ru:Address/cat_ru:CounryName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:if>
                           <xsl:if test="TMCout:TransportManufacturer/catESAD_ru:Address/cat_ru:Region">
                              <xsl:value-of select="TMCout:TransportManufacturer/catESAD_ru:Address/cat_ru:Region"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:if>
                           <xsl:if test="TMCout:TransportManufacturer/catESAD_ru:Address/cat_ru:City">
                              <xsl:value-of select="TMCout:TransportManufacturer/catESAD_ru:Address/cat_ru:City"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:if>
                           <xsl:value-of select="TMCout:TransportManufacturer/catESAD_ru:Address/cat_ru:StreetHouse"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Учетный номер карточки</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:CardNumber/cat_ru:CustomsCode"/>
                           <xsl:text> / </xsl:text>
                           <xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="TMCout:CardNumber/cat_ru:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text> / </xsl:text>
                           <xsl:value-of select="TMCout:CardNumber/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Идентификационный номер ТС (VIN)</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="TMCout:ESADTransportMeanCard/cat_ru:VINID">
                              <xsl:value-of select="TMCout:ESADTransportMeanCard/cat_ru:VINID"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Признак ТС, шасси ТС</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:TMSign"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Номер товара по ДТ</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:GoodsNumeric"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Код товара по ТН ВЭД ЕАЭС</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:GoodsTNVEDCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Марка ТС (код, наименование)</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/cat_ru:MarkCode"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/cat_ru:Mark"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Модель ТС</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/cat_ru:Model"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Код типа ТС</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="TMCout:ESADTransportMeanCard/catESAD_ru:TransportMeansTypeCode">
                              <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:TransportMeansTypeCode"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Код категории</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:TransportCategoryCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Количество мест, включая место водителя</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:SeatsQuantity"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Год изготовления</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/cat_ru:OfftakeYear"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Модель двигателя</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:EngineModel"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Номер двигателя</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/cat_ru:EngineID"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Номер коробки передач</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:GearboxID"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Номер(а) моста(ов)</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:for-each select="TMCout:ESADTransportMeanCard/catESAD_ru:AxleID">
                              <xsl:value-of select="."/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Номер шасси (рамы)</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/cat_ru:ChassisID"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Номер кузова (прицепа)</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/cat_ru:BodyID"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Код цвета</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:ColorCode"/>
                        </td>
                     </tr>
                     <xsl:if test="(TMCout:ESADTransportMeanCard/catESAD_ru:TMSign = 'Ш') or (TMCout:ESADTransportMeanCard/catESAD_ru:TMSign = 'А')">
                        <xsl:if test="TMCout:ESADTransportMeanCard/catESAD_ru:ColorCode = 905">
                           <tr>
                              <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <span class="graph">Список кодов цветов</span>
                              </td>
                              <td>
                                 <table style="border:solid 0.8pt #000000;">
                                    <tbody>
                                       <xsl:for-each select="TMCout:ESADTransportMeanCard/catESAD_ru:ColorListElement">
                                          <tr>
                                             <td class="graph" style="width:100mm;border:none;">
                                                <xsl:value-of select="."/>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                        </xsl:if>
                     </xsl:if>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Мощность двигателя в л.с.</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:EnginePowerHpQuanity"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Мощность двигателя в кВт</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:EnginePowerKvtQuanity"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Рабочий объем двигателя вкуб. см</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/cat_ru:EngineVolumeQuanity"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Код типа двигателя</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:EngineModeCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Код вида движителя</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:MoverModeCodeType"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Экологический класс</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:Ekoclass"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Разрешенная максимальная масса в кг</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="TMCout:ESADTransportMeanCard/catESAD_ru:MaxWeightQuantity">
                              <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:MaxWeightQuantity"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Масса без нагрузки в кг</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="TMCout:ESADTransportMeanCard/catESAD_ru:MinWeightQuantity">
                              <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:MinWeightQuantity"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Максимальная конструктивная скорость</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:MaximumConstructiveVelocity"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Ширина, мм</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:Widthmm"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Высота, мм</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:Heightmm"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Длина, мм</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:Lengthmm"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Номер Одобрения типа ТС/ Заключения</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:ApprovalNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Дата Одобрения типа ТС/ Заключения</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="TMCout:ESADTransportMeanCard/catESAD_ru:ApprovalDate"/>
                           </xsl:call-template>
                           <!--xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:ApprovalDate"/-->
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Организация,выдавшая заключение</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:ApprovalOrganization"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">К моменту выдачи паспорта отработано/пройдено моточасов/километров</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/catESAD_ru:PassedKilometerQuantity"/>
                        </td>
                     </tr>
                     <tr>
                        <!--td style="width:90mm;border:solid 0.8pt #000000;" class="graph">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<span class="graph">Номер таможеной декларации</span>
								</td-->
                        <!--td style="width:90mm;border:solid 0.8pt #000000;" class="graph">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="TMCout:GTDNumber/cat_ru:CustomsCode"/>
									<xsl:text> / </xsl:text>
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="TMCout:GTDNumber/cat_ru:RegistrationDate"/>
									</xsl:call-template>
									<xsl:value-of select="TMCout:GTDNumber/catESAD_ru:RegistrationDate"/>
									<xsl:text> / </xsl:text>
									<xsl:value-of select="TMCout:GTDNumber/cat_ru:GTDNumber"/>
								</td-->
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Наименование,номер и дата документа (ТД, ТПО, иной документ)</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="TMCout:Document/cat_ru:PrDocumentName">
                              <xsl:value-of select="TMCout:Document/cat_ru:PrDocumentName"/>
                           </xsl:if>
                           <xsl:if test="TMCout:Document/cat_ru:PrDocumentNumber">
                              <xsl:text> № </xsl:text>
                              <xsl:value-of select="TMCout:Document/cat_ru:PrDocumentNumber"/>
                           </xsl:if>
                           <xsl:if test="TMCout:Document/cat_ru:PrDocumentDate">
                              <xsl:text> от </xsl:text>
                              <xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn" select="TMCout:Document/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">Идентификационный номер устройства или системы вызова экстренных оперативных служб, которыми оборудовано транспортное средство</span>
                        </td>
                        <td class="graph" style="width:90mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="TMCout:ESADTransportMeanCard/cat_ru:EmergencyDeviceID"/>
                        </td>
                     </tr>
                     <!--tr>
								<td style="width:90mm;border:solid 0.8pt #000000;" class="graph">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<span class="graph">Номер заявления</span>
								</td>
								<td style="width:90mm;border:solid 0.8pt #000000;" class="graph">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="TMCout:ApplicationNumber/cat_ru:CustomsCode"/>
									<xsl:text> / </xsl:text>
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="TMCout:ApplicationNumber/cat_ru:RegistrationDate"/>
									</xsl:call-template>
									<xsl:text> / </xsl:text>
									<xsl:value-of select="TMCout:ApplicationNumber/cat_ru:GTDNumber"/>
								</td>
							</tr-->
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
