<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catExch_ru cat_ru cddr" version="1.0" xmlns:catExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonAggregateTypes:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cddr="urn:customs.ru:Information:ExchangeDocuments:ConfirmDeclDocsRecip:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 1.2 от 19.11.2007.   -->
   <xsl:template match="/">
      <html>
         <head>
			 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
         </head>
         <body>
            <table border="1">
               <tbody>
                  <tr>
                     <td align="center" width="146">
                        <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
                           <xsl:for-each select="cddr:SendDate">
                              <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                           </xsl:for-each>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="substring(cddr:SendTime,12,8)"/>
                        </xsl:for-each>  
                               <!--
								   <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
                                        <xsl:value-of select="format-number(substring(substring-before(., ':'), string-length(substring-before(., ':')) - 1), '00')" />
                                        <xsl:text>:</xsl:text>
                                        <xsl:value-of select="format-number(substring-before(substring-after(., ':'), ':'), '00')" />
                                        <xsl:text>:</xsl:text>
                                        <xsl:choose>
                                            <xsl:when test="contains(., 'Z')">
                                                <xsl:value-of select="format-number(substring-after(substring-before(., 'Z'), ':'), '00')" />
                                            </xsl:when>
                                            <xsl:when test="contains(., '+')">
                                                <xsl:value-of select="format-number(substring-after(substring-after(substring-before(., '+'), ':'), ':'), '00')" />
                                            </xsl:when>
                                            <xsl:when test="contains(substring-after(substring-after(., ':'), ':'), '-')">
                                                <xsl:value-of select="format-number(substring-before(substring-after(substring-after(., ':'), ':'), '-'), '00')" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="format-number(substring-after(substring-after(., ':'), ':'), '00')" />
                                            </xsl:otherwise>
                                        </xsl:choose>
									</xsl:for-each>
								-->
                       </td>
                  </tr>
               </tbody>
            </table>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:medium; font-weight:bold; ">Подтверждение получения документов</span>
                     </td>
                  </tr>
                  <tr>
                     <td align="center"/>
                  </tr>
               </tbody>
            </table>
            <br/>
            <xsl:if test="string-length(  cddr:ConfirmDeclDocsRecip/cddr:Comments  )  = 0">Ваше уведомление получено.</xsl:if>
            <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
               <xsl:for-each select="cddr:Comments">
                  <xsl:apply-templates/>
               </xsl:for-each>
            </xsl:for-each>
            <br/>
            <br/>Получены документы:  <br/>
            <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
               <table border="0" frame="void">
                  <tbody>
                     <xsl:for-each select="cddr:RecipDocument">
                        <tr>
                           <td>
                              <xsl:for-each select="cat_ru:PrDocumentName">
                                 <xsl:apply-templates/>
                              </xsl:for-each> <xsl:if test="cat_ru:PrDocumentNumber  != 'б/н'">№ <xsl:for-each select="cat_ru:PrDocumentNumber">
                                    <xsl:apply-templates/>
                                 </xsl:for-each>
                              </xsl:if> от <xsl:for-each select="cat_ru:PrDocumentDate">
                                 <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                                 <xsl:text>.</xsl:text>
                                 <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                                 <xsl:text>.</xsl:text>
                                 <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                              </xsl:for-each> 
                                        <xsl:for-each select="catExch_ru:RecipTime">
                                 <xsl:apply-templates/>
                                 <!--
                                            <xsl:value-of select="format-number(substring(substring-before(., ':'), string-length(substring-before(., ':')) - 1), '00')" />
                                            <xsl:text>:</xsl:text>
                                            <xsl:value-of select="format-number(substring-before(substring-after(., ':'), ':'), '00')" />
                                            <xsl:text>:</xsl:text>
                                            <xsl:choose>
                                                <xsl:when test="contains(., 'Z')">
                                                    <xsl:value-of select="format-number(substring-after(substring-before(., 'Z'), ':'), '00')" />
                                                </xsl:when>
                                                <xsl:when test="contains(., '+')">
                                                    <xsl:value-of select="format-number(substring-after(substring-after(substring-before(., '+'), ':'), ':'), '00')" />
                                                </xsl:when>
                                                <xsl:when test="contains(substring-after(substring-after(., ':'), ':'), '-')">
                                                    <xsl:value-of select="format-number(substring-before(substring-after(substring-after(., ':'), ':'), '-'), '00')" />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="format-number(substring-after(substring-after(., ':'), ':'), '00')" />
                                                </xsl:otherwise>
                                            </xsl:choose>
											-->
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <xsl:if test="cddr:DeclDecision">
                  <table border="0" width="100%">
                     <tbody>
                        <tr>
                           <td width="55%">Присутствие декларанта на досмотре(осмотре):</td>
                           <td width="5%">да</td>
                           <td align="center" style="width:3%;border:solid 1.5pt #000000;" valign="middle">
                              <xsl:choose>
                                 <xsl:when test="(number(cddr:DeclDecision/cddr:DeclAgree)=1) or (cddr:DeclDecision/cddr:DeclAgree='t') or(cddr:DeclDecision/cddr:DeclAgree='true') ">
                                    <span class="graphBold">х</span>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td width="37%">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									Декларант согласен прибыть на досмотр
									<xsl:if test="cddr:DeclDecision/cddr:DeclDate">: <u>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cddr:DeclDecision/cddr:DeclDate"/>
                                    </xsl:call-template> 
										<xsl:value-of select="substring(cddr:DeclDecision/cddr:DeclTime,1,5)"/>
                                 </u>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="3" width="55%"> </td>
                           <td>
                              <xsl:if test="cddr:DeclDecision/cddr:InspectionPlace">
									Код таможенного органа: <xsl:value-of select="cddr:DeclDecision/cddr:InspectionPlace/cat_ru:Code"/>
                                 <xsl:if test="cddr:DeclDecision/cddr:InspectionPlace/cat_ru:OfficeName">
                                    <br/>
							Наименование таможенного органа: <xsl:value-of select="cddr:DeclDecision/cddr:InspectionPlace/cat_ru:OfficeName"/>
                                    <br/>
                                 </xsl:if>
                                 <br/>Вид информации о месте досмотра (осмотра):
									<xsl:choose>
                                    <xsl:when test="cddr:DeclDecision/cddr:InspectionPlace/cddr:InformationTypeCode = 11">СВХ</xsl:when>
                                    <xsl:when test="cddr:DeclDecision/cddr:InspectionPlace/cddr:InformationTypeCode = 21">ТС</xsl:when>
                                    <xsl:when test="cddr:DeclDecision/cddr:InspectionPlace/cddr:InformationTypeCode = 25">Свободный склад</xsl:when>
                                    <xsl:when test="cddr:DeclDecision/cddr:InspectionPlace/cddr:InformationTypeCode = 31">Склад получателя</xsl:when>
                                    <xsl:when test="cddr:DeclDecision/cddr:InspectionPlace/cddr:InformationTypeCode = 39">Склад иной</xsl:when>
                                    <xsl:when test="cddr:DeclDecision/cddr:InspectionPlace/cddr:InformationTypeCode = 51">Ж/д / название ж/д станции</xsl:when>
                                    <xsl:otherwise>Местонахождение ЗТК (адрес)</xsl:otherwise>
                                 </xsl:choose>
                                 <br/>
                    Наименование места досмотра: <xsl:value-of select="cddr:DeclDecision/cddr:InspectionPlace/cddr:InspPlaceName"/> <br/>
                                 <xsl:if test="cddr:DeclDecision/cddr:InspectionPlace/cddr:InspPlaceDesc">
                    Описание места проведения досмотра(осмотра). Иная информация о месте досмотра:<xsl:text> </xsl:text>
                                    <xsl:for-each select="cddr:DeclDecision/cddr:InspectionPlace/cddr:InspPlaceDesc">
                                       <xsl:value-of select="."/> 
									</xsl:for-each>
                                    <xsl:text> </xsl:text>
                                 </xsl:if>
                                 <xsl:apply-templates select="cddr:DeclDecision/cddr:InspectionPlace/cddr:WarehousePlace"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:apply-templates select="cddr:DeclDecision/cddr:InspectionPlace/cddr:InspAddress"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td width="55%">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td width="5%">нет</td>
                           <td align="center" style="width:3%;border:solid 1.5pt #000000;" valign="middle">
                              <xsl:choose>
                                 <xsl:when test="(number(cddr:DeclDecision/cddr:DeclAgree)=0) or (cddr:DeclDecision/cddr:DeclAgree='f') or(cddr:DeclDecision/cddr:DeclAgree='false') ">
                                    <span class="graphBold">х</span>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td width="37%">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </xsl:if>
            </xsl:for-each>   <br/>
            <br/>
            <hr color="black" size="1"/>
            <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
               <xsl:for-each select="cddr:DeclPerson">
                  <xsl:for-each select="cat_ru:PersonSurname">
                     <xsl:apply-templates/>
                  </xsl:for-each>
                  <xsl:text> </xsl:text>
                  <xsl:for-each select="cat_ru:PersonName">
                     <xsl:apply-templates/>
                  </xsl:for-each>
                  <xsl:text> </xsl:text>
                  <xsl:for-each select="cat_ru:PersonMiddleName">
                     <xsl:apply-templates/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>
            <br/>  <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
               <xsl:for-each select="cddr:DeclPerson">
                  <xsl:for-each select="cat_ru:PersonPost">
                     <xsl:apply-templates/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>
            <br/>  <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
               <xsl:for-each select="cddr:DeclPerson">
                  <xsl:for-each select="catExch_ru:AuthoritesDocument">
                     <xsl:for-each select="cat_ru:PrDocumentName">
                        <xsl:apply-templates/>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each> № <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
               <xsl:for-each select="cddr:DeclPerson">
                  <xsl:for-each select="catExch_ru:AuthoritesDocument">
                     <xsl:for-each select="cat_ru:PrDocumentNumber">
                        <xsl:apply-templates/>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each> от <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
               <xsl:for-each select="cddr:DeclPerson">
                  <xsl:for-each select="catExch_ru:AuthoritesDocument">
                     <xsl:for-each select="cat_ru:PrDocumentDate">
                        <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each> (до <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
               <xsl:for-each select="cddr:DeclPerson">
                  <xsl:for-each select="catExch_ru:AuthoritesDocument">
                     <xsl:for-each select="cat_ru:ComplationAuthorityDate">
                        <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>)
            <!--br />&#160; тел: <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
                    <xsl:for-each select="cddr:DeclPerson">
                        <xsl:for-each select="cat_ru:PhoneNumber">
                            <xsl:apply-templates />
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each-->
            <br/> <br/>
            <table border="0">
               <tbody>
                  <tr>
                     <td width="99">
                        <hr color="black" size="1"/>
                     </td>
                  </tr>
               </tbody>
            </table>
            <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
               <xsl:for-each select="cddr:Declarant">
                  <xsl:for-each select="cat_ru:OrganizationName">
                     <xsl:apply-templates/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each> (<xsl:for-each select="cddr:ConfirmDeclDocsRecip">
               <xsl:for-each select="cddr:Declarant">
                  <xsl:apply-templates select="cat_ru:Address"/>
               </xsl:for-each>
            </xsl:for-each>)<br/>  <xsl:if test="string-length(  cddr:ConfirmDeclDocsRecip/cddr:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:INN  )  != 0">ИНН <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
                  <xsl:for-each select="cddr:Declarant">
                     <xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:INN">
                        <xsl:apply-templates/>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:if>
            <br/>  <xsl:if test="string-length(  cddr:ConfirmDeclDocsRecip/cddr:Declarant/cat_ru:Contact/cat_ru:Phone )  != 0">тел: <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
                  <xsl:for-each select="cddr:Declarant">
                     <xsl:for-each select="cat_ru:Contact/cat_ru:Phone">
                        <xsl:apply-templates/>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:if> <xsl:if test="string-length(  cddr:ConfirmDeclDocsRecip/cddr:Declarant/cat_ru:Contact/cat_ru:Fax  )  != 0">факс: <xsl:for-each select="cddr:ConfirmDeclDocsRecip">
                  <xsl:for-each select="cddr:Declarant">
                     <xsl:for-each select="cat_ru:Contact/cat_ru:Fax">
                        <xsl:apply-templates/>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:if>
         </body>
      </html>
   </xsl:template>
	<xsl:template match="cddr:WarehousePlace">
		<xsl:choose>
			<xsl:when test="cddr:DocumentModeCode=1">Лицензия: </xsl:when>
			<xsl:when test="cddr:DocumentModeCode=2">Свидетельство: </xsl:when>
		</xsl:choose>
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
	</xsl:template>
   <xsl:template match="cat_ru:Address">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="cddr:InspAddress">
	   Адрес места досмотра: 
	   <xsl:if test="cat_ru:PostalCode"><xsl:value-of select="cat_ru:PostalCode"/></xsl:if>
	   <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">
		   <xsl:if test="cat_ru:PostalCode">, </xsl:if>
		   <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>) </xsl:if>
		   <xsl:value-of select="cat_ru:CounryName"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:Region">
		   <xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
		   <xsl:value-of select="cat_ru:Region"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:City">
		   <xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
		   <xsl:value-of select="cat_ru:City"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:StreetHouse">
		   <xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
		   <xsl:value-of select="cat_ru:StreetHouse"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:TerritoryCode">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City or cat_ru:StreetHouse">, </xsl:if>
		   <xsl:value-of select="cat_ru:TerritoryCode"/>
	   </xsl:if>
   </xsl:template>

   <xsl:template match="cat_ru:Address/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
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
   <xsl:template match="cddr:Address/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
