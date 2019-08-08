<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:icd="urn:customs.ru:Information:CustomsDocuments:InqChangeData:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <title>Обращение об изменении, дополнении сведений, заявленных в декларации на товары</title>
            <style type="text/css">
                    body {
                        text-align: center; 
                        background: #cccccc; 
                    }
                    div.pageAlbum {
                        width: 297mm; 
                        margin-top: 10pt; 
                        margin-bottom: 10pt; 
                        margin-left: auto; 
                        margin-right: auto; 
                        padding: 10mm; 
                        padding-left: 10mm; 
                        background: #ffffff; 
                        border: solid .5pt #000000; 
                        text-align: left; 
                    }
                    h2 {
                        text-align: center; 
                    }
                    table {
                        border: none; 
                        vertical-align: top; 
                    }
                    td {
                        vertical-align: top; 
                    }
                    td.graphUnderline{
						border : none; 
                        border-bottom: 1px solid black; 
                        text-align: center; 
                    }
                    td.graph{
						border : none; 
                        font-size: 7pt; 
                        text-align: center; 
                        padding: 0; 
                        spacing: 0; 
                        white-space: normal; 
                    }
				</style>
         </head>
         <body>
            <xsl:apply-templates select="icd:InqChangeData"/>
         </body>
      </html>
   </xsl:template>
   <!--Шаблон для отображения времени по стандартам русской локали-->
   <xsl:template name="time">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 3, 1) = ':' and substring($text, 6, 1) = ':'">
            <xsl:value-of select="substring($text, 1, 5)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Шаблон для отображения даты по стандартам русской локали-->
   <xsl:template name="date">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <xsl:value-of select="substring($text,9,2)"/>.<xsl:value-of select="substring($text,6,2)"/>.<xsl:value-of select="substring($text,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Шаблон для отображения даты и времени по стандартам русской локали-->
   <xsl:template name="numberDateTime">
      <table>
         <!--xsl:if test="icd:RegistrationNumber">
            <tr>
               <td class="graphUnderline">
                  <xsl:value-of select="icd:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td class="graph">№ уведомления</td>
            </tr>
         </xsl:if-->
         <tr>
            <td class="graphUnderline" style="white-space: nowrap; ">
               <xsl:call-template name="date">
                  <xsl:with-param name="text" select="icd:SendDate"/>
               </xsl:call-template>
            </td>
         </tr>
         <tr>
            <td class="graph">Дата направления</td>
         </tr>
         <xsl:if test="icd:SendTime">
            <tr>
               <td class="graphUnderline" style="white-space: nowrap; ">
                  <xsl:call-template name="time">
                     <xsl:with-param name="text" select="icd:SendTime"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td class="graph">Время направления</td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <!--Дата - представление для второй части номера таможенного документа (mmDDYY)-->
   <xsl:template name="DateForCustomsNumber">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text,5,1)='-' and substring($text,8,1)='-'">
            <xsl:value-of select="substring($text,9,2)"/>
            <xsl:value-of select="substring($text,6,2)"/>
            <xsl:value-of select="substring($text,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Шаблон для отображения информации о регистрационном номере-->
   <xsl:template match="icd:GTDNumber">
      <table>
         <tr>
            <td class="graphUnderline">
               <xsl:number format="00000001" value="cat_ru:CustomsCode"/>
               <xsl:text>/</xsl:text>
               <xsl:call-template name="DateForCustomsNumber">
                  <xsl:with-param name="text" select="cat_ru:RegistrationDate"/>
               </xsl:call-template>
               <xsl:text>/</xsl:text>
               <xsl:value-of select="cat_ru:GTDNumber"/>
            </td>
         </tr>
         <tr>
            <td class="graph">Номер обращения</td>
         </tr>
      </table>
   </xsl:template>
   <!--Шаблон для отображения информации об организации-->
   <xsl:template name="Organisation">
      <xsl:param name="base"/>
      <table style="width: 100%">
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="$base/cat_ru:OrganizationName"/>
               <xsl:if test="$base/cat_ru:ShortName">
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="$base/cat_ru:ShortName"/>
                  <xsl:text>)</xsl:text>
               </xsl:if>
            </td>
         </tr>
         <tr>
            <td class="graph">Наименование организации / ФИО физического лица</td>
         </tr>
         <xsl:if test="$base/cat_ru:RFOrganizationFeatures or $base/cat_ru:RKOrganizationFeatures or $base/cat_ru:RBOrganizationFeatures">
            <tr>
               <td class="graphUnderline">
                  <xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН: <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"> ИНН: <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"> КПП: <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:RKOrganizationFeatures/cat_ru:ITN"> ИТН: 
							<xsl:value-of select="$base/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
										<xsl:value-of select="$base/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
										<xsl:value-of select="$base/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
										<xsl:value-of select="$base/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:RBOrganizationFeatures/cat_ru:UNP"> УНП: <xsl:value-of select="$base/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:RKOrganizationFeatures/cat_ru:BIN"> БИН: <xsl:value-of select="$base/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:RKOrganizationFeatures/cat_ru:IIN"> ИИН: <xsl:value-of select="$base/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph">Реквизиты</td>
            </tr>
         </xsl:if>
         <xsl:if test="$base/cat_ru:OKPOID or $base/cat_ru:OKATOCode">
            <tr>
               <td class="graphUnderline">
                  <xsl:if test="$base/cat_ru:OKPOID">Код по ОКПО <xsl:value-of select="$base/cat_ru:OKPOID"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:OKATOCode"> Код по ОКАТО <xsl:value-of select="$base/cat_ru:OKATOCode"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph">Дополнительная информация</td>
            </tr>
         </xsl:if>
         <xsl:if test="$base/cat_ru:Contact/cat_ru:Phone or $base/cat_ru:Contact/cat_ru:Fax or $base/cat_ru:Contact/cat_ru:KPP">
            <tr>
               <td class="graphUnderline">
                  <xsl:if test="$base/cat_ru:Contact/cat_ru:Phone">тел.: <xsl:value-of select="$base/cat_ru:Contact/cat_ru:Phone"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:Contact/cat_ru:Fax"> факс <xsl:value-of select="$base/cat_ru:Contact/cat_ru:Fax"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:Contact/cat_ru:Telex"> телекс <xsl:value-of select="$base/cat_ru:Contact/cat_ru:Telex"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph">Контактная информация</td>
            </tr>
         </xsl:if>
         <xsl:if test="$base/cat_ru:Address">
            <tr>
               <td class="graphUnderline">
                  <xsl:if test="$base/cat_ru:Address/cat_ru:PostalCode">
                     <xsl:value-of select="$base/cat_ru:Address/cat_ru:PostalCode"/>
                     <xsl:text>, </xsl:text>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:Address/cat_ru:CounryName">
                     <xsl:value-of select="$base/cat_ru:Address/cat_ru:CounryName"/>
                     <xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:Address/cat_ru:CountryCode">
							(<xsl:value-of select="$base/cat_ru:Address/cat_ru:CountryCode"/>)
							<xsl:text>, </xsl:text>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:Address/cat_ru:Region">
                     <xsl:value-of select="$base/cat_ru:Address/cat_ru:Region"/>
                     <xsl:text>, </xsl:text>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:Address/cat_ru:City">
                     <xsl:value-of select="$base/cat_ru:Address/cat_ru:City"/>
                     <xsl:text>, </xsl:text>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:Address/cat_ru:StreetHouse">
                     <xsl:value-of select="$base/cat_ru:Address/cat_ru:StreetHouse"/>
                     <xsl:text>, </xsl:text>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph">Адрес организации / физического лица</td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <!-- Корневой элемент -->
   <xsl:template match="icd:InqChangeData">
      <div class="pageAlbum">
         <h2>Обращение об изменении, дополнении сведений, заявленных в декларации на товары</h2>
         <div style="float: left; ">
            <xsl:call-template name="numberDateTime"/>
         </div>
         <div style="float: right;  max-width: 120mm; ">
            <xsl:apply-templates select="icd:GTDNumber"/>
         </div>
         <div style="clear:both;  padding-top: 10pt; "/>
         <h3>Организация - резидент или нерезидент ОЭЗ</h3>
         <xsl:call-template name="Organisation">
            <xsl:with-param name="base" select="icd:Applicant"/>
         </xsl:call-template>
         <div style="clear: both;"/>
      </div>
   </xsl:template>
</xsl:stylesheet>
