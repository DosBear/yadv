<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nfro="urn:customs.ru:Information:CustomsDocuments:NotifFinishRejectOperations:5.10.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
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
   <xsl:template match="nfro:NotifFinishRejectOperations">
      <html>
         <head>
            <title>Уведомление о завершении операций/об отказе в проведении операций в отношении товаров и транспортных средств</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
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
					border: solid 0pt #000000;
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
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 12pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				.р{
				            
               <!--text-orientation: sideways-right;-->
				            -webkit-transform: rotate(180deg); 
                            -moz-transform: rotate(180deg);
                            -o-transform: rotate(180deg); 
                            transform: rotate(180deg); 
                            filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2);
				            }
				.graph1 {
							font-family: Arial;
							font-size: 7pt;
							}
				</style>
         </head>
         <body>
            <div class="album_page">
               <table>
                  <tr>
                     <td align="center" colspan="2" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Уведомление
						<xsl:choose>
                                 <xsl:when test="nfro:DocumentSign='1'">о завершении операций</xsl:when>
                                 <xsl:when test="nfro:DocumentSign='0'">об отказе в проведении операций</xsl:when>
                              </xsl:choose> в отношении товаров и транспортных средств</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="nfro:OperationDescription">
                     <tr>
                        <td width="30%">Операция:</td>
                        <td>
                           <xsl:for-each select="nfro:OperationDescription">
                              <xsl:choose>
                                 <xsl:when test=".='1'">Транспортировка</xsl:when>
                                 <xsl:when test=".='2'">Взвешивание</xsl:when>
                                 <xsl:when test=".='3'">Иное определение количества товаров</xsl:when>
                                 <xsl:when test=".='4'">Погрузка</xsl:when>
                                 <xsl:when test=".='5'">Выгрузка</xsl:when>
                                 <xsl:when test=".='6'"> Перегрузка</xsl:when>
                                 <xsl:when test=".='7'">Исправление поврежденной упаковки</xsl:when>
                                 <xsl:when test=".='8'">Вскрытие упаковки</xsl:when>
                                 <xsl:when test=".='9'">Упаковка</xsl:when>
                                 <xsl:when test=".='10'">Переупаковка</xsl:when>
                                 <xsl:when test=".='11'">Вскрытие помещений, емкостей и других мест,  где находятся или могут находиться товары</xsl:when>
                                 <xsl:when test=".='12'">Разделение товарной партии по отдельным видам и (или) наименованиям товаров</xsl:when>
                              </xsl:choose>
                              <xsl:if test="position()!=last()">, </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="nfro:GTDNumber">
                     <tr>
                        <td>Номер таможенной декларации:</td>
                        <td>
                           <xsl:value-of select="nfro:GTDNumber/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="nfro:GTDNumber/cat_ru:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="nfro:GTDNumber/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td>Сведения о декларанте:</td>
                     <td>
                        <xsl:if test="nfro:Declarant/cat_ru:OrganizationName">
                           <xsl:value-of select="nfro:Declarant/cat_ru:OrganizationName"/>,</xsl:if>
                        <xsl:if test="nfro:Declarant/cat_ru:ShortName">
                           <xsl:value-of select="nfro:Declarant/cat_ru:ShortName"/>,</xsl:if>
                        <xsl:if test="nfro:Declarant/cat_ru:OrganizationLanguage">
                           <xsl:value-of select="nfro:Declarant/cat_ru:OrganizationLanguage"/>
                        </xsl:if>
                        <br/>
                        <xsl:choose>
                           <xsl:when test="nfro:Declarant/cat_ru:RFOrganizationFeatures">
                              <xsl:apply-templates select="nfro:Declarant/cat_ru:RFOrganizationFeatures"/>
                           </xsl:when>
                           <xsl:when test="nfro:Declarant/cat_ru:RKOrganizationFeatures">
                              <xsl:apply-templates select="nfro:Declarant/cat_ru:RKOrganizationFeatures"/>
                           </xsl:when>
                           <xsl:when test="nfro:Declarant/cat_ru:RBOrganizationFeatures">
                              <xsl:apply-templates select="nfro:Declarant/cat_ru:RBOrganizationFeatures"/>
                           </xsl:when>
                        </xsl:choose>
                        <xsl:if test="nfro:Declarant/nfro:Representative">
                           <br/>
                           <u>Представитель:</u>
                           <xsl:if test="nfro:Declarant/nfro:Representative/cat_ru:OrganizationName">
                              <xsl:value-of select="nfro:Declarant/nfro:Representative/cat_ru:OrganizationName"/>,</xsl:if>
                           <xsl:if test="nfro:Declarant/nfro:Representative/cat_ru:ShortName">
                              <xsl:value-of select="nfro:Declarant/nfro:Representative/cat_ru:ShortName"/>,</xsl:if>
                           <xsl:if test="nfro:Declarant/nfro:Representative/cat_ru:OrganizationLanguage">
                              <xsl:value-of select="nfro:Declarant/nfro:Representative/cat_ru:OrganizationLanguage"/>
                           </xsl:if>
                           <br/>
                           <xsl:choose>
                              <xsl:when test="nfro:Declarant/nfro:Representative/cat_ru:RFOrganizationFeatures">
                                 <xsl:apply-templates select="nfro:Declarant/nfro:Representative/cat_ru:RFOrganizationFeatures"/>
                              </xsl:when>
                              <xsl:when test="nfro:Declarant/nfro:Representative/cat_ru:RKOrganizationFeatures">
                                 <xsl:apply-templates select="nfro:Declarant/nfro:Representative/cat_ru:RKOrganizationFeatures"/>
                              </xsl:when>
                              <xsl:when test="nfro:Declarant/nfro:Representative/cat_ru:RBOrganizationFeatures">
                                 <xsl:apply-templates select="nfro:Declarant/nfro:Representative/cat_ru:RBOrganizationFeatures"/>
                              </xsl:when>
                           </xsl:choose>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td>Таможеннный орган:</td>
                     <td>
                        <xsl:value-of select="nfro:CustomsOffice/cat_ru:Code"/>
                        <xsl:if test="nfro:CustomsOffice/cat_ru:OfficeName">,<xsl:value-of select="nfro:CustomsOffice/cat_ru:OfficeName"/>
                        </xsl:if>
                        <xsl:if test="nfro:CustomsOffice/cat_ru:CustomsCountryCode">,<xsl:value-of select="nfro:CustomsOffice/cat_ru:CustomsCountryCode"/>
                        </xsl:if>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="date">
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
   <!--	<xsl:template name="Features" match="cat_ru:RFOrganizationFeatures | cat_ru:RKOrganizationFeatures | cat_ru:RBOrganizationFeatures">
	<xsl:if test="cat_ru:OGRN"><xsl:value-of select="cat_ru:OGRN"/>,</xsl:if>
	<xsl:if test="cat_ru:INN"><xsl:value-of select="cat_ru:INN"/>,</xsl:if>
	<xsl:if test="cat_ru:KPP"><xsl:value-of select="cat_ru:KPP"/></xsl:if>
	</xsl:template>-->
   <xsl:template match="cat_ru:RFOrganizationFeatures | cat_ru:RKOrganizationFeatures | cat_ru:RBOrganizationFeatures">
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
   </xsl:template>
</xsl:stylesheet>
