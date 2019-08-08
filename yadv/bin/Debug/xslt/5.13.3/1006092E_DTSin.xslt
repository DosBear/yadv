<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="DTSin cat_ru catESAD_ru cat_EDTS_ru" version="1.0" xmlns:DTSin="urn:customs.ru:Information:CustomsDocuments:DTSin:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_EDTS_cu="urn:customs.ru:CUESADDTSCommonAggregateTypes:5.12.0" xmlns:cat_EDTS_ru="urn:customs.ru:RUESADDTSCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 1.6 от 01.07.2008   -->
   <!-- Для  xmlns=urn:customs.ru:Information:CustomsDocuments:DTSin:4.7.0  -->
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
   <xsl:template name="gtd_date">
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
   <xsl:template match="DTSin:DTSin">
      <html>
         <head>
            <title>Декларация таможенной стоимости</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: 210mm;
							height: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	20mm;
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
							border-bottom: solid 0.5pt #000000;
							}
							
						p.NumberDate {
							font-weight: bold;
							}
							
						.graph {
							font-family: Arial;
							font-size: 7pt;
							}
							
						.graphBold {
							font-family: Arial;
							font-size: 7pt;
							font-weight: bold;
							}
							
						td {
							font-family:Courier;
							}
		
						.graphMain {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.graphNo {
							font-size: 10pt;
							font-weight: bold;
							}
					</style>
         </head>
         <body>
            <xsl:choose>
               <xsl:when test="DTSin:FormDTS=1">
                  <div class="page">
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" rowspan="2" style="width:100mm;">РОССИЙСКАЯ ФЕДЕРАЦИЯ</td>
                              <td align="right" class="graphNo" style="width:80mm;">ДЕКЛАРАЦИЯ ТАМОЖЕННОЙ СТОИМОСТИ</td>
                           </tr>
                           <tr>
                              <td align="right" class="graph" style="width:80mm;">Форма ДТС-1</td>
                           </tr>
                        </tbody>
                     </table>
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">1 </span>
                                 <span class="graph">Продавец (поставщик)</span>
                                 <br/>
                                 <xsl:value-of select="DTSin:DTSinSeller/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinSeller/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                    </xsl:if>
                                 </xsl:if>
                              </td>
                              <td class="graph" rowspan="3" style="width:80mm;border-left:solid 2pt #000000;border-top:solid 1.5pt #000000;border-right:solid 0.5pt #000000;border-bottom:solid 1.5pt #000000;" valign="top">
                                 <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                 <!--меняла-->
                                 <br/>
                                 <span class="graph">Окончательное решение: </span>
                                 <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DecisionCode"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:LNP"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                 </xsl:call-template>
                                 <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                 <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                    <br/>
                                    <span class="graph">Промежуточное решение: </span>
                                    <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:Term"/>
                                    </xsl:call-template>
												xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:Term"/
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                    </xsl:call-template>
												xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/
											</xsl:if>
                                 <xsl:if test="DTSin:CancelingDecision">
                                    <br/>
                                    <span class="graph">Решение об аннулировании или отзыве ДТС: </span>
                                    <xsl:value-of select="DTSin:CancelingDecision/cat_EDTS_ru:DecisionCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CancelingDecision/cat_EDTS_ru:LNP"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:CancelingDecision/cat_EDTS_ru:DateInf"/>
                                    </xsl:call-template>
												xsl:value-of select="DTSin:CancelingDecision/cat_EDTS_ru:DateInf"/
											</xsl:if>
                                 <xsl:if test="DTSin:DTSinOfficialMark">
                                    <br/>
                                    <span class="graph">Служебные отметки: </span>
                                    <xsl:for-each select="DTSin:DTSinOfficialMark">
										<xsl:value-of select="cat_EDTS_ru:MarkIdentifier"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="DTSin:RecordSerialNumber"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:MarkDescription"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:LNP"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:call-template name="russian_date">
										   <xsl:with-param name="dateIn" select="cat_EDTS_ru:DateInf"/>
										</xsl:call-template>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:TimeInf"/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
                                    </xsl:for-each>
                                 </xsl:if>--&gt;
										</td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(а) Покупатель (получатель)</span>
                                 <br/>
                                 <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                    </xsl:if>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(б) Декларант</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;">
                                 <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinDeclarant/catESAD_сu:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                    </xsl:if>
                                 </xsl:if>
                                 <xsl:value-of select="DTSin:DTSinDeclarant/DTSin:DocumentRegNumber"/>
                              </td>
                              <td class="graph" style="width:80mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">3 </span>
                                 <span class="graph">Условия поставки</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DeliveryTerms">
                                    <xsl:value-of select="cat_ru:DeliveryTermsStringCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:for-each select="cat_ru:DeliveryPlace">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:for-each>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphBold" rowspan="2" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
                                 <xsl:text>ВАЖНАЯ ИНФОРМАЦИЯ</xsl:text>
                                 <br/>
                                 <xsl:text>В соответствии со статьей 84 Таможенного </xsl:text>
                                 <br/>
                                 <xsl:text>кодекса ЕАЭС  декларант либо </xsl:text>
                                 <br/>
                                 <xsl:text>таможенный представитель несет</xsl:text>
                                 <br/>
                                 <xsl:text>ответственность за указание в декларации</xsl:text>
                                 <br/>
                                 <xsl:text>таможенной стоимости недостоверных</xsl:text>
                                 <br/>
                                 <xsl:text>сведений</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">4 </span>
                                 <span class="graph">Номер и дата счета (счетов)</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiveDocuments">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    <br/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:80mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">5 </span>
                                 <span class="graph">Номер и дата контракта</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiveDocuments">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    <br/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">6 </span>
                                 <span class="graph">Номер и дата документа с принятыми таможенными органами решениями, применимыми к графам 7-9</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiveDocuments">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    <br/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                                    <tbody>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <span class="graphNo">7 </span>
                                             <span class="graph">(а) Имеется ли ВЗАИМОСВЯЗЬ между продавцом и покупателем в значении, указанном в п.1 ст.3 Соглашения об определении  таможенной стоимости товаров, перемещаемых через</span>
                                          </td>
                                          <td class="graph" colspan="4" style="width:40mm;" valign="top">
                                             <table cellpadding="0" cellspacing="0" style="width:100%;">
                                                <tbody>
                                                   <tr>
                                                      <td align="center" class="graph" style="width:30mm;border-left:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;" valign="top">
                                                         <span class="graphBold">Верное отметить</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                                         <span class="graphBold">х</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border-bottom:solid 0.5pt #000000;">
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </td>
                                                   </tr>
                                                </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">таможенную границу Таможенного союза? &lt;*&gt; - В случае ответа НЕТ, далее к графе 8</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A)=1) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A)=0) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) Оказала ли взаимосвязь между продавцом и покупателем влияние на цену ввозимого товара</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B)=1) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B)=0) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(в) Стоимость сделки с ввозимыми товарами близка к одной из возможных проверочных величин, указанных в п.4</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">ст. 4 Соглашения об определении таможенной стоимости товаров, перемещаемых через таможенную границу Таможенного союза? В случае ответа ДА, указываются подробности
</span>
                                          </td>
                                          <!--<td style="width:5mm;border:solid 1.5pt #000000;" class="graph" align="center" valign="middle">
															<xsl:choose>
																<xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C)=1) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C='t')">
																	<span class="graphBold">х</span>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td style="width:15mm;" class="graph">
															<span class="graph">ДА</span>
														</td>-->
                                          <!--<td style="width:5mm;border:solid 1.5pt #000000;" class="graph" align="center" valign="middle">
															<xsl:choose>
																<xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C)=0) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C='f')">
																	<span class="graphBold">х</span>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td style="width:15mm;" class="graph">
															<span class="graph">НЕТ</span>
														</td>-->
                                       </tr>
                                       <!--<tr>
														<td style="width:140mm;" class="graph" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">В случае ответа ДА, указываются подробности</span>
															<br/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:for-each select="DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7CDescription">
																<xsl:value-of select="."/>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:for-each>
														</td>
														<td style="width:5mm;" class="graph" align="center" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td style="width:15mm;" class="graph">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td style="width:5mm;" class="graph" align="center" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td style="width:15mm;" class="graph">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>-->
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <span class="graphNo">8 </span>
                                             <span class="graph">(а) Имеются ли ОГРАНИЧЕНИЯ в отношении прав покупателя на пользование и распоряжение товарами, за исключением ограничений, которые:</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">- установлены федеральными законами, указами и распоряжениями Президента Российской Федерации, постановлениями и распоряжениями Правительства Российской Федерации, а также нормативными правовыми актами федеральных органов исполнительной власти;</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">- ограничивают географический регион, в котором товары могут быть перепроданы;</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">- существенно не влияют на стоимость товаров.</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8A)=1) or (DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8A='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8A)=0) or (DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8A='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) Зависит ли продажа товаров или их цена от соблюдения УСЛОВИЙ или ОБЯЗАТЕЛЬСТВ, влияние которых на стоимость оцениваемых товаров не может быть количественно определено?</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">Указывается вид и содержание, а также расчет стоимостной оценки таких условий или обязательств</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8B)=1) or (DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8B='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8B)=0) or (DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8B='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <xsl:if test="DTSin:DTSSellingLimitation/cat_EDTS_cu:limitationDescription">
                                          <tr>
                                             <td class="graph" style="width:140mm;" valign="top">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="DTSin:DTSSellingLimitation/cat_EDTS_cu:limitationDescription"/>
                                             </td>
                                             <td align="center" class="graph" style="width:5mm;" valign="middle">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graph" style="width:15mm;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td align="center" class="graph" style="width:5mm;" valign="middle">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graph" style="width:15mm;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                          </tr>
                                       </xsl:if>
                                       <tr>
                                          <td class="graph" colspan="5" style="width:180mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">Если влияние таких условий или обязательств на стоимость товаров может быть количественно определено, сумма указывается в графе 11б</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <span class="graphNo">9 </span>
                                             <span class="graph">(а) Предусмотрены ли ПЛАТЕЖИ за использование объектов ИНТЕЛЛЕКТУАЛЬНОЙ СОБСТВЕННОСТИ (за исключением платежей за право воспроизведения (тиражирования) ввозимых товаров на таможенной территории Таможенного союза), которые относятся к оцениваемым товарам и которые покупатель прямо или косвенно </span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">должен уплатить в качестве условия продажи таких товаров?</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9A)=1) or (DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9A='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9A)=0) or (DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9A='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) Зависит ли продажа от соблюдения условия, в соответствии с которым часть дохода или выручки от последующей продажи, распоряжения иным способом или использования товаров покупателем не причитается</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">прямо или косвенно продавцу?</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9B)=1) or (DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9B='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9B)=0) or (DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9B='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" colspan="5" style="width:180mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">В результате ответа ДА на подпункт (а) и/или (б): указываются условия и в графах 15 и 16 приводятся соответствующие суммы.</span>
                                             <xsl:if test="DTSin:DTSAdditionalPayments/cat_EDTS_cu:PaymentDescription">
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="DTSin:DTSAdditionalPayments/cat_EDTS_cu:PaymentDescription"/>
                                             </xsl:if>
                                             <xsl:if test="DTSin:DTSAdditionalPayments/cat_EDTS_cu:PaymentConditionDescription">
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:for-each select="DTSin:DTSAdditionalPayments/cat_EDTS_cu:PaymentConditionDescription">
                                                   <xsl:value-of select="."/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:for-each>
                                             </xsl:if>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphBold" rowspan="2" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
                                 <xsl:text>&lt;*&gt; ЛИЦА ЯВЛЯЮТСЯ ВЗАИМОСВЯЗАННЫМИ, ЕСЛИ ОТВЕЧАЮТ ХОТЯ БЫ ОДНОМУ ИЗ СЛЕДУЮЩИХ УСЛОВИЙ</xsl:text>
                                 <br/>
                                 <xsl:text>(а) являются сотрудниками или директорами (руководителями) предприятий друг друга;</xsl:text>
                                 <br/>
                                 <xsl:text>(б) являются юридически признанными деловыми партнерами, т.е. связаны договорными отношениями, действуют в целях извлечения прибыли и совместно несут расходы и убытки, связанные с осуществлением совместной деятельности;</xsl:text>
                                 <br/>
                                 <xsl:text>(в) являются работодателем и работником, служащим;</xsl:text>
                                 <br/>
                                 <xsl:text>(г) какое-либо лицо прямо или косвенно владеет, контролирует или является│   держателем пяти или более процентов выпущенных в обращение голосующих акций обоих из них;</xsl:text>
                                 <br/>
                                 <xsl:text>(д) одно из них прямо или косвенно контролирует другое;</xsl:text>
                                 <br/>
                                 <xsl:text>(е) вместе они прямо или косвенно контролируют третье лицо;</xsl:text>
                                 <br/>
                                 <xsl:text>(ж) вместе они прямо или косвенно контролируют третье лицо;</xsl:text>
                                 <br/>
                                 <xsl:text>(з) являются родственниками или членами одной семьи.</xsl:text>
                                 <br/>
                                 <xsl:text>Факт взаимосвязи сам по себе не должен являться основанием для признания стоимости сделки неприемлимой для целей определения таможенной стоимости товаров (п.3 ст.4 Соглашения об определении таможенной стоимости товаров, перемещаемых через таможенную границу Таможенного союза).</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">10 </span>
                                 <span class="graph">(а) Число дополнительных листов</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:AdditionalSheetNumber"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:80mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">10 </span>
                                 <span class="graph">(б) Место, дата, подпись, печать</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/cat_EDTS_cu:FilledDate"/>
                                 </xsl:call-template>
                                 <!--xsl:value-of select="DTSin:DTSinFilledPerson/cat_EDTS_ru:FilledDate"/-->
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard">
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:OrganizationName"/>
                                 </xsl:if>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:Contact/cat_ru:Phone"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/DTSin:LNP"/>
                                 <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument">
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName">
                                       <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:AuthoritesDocument/cat_ru:PrDocumentDate"/-->
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:AuthoritesDocument/catESAD_ru:CompletionAuthorityDate"/-->
                                 </xsl:if>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <xsl:variable name="DTS" select="current()"/>
                  <xsl:for-each select="DTSin:DTSinGoodsCustomsCost">
                     <div class="page">
                        <table cellpadding="0" cellspacing="0" style="width:100%;">
                           <tbody>
                              <tr>
                                 <td align="right" class="graph" style="width:145mm;">
                                    <span class="graph">Форма ДТС-1</span>
                                 </td>
                                 <td align="right" class="graph" style="width:35mm;">
                                    <span class="graph">Лист №  </span>
                                    <xsl:value-of select="DTSin:SheetNumber"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="right" class="graph" style="width:145mm;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td align="right" class="graph" style="width:35mm;">
                                    <span class="graph">Метод 1</span>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                        <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                           <tbody>
                              <tr>
                                 <td class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                    <br/>
                                    <span class="graph">Окончательное решение: </span>
                                    <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DecisionCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:LNP"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                                    <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                       <br/>
                                       <span class="graph">Промежуточное решение: </span>
                                       <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                                    </xsl:if>
                                    <xsl:if test="DTSin:GoodsCancelingDecision">
                                       <br/>
                                       <span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
                                       <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DecisionCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:Term"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:Term"/-->
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DateInf"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/-->
                                    </xsl:if>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">Товар № </span>
                                    <xsl:if test="DTSin:GTDGoodsNumber">
                                       <xsl:value-of select="DTSin:GTDGoodsNumber"/>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">Код ТН ВЭД</span>
                                    <br/>
                                    <xsl:value-of select="DTSin:GoodsTNVEDCode"/>
                                    <xsl:value-of select="DTSin:GoodsAddTNVEDCode"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" rowspan="4" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">А. Основа для расчета</span>
                                 </td>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">11 </span>
                                    <span class="graph">(а) Цена, фактически уплаченная или подлежащая уплате за товары в ВАЛЮТЕ СЧЕТА </span>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyCode"/>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">в РУБЛЯХ</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyRate"/>
											)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) Косвенные платежи в РУБЛЯХ - см. графу 8 (б)</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyRate"/>
											)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">12 </span>
                                    <span class="graph">Итого А в рублях</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" rowspan="12" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">Б. ДОПОЛНИ- ТЕЛЬНЫЕ НАЧИСЛЕНИЯ: расходы в национальной валюте, которые не включены в А &lt;*&gt;</span>
                                 </td>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">13 </span>
                                    <span class="graph">Расходы, произведенные покупателем на:</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(а) вознаграждения агенту (посреднику), за исключением вознаграждений за оказание услуг, связанных с покупкой товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:AgentBonus"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) тару и упаковку</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:PackageExpenses"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">14 </span>
                                    <span class="graph">Соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных покупателем бесплатно или сниженной цене для использования в связи с  производством и продажей на экспорт в Российскую Федерацию оцениваемых товаров, в размере, не включенном в цену, фактически уплаченную или подлежащую уплате:</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(а) сырья, материалов и комплектующих, которые являются составной частью ввозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:StoreCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве ввозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:ProductionToolkitCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(в) материалов, израсходованных при производстве ввозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:WorkingStockCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(г) проектирования, разработки, инженерной конструкторской работы, художественного оформления, дизайна, эскизов и чертежей, выполненных вне таможенной территории Таможенного союза и необходимых для производства ввозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:DesignPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">15 </span>
                                    <span class="graph">Платежи за использование объектов интеллектуальной собственности - см. графу 9 (а)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:IntellectualPropertyPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">16 </span>
                                    <span class="graph">Часть дохода, полученного в результате последующей продажи, распоряжения иным способом или использования товаров, которая прямо или косвенно причитается продавцу - см. графу 9 (б)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:SellerIncome"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">17 </span>
                                    <span class="graph">Расходы по перевозке (транспортировке) товаров до 
											<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderPlace"/>
											 (место прибытия на таможенную территорию Таможенного союза)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderTransportCharges"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">18 </span>
                                    <span class="graph">Расходы по погрузке, выгрузке/перегрузке товаров и операциям, связанным с перевозкой до 
											<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:ArrivalPlace"/>
											(место прибытия на таможенную территорию Таможенного союза)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:LoadCharges"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">19 </span>
                                    <span class="graph">Расходы на страхование в связи с международной перевозкой товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:InsuranceCharges"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">20 </span>
                                    <span class="graph">Итого Б в национальной валюте</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:TotalAdditionalSum"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" rowspan="4" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">В. ВЫЧЕТЫ: расходы в национальной валюте, которые включены в А&lt;*&gt;</span>
                                 </td>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">21 </span>
                                    <span class="graph">Расходы на строительство, возведение, сборку, монтаж, обслуживание, или оказание технического содействия, производимые после ввоза товаров на таможенную территорию таможенного союза</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:BuildingAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">22 </span>
                                    <span class="graph">Расходы по перевозке (транспортировке) товаров после их прибытия на таможенную территорию Таможенного союза</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">23 </span>
                                    <span class="graph">Пошлины, налоги и сборы, взимаемые в Российской Федерации</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">24 </span>
                                    <span class="graph">Итого В в рублях</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">25 </span>
                                    <span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (А + Б - В)</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(а) в НАЦИОНАЛЬНОЙ ВАЛЮТЕ</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:NationalDeclaredCustomsCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
											<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
											)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DollarDeclaredCustomsCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="3" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                                       <tbody>
                                          <tr>
                                             <td class="graph" colspan="3" style="width:180mm;" valign="top">
                                                <xsl:text>&lt;*&gt; Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td class="graph" style="width:80mm;" valign="top">
                                                <span class="graph">Номер товара и позиции</span>
                                             </td>
                                             <td class="graph" style="width:40mm;" valign="top">
                                                <span class="graph">Код валюты, сумма</span>
                                             </td>
                                             <td class="graph" style="width:40mm;" valign="top">
                                                <span class="graph">Курс пересчета</span>
                                             </td>
                                          </tr>
                                          <xsl:for-each select="DTSin:DTSinCurrencyPayment">
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <xsl:choose>
                                                      <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                         <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </xsl:otherwise>
                                                   </xsl:choose>
                                                </td>
                                             </tr>
                                          </xsl:for-each>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">Дополнительные данные</span>
                                    <!--<xsl:if test="DTSin:AdditionalData">
													<br/>
													<span class="graphNo">11 </span>-->
                                    <!--<xsl:for-each select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_ru:IndirectAdditionalInformation">
														<xsl:value-of select="."/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:for-each>-->
                                    <!--</xsl:if>-->
                                    <xsl:if test="cat_EDTS_ru:AdditionalData">
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:for-each select="DTSin:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                          <xsl:value-of select="."/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:for-each>
                                    </xsl:if>
                                 </td>
                                 <td class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">Подпись, печать</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </xsl:for-each>
               </xsl:when>
               <xsl:when test="DTSin:FormDTS=2">
                  <div class="page">
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" rowspan="2" style="width:100mm;">РОССИЙСКАЯ ФЕДЕРАЦИЯ</td>
                              <td align="right" class="graphNo" style="width:80mm;">ДЕКЛАРАЦИЯ ТАМОЖЕННОЙ СТОИМОСТИ</td>
                           </tr>
                           <tr>
                              <td align="right" class="graph" style="width:80mm;">Форма ДТС-2</td>
                           </tr>
                        </tbody>
                     </table>
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">1 </span>
                                 <span class="graph">Продавец (поставщик)</span>
                                 <br/>
                                 <xsl:value-of select="DTSin:DTSinSeller/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinSeller/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                    </xsl:if>
                                 </xsl:if>
                              </td>
                              <td class="graph" rowspan="3" style="width:80mm;border-left:solid 2pt #000000;border-top:solid 1.5pt #000000;border-right:solid 0.5pt #000000;border-bottom:solid 1.5pt #000000;" valign="top">
                                 <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                 <br/>
                                 <span class="graph">Окончательное решение: </span>
                                 <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DecisionCode"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:LNP"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                 </xsl:call-template>
                                 <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                                 <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                    <br/>
                                    <span class="graph">Промежуточное решение: </span>
                                    <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:Term"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:Term"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                                 </xsl:if>
                                 <xsl:if test="DTSin:CancelingDecision">
                                    <br/>
                                    <span class="graph">Решение об аннулировании или отзыве ДТС: </span>
                                    <xsl:value-of select="DTSin:CancelingDecision/cat_EDTS_ru:DecisionCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CancelingDecision/cat_EDTS_ru:LNP"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:CancelingDecision/cat_EDTS_ru:DateInf"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:CancelingDecision/DTSin:DateInf"/-->
                                 </xsl:if>
                                 <xsl:if test="DTSin:DTSinOfficialMark">
                                    <br/>
                                    <span class="graph">Служебные отметки: </span>
                                    <!--меняла -->
									<xsl:for-each select="DTSin:DTSinOfficialMark">
										<xsl:value-of select="cat_EDTS_ru:MarkIdentifier"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="DTSin:RecordSerialNumber"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:MarkDescription"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:LNP"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:call-template name="russian_date">
										   <xsl:with-param name="dateIn" select="cat_EDTS_ru:DateInf"/>
										</xsl:call-template>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:TimeInf"/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
                                    </xsl:for-each>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(а) Покупатель (получатель)</span>
                                 <br/>
                                 <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                    </xsl:if>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(б) Декларант</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;">
                                 <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                       <xsl:text> </xsl:text>
                                    </xsl:if>
                                 </xsl:if>
                                 <xsl:value-of select="DTSin:DTSinDeclarant/DTSin:DocumentRegNumber"/>
                              </td>
                              <td class="graph" style="width:80mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">3 </span>
                                 <span class="graph">Условия поставки</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DeliveryTerms">
                                    <xsl:value-of select="cat_ru:DeliveryTermsStringCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:for-each select="cat_ru:DeliveryPlace">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:for-each>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphBold" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
                                 <xsl:text>ВАЖНАЯ ИНФОРМАЦИЯ</xsl:text>
                                 <!-- меняла-->
                                 <br/>
                                 <xsl:text>В соответствии со статьей 84 Таможенного</xsl:text>
                                 <br/>
                                 <xsl:text>кодекса ЕАЭС, декларант либо</xsl:text>
                                 <br/>
                                 <xsl:text>таможенный представитель несет</xsl:text>
                                 <br/>
                                 <xsl:text>ответственность за указание в декларации </xsl:text>
                                 <br/>
                                 <xsl:text>таможенной стоимости недостоверных</xsl:text>
                                 <br/>
                                 <xsl:text>сведений.</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">4 </span>
                                 <span class="graph">Вид, номер и дата документа, являющегося основанием для поставки товара</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiceDocuments">
                                    <!-- меняла-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    <br/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">5 </span>
                                 <span class="graph">Номер и дата документа с принятыми таможенными органами решениями по ранее ввезенным товарам по документу, указанному в графе 4</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiceDocuments">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    <br/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                                    <tbody>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <span class="graphNo">6 </span>
                                             <span class="graph">Таможенная стоимость декларируемых товаров определяется по методу</span>
                                          </td>
                                          <td class="graph" colspan="3" style="width:50mm;" valign="top">
                                             <table cellpadding="0" cellspacing="0" style="width:100%;">
                                                <tbody>
                                                   <tr>
                                                      <td align="center" class="graph" style="width:40mm;border-left:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;" valign="top">
                                                         <span class="graphBold">Верное отметить</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                                         <span class="graphBold">х</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border-bottom:solid 0.5pt #000000;">
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </td>
                                                   </tr>
                                                </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(а) по стоимости сделки с идентичными товарами (метод  2)</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSin:CustomsCostMethodCode=2) or (DTSin:BaseMethodCode=2)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) по стоимости сделки с однородными товарами (метод 3)</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSin:CustomsCostMethodCode=3) or (DTSin:BaseMethodCode=3)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(в) по методу вычитания (метод  4)</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSin:CustomsCostMethodCode=4) or (DTSin:BaseMethodCode=4)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(г) по методу сложения (метод 5)
 </span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSin:CustomsCostMethodCode=5) or (DTSin:BaseMethodCode=5)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(д)&lt;*&gt; по резервному методу (метод 6) </span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="((DTSin:CustomsCostMethodCode=6) and not(DTSin:BaseMethodCode=1))">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <!--<tr>
														<td style="width:130mm;" class="graph" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">если таможенная стоимость определяется по резервному методу на основе иного метода,</span>
															<br/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">одновременно отмечаются оба метода</span>
														</td>
														<td style="width:22.5mm;" class="graph">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td style="width:5mm;" class="graph" align="center" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td style="width:22.5mm;" class="graph">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>-->
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(е) по резервному методу (метод 6) на основе метода по стоимости сделки с ввозимыми товарами (метод 1)
</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="((DTSin:CustomsCostMethodCode='6') and (DTSin:BaseMethodCode='1'))">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(ж) различным (если для разных товаров используются различные методы)
</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSin:CustomsCostMethodCode='*')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">7 </span>
                                 <span class="graph">Причины, по которым предшествующие методы определения таможенной стоимости не применимы</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:ReasonApplyMethod/cat_EDTS_cu:ReasonDescription">
                                    <xsl:value-of select="."/>
                                    <xsl:text> </xsl:text>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">8 </span>
                                 <span class="graph">Наименование и реквизиты основных документов, представленных в подтверждение приводимых сведений</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiceDocuments">
                                    <!-- меняла-->
                                    <xsl:if test="cat_EDTS_cu:PositionNumber=8">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       <br/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" rowspan="2" style="width:100mm;border:solid 0.5pt #000000;">
                                 <xsl:text>&lt;*&gt; В КАЧЕСТВЕ ОСНОВЫ ДЛЯ ОПРЕДЕЛЕНИЯ ТАМОЖЕННОЙ СТОИМОСТИ</xsl:text>
                                 <br/>
                                 <xsl:text> ТОВАРОВ ПО МЕТОДУ 6 В СООТВЕТСТВИИ СО СТАТЬЕЙ 10 СОГЛАШЕНИЯ </xsl:text>
                                 <br/>
                                 <xsl:text>ОБ ОПРЕДЕЛЕНИИ ТАМОЖЕННОЙ СТОИМОСТИ ТОВАРОВ, ПЕРЕМЕЩАЕМЫХ </xsl:text>
                                 <br/>
                                 <xsl:text>ЧЕРЕЗ ТАМОЖЕННУЮ ГРАНИЦУТАМОЖЕННОГО СОЮЗА, ОТ 25.01.2008 НЕ </xsl:text>
                                 <br/>
                                 <xsl:text> МОГУТ БЫТЬ ИСПОЛЬЗОВАНЫ:</xsl:text>
                                 <br/>
                                 <xsl:text>- цены на товары на внутреннем рынке Таможенного Союза, произведенные на</xsl:text>
                                 <br/>
                                 <xsl:text>таможенной территории Таможенного Союза;</xsl:text>
                                 <br/>
                                 <xsl:text>- системы, предусматривающие принятие для таможенных целей более высокой</xsl:text>
                                 <br/>
                                 <xsl:text> из двух альтернативных стоимостей;</xsl:text>
                                 <br/>
                                 <xsl:text>- цена на товары на внутреннем рынке страны вывоза;</xsl:text>
                                 <br/>
                                 <xsl:text>- иные расходы, нежели расходы, включенные в  расчетную стоимость, которая</xsl:text>
                                 <br/>
                                 <xsl:text> была определена для идентичных или однородных товаров;</xsl:text>
                                 <br/>
                                 <xsl:text>- цены товаров, поставляемых из страны их вывоза в третьи страны;</xsl:text>
                                 <br/>
                                 <xsl:text>- минимальная таможенная стоимость;</xsl:text>
                                 <br/>
                                 <xsl:text>- произвольная или фиктивная стоимость.</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">9 </span>
                                 <span class="graph">Число дополнительных листов</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:AdditionalSheetNumber"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:80mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">10 </span>
                                 <span class="graph">Место, дата, подпись, печать</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/cat_EDTS_cu:FilledDate"/>
                                 </xsl:call-template>
                                 <!--xsl:value-of select="DTSin:DTSinFilledPerson/cat_EDTS_ru:FilledDate"/-->
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard">
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:OrganizationName"/>
                                 </xsl:if>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:Contact/cat_ru:Phone"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/DTSin:LNP"/>
                                 <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument">
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName">
                                       <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:AuthoritesDocument/cat_ru:PrDocumentDate"/-->
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:AuthoritesDocument/catESAD_ru:CompletionAuthorityDate"/-->
                                 </xsl:if>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <xsl:variable name="DTS" select="current()"/>
                  <xsl:for-each select="DTSin:DTSinGoodsCustomsCost">
                     <!--<xsl:if test="($DTS/DTSin:CustomsCostMethodCode=2) or ($DTS/DTSin:CustomsCostMethodCode=3) or ($DTS/DTSin:CustomsCostMethodCode=6 and (($DTS/DTSin:BaseMethodCode=2) or ($DTS/DTSin:BaseMethodCode=3))) or (($DTS/DTSin:CustomsCostMethodCode='*') and ((cat_EDTS_ru:MethodNumberCode=2) or (cat_EDTS_ru:MethodNumberCode=3) or (cat_EDTS_ru:MethodNumberCode=6 and ((cat_EDTS_ru:BaseMethodNumberCode=2) or (cat_EDTS_ru:BaseMethodNumberCode=3)))))">-->
                     <xsl:if test="($DTS/DTSin:CustomsCostMethodCode=2) or ($DTS/DTSin:CustomsCostMethodCode=3) or ($DTS/DTSin:CustomsCostMethodCode=6 and (($DTS/DTSin:BaseMethodCode=2) or ($DTS/DTSin:BaseMethodCode=3)))">
                        <div class="page">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <span class="graph">Форма ДТС-2</span>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Лист № </span>
                                       <xsl:value-of select="DTSin:SheetNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Методы 2, 3, 6</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                              <tbody>
                                 <tr>
                                    <td class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                       <br/>
                                       <span class="graph">Окончательное решение: </span>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DecisionCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                                       <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                          <br/>
                                          <span class="graph">Промежуточное решение: </span>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                                       </xsl:if>
                                       <xsl:if test="DTSin:GoodsCancelingDecision">
                                          <br/>
                                          <span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:Term"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:Term"/-->
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DateInf"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/-->
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="cat_EDTS_ru:GTDGoodsNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД ЕАЭС</span>
                                       <br/>
                                       <xsl:value-of select="DTSin:GoodsTNVEDCode"/>
                                       <xsl:value-of select="DTSin:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">А. Основа для расчета</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">11 </span>
                                       <span class="graph">Стоимость сделки с идентичными/однородными товарами в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2Basis/cat_EDTS_cu:IdenticalDealNationalAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="13" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Б. Корректировки стоимости сделки (+/-) &lt;*&gt;</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">(а) корректировка на количество (-)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusQuantityCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) корректировка на коммерческий уровень (-)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusCommerceCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(в) корректировка на разницу в расходах по перевозке (транспортировке) товаров до 
													<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusBorderPlace"/>
													 (место прибытия на таможенную единую  таможенную территорию Таможенного Союза) (-)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusBorderTransportCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(г) корректировка на разницу в расходах по погрузке, выгрузке/перегрузке товаров и операциям, связанным с перевозкой до 
														<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusArrivalPlace"/>
													  (место прибытия на таможенную единую  таможенную территорию Таможенного Союза) (-)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusLoadCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(д) корректировка на разницу в расходах на страхование в связи с операциями, указанными в графах 12в и 12г(-)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusInsuaranceCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">13 </span>
                                       <span class="graph">Итого графа 12 в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusTotalSum"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">(а) корректировка на количество (+)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusQuantityCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) корректировка на коммерческий уровень (+)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusCommerceCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(в) корректировка на разницу в расходах по перевозке (транспортировке) товаров до 
													<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusBorderPlace"/>
													 (место прибытия на таможенную единую  таможенную территорию Таможенного Союза) (+)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusBorderTransportCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(г) корректировка на разницу в расходах по погрузке, выгрузке/перегрузке товаров и операциям, связанным с перевозкой до 
													<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusArrivalPlace"/>
													 (место прибытия на таможенную единую  таможенную территорию Таможенного Союза) (+)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusLoadCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(д) корректировка на разницу в расходах на страхование в связи с операциями, указанными в графах 14в и 14г (+)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusInsuaranceCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">15 </span>
                                       <span class="graph">Итого графа 14 в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusTotalSum"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">16 </span>
                                       <span class="graph">Стоимость сделки с учетом корректировок (11-13+15) в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:TotalDealCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="2" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">17 </span>
                                       <span class="graph">Количество</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) идентичных/однородных товаров</span>
                                       <xsl:if test="(DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or (DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) декларируемых товаров</span>
                                       <xsl:if test="(DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or (DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">18 </span>
                                       <span class="graph">таможенная стоимость оцениваемых товаров (16*17б/17а) или (16)</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:NationalDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
													<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
													)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DollarDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" colspan="3" style="width:180mm;" valign="top">
                                                   <xsl:text>&lt;*&gt; Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <span class="graph">Номер товара и позиции</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Код валюты, сумма</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Курс пересчета</span>
                                                </td>
                                             </tr>
                                             <xsl:for-each select="DTSin:DTSinCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Дополнительные данные</span>
                                       <xsl:if test="DTSin:AdditionalData">
                                          <br/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:for-each select="DTSin:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Подпись, печать</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/DTSin:LNP"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </xsl:if>
                     <xsl:if test="($DTS/DTSin:CustomsCostMethodCode=4)         or (($DTS/DTSin:CustomsCostMethodCode=6) and ($DTS/DTSin:BaseMethodCode=4))">
                        <div class="page">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <span class="graph">Форма ДТС-2</span>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Лист № </span>
                                       <xsl:value-of select="DTSin:SheetNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Методы 4, 6</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                              <tbody>
                                 <tr>
                                    <td class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                       <br/>
                                       <span class="graph">Окончательное решение: </span>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DecisionCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                                       <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                          <br/>
                                          <span class="graph">Промежуточное решение: </span>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                                       </xsl:if>
                                       <xsl:if test="DTSin:GoodsCancelingDecision">
                                          <br/>
                                          <span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/DTSin:Term"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:Term"/-->
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/-->
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="DTSin:GTDGoodsNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД ЕАЭС</span>
                                       <br/>
                                       <xsl:value-of select="DTSin:GoodsTNVEDCode"/>
                                       <xsl:value-of select="DTSin:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">А. Основа для расчета</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">11 </span>
                                       <span class="graph">(а) Цена единицы оцениваемых, идентичных или однородных товаров (в национальной валюте), по которой их наибольшее совокупное количество продается лицам, не являющимся взаимосвязанными лицами с лицами, осуществляющими продажу на таможенной территории Таможенного союза</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod46/cat_EDTS_cu:Method46Basis/cat_EDTS_cu:IdenticalDealNationalPrice"/>
                                       <!-- меняла -->
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="5" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Б. Вычеты сумм, которые вошли в раздел А (в расчете на единицу товара)</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">Вознаграждения посреднику (агенту) либо надбавки к цене, обычно производимой для получения прибыли и покрытия коммерческих и управленческих расходов</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:AgentCharge"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">13 </span>
                                       <span class="graph">Расходы на перевозку (транспортировку), страхование и иные связанные с такими операциями расходы, осуществленные таможенной территории Таможенного союза</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">Таможенные пошлины, налоги, сборы, подлежащие уплате в  связи с ввозом товаров на таможенную территорию Таможенного союза или с их  продажей на территории государства - члена Таможенного союза, включая  налоги и сборы субъектов государства - члена Таможенного союза и местные налоги и сборы</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">15 </span>
                                       <span class="graph">Стоимость, добавленная в результате переработки (обработки)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:ProcessingAddedCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">16 </span>
                                       <span class="graph">Итого Б в национальной валюте (по графам с 12 по 15)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">17 </span>
                                       <span class="graph">Количество оцениваемых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">18 </span>
                                       <span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (11-16)*17</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:NationalDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
													<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
													)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DollarDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Дополнительные данные</span>
                                       <xsl:if test="DTSin:AdditionalData">
                                          <br/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:for-each select="DTSin:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Подпись, печать</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/DTSin:LNP"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </xsl:if>
                     <!--<xsl:if test="($DTS/DTSin:CustomsCostMethodCode=5) or (($DTS/DTSin:CustomsCostMethodCode='*') and
							 (cat_EDTS_ru:MethodNumberCode=5))">-->
                     <xsl:if test="($DTS/DTSin:CustomsCostMethodCode=5) or (($DTS/DTSin:CustomsCostMethodCode=6) and ($DTS/DTSin:BaseMethodCode=5))">
                        <div class="page">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <span class="graph">Форма ДТС-2</span>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Лист № </span>
                                       <xsl:value-of select="DTSin:SheetNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Методы 5, 6</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                              <tbody>
                                 <tr>
                                    <td class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                       <br/>
                                       <span class="graph">Окончательное решение: </span>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DecisionCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                                       <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                          <br/>
                                          <span class="graph">Промежуточное решение: </span>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                                       </xsl:if>
                                       <xsl:if test="DTSin:GoodsCancelingDecision">
                                          <br/>
                                          <span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/DTSin:Term"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:Term"/-->
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/-->
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="DTSin:GTDGoodsNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД ЕАЭС</span>
                                       <br/>
                                       <xsl:value-of select="DTSin:GoodsTNVEDCode"/>
                                       <xsl:value-of select="DTSin:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="11" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">А. Основа для расчета&lt;*&gt;</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">11 </span>
                                       <span class="graph">Расходы производителя по изготовлению/приобретению материалов и расходы на производство, а также на иные операции, связанные с производством ввозимых товаров, в том числе:</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ProductionStoreExpense"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">а) расходы на тару и упаковку</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:PackageExpenses"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">б) расходы на проектирование, разработку, инженерную, конструкторскую работу, художественное оформление, дизайн, эскизы и чертежи, выполненные на таможенной территории Таможенного союза и необходимые для производства оцениваемых товаров в пределах, оплаченных производителем</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:DesignPaymentProduction"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">Расходы, связанные с производством ввозимых товаров, в том числе</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных бесплатно или по сниженной цене для использвания в связи с производством и продажей для вывоза на таможенную территорию Таможенного союза оцениваемых товаров:</span>
                                       <!--<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(а) сырья, материалов, деталей, полуфабрикатов и тому подобных предметов, из которых состоят ввозимые товары</span>-->
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:GoodsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) сырья, материалов, деталей, полуфабрикатов и тому подобных предметов, из которых состоят ввозимые товары</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:StoreCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ProductionToolkitCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(в) материалов, израсходованных при производстве ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ConsumablesCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(г) проектирования, разработки, инженерной, конструктивной работы, художественного оформления, дизайна, эскизов и чертежей, выполненных вне  таможенной территории Таможенного Союза и необходимых для производства ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:DesignPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">13 </span>
                                       <span class="graph">Сумма прибыли и коммерческих и управленческих расходов</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:CommerceExpense"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">Расходы по перевозке (транспортировке) товаров до 
														<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:BorderPlace"/>
													 (место прибытия на единую таможенную территорию Таможенного Союза)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:BorderTransportCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">15 </span>
                                       <span class="graph">Расходы по погрузке, выгрузке/перегрузке товаров и операциям, связанным с перевозкой до  
													<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ArrivalPlace"/>
													(место прибытия на единую таможенную территорию Таможенного Союза)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:LoadCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">16 </span>
                                       <span class="graph">Расходы на страхование в связи с операциями, указанными в графах 14 и 15</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:InsuaranceCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">17 </span>
                                       <span class="graph">ТАМОЖЕННАЯ СТОИМОСТЬ ОЦЕНИВАЕМЫХ ТОВАРОВ (итого по графам с 11 по 16)</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) в национальной валюте государства-члена Таможенного союза</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:NationalDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
													<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
													)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DollarDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" colspan="3" style="width:180mm;" valign="top">
                                                   <xsl:text>&lt;*&gt;Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <span class="graph">Номер товара и позиции</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Код валюты, сумма</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Курс пересчета</span>
                                                </td>
                                             </tr>
                                             <xsl:for-each select="DTSin:DTSinCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Дополнительные данные</span>
                                       <xsl:if test="DTSin:AdditionalData">
                                          <br/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:for-each select="DTSin:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Подпись, печать</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/DTSin:LNP"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </xsl:if>
                     <!--</xsl:if>-->
                     <!--<xsl:if test="(($DTS/DTSin:CustomsCostMethodCode=6) and ($DTS/DTSin:BaseMethodCode=4)) or (($DTS/DTSin:CustomsCostMethodCode='*') and (cat_EDTS_ru:MethodNumberCode=6) and (cat_EDTS_ru:BaseMethodNumberCode=4))">
								<div class="page">
									<table style="width:100%;" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td style="width:145mm;" class="graph" align="right">
													<span class="graph">Форма ДТС-2</span>
												</td>
												<td style="width:35mm;" class="graph" align="right">
													<span class="graph">Лист № </span>
													<xsl:value-of select="cat_EDTS_ru:SheetNumber"/>
												</td>
											</tr>
											<tr>
												<td style="width:145mm;" class="graph" align="right">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td style="width:35mm;" class="graph" align="right">
													<span class="graph">Методы 4, 6</span>
												</td>
											</tr>
										</tbody>
									</table>
									<table style="width:100%;border:solid 0.5pt #000000;" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td colspan="2" rowspan="2" style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
													<br/>
													<span class="graph">Окончательное решение: </span>
													<xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DecisionCode"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:LNP"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/>
									</xsl:call-template>
													-->
                     <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                     <!--
													<xsl:if test="DTSin:IntermediateCustomsCostDecision">
														<br/>
														<span class="graph">Промежуточное решение: </span>
														<xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
									</xsl:call-template>
														-->
                     <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                     <!--
													</xsl:if>
													<xsl:if test="DTSin:GoodsCancelingDecision">
														<br/>
														<span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
														<xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DecisionCode"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/DTSin:Term"/>
									</xsl:call-template>
														-->
                     <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:Term"/-->
                     <!--
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:LNP"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/>
									</xsl:call-template>
														-->
                     <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/-->
                     <!--
													</xsl:if>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="top">
													<span class="graph">Товар № </span>
													<xsl:value-of select="cat_EDTS_ru:SheetGoodsSerialNumber"/>
												</td>
											</tr>
											<tr>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="top">
													<span class="graph">Код ТН ВЭД ЕАЭС</span>
													<br/>
													<xsl:value-of select="cat_EDTS_ru:GoodsTNVEDCode"/>
													<xsl:value-of select="cat_EDTS_ru:GoodsAddTNVEDCode"/>
												</td>
											</tr>
											<tr>
												<td style="width:20mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">А. Основа для расчета</span>
												</td>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">11 </span>
													<span class="graph">Цена единицы оцениваемых, идентичных или однородных товаров (в РУБЛЯХ), по которой их наибольшее совокупное количество продается лицам, не являющимся взаимосвязанными лицами с лицами, осуществляющими продажу на единой теможенной территории Таможенного Союза</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:Method46Basis/cat_EDTS_ru:IdenticalDealRoublePrice"/>
												</td>
											</tr>
											<tr>
												<td rowspan="5" style="width:20mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">Б. Вычеты сумм, которые вошли в раздел А</span>
												</td>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">12 </span>
													<span class="graph">Вознаграждения агенту (посреднику) либо надбавки к цене, обычно производимой для получения прибыли и покрытия коммерческих и управленческих расходов</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:Method46Deduction/cat_EDTS_ru:AgentCharge"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">13 </span>
													<span class="graph">Расходы на перевозку (транспортировку), страхование и иные  связанные с такими операциями расходы, осуществленные на единой таможенной территории Таможенного Союза</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:Method46Deduction/cat_EDTS_ru:RussianTransportCharge"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">14 </span>
													<span class="graph">Таможенные пошлины, налоги, сборы, подлежащие уплате в связи с ввозом товаров на единую таможенную территорию Таможенного Союза или с их продажей на этой территории государства-члена Таможенного Союза, включая налоги и сборы субъектов государства-члена Таможенного Союза и местные налоги и сборы</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:Method46Deduction/cat_EDTS_ru:RussiansTaxPayment"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">15 </span>
													<span class="graph">Стоимость, добавленная в результате переработки (обработки)</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:Method46Deduction/cat_EDTS_ru:ProcessingAddedCost"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">16 </span>
													<span class="graph">Итого Б в рублях (по графам с 12 по 15)</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:Method46Deduction/cat_EDTS_ru:TotalDeductionAmount"/>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">17 </span>
													<span class="graph">Количество декларируемых товаров</span>
													<xsl:if test="(cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_EDTS_ru:MeasureUnitQualifierName) or (cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_EDTS_ru:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_EDTS_ru:MeasureUnitQualifierCode"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_EDTS_ru:MeasureUnitQualifierName"/>
														)
													</xsl:if>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod46/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_EDTS_ru:GoodsQuantity"/>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">18 </span>
													<span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (11-16) х 17</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(а) в РУБЛЯХ</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:RoubleDeclaredCustomsCost"/>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
													<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
													)</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:DollarDeclaredCustomsCost"/>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">Дополнительные данные</span>
													<xsl:if test="cat_EDTS_ru:AdditionalData">
														<br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="cat_EDTS_ru:AdditionalData/cat_EDTS_cu:PositionNumber"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:for-each select="cat_EDTS_ru:AdditionalData/cat_EDTS_cu:AdditionalInformation">
															<xsl:value-of select="."/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:for-each>
													</xsl:if>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">Подпись, печать</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/DTSin:LNP"/>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</xsl:if>-->
                     <!--<xsl:if test="(($DTS/DTSin:CustomsCostMethodCode=6) and ($DTS/DTSin:BaseMethodCode=5)) or (($DTS/DTSin:CustomsCostMethodCode='*') and (cat_EDTS_ru:MethodNumberCode=6) and (cat_EDTS_ru:BaseMethodNumberCode=5))">
								<div class="page">
									<table style="width:100%;" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td style="width:145mm;" class="graph" align="right">
													<span class="graph">Форма ДТС-2</span>
												</td>
												<td style="width:35mm;" class="graph" align="right">
													<span class="graph">Лист № </span>
													<xsl:value-of select="cat_EDTS_ru:SheetNumber"/>
												</td>
											</tr>
											<tr>
												<td style="width:145mm;" class="graph" align="right">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td style="width:35mm;" class="graph" align="right">
													<span class="graph">Методы 5, 6</span>
												</td>
											</tr>
										</tbody>
									</table>
									<table style="width:100%;border:solid 0.5pt #000000;" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td colspan="2" rowspan="2" style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
													<br/>
													<span class="graph">Окончательное решение: </span>
													<xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DecisionCode"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:LNP"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/>
									</xsl:call-template>
													-->
                     <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                     <!--
													<xsl:if test="DTSin:IntermediateCustomsCostDecision">
														<br/>
														<span class="graph">Промежуточное решение: </span>
														<xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
									</xsl:call-template>
														-->
                     <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                     <!--
													</xsl:if>
													<xsl:if test="DTSin:GoodsCancelingDecision">
														<br/>
														<span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
														<xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DecisionCode"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/DTSin:Term"/>
									</xsl:call-template>
														-->
                     <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:Term"/-->
                     <!--
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:LNP"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/>
									</xsl:call-template>
														-->
                     <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/-->
                     <!--
													</xsl:if>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="top">
													<span class="graph">Товар № </span>
													<xsl:value-of select="cat_EDTS_ru:SheetGoodsSerialNumber"/>
												</td>
											</tr>
											<tr>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="top">
													<span class="graph">Код ТН ВЭД ЕАЭС</span>
													<br/>
													<xsl:value-of select="cat_EDTS_ru:GoodsTNVEDCode"/>
													<xsl:value-of select="cat_EDTS_ru:GoodsAddTNVEDCode"/>
												</td>
											</tr>
											<tr>
												<td rowspan="11" style="width:20mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">А. Основа для расчета*</span>
												</td>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">11 </span>
													<span class="graph">Расходы по изготовлению/приобретению материалов и расходы на производство, а также на иные операции, связанные с производством ввозимых товаров</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:ProductionStoreExpense"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">12 </span>
													<span class="graph">Расходы, связанные с производством ввозимых товаров, в том числе:</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных поукпателем бесплатно или по сниженной цене для использования в связи с производством и продажей на для вывоза на единую таможенную территорию Таможенного Союза, оцениваемых товаров, в размере, не включенном в цену, фактически уплаченную или подлежащую уплате:</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(а) сырья, материалов и комплектующих, которые являются составной частью ввозимых товаров</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:StoreCost"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве ввозимых товаров</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:ProductionToolkitCost"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(в) материалов, израсходованных при производстве ввозимых товаров</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:ConsumablesCost"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(г) проектирования, разработки, инженерной, конструктивной работы, дизайна, художественного оформления, чертежей и эскизов, выполненных вне единой таможенной территории Таможенного Союза и необходимых для производства оцениваемых товаров</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:DesignPayment"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(д) стоимость проектирования, разработки, инженерной, конструктивной работы, дизайна, художественного оформления, чертежей и эскизов, выполненных на единой таможенной территории Таможенного Союза и необходимых для производства оцениваемых товаров, в пределах, оплаченных производителем</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:RussianDesignPayment"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(е) расходы на тару и упаковку</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:PackageExpense"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">13 </span>
													<span class="graph">Сумма прибыли и коммерческих и управленческих расходов</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:CommerceExpense"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">14 </span>
													<span class="graph">Расходы по перевозке (транспортировке) товаров до 
														<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:BorderPlace"/>
													 (место прибытия на единую таможенную территорию Таможенного Союза)</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:BorderTransportCharges"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">15 </span>
													<span class="graph">Расходы по погрузке, выгрузке/перегрузке товаров и операциям, связанным с перевозкой до  
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:ArrivalPlace"/>
													(место прибытия на единую таможенную территорию Таможенного Союза)</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:LoadCharges"/>
												</td>
											</tr>
											<tr>
												<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">16 </span>
													<span class="graph">Расходы на страхование в связи с международной перевозкой товаров</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:InsuaranceCharges"/>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">17 </span>
													<span class="graph">Расчетная стоимость в рублях (итого по графам с 11 по 16)</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod56/cat_EDTS_ru:Method56Basis/cat_EDTS_ru:TotalBasisSum"/>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">18 </span>
													<span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(а) в РУБЛЯХ</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:RoubleDeclaredCustomsCost"/>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
													<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
													)</span>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:DollarDeclaredCustomsCost"/>
												</td>
											</tr>
											<tr>
												<td colspan="3" style="width:180mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<table style="width:100%;" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td colspan="3" style="width:180mm;" class="graph" valign="top">
																	<xsl:text>* Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
																</td>
															</tr>
															<tr>
																<td style="width:80mm;" class="graph" valign="top">
																	<span class="graph">Номер товара и позиции</span>
																</td>
																<td style="width:40mm;" class="graph" valign="top">
																	<span class="graph">Код валюты, сумма</span>
																</td>
																<td style="width:40mm;" class="graph" valign="top">
																	<span class="graph">Курс пересчета</span>
																</td>
															</tr>
															<xsl:for-each select="cat_EDTS_ru:DTSCurrencyPayment">
																<tr>
																	<td style="width:80mm;" class="graph" valign="top">
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		<xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
																	</td>
																	<td style="width:40mm;" class="graph" valign="top">
																		<xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		<xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
																	</td>
																	<td style="width:40mm;" class="graph" valign="top">
																		<xsl:choose>
																			<xsl:when test="cat_EDTS_cu:CurrencyRate">
																				<xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																			</xsl:otherwise>
																		</xsl:choose>
																	</td>
																</tr>
															</xsl:for-each>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">Дополнительные данные</span>
													<xsl:if test="cat_EDTS_ru:AdditionalData">
														<br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="cat_EDTS_ru:AdditionalData/cat_EDTS_cu:PositionNumber"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:for-each select="cat_EDTS_ru:AdditionalData/cat_EDTS_cu:AdditionalInformation">
															<xsl:value-of select="."/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:for-each>
													</xsl:if>
												</td>
												<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">Подпись, печать</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/DTSin:LNP"/>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</xsl:if>-->
                     <!--<xsl:if test="(($DTS/DTSin:CustomsCostMethodCode=6) and (count($DTS)=count($DTS/DTSin:BaseMethodCode | $DTS))) or (($DTS/DTSin:CustomsCostMethodCode='**') and ((cat_EDTS_ru:MethodNumberCode=6) and (count(.)=count(cat_EDTS_ru:BaseMethodNumberCode | .))))">
								<div class="page">
									<table style="width:100%;" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td style="width:145mm;" class="graph" align="right">
													<span class="graph">Форма ДТС-2</span>
												</td>
												<td style="width:35mm;" class="graph" align="right">
													<span class="graph">Лист № </span>
													<xsl:value-of select="cat_EDTS_ru:SheetNumber"/>
												</td>
											</tr>
											<tr>
												<td style="width:145mm;" class="graph" align="right">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td style="width:35mm;" class="graph" align="right">
													<span class="graph">Метод 6</span>
												</td>
											</tr>
										</tbody>
									</table>
									<table style="width:100%;border:solid 0.5pt #000000;" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td colspan="2" rowspan="2" style="width:145mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
													<br/>
													<span class="graph">Окончательное решение: </span>
													<xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DecisionCode"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:LNP"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/>
									</xsl:call-template>
													-->
                     <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                     <!--
													<xsl:if test="DTSin:IntermediateCustomsCostDecision">
														<br/>
														<span class="graph">Промежуточное решение: </span>
														<xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
									</xsl:call-template>
														-->
                     <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                     <!--
													</xsl:if>
													<xsl:if test="DTSin:GoodsCancelingDecision">
														<br/>
														<span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
														<xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DecisionCode"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/DTSin:Term"/>
									</xsl:call-template>
														-->
                     <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:Term"/-->
                     <!--
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:LNP"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/>
									</xsl:call-template>
														-->
                     <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/-->
                     <!--
													</xsl:if>
												</td>
												<td style="width:35mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="top">
													<span class="graph">Товар № </span>
													<xsl:value-of select="cat_EDTS_ru:SheetGoodsSerialNumber"/>
												</td>
											</tr>
											<tr>
												<td style="width:35mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="top">
													<span class="graph">Код ТН ВЭД ЕАЭС</span>
													<br/>
													<xsl:value-of select="cat_EDTS_ru:GoodsTNVEDCode"/>
													<xsl:value-of select="cat_EDTS_ru:GoodsAddTNVEDCode"/>
												</td>
											</tr>
											<tr>
												<td rowspan="2" style="width:20mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">А. Основа для расчета</span>
												</td>
												<td style="width:125mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">11 </span>
													<span class="graph">в ВАЛЮТЕ ИСХОДНЫХ ДАННЫХ</span>
													<br/>
													
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(код вида валюты 
														<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod6/cat_EDTS_ru:CurrencyCode"/>
													)</span>
												</td>
												<td>
													<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod6/cat_EDTS_ru:ValueBasisCustAmount"/>
												</td>
											</tr>
											<tr>
												<td style="width:125mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">в РУБЛЯХ</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(курс пересчета 
														<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod6/cat_EDTS_ru:CurrencyRate"/>
													)</span>
												</td>
												<td style="width:35mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod6/cat_EDTS_ru:ValueBasisCustAmountRUR"/>
												</td>
											</tr>
											<tr>
												<td style="width:20mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graph">Б. Расчет</span>
												</td>
												<td style="width:125mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">12 </span>
													<xsl:for-each select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod6/cat_EDTS_ru:Method6Calculation/cat_EDTS_ru:CalculationDescription">
														<br/>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</td>
												<td style="width:35mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width:145mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<span class="graphNo">13 </span>
													<span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(а) в РУБЛЯХ</span>
												</td>
												<td style="width:35mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:RoubleDeclaredCustomsCost"/>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width:145mm;border:solid 0.5pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
														<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
													)</span>
												</td>
												<td style="width:35mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_EDTS_ru:DollarDeclaredCustomsCost"/>
												</td>
											</tr>
											<tr>
												<td colspan="3" style="width:180mm;" class="graph" valign="top">
													<table style="width:100%;border:solid 0pt #000000;" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td style="width:110mm;border:solid 0.5pt #000000;" class="graph" valign="top">
																	<span class="graph">Дополнительные данные</span>
																	<xsl:if test="cat_EDTS_ru:AdditionalData">
																		<br/>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		<xsl:value-of select="cat_EDTS_ru:AdditionalData/cat_EDTS_cu:PositionNumber"/>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		<xsl:for-each select="cat_EDTS_ru:AdditionalData/cat_EDTS_cu:AdditionalInformation">
																			<xsl:value-of select="."/>
																			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		</xsl:for-each>
																	</xsl:if>
																</td>
																<td style="width:70mm;border:solid 0.5pt #000000;" class="graph" valign="top">
																	<span class="graph">Подпись, печать</span>
																	<br/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>

																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/DTSin:LNP"/>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</xsl:if>-->
                     <xsl:if test="($DTS/DTSin:CustomsCostMethodCode=6) and ($DTS/DTSin:BaseMethodCode=1)">
                        <div class="page">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <span class="graph">Форма ДТС-2</span>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Лист № </span>
                                       <xsl:value-of select="DTSin:SheetNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Метод 6 на основе метода 1</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                              <tbody>
                                 <tr>
                                    <td class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                       <br/>
                                       <span class="graph">Окончательное решение: </span>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DecisionCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                                       <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                          <br/>
                                          <span class="graph">Промежуточное решение: </span>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                                       </xsl:if>
                                       <xsl:if test="DTSin:GoodsCancelingDecision">
                                          <br/>
                                          <span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:Term"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:Term"/-->
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DateInf"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/-->
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:if test="DTSin:GTDGoodsNumber">
                                          <xsl:value-of select="DTSin:GTDGoodsNumber"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД</span>
                                       <br/>
                                       <xsl:value-of select="DTSin:GoodsTNVEDCode"/>
                                       <xsl:value-of select="DTSin:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="4" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">А. Основа для расчета</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">11 </span>
                                       <span class="graph">(а) Цена, фактически уплаченная или подлежащая уплате за товары, или стоимость товаров, перемещаемых по договорам, отличным от купли-продажи (в ВАЛЮТЕ СЧЕТА) </span>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">в национальной валюте</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyRate"/>
											)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) Косвенные платежи (условия или обязательства) в национальной валюте</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyRate"/>
											)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">Итого А в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="12" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Б. ДОПОЛНИ- ТЕЛЬНЫЕ НАЧИСЛЕНИЯ: расходы в национальной валюте, которые не включены в А &lt;*&gt;</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">13 </span>
                                       <span class="graph">Расходы, произведенные покупателем на:</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) вознаграждения посреднику (агенту), брокеру, за исключением вознаграждений за закупку товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:AgentBonus"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) тару и упаковку</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:PackageExpenses"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">Соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных покупателем бесплатно или сниженной цене для использования в связи с  производством и продажей на таможенную территорию Таможенного Союза, в размере, не включенном в цену, фактически уплаченную или подлежащую уплате:</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) сырья, материалов и деталей, полуфабрикатов и тому подобных предметов, из которых состоят ввозимые товары</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:StoreCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:ProductionToolkitCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(в) материалов, израсходованных при производстве ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:WorkingStockCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(г) проектирования, разработки, инженерной, конструкторской работы, хуждожественного оформления, дизайна, эскизов и чертежей, выполненных вне таможенной территории Таможенного союза и необходимых для производства ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:DesignPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">15 </span>
                                       <span class="graph">Лицензионные и иные подобные платежи за использование объектов интеллектуальной собственности</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:IntellectualPropertyPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">16 </span>
                                       <span class="graph">Часть дохода (выручки), полученного в результате последующей продажи, распоряжения иным способом или использования товаров, которая прямо или косвенно причитается продавцу</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:SellerIncome"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">17 </span>
                                       <span class="graph">Расходы по перевозке (транспортировке) товаров до 
											<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderPlace"/>
											 (место прибытия на таможенную территорию Таможенного союза)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderTransportCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">18 </span>
                                       <span class="graph">Расходы по погрузке, разгрузке/перегрузке товаров и иным операциям, связанным с перевозкой до 
											<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:ArrivalPlace"/>
											(место прибытия на таможенную территорию Таможенного союза)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:LoadCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">19 </span>
                                       <span class="graph">Расходы на страхование в связи с операциями, указанными в графах 17 и 18</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:InsuranceCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">20 </span>
                                       <span class="graph">Итого Б в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:TotalAdditionalSum"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="4" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">В. ВЫЧЕТЫ: расходы в национальной валюте, которые включены в А&lt;*&gt;</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">21 </span>
                                       <span class="graph">Расходы на строительство, возведение, сборку, монтаж, обслуживание или оказание технического содействия, производимые после прибытия ввоза товаров на таможенную территорию Таможенного союза</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:BuildingAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">22 </span>
                                       <span class="graph">Расходы по перевозке (транспортировке) товаров после их прибытия на таможенную территорию Таможенного союза</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">23 </span>
                                       <span class="graph">Пошлины, налоги и сборы, уплачиваемые на таможеннгй территории Таможенного союза в связи с ввозом или продажей ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">24 </span>
                                       <span class="graph">Итого В в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">25 </span>
                                       <span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (А + Б - В)</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) в НАЦИОНАЛЬНОЙ ВАЛЮТЕ</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:NationalDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
											<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
											)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DollarDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" colspan="3" style="width:180mm;" valign="top">
                                                   <xsl:text>&lt;*&gt; Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <span class="graph">Номер товара и позиции</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Код валюты, сумма</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Курс пересчета</span>
                                                </td>
                                             </tr>
                                             <xsl:for-each select="DTSin:DTSinCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Дополнительные данные</span>
                                       <!--<xsl:if test="DTSin:AdditionalData">
													<br/>
													<span class="graphNo">11 </span>-->
                                       <!--<xsl:for-each select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTSMethod1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_ru:IndirectAdditionalInformation">
														<xsl:value-of select="."/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:for-each>-->
                                       <!--</xsl:if>-->
                                       <xsl:if test="DTSin:AdditionalData">
                                          <br/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:for-each select="DTSin:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Подпись, печать</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:when test="DTSin:FormDTS=3">
                  <div class="page">
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" rowspan="2" style="width:100mm;">РОССИЙСКАЯ ФЕДЕРАЦИЯ</td>
                              <td align="right" class="graphNo" style="width:80mm;">ДЕКЛАРАЦИЯ ТАМОЖЕННОЙ СТОИМОСТИ</td>
                           </tr>
                           <tr>
                              <td align="right" class="graph" style="width:80mm;">Форма ДТС-3</td>
                           </tr>
                        </tbody>
                     </table>
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">1 </span>
                                 <span class="graph">Продавец </span>
                                 <br/>
                                 <xsl:value-of select="DTSin:DTSinSeller/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinSeller/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                    </xsl:if>
                                 </xsl:if>
                              </td>
                              <td class="graph" rowspan="3" style="width:80mm;border-left:solid 2pt #000000;border-top:solid 1.5pt #000000;border-right:solid 0.5pt #000000;border-bottom:solid 1.5pt #000000;" valign="top">
                                 <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                 <br/>
                                 <span class="graph">Окончательное решение: </span>
                                 <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DecisionCode"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:LNP"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                 </xsl:call-template>
                                 <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                 <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                    <br/>
                                    <span class="graph">Промежуточное решение: </span>
                                    <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:Term"/>
                                    </xsl:call-template>
                                    <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:Term"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                    </xsl:call-template>
                                    <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                 </xsl:if>
                                 <xsl:if test="DTSin:CancelingDecision">
                                    <br/>
                                    <span class="graph">Решение об аннулировании или отзыве ДТС: </span>
                                    <xsl:value-of select="DTSin:CancelingDecision/cat_EDTS_ru:DecisionCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CancelingDecision/DTSin:LNP"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:CancelingDecision/cat_EDTS_ru:DateInf"/>
                                    </xsl:call-template>
                                    <xsl:value-of select="DTSin:CancelingDecision/cat_EDTS_ru:DateInf"/>
                                 </xsl:if>
                                 <xsl:if test="DTSin:DTSinOfficialMark">
                                    <br/>
                                    <span class="graph">Служебные отметки: </span>
                                    <xsl:for-each select="DTSin:DTSinOfficialMark">
										<xsl:value-of select="cat_EDTS_ru:MarkIdentifier"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="DTSin:RecordSerialNumber"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:MarkDescription"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:LNP"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:call-template name="russian_date">
										   <xsl:with-param name="dateIn" select="cat_EDTS_ru:DateInf"/>
										</xsl:call-template>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:TimeInf"/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
                                    </xsl:for-each>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(а) Покупатель </span>
                                 <br/>
                                 <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                    </xsl:if>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(б) Декларант</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;">
                                 <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                    </xsl:if>
                                 </xsl:if>
                                 <xsl:value-of select="DTSin:DTSinDeclarant/DTSin:DocumentRegNumber"/>
                              </td>
                              <td class="graph" style="width:80mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">3 </span>
                                 <span class="graph">Условия поставки</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DeliveryTerms">
                                    <xsl:value-of select="cat_ru:DeliveryTermsStringCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:for-each select="cat_ru:DeliveryPlace">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:for-each>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphBold" rowspan="2" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
                                 <xsl:text>ВАЖНАЯ ИНФОРМАЦИЯ</xsl:text>
                                 <!--меняла-->
                                 <br/>
                                 <xsl:text>В соответствии со статьей 84 Таможенного</xsl:text>
                                 <br/>
                                 <xsl:text>кодекса ЕАЭС декларант либо</xsl:text>
                                 <br/>
                                 <xsl:text> таможенный представитель несет</xsl:text>
                                 <br/>
                                 <xsl:text>ответственность за указание в декларации</xsl:text>
                                 <br/>
                                 <xsl:text>таможенной стоимости недостоверных</xsl:text>
                                 <br/>
                                 <xsl:text>сведений. Декларант обязан также</xsl:text>
                                 <br/>
                                 <xsl:text>представить при необходимости</xsl:text>
                                 <br/>
                                 <xsl:text>соответствующую дополнительную информацию</xsl:text>
                                 <br/>
                                 <xsl:text>и необходимые документы, подтверждающие</xsl:text>
                                 <br/>
                                 <xsl:text>использованные для определения заявленной</xsl:text>
                                 <br/>
                                 <xsl:text>таможенной стоимости сведения.</xsl:text>
                                 <!--<br/>
											<xsl:text>В соответствии с законодательством Российской Федерации декларант</xsl:text>
											<br/>
											<xsl:text>отвечает за достоверность сведений, указанных в настоящей декларации и в</xsl:text>
											<br/>
											<xsl:text>документах, представленных для их подтверждения. Декларант обязан также</xsl:text>
											<br/>
											<xsl:text>представить при необходимости соответствующую дополнительную</xsl:text>
											<br/>
											<xsl:text>информацию и необходимые документы, подтверждающие использованные</xsl:text>
											<br/>
											<xsl:text>для определения заявленной таможенной стоимости сведения.</xsl:text>-->
                              </td>
                              <td class="graph" style="width:80mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">4 </span>
                                 <span class="graph">Номер и дата счета (счетов)</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiceDocuments">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    <br/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:80mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">5 </span>
                                 <span class="graph">Номер и дата контракта</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiceDocuments">
                                    <!-- меняла-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    <br/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">6 </span>
                                 <span class="graph">Номер и дата документа с принятыми таможенными органами решениями, применимыми к графам 7-9</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiceDocuments">
                                    <!-- меняла-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    <br/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                                    <tbody>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <span class="graphNo">7 </span>
                                             <span class="graph">(а) Имеется ли ВЗАИМОСВЯЗЬ между продавцом и покупателем в значении, указанном в пп.2 п.1 ст.5 Закона Российской Федерации "О таможенном тарифе" </span>
                                          </td>
                                          <td class="graph" colspan="4" style="width:40mm;" valign="top">
                                             <table cellpadding="0" cellspacing="0" style="width:100%;">
                                                <tbody>
                                                   <tr>
                                                      <td align="center" class="graph" style="width:30mm;border-left:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;" valign="top">
                                                         <span class="graphBold">Верное отметить</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                                         <span class="graphBold">х</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border-bottom:solid 0.5pt #000000;">
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </td>
                                                   </tr>
                                                </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">Закона Российской Федерации "О таможенном тарифе"?&lt;*&gt; - В случае ответа НЕТ, далее к графе 8</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A)=1) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A)=0) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) Оказала ли взаимосвязь между продавцом и покупателем влияние на цену вывозимого товара</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B)=1) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B)=0) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(в) Стоимость сделки с вывозимыми товарами близка к одной из возможных проверочных величин, указанных в п.12 Правил определения таможенной стоимости товаров, вывозимых с таможенной территории Российской</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">  Федерации, утвержденных Постановлением Правительства Российской Федерации от 12 августа 2006 г. N 500</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C)=1) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C)=0) or (DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">В случае ответа ДА, указываются подробности</span>
                                             <br/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:for-each select="DTSin:DTSBuyerSellerDependence/cat_EDTS_cu:Column7CDescription">
                                                <xsl:value-of select="."/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </xsl:for-each>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <span class="graphNo">8 </span>
                                             <span class="graph">(а) Имеются ли прямо или косвенно установленные продавцом ОГРАНИЧЕНИЯ в отношении прав покупателя на пользование и распоряжение товарами, за исключением ограничений, которые:</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">- ограничивают географический регион, в котором товары могут быть перепроданы;</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">- существенно не влияют на стоимость товаров.</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8A)=1) or (DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8A='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8A)=0) or (DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8A='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) Зависит ли продажа товаров или их цена от соблюдения УСЛОВИЙ или ОБЯЗАТЕЛЬСТВ, влияние которых на стоимость оцениваемых товаров не может быть количественно определено?</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">Указывается вид и содержание, а также расчет стоимостной оценки таких условий или обязательств</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8B)=1) or (DTSin:DTSSellingLimitation/cat_EDTS_cu:Column8B='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSSellingLimitation/cat_EDTS_ru:Column8B)=0) or (DTSin:DTSSellingLimitation/cat_EDTS_ru:Column8B='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <xsl:if test="DTSin:DTSSellingLimitation/cat_EDTS_cu:limitationDescription">
                                          <tr>
                                             <td class="graph" style="width:140mm;" valign="top">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="DTSin:DTSSellingLimitation/cat_EDTS_cu:limitationDescription"/>
                                             </td>
                                             <td align="center" class="graph" style="width:5mm;" valign="middle">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graph" style="width:15mm;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td align="center" class="graph" style="width:5mm;" valign="middle">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graph" style="width:15mm;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                          </tr>
                                       </xsl:if>
                                       <tr>
                                          <td class="graph" colspan="5" style="width:180mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">Если влияние таких условий или обязательств на стоимость товаров может быть количественно определено, сумма указывается в графе 11б</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <span class="graphNo">9 </span>
                                             <span class="graph">(а) Предусмотрены ли ПЛАТЕЖИ за использование объектов ИНТЕЛЛЕКТУАЛЬНОЙ СОБСТВЕННОСТИ (за исключением платежей за право воспроизведения оцениваемых товароввне таможенной территории Российской Федерации), которые относятся к оцениваемым товарам и которые покупатель прямо или косвенно должен уплатить в</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">качестве условия продажи таких товаров?</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9A)=1) or (DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9A='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9A)=0) or (DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9A='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) Зависит ли продажа товаров от соблюдения условия, в соответствии с которым ЧАСТЬ ДОХОДА, полученного в результате ПОСЛЕДУЮЩИХ ПРОДАЖ товаров, РАСПОРЯЖЕНИЯ товарами иным способом или их</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">ИСПОЛЬЗОВАНИЯ, будет причитаться прямо или косвенно продавцу?</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9B)=1) or (DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9B='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9B)=0) or (DTSin:DTSAdditionalPayments/cat_EDTS_cu:Column9B='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" colspan="5" style="width:180mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">В случае ответа ДА на подпункт (а) и/или (б): указываются условия и в графах 15 и 16 приводятся соответствующие суммы.</span>
                                             <xsl:if test="DTSin:DTSAdditionalPayments/cat_EDTS_cu:PaymentDescription">
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="DTSin:DTSAdditionalPayments/cat_EDTS_cu:PaymentDescription"/>
                                             </xsl:if>
                                             <xsl:if test="DTSin:DTSAdditionalPayments/cat_EDTS_cu:PaymentConditionDescription">
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:for-each select="DTSin:DTSAdditionalPayments/cat_EDTS_cu:PaymentConditionDescription">
                                                   <xsl:value-of select="."/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:for-each>
                                             </xsl:if>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphBold" rowspan="2" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
                                 <xsl:text>&lt;*&gt; ЛИЦА ЯВЛЯЮТСЯ ВЗАИМОСВЯЗАННЫМИ ИСКЛЮЧИТЕЛЬНО В ТОМ СЛУЧАЕ, ЕСЛИ</xsl:text>
                                 <br/>
                                 <xsl:text>(а) каждое из этих лиц является сотрудником или руководителем организации, созданной с участием другого лица;</xsl:text>
                                 <br/>
                                 <xsl:text>(б) они являются деловыми партнерами, т.е. связаны договорными отношениями, действуют в целях извлечения прибыли и совместно несут расходы и убытки, связанные с осуществлением совместной деятельности;</xsl:text>
                                 <br/>
                                 <xsl:text>(в) они являются работодателем и работником;</xsl:text>
                                 <br/>
                                 <xsl:text>(г) какое-либо лицо прямо или косвенно владеет пятью или более процентами выпущенных в обращение голосующих акций обоих лиц, контролирует пять или более процентов выпущенных в обращение голосующих акций обоих лиц или является номинальным держателем пяти и более процентов выпущенных в обращение голосующих акций обоих лиц;</xsl:text>
                                 <br/>
                                 <xsl:text>(д) одно из них прямо или косвенно контролирует другое;</xsl:text>
                                 <br/>
                                 <xsl:text>(е) оба они прямо или косвенно контролируются третьим лицом;</xsl:text>
                                 <br/>
                                 <xsl:text>(ж) вместе они прямо или косвенно контролируют третье лицо;</xsl:text>
                                 <br/>
                                 <xsl:text>(з) лица состоят в брачных отношениях, отношениях родства или свойства, усыновителя или усыновленного, а также попечителя и опекаемого.</xsl:text>
                                 <br/>
                                 <xsl:text>Факт взаимосвязи сам по себе не должен являться основанием для признания стоимости сделки неприемлимой для целей определения таможенной стоимости вывозимых товаров (п. 11 Правил определения таможенной стоимости товаров, вывозимых с таможенной территории Российской Федерации, утвержденных Постановлением Правительства Российской Федерации от 13 августа 2005 г. N 500).</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">10 </span>
                                 <span class="graph">(а) Число дополнительных листов</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:AdditionalSheetNumber"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:80mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">10 </span>
                                 <span class="graph">(б) Место, дата, подпись, печать</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/cat_EDTS_cu:FilledDate"/>
                                    <!-- меняла -->
                                 </xsl:call-template>
                                 <!--xsl:value-of select="DTSin:DTSinFilledPerson/cat_EDTS_ru:FilledDate"/-->
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard">
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:OrganizationName"/>
                                 </xsl:if>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:Contact/cat_ru:Phone"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/DTSin:LNP"/>
                                 <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument">
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName">
                                       <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:AuthoritesDocument/cat_ru:PrDocumentDate"/-->
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:AuthoritesDocument/catESAD_ru:CompletionAuthorityDate"/-->
                                 </xsl:if>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <xsl:variable name="DTS" select="current()"/>
                  <xsl:for-each select="DTSin:DTSinGoodsCustomsCost">
                     <div class="page">
                        <table cellpadding="0" cellspacing="0" style="width:100%;">
                           <tbody>
                              <tr>
                                 <td align="right" class="graph" style="width:145mm;">
                                    <span class="graph">Форма ДТС-3</span>
                                 </td>
                                 <td align="right" class="graph" style="width:35mm;">
                                    <span class="graph">Лист №  </span>
                                    <xsl:value-of select="DTSin:SheetNumber"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="right" class="graph" style="width:145mm;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td align="right" class="graph" style="width:35mm;">
                                    <span class="graph">Метод 1</span>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                        <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                           <tbody>
                              <tr>
                                 <td class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                    <!--меняла-->
                                    <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                    <br/>
                                    <span class="graph">Окончательное решение: </span>
                                    <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DecisionCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:LNP"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                    </xsl:call-template>
                                    <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                    <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                       <br/>
                                       <span class="graph">Промежуточное решение: </span>
                                       <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                       </xsl:call-template>
                                       <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                    </xsl:if>
                                    <xsl:if test="DTSin:GoodsCancelingDecision">
                                       <br/>
                                       <span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
                                       <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DecisionCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:Term"/>
                                       </xsl:call-template>
                                       <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:Term"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DateInf"/>
                                       </xsl:call-template>
                                       <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DateInf"/>
                                    </xsl:if>
                                 </td>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">Товар № </span>
                                    <xsl:if test="DTSin:GTDGoodsNumber">
                                       <xsl:value-of select="DTSin:GTDGoodsNumber"/>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">Код ТН ВЭД</span>
                                    <br/>
                                    <xsl:value-of select="DTSin:GoodsTNVEDCode"/>
                                    <xsl:value-of select="DTSin:GoodsAddTNVEDCode"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" rowspan="4" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">А. Основа для расчета</span>
                                 </td>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">11 </span>
                                    <span class="graph">(а) Цена, фактически уплаченная или подлежащая уплате за товары в ВАЛЮТЕ СЧЕТА </span>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyCode"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23.3mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">в РУБЛЯХ</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyRate"/>
											)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) Косвенные платежи в РУБЛЯХ - см. графу 8 (б)</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyRate"/>
											)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">12 </span>
                                    <span class="graph">Итого А в рублях</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" rowspan="9" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">Б. ДОПОЛНИ- ТЕЛЬНЫЕ НАЧИСЛЕНИЯ: расходы в рублях, которые не включены в А&lt;*&gt;</span>
                                 </td>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">13 </span>
                                    <span class="graph">Расходы, произведенные покупателем на:</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(а) выплату вознаграждения агенту (посреднику), за исключением вознаграждений за оказание услуг, связанных с покупкой товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:AgentBonus"/>
                                    <!-- меняла -->
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) тару и упаковку</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:PackageExpenses"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">14 </span>
                                    <span class="graph">Соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных покупателем бесплатно или по сниженной цене для использования в связи с  производством оцениваемых товаров и продажей их на вывоз из Российской Федерации в страну назначения:</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(а) сырья, материалов и комплектующих, которые являются составной частью вывозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:StoreCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве вывозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:ProductionToolkitCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(в) материалов, израсходованных при производстве вывозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:WorkingStockCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(г) проектирования, разработки, инженерной, конструктивной работы, дизайна, художественного оформления, чертежей и эскизов, необходимых для производства оцениваемых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:DesignPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">15 </span>
                                    <span class="graph">Платежи за использование объектов интеллектуальной собственности - см. графу 9 (а)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:IntellectualPropertyPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">16 </span>
                                    <span class="graph">Часть дохода, полученного в результате последующей продажи, распоряжения иным способом или использования товаров, которая прямо или косвенно причитается продавцу - см. графу 9 (б)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:SellerIncome"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="middle">
                                    <span class="graphNo">17 </span>
                                    <span class="graph"> Итого Б в рублях</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:TotalAdditionalSum"/>
                                 </td>
                              </tr>
                              <!--<tr>
											<td rowspan="4" style="width:20mm;border:solid 0.5pt #000000;" class="graph" valign="top">
												<span class="graphNo">В. </span>
												<span class="graph">ВЫЧЕТЫ: расходы в рублях, которые включены в А</span>
											</td>
											<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
												<span class="graphNo">18 </span>
												<span class="graph">Расходы по перевозке (транспортировке) товаров, осуществляемой для их вывоза с таможенной территории Российской Федерации, и расходы по последующей перевозке (транспортировке)</span>
											</td>
											
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussianTransportCharge"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussianTransportCharge"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussianTransportCharge"/>
											</td>
										</tr>
										<tr>
											<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
												<span class="graphNo">19</span>
												<span class="graph">Пошлины, налоги и сборы, взимаемые в Российской Федерации в связи с вывозом товаров</span>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussiansTaxPayment"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussiansTaxPayment"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussiansTaxPayment"/>
											</td>
										</tr>
										<tr>
											<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
												<span class="graphNo">20</span>
												<span class="graph">Пошлины, налоги и сборы, взимаемые в отношении оцениваемых товаров в стране, в которую ввозятся эти товары</span>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:ExportCountryTaxPayment"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:ExportCountryTaxPayment"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:ExportCountryTaxPayment"/>
											</td>
										</tr>
										<tr>
											<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
												<span class="graphNo">21</span>
												<span class="graph">Итого В в рублях</span>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:TotalDeductionAmount"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:TotalDeductionAmount"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:TotalDeductionAmount"/>
											</td>
										</tr>	-->
                              <tr>
                                 <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graphNo">18 </span>
                                    <!--меняла-->
                                    <span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (А + Б)</span>
                                    <!--меняла-->
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(а) в РУБЛЯХ</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:NationalDeclaredCustomsCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
											<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
											)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DollarDeclaredCustomsCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="5" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                                       <tbody>
                                          <tr>
                                             <td class="graph" colspan="3" style="width:180mm;" valign="top">
                                                <xsl:text>&lt;*&gt; Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td class="graph" style="width:80mm;" valign="top">
                                                <span class="graph">Номер товара и позиции</span>
                                             </td>
                                             <td class="graph" style="width:40mm;" valign="top">
                                                <span class="graph">Код валюты, сумма</span>
                                             </td>
                                             <td class="graph" style="width:40mm;" valign="top">
                                                <span class="graph">Курс пересчета</span>
                                             </td>
                                          </tr>
                                          <xsl:for-each select="DTSin:DTSinCurrencyPayment">
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <xsl:choose>
                                                      <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                         <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </xsl:otherwise>
                                                   </xsl:choose>
                                                </td>
                                             </tr>
                                          </xsl:for-each>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">Дополнительные данные</span>
                                    <!--<xsl:if test="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_ru:IndirectAdditionalInformation">
													<br/>
														<xsl:for-each select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_ru:IndirectAdditionalInformation">
														<xsl:value-of select="."/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:for-each>
												</xsl:if>-->
                                    <xsl:if test="DTSin:AdditionalData">
                                       <!--меняла -->
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:for-each select="DTSin:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                          <xsl:value-of select="."/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:for-each>
                                    </xsl:if>
                                 </td>
                                 <td class="graph" colspan="3" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                    <span class="graph">Подпись, печать</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </xsl:for-each>
               </xsl:when>
               <xsl:when test="DTSin:FormDTS=4">
                  <div class="page">
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" rowspan="2" style="width:100mm;">РОССИЙСКАЯ ФЕДЕРАЦИЯ</td>
                              <td align="right" class="graphNo" style="width:80mm;">ДЕКЛАРАЦИЯ ТАМОЖЕННОЙ СТОИМОСТИ</td>
                           </tr>
                           <tr>
                              <td align="right" class="graph" style="width:80mm;">Форма ДТС-4</td>
                           </tr>
                        </tbody>
                     </table>
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">1 </span>
                                 <span class="graph">Продавец (поставщик)</span>
                                 <br/>
                                 <xsl:value-of select="DTSin:DTSinSeller/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinSeller/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinSeller/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinSeller/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                    </xsl:if>
                                 </xsl:if>
                              </td>
                              <td class="graph" rowspan="3" style="width:80mm;border-left:solid 2pt #000000;border-top:solid 1.5pt #000000;border-right:solid 0.5pt #000000;border-bottom:solid 1.5pt #000000;" valign="top">
                                 <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                 <br/>
                                 <span class="graph">Окончательное решение: </span>
                                 <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DecisionCode"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:LNP"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                 </xsl:call-template>
                                 <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                                 <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                    <br/>
                                    <span class="graph">Промежуточное решение: </span>
                                    <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:Term"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:Term"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                                 </xsl:if>
                                 <xsl:if test="DTSin:CancelingDecision">
                                    <br/>
                                    <span class="graph">Решение об аннулировании или отзыве ДТС: </span>
                                    <xsl:value-of select="DTSin:CancelingDecision/cat_EDTS_ru:DecisionCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:CancelingDecision/cat_EDTS_ru:LNP"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:CancelingDecision/cat_EDTS_ru:DateInf"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:CancelingDecision/DTSin:DateInf"/-->
                                 </xsl:if>
                                 <xsl:if test="DTSin:DTSinOfficialMark">
                                    <br/>
                                    <span class="graph">Служебные отметки: </span>
                                    <xsl:for-each select="DTSin:DTSinOfficialMark">
										<xsl:value-of select="cat_EDTS_ru:MarkIdentifier"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="DTSin:RecordSerialNumber"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:MarkDescription"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:LNP"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:call-template name="russian_date">
										   <xsl:with-param name="dateIn" select="cat_EDTS_ru:DateInf"/>
										</xsl:call-template>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_EDTS_ru:TimeInf"/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
                                    </xsl:for-each>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(а) Покупатель (получатель)</span>
                                 <br/>
                                 <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinBuyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinBuyer/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                    </xsl:if>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;border-top:solid 0.5pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(б) Декларант</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.5pt #000000;">
                                 <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:OrganizationName"/>
                                 <span class="graph"> (</span>
                                 <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:ShortName"/>
                                 <span class="graph">) </span>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN!='') or (DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSin:DTSinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:if test="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinDeclarant/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
                                       <xsl:text>&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                 </xsl:if> 
											<xsl:value-of select="DTSin:DTSinDeclarant/DTSin:DocumentRegNumber"/>
                              </td>
                              <td class="graph" style="width:80mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">3 </span>
                                 <span class="graph">Условия поставки</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DeliveryTerms">
                                    <xsl:value-of select="cat_ru:DeliveryTermsStringCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:for-each select="cat_ru:DeliveryPlace">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:for-each>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphBold" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
                                 <xsl:text>ВАЖНАЯ ИНФОРМАЦИЯ</xsl:text>
                                 <!-- меняла -->
                                 <br/>
                                 <xsl:text>В соответствии со статьей 84 Таможенного</xsl:text>
                                 <br/>
                                 <xsl:text>кодекса ЕАЭС декларант либо</xsl:text>
                                 <br/>
                                 <xsl:text>таможенный представитель несет</xsl:text>
                                 <br/>
                                 <xsl:text>ответственность за указание в декларации</xsl:text>
                                 <br/>
                                 <xsl:text>таможенной стоимости недостоверных</xsl:text>
                                 <br/>
                                 <xsl:text>сведений. Декларант обязан также</xsl:text>
                                 <br/>
                                 <xsl:text>представить при необходимости </xsl:text>
                                 <br/>
                                 <xsl:text>соответствующую дополнительную информацию </xsl:text>
                                 <br/>
                                 <xsl:text>и необходимые документы, подтверждающие </xsl:text>
                                 <br/>
                                 <xsl:text>использованные для определения заявленной</xsl:text>
                                 <br/>
                                 <xsl:text>таможенной стоимости сведения.</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">4 </span>
                                 <span class="graph">Вид, номер и дата документа, являющегося основанием для поставки товара</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiceDocuments">
                                    <!--меняла -->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    <br/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">5 </span>
                                 <span class="graph">Номер и дата документа с принятыми ранее таможенными органами решениями по ранее вывезенным товарам по документу, указанному в графе 4</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiceDocuments">
                                    <!--меняла -->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    <br/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                                    <tbody>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <span class="graphNo">6 </span>
                                             <span class="graph">Таможенная стоимость декларируемых товаров определяется по методу</span>
                                          </td>
                                          <td class="graph" colspan="3" style="width:50mm;" valign="top">
                                             <table cellpadding="0" cellspacing="0" style="width:100%;">
                                                <tbody>
                                                   <tr>
                                                      <td align="center" class="graph" style="width:40mm;border-left:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;" valign="top">
                                                         <span class="graphBold">Верное отметить</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                                         <span class="graphBold">х</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border-bottom:solid 0.5pt #000000;">
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </td>
                                                   </tr>
                                                </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(а) по стоимости сделки с идентичными товарами</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSin:CustomsCostMethodCode=2) or (DTSin:BaseMethodCode=2)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) по стоимости сделки с однородными товарами</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSin:CustomsCostMethodCode=3) or (DTSin:BaseMethodCode=3)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(в) сложения</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSin:CustomsCostMethodCode=5) or (DTSin:BaseMethodCode=5)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(г) резервному&lt;*&gt;</span>
                                             <!--меняла -->
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSin:CustomsCostMethodCode=6)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(д) различными (если для разных товаров используются различные методы)</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSin:CustomsCostMethodCode='*')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">7 </span>
                                 <span class="graph">Причины, по которым предшествующие методы определения таможенной стоимости не применимы</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:ReasonApplyMethod/cat_EDTS_cu:ReasonDescription">
                                    <xsl:value-of select="."/>
                                    <xsl:text> </xsl:text>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border-left:solid 0.5pt #000000;border-right:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">8 </span>
                                 <span class="graph">Наименование и реквизиты основных документов, представленных в подтверждение приводимых сведений</span>
                                 <br/>
                                 <xsl:for-each select="DTSin:DTSInvoiceDocuments">
                                    <!--меняла -->
                                    <xsl:if test="cat_EDTS_cu:PositionNumber=8">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="cat_ru:PrDocumentDate"/-->
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       <br/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" rowspan="2" style="width:100mm;border:solid 0.5pt #000000;">
                                 <xsl:text>&lt;*&gt; В КАЧЕСТВЕ ОСНОВЫ ДЛЯ ОПРЕДЕЛЕНИЯ </xsl:text>
                                 <br/>
                                 <xsl:text>ТАМОЖЕННОЙ СТОИМОСТИ ТОВАРА ПО РЕЗЕРВНОМУ</xsl:text>
                                 <br/>
                                 <xsl:text> МЕТОДУ (в соответствии с пунктом 38 правил</xsl:text>
                                 <br/>
                                 <xsl:text>определения таможенной стоимости товаров,</xsl:text>
                                 <br/>
                                 <xsl:text> вывозимых с таможенной территории </xsl:text>
                                 <br/>
                                 <xsl:text> Российской Федерации, утвержденных</xsl:text>
                                 <br/>
                                 <xsl:text>Постановлением Правительства Российской</xsl:text>
                                 <br/>
                                 <xsl:text>Федерации от 13 августа 2006 г. N 500) НЕ</xsl:text>
                                 <br/>
                                 <xsl:text>МОГУТ БЫТЬ ИСПОЛЬЗОВАНЫ:</xsl:text>
                                 <br/>
                                 <xsl:text>- цена товара на внутреннем рынке Российской</xsl:text>
                                 <br/>
                                 <xsl:text>Федерации;</xsl:text>
                                 <br/>
                                 <xsl:text>- цена товара, поставляемого из Российской </xsl:text>
                                 <br/>
                                 <xsl:text>Федерации в иную страну, чем страна, в</xsl:text>
                                 <br/>
                                 <xsl:text>которую поставляют оцениваемые товары;</xsl:text>
                                 <br/>
                                 <xsl:text>- иные расходы, нежели те, которые подлежат</xsl:text>
                                 <br/>
                                 <xsl:text>включению в расчетную стоимость товаров при</xsl:text>
                                 <br/>
                                 <xsl:text>определении таможенной стоимости по методу</xsl:text>
                                 <br/>
                                 <xsl:text>сложения в отношении идентичных или</xsl:text>
                                 <br/>
                                 <xsl:text>однородных товаров;</xsl:text>
                                 <br/>
                                 <xsl:text>- цена, которая предусматривает принятие для</xsl:text>
                                 <br/>
                                 <xsl:text>таможенных целей наивысшей из двух</xsl:text>
                                 <br/>
                                 <xsl:text>альтернативных стоимостей;</xsl:text>
                                 <br/>
                                 <xsl:text>- минимальные таможенные стоимости;</xsl:text>
                                 <br/>
                                 <xsl:text>- произвольные или фиктивные стоимости</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">9 </span>
                                 <span class="graph">Число дополнительных листов</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:AdditionalSheetNumber"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:80mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">10 </span>
                                 <span class="graph">Место, дата, подпись, печать</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/cat_EDTS_cu:FilledDate"/>
                                 </xsl:call-template>
                                 <!--xsl:value-of select="DTSin:DTSinFilledPerson/cat_EDTS_ru:FilledDate"/-->
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard">
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:OrganizationName"/>
                                 </xsl:if>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:Contact/cat_ru:Phone"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSin:DTSinFilledPerson/DTSin:LNP"/>
                                 <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument">
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName">
                                       <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:AuthoritesDocument/cat_ru:PrDocumentDate"/-->
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSin:DTSinFilledPerson/catESAD_cu:AuthoritesDocument/catESAD_ru:ComplationAuthorityDate"/>
                                    </xsl:call-template>
                                    <!--xsl:value-of select="DTSin:DTSinFilledPerson/catESAD_ru:AuthoritesDocument/catESAD_ru:CompletionAuthorityDate"/-->
                                 </xsl:if>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <xsl:variable name="DTS" select="current()"/>
                  <xsl:for-each select="DTSin:DTSinGoodsCustomsCost">
                     <xsl:if test="($DTS/DTSin:CustomsCostMethodCode=2) or ($DTS/DTSin:CustomsCostMethodCode=3)       or ($DTS/DTSin:CustomsCostMethodCode=5) or ($DTS/DTSin:CustomsCostMethodCode=6 and        $DTS/DTSin:BaseMethodCode!=1)">
                        <div class="page">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <span class="graph">Форма ДТС-4</span>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Лист № </span>
                                       <xsl:value-of select="cat_EDTS_ru:SheetNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Методы 2, 3, 5, 6</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                              <tbody>
                                 <tr>
                                    <td class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                       <br/>
                                       <span class="graph">Окончательное решение: </span>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DecisionCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                       </xsl:call-template>
                                       <!--xsl:value-of select="DTSin:FinalCustomsCostDecision/DTSin:DateInf"/-->
                                       <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                          <br/>
                                          <span class="graph">Промежуточное решение: </span>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/-->
                                       </xsl:if>
                                       <xsl:if test="DTSin:GoodsCancelingDecision">
                                          <br/>
                                          <span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:Term"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:Term"/-->
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DateInf"/>
                                          </xsl:call-template>
                                          <!--xsl:value-of select="DTSin:GoodsCancelingDecision/DTSin:DateInf"/-->
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="DTSin:GTDGoodsNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД</span>
                                       <br/>
                                       <xsl:value-of select="DTSin:GoodsTNVEDCode"/>
                                       <xsl:value-of select="DTSin:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="4" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">А. Основа для расчета</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">11 </span>
                                       <span class="graph">Стоимость сделки с идентичными товарами в РУБЛЯХ (для методов 2, 3, 6)</span>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:Method2Basis/cat_EDTS_cu:IdenticalDealNationalAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">Расчетная стоимость вывозимых товаров, определяемая путем сложения в РУБЛЯХ (для методов 5,6):</span>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method56/cat_EDTS_ru:TotalBasisSum"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) суммы расходов, произведенных на изготовление или приобретение материалов, и расходов на производство, а также иные операции, связанные с производством вывозымых товаров</span>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method56/cat_EDTS_ru:ProductionStoreExpense"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) суммы прибыли и коммерческих и управленческих расходов</span>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method56/cat_EDTS_ru:CommerceExpense"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="4" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Б. Корректировки стоимости сделки (+/-)</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">13 </span>
                                       <span class="graph">(а) корректировка на количество (+/-)</span>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:Method2DealCorrect/cat_EDTS_ru:QuantityCorrect"/>
                                       <!--меняла -->
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) корректировка на коммерческий уровень (+/-)</span>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:Method2DealCorrect/cat_EDTS_ru:CommerceCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">Итого графа 13 в рублях (+/-)</span>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:Method2DealCorrect/cat_EDTS_ru:TotalSum"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">15</span>
                                       <span class="graph">Стоимость сделки с учетом корректировок (11 +/- 14) в рублях</span>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:Method2DealCorrect/cat_EDTS_ru:TotalDealCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="2" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">16 </span>
                                       <span class="graph">Количество</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) идентичных/однородных товаров</span>
                                       <xsl:if test="(DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:IdenticalGoodsQuantity/cat_ru:MeasureUnitQualifierName) or (DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:IdenticalGoodsQuantity/cat_ru:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:IdenticalGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:IdenticalGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:IdenticalGoodsQuantity/cat_ru:GoodsQuantity"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) декларируемых товаров</span>
                                       <xsl:if test="(DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_ru:MeasureUnitQualifierName) or (DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_ru:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS4Method236/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_ru:GoodsQuantity"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">17 </span>
                                       <span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (15/16а * 16б или 12)</span>
                                       <!--меняла -->
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) в РУБЛЯХ</span>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:NationalDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
													<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
													)</span>
                                    </td>
                                    <td align="center" class="graph" colspan="3" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DollarDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Дополнительные данные</span>
                                       <xsl:if test="DTSin:AdditionalData">
                                          <br/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:for-each select="DTSin:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" colspan="2" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Подпись, печать</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/DTSin:LNP"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </xsl:if>
                     <xsl:if test="($DTS/DTSin:CustomsCostMethodCode='*') or ($DTS/DTSin:CustomsCostMethodCode=6 and $DTS/DTSin:BaseMethodCode=1)">
                        <!--<xsl:for-each select="DTSin:DTSinGoodsCustomsCost">-->
                        <div class="page">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <span class="graph">Форма ДТС-4</span>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Лист №  </span>
                                       <xsl:value-of select="DTSin:SheetNumber"/>
                                       <!--меняла-->
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Метод 6 на основе метода 1</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.5pt #000000;">
                              <tbody>
                                 <tr>
                                    <td class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <!--меняла-->
                                       <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                       <br/>
                                       <span class="graph">Окончательное решение: </span>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DecisionCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                       </xsl:call-template>
                                       <xsl:value-of select="DTSin:FinalCustomsCostDecision/cat_EDTS_ru:DateInf"/>
                                       <xsl:if test="DTSin:IntermediateCustomsCostDecision">
                                          <br/>
                                          <span class="graph">Промежуточное решение: </span>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                          </xsl:call-template>
                                          <xsl:value-of select="DTSin:IntermediateCustomsCostDecision/DTSin:DateInf"/>
                                       </xsl:if>
                                       <xsl:if test="DTSin:GoodsCancelingDecision">
                                          <br/>
                                          <span class="graph">Решение об аннулировании или отзыве ДТС по товару: </span>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DecisionCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:Term"/>
                                          </xsl:call-template>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:Term"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DateInf"/>
                                          </xsl:call-template>
                                          <xsl:value-of select="DTSin:GoodsCancelingDecision/cat_EDTS_ru:DateInf"/>
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:if test="DTSin:GTDGoodsNumber">
                                          <xsl:value-of select="DTSin:GTDGoodsNumber"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД</span>
                                       <br/>
                                       <xsl:value-of select="DTSin:GoodsTNVEDCode"/>
                                       <xsl:value-of select="DTSin:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="4" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">А. Основа для расчета</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">11 </span>
                                       <span class="graph">(а) Цена, фактически уплаченная или подлежащая уплате за товары в ВАЛЮТЕ СЧЕТА </span>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23.3mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">в РУБЛЯХ</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyRate"/>
											)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) Косвенные платежи в РУБЛЯХ - см. графу 8 (б)</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyRate"/>
											)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">Итого А в рублях</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="9" style="width:20mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Б. ДОПОЛНИ- ТЕЛЬНЫЕ НАЧИСЛЕНИЯ: расходы в рублях, которые не включены в А&lt;*&gt;</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">13 </span>
                                       <span class="graph">Расходы, произведенные покупателем на:</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) выплату вознаграждения агенту (посреднику), за исключением вознаграждений за оказание услуг, связанных с покупкой товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:AgentBonus"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) тару и упаковку</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:PackageExpenses"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">Соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных покупателем бесплатно или по сниженной цене для использования в связи с  производством оцениваемых товаров и продажей их на вывоз из Российской Федерации в страну назначения:</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) сырья, материалов и комплектующих, которые являются составной частью вывозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:StoreCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве вывозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:ProductionToolkitCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(в) материалов, израсходованных при производстве вывозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:WorkingStockCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(г) проектирования, разработки, инженерной, конструктивной работы, дизайна, художественного оформления, чертежей и эскизов, необходимых для производства оцениваемых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:DesignPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">15 </span>
                                       <span class="graph">Платежи за использование объектов интеллектуальной собственности - см. графу 9 (а)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:IntellectualPropertyPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">16 </span>
                                       <span class="graph">Часть дохода, полученного в результате последующей продажи, распоряжения иным способом или использования товаров, которая прямо или косвенно причитается продавцу - см. графу 9 (б)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:SellerIncome"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="left" class="graph" style="width:90mm;border:solid 0.5pt #000000;" valign="middle">
                                       <span class="graphNo">17 </span>
                                       <span class="graph"> Итого Б в рублях</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:CustomsCostCalculation/DTSin:DTS3Method1/cat_EDTS_ru:Method1AdditionalSum/cat_EDTS_ru:TotalAdditionalSum"/>
                                    </td>
                                 </tr>
                                 <!--<tr>
											<td rowspan="4" style="width:20mm;border:solid 0.5pt #000000;" class="graph" valign="top">
												<span class="graphNo">В. </span>
												<span class="graph">ВЫЧЕТЫ: расходы в рублях, которые включены в А</span>
											</td>
											<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
												<span class="graphNo">18 </span>
												<span class="graph">Расходы по перевозке (транспортировке) товаров, осуществляемой для их вывоза с таможенной территории Российской Федерации, и расходы по последующей перевозке (транспортировке)</span>
											</td>
											
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussianTransportCharge"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussianTransportCharge"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussianTransportCharge"/>
											</td>
										</tr>
										<tr>
											<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
												<span class="graphNo">19</span>
												<span class="graph">Пошлины, налоги и сборы, взимаемые в Российской Федерации в связи с вывозом товаров</span>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussiansTaxPayment"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussiansTaxPayment"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:RussiansTaxPayment"/>
											</td>
										</tr>
										<tr>
											<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
												<span class="graphNo">20</span>
												<span class="graph">Пошлины, налоги и сборы, взимаемые в отношении оцениваемых товаров в стране, в которую ввозятся эти товары</span>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:ExportCountryTaxPayment"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:ExportCountryTaxPayment"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:ExportCountryTaxPayment"/>
											</td>
										</tr>
										<tr>
											<td style="width:90mm;border:solid 0.5pt #000000;" class="graph" valign="top">
												<span class="graphNo">21</span>
												<span class="graph">Итого В в рублях</span>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:TotalDeductionAmount"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:TotalDeductionAmount"/>
											</td>
											<td style="width:23mm;border:solid 0.5pt #000000;" class="graph" align="center" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1Deduction/cat_EDTS_ru:TotalDeductionAmount"/>
											</td>
										</tr>	-->
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graphNo">18 </span>
                                       <!--меняла-->
                                       <span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (А + Б)</span>
                                       <!--меняла-->
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) в РУБЛЯХ</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:NationalDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
											<xsl:value-of select="$DTS/DTSin:CurrencyRate"/>
											)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.5pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DollarDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="5" style="width:180mm;border:solid 0.5pt #000000;" valign="top">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" colspan="3" style="width:180mm;" valign="top">
                                                   <xsl:text>&lt;*&gt; Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <span class="graph">Номер товара и позиции</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Код валюты, сумма</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Курс пересчета</span>
                                                </td>
                                             </tr>
                                             <xsl:for-each select="DTSin:DTSinCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Дополнительные данные</span>
                                       <!--<xsl:if test="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_ru:IndirectAdditionalInformation">
													<br/>
														<xsl:for-each select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_ru:IndirectAdditionalInformation">
														<xsl:value-of select="."/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:for-each>
												</xsl:if>-->
                                       <xsl:if test="DTSin:AdditionalData">
                                          <!--меняла -->
                                          <br/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSin:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:for-each select="DTSin:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" colspan="3" style="width:70mm;border:solid 0.5pt #000000;" valign="top">
                                       <span class="graph">Подпись, печать</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonSurname"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonName"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="DTSin:DTSinFilledPerson/cat_ru:PersonMiddleName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSin:DTSinFilledPerson/cat_ru:PersonPost"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                        <!--</xsl:for-each>-->
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
            </xsl:choose>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
