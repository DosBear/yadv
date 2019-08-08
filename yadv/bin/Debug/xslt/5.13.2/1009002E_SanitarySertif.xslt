<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="sas cat_ru catSert_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:sas="urn:customs.ru:Information:SertifDocuments:SanitarySertif:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="sas:SanitarySertif">
      <html>
         <head>
            <title>
               <xsl:choose>
                  <xsl:when test="sas:TypeOfSetif=1">Санитарно-эпидемиологическое заключение</xsl:when>
                  <xsl:otherwise>Гигиеническое заключение</xsl:otherwise>
                  <!--xsl:when test="sas:TypeOfSetif=0">Гигиеническое заключение</xsl:when-->
               </xsl:choose>
            </title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    table {
                        border: 0;
                        cellpadding: 0;
                        cellspacing: 0;
                        width: 100%;
                        border-collapse: collapse;
                    }

                    td {
                        font-size: 6.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                        padding-left: 4pt
                    }

                    td.bold {
                        font-size: 8.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: bottom;
                        /*white-space: nowrap;*/
                    }

                    td.value {
                        font-size: 10.0pt;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                    }

                    td.border-bottom {
                        border-left: medium none;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    span.bold {
                        font-size: 12.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                    }

                    span.value {
                        font-size: 12.0pt;
                    }

                    div.page {
                        width: 210mm;
                        height: 297mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    p.number-date {
                        font-weight: bold;
                    }

                    .bordered {
                        border: solid 1pt #000000;
                        padding-top: 4pt;
                        padding-bottom: 4pt;
                    }

                    .underlined {
                        border-bottom: solid 0.8pt #000000;
                    }

                    .graph {
                        font-family: Arial;
                        font-size: 10pt;
                    }

                    .graph-number {
                        font-size: 9pt;
                        font-weight: bold;
                    }

                    @media print {
                        div.page {
                            border: none;
                        }
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <p style="padding-top: 50pt;">ГОСУДАРСТВЕННАЯ САНИТАРНО-ЭПИДЕМИОЛОГИЧЕСКАЯ СЛУЖБА
                        <br/>
                        РОССИЙСКОЙ ФЕДЕРАЦИИ
                        <br/>
                        ГЛАВНЫЙ ГОСУДАРСТВЕННЫЙ САНИТАРНЫЙ ВРАЧ
                    </p>
               <table>
                  <tr>
                     <td align="center" class="border-bottom" style="width:180mm;" width="100%">
                        <span class="value">
                           <xsl:apply-templates mode="CommaSeparated" select="sas:SertifOrganization/sas:PostalAddress/cat_ru:Region | sas:SertifOrganization/sas:OrganizationName"/>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" width="100%">
                                (наименование территории, ведомства)
                            </td>
                  </tr>
               </table>
               <br/>
               <xsl:choose>
                  <xsl:when test="sas:TypeOfSetif=1">САНИТАРНО-ЭПИДЕМИОЛОГИЧЕСКОЕ ЗАКЛЮЧЕНИЕ</xsl:when>
                  <xsl:otherwise>Гигиеническое заключение</xsl:otherwise>
				  <!--xsl:when test="sas:TypeOfSetif=0">Гигиеническое заключение</xsl:when-->
               </xsl:choose>
               <br/>
               <br/>
                    №
                    <xsl:value-of select="sas:SertifNumber"/> от
                    <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="sas:BeginDate"/>
               </xsl:call-template>
               <p/>
               <p align="left">
                  <span class="value">Настоящим санитарно-эпидемиологическим заключением удостоверяется, что
                            производство, применение (использование)
                            и реализация новых видов продукции; продукция, ввозимая на территорию Российской Федерации
                        </span>
                  <br/>
                  <span class="graph">
                     <xsl:apply-templates select="sas:Goods/sas:GoodsDescription"/>
                  </span>
               </p>
               <br/>
               <p align="left">
                  <span class="value">изготовленная в соответствии</span>
                  <br/>
                  <span class="graph">
                     <xsl:apply-templates select="sas:Contract"/>
                  </span>
               </p>
               <br/>
               <p align="left">
                  <span class="value">СООТВЕТСТВУЕТ государственным санитарно-эпидемиологическим
                            правилам и нормативам (ненужное зачеркнуть, указать полное наименование санитарных правил)
                        </span>
                  <br/>
                  <span class="graph">
                     <xsl:for-each select="sas:Goods/sas:NormTechDocs">
                        <xsl:value-of select="."/>
                        <xsl:text>, </xsl:text>
                     </xsl:for-each>
                     <br/>
                     <xsl:for-each select="sas:Goods/sas:SanitaryRegulations">
                        <xsl:value-of select="."/>
                        <xsl:text>, </xsl:text>
                     </xsl:for-each>
                  </span>
               </p>
               <p>
                  <br/>
                  <br/>
                  <br/>
               </p>
               <p align="left">
                  <span class="value">Организация-изготовитель</span>
                  <br/>
                  <span class="graph">
                     <xsl:for-each select="sas:ManufacturerInf">
						<xsl:apply-templates select="."/>
                        <!--xsl:value-of select="cat_ru:OrganizationName"/>
                        <xsl:text>, </xsl:text>
                        <xsl:if test="catSert_ru:LegalAddress/RUScat_ru:CountryCode">(<xsl:value-of select="catSert_ru:LegalAddress/RUScat_ru:CountryCode"/>) </xsl:if>
                        <xsl:value-of select="catSert_ru:LegalAddress/RUScat_ru:CounryName"/-->
                     </xsl:for-each>
                  </span>
               </p>
               <p align="left">
                  <span class="value">Получатель санитарно-эпидемиологического заключения</span>
                  <br/>
                  <span class="graph">
                     <xsl:apply-templates select="sas:SertifRecipient"/>
                  </span>
               </p>
               <p align="left">
                  <span class="value">Основанием для признания продукции, соответствующей (не соответствующей)
                            государственным санитарно-эпидемиологическим правилам и нормативам являются (перечислить
                            рассмотренные протоколы исследований,
                            наименование учреждения, проводившего исследования, другие рассмотренные документы);
                        </span>
                  <br/>
                  <span class="graph">
                     <xsl:for-each select="sas:Goods/sas:InvestigProtocols">
                        <xsl:value-of select="."/>
                        <br/>
                     </xsl:for-each>
                     <xsl:if test="sas:NormDocsOrganization">
                        <!--xsl:value-of select="sas:NormDocsOrganization/cat_ru:OrganizationName"/-->
                        <xsl:apply-templates select="sas:NormDocsOrganization"/>
                     </xsl:if>
                  </span>
               </p>
               <br/>
               <br/>
               <br/>
               <br/>
               <br/>
               <br/>
               <br/>
               <br/>
               <br/>
               <br/>
               <br/>
               <p align="center">
                  <span class="value">№<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="sas:FormNumber"/>
                  </span>
               </p>
            </div>
            <div class="page">
               <p style="page-break-before: always;">
                        Гигиеническая характеристика продукции
                    </p>
               <br/>
               <table>
                  <tr>
                     <td align="center" class="value" width="50%">
                                Вещества,
                                <br/>
                                показатели (факторы)
                            </td>
                     <td align="center" class="value" width="50%">
                                Гигиенический
                                <br/>
                                норматив
                                <br/>
                                (СанПиН, МДУ, ПДК и т.д.)
                            </td>
                  </tr>
                  <tr>
                     <td width="50%">
                        <span class="graph">
                           <xsl:for-each select="sas:Goods/sas:SanitaryCharachter">
                              <xsl:value-of select="."/>
                              <br/>
                           </xsl:for-each>
                        </span>
                     </td>
                     <td width="50%"/>
                  </tr>
               </table>
               <p>
                  <br/>
                  <br/>
               </p>
               <p align="left">
                  <span class="value">Область применения:</span>
                  <br/>
                  <span class="graph">
                     <xsl:value-of select="sas:Goods/sas:FieldOfUse"/>
                     <br/>
                  </span>
               </p>
               <p align="left">
                  <span class="value">Необходимые условия использования, хранения, транспортировки и меры
                            безопасности:
                        </span>
                  <br/>
                  <span class="graph">
                     <xsl:value-of select="sas:Goods/sas:ReqConditions"/>
                     <br/>
                  </span>
               </p>
               <p align="left">
                  <span class="value">Информация, наносимая на этикетку:</span>
                  <br/>
                  <span class="graph">
                     <xsl:value-of select="sas:Goods/sas:LabelInf"/>
                     <br/>
                  </span>
               </p>
               <p align="left">
                  <span class="value">Приложение к заключению:</span>
                  <br/>
                  <span class="graph">
                     <xsl:for-each select="sas:SertifSupplement/sas:SupplementText">
                        <xsl:value-of select="."/>
                     </xsl:for-each>
                     <br/>
                  </span>
               </p>
               <p align="left">
                  <span class="value">Заключение действительно до :</span>
                  <br/>
                  <span class="graph">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="sas:EndDate"/>
                     </xsl:call-template>
                     <br/>
                  </span>
               </p>
               <p>
                  <br/>
               </p>
               <p align="left">
                  <span class="value">
                     <i>
                        <xsl:value-of select="sas:DocumentSignature/cat_ru:PersonPost"/>
                     </i>
                  </span>
                  <br/>
                  <xsl:value-of select="sas:DocumentSignature/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="sas:DocumentSignature/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="sas:DocumentSignature/cat_ru:PersonMiddleName"/>
                  <br/>
               </p>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="sas:Contract">
      <xsl:value-of select="cat_ru:PrDocumentName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
        №<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PrDocumentNumber"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>от<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template match="sas:SertifRecipient|sas:ManufacturerInf|sas:NormDocsOrganization">
      <xsl:value-of select="cat_ru:OrganizationName"/>
	  <xsl:if test="catSert_ru:LegalAddress/RUScat_ru:CountryCode"> (<xsl:value-of select="catSert_ru:LegalAddress/RUScat_ru:CountryCode"/>) </xsl:if>
      <br/>
	  <xsl:if test="catSert_ru:OKPOID">Код организации по ОКПО:
			<xsl:value-of select="catSert_ru:OKPOID"/>
		  <br/>
	  </xsl:if>
	  <xsl:if test="catSert_ru:LegalAddress">Юридический адрес:<br/></xsl:if>
      <xsl:for-each select="catSert_ru:LegalAddress">
		  <xsl:apply-templates select="."/>
		  <br/>
	  </xsl:for-each>
	  <xsl:if test="catSert_ru:FactAddress">Фактический адрес:<br/></xsl:if>
      <xsl:for-each select="catSert_ru:FactAddress">
		  <xsl:apply-templates select="."/>
		  <br/>
	  </xsl:for-each>
	  <xsl:if test="catSert_ru:Phone">Тел.: 
		<xsl:for-each select="catSert_ru:Phone">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<br/>
	  </xsl:if>	
	  <xsl:if test="catSert_ru:Fax">Факс: 
		<xsl:for-each select="catSert_ru:Fax">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<br/>
	  </xsl:if>	
	  <xsl:if test="catSert_ru:Email">Email: 
		<xsl:for-each select="catSert_ru:Email">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<br/>
	  </xsl:if>	
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <xsl:value-of select="cat_ru:PostalCode"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:City"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:StreetHouse"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:CounryName"/>
   </xsl:template>
   <xsl:template match="*" mode="CommaSeparated">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="catSert_ru:LegalAddress| catSert_ru:FactAddress">
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
		<!-- xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode"-->
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<!--xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if-->
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	  </xsl:template>
</xsl:stylesheet>
