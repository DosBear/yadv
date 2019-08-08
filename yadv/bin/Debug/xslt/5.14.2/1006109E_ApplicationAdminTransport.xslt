<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="apat cat_ru" version="1.0" xmlns:apat="urn:customs.ru:Information:CustomsDocuments:ApplicationAdminTransport:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="apat:ApplicationAdminTransport">
      <html>
         <head>
            <title>Заявка от администрации транспортного средства</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 14pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 14pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
						font-weight: normal;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 11pt;
						font-weight: normal;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
         </head>
         <body>
            <div class="page">
               <h4> ЗАЯВКА ОТ АДМИНИСТРАЦИИ ТРАНСПОРТНОГО СРЕДСТВА</h4>
               <br/>
               <table border="0" style="width:180mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" style="width:90mm">Описание ТС</td>
                        <td align="center" class="graphMain" style="width:90mm">
                           <!--xsl:value-of select="apat:TransportMeans/cat_ru:TransportModeCode"/>,   
                              		<xsl:if test="apat:TransportMeans/cat_ru:TransportTraditionalName">
                              <xsl:value-of select="apat:TransportMeans/cat_ru:TransportTraditionalName"/>  
									</xsl:if-->
                           <xsl:if test="apat:TransportMeans/cat_ru:TransportMeansNationalityCode">
										страна:
										<xsl:value-of select="apat:TransportMeans/cat_ru:TransportMeansNationalityCode"/>  
									</xsl:if>
                           <xsl:if test="(apat:TransportMeans/cat_ru:TransportIdentifier) or (apat:TransportMeans/cat_ru:TrailerIdentifier) or (apat:TransportMeans/cat_ru:SecondTrailerIdentifier)">
										номер:
										<xsl:value-of select="apat:TransportMeans/cat_ru:TransportIdentifier"/>,  
										
                              <!--<xsl:value-of select="apat:TransportMeans/catESAD_ru:TrailerIdentifier"/>, &#160;
										<xsl:value-of select="apat:TransportMeans/catESAD_ru:SecondTrailerIdentifier"/> &#160;-->
                              <br/>
                           </xsl:if>
                                                         <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:90mm">Цель прибытия на таможенную территорию РФ</td>
                        <td align="center" class="graphMain" style="width:90mm">
                           <xsl:value-of select="apat:Aim"/>
                        </td>
                     </tr>
                     <xsl:if test="apat:ForeignCustomer">
                        <tr>
                           <td align="left" class="graphMain" style="width:90mm">Лицо, номинированное иностранным заказчиком на поставку припасов</td>
                           <td align="center" class="graphMain" style="width:90mm">
                              <xsl:value-of select="apat:ForeignCustomer/cat_ru:OrganizationName"/> 
										<xsl:value-of select="apat:ForeignCustomer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
										<xsl:value-of select="apat:ForeignCustomer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
										<xsl:value-of select="apat:ForeignCustomer/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
										<xsl:if test="apat:ForeignCustomer/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
				УНП <xsl:value-of select="apat:ForeignCustomer/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/> 
				</xsl:if>
                              <xsl:if test="apat:ForeignCustomer/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
				BIN <xsl:value-of select="apat:ForeignCustomer/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/> 
				</xsl:if>
                              <xsl:if test="apat:ForeignCustomer/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
				IIN <xsl:value-of select="apat:ForeignCustomer/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/> 
				</xsl:if>
                              <xsl:if test="apat:ForeignCustomer/cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				 ITN 
				<xsl:if test="apat:ForeignCustomer/cat_ru:RKOrganizationFeatures/cat_ru:ITN"/> 
				</xsl:if>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="left" class="graphMain" style="width:90mm">Объем (в основных единицах измерения) технологических конструктивных емкостей и площади специально выделенных штатных мест, предназначенных для хранения припасов на транспортном средстве</td>
                        <td align="center" class="graphMain" style="width:90mm">
                           <xsl:value-of select="apat:Volume"/>   
									 <xsl:value-of select="apat:MeasureUnitQualifierName"/>
                        </td>
                     </tr>
                     <xsl:if test="apat:QuantityStore">
                        <tr>
                           <td align="left" class="graphMain" style="width:90mm">Количество припасов, находящихся на борту транспортного средства на момент подачи заявления</td>
                           <td align="center" class="graphMain" style="width:90mm">
                              <xsl:value-of select="apat:QuantityStore"/> 
										<xsl:value-of select="apat:MeasureUnitStore"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="apat:Route">
                        <tr>
                           <td align="left" class="graphMain" style="width:90mm">Предполагаемый маршрут следования транспортного средства после убытия с таможенной территории Российской Федерации</td>
                           <td align="center" class="graphMain" style="width:90mm">
                              <xsl:for-each select="apat:Route">
                                 <xsl:value-of select="."/>   
										</xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="apat:QuantityOperation">
                        <tr>
                           <td align="left" class="graphMain" style="width:90mm">Количество припасов, необходимых для обеспечения эксплуатации транспортного средства</td>
                           <td align="center" class="graphMain" style="width:90mm">
                              <xsl:value-of select="apat:QuantityOperation"/> 
										<xsl:value-of select="apat:MeasureUnitOperation"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="apat:Translator">
                        <tr>
                           <td align="left" class="graphMain" style="width:90mm">Сведения о лице, осуществившем перевод заявки на русский язык в случае, если она представлена на иностранном языке</td>
                           <td align="center" class="graphMain" style="width:90mm">
                              <xsl:value-of select="apat:Translator/cat_ru:OrganizationName"/> 
										<xsl:value-of select="apat:Translator/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
										<xsl:value-of select="apat:Translator/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
										<xsl:value-of select="apat:Translator/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
																		<xsl:if test="apat:Translator/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
				УНП <xsl:value-of select="apat:Translator/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/> 
				</xsl:if>
                              <xsl:if test="apat:Translator/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
				BIN <xsl:value-of select="apat:Translator/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/> 
				</xsl:if>
                              <xsl:if test="apat:Translator/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
				IIN <xsl:value-of select="apat:Translator/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/> 
				</xsl:if>
                              <xsl:if test="apat:Translator/cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				 ITN 
				<xsl:if test="apat:Translator/cat_ru:RKOrganizationFeatures/cat_ru:ITN"/> 
				</xsl:if>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="right" class="graphMain" style="width:90mm">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="apat:FilingDate"/>
                           </xsl:call-template>
                        </td>
                        <td align="center" class="graphMain" style="width:90mm">
                           <xsl:value-of select="apat:AdminTransport/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="apat:AdminTransport/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="apat:AdminTransport/cat_ru:PersonMiddleName"/>   
											<br/>
                           <xsl:value-of select="apat:AdminTransport/cat_ru:PersonPost"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
