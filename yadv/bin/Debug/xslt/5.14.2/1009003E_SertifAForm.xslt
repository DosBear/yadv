<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="saf cat_ru catSert_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:saf="urn:customs.ru:Information:SertifDocuments:SertifAForm:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn, 5, 1)='-' and substring($dateIn, 8, 1)='-'">
            <xsl:value-of select="substring($dateIn, 9, 2)"/>.<xsl:value-of select="substring($dateIn, 6, 2)"/>.<xsl:value-of select="substring($dateIn, 1, 4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="saf:SertifAForm">
      <html>
         <head>
            <title>Сертификат о происхождении товаров по форме "A"</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    table {
                        border: 0;
                        cellpadding: 3;
                        cellspacing: 0;
                        width: 100%;
                        border-collapse: collapse;
                    }

                    td {
                        font-size: 12.0pt;
                        font-family: Courier, sans-serif;
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
                        font-size: 12.0pt;
                        font-family: Courier;
                        color: windowtext;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                    }

                    td.border-left {
                        border-left: medium none;
                        border-right: .5pt solid black;
                    }

                    td.border {
                        border-left: .5pt solid windowtext;
                        border-right: .5pt solid windowtext;
                        border-top: .5pt solid windowtext;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-left {
                        border-left: .5pt solid windowtext;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: medium none;
                    }

                    td.border-right {
                        border-left: medium none;
                        border-right: .5pt solid windowtext;
                        border-top: medium none;
                        border-bottom: medium none;
                    }

                    td.border-top {
                        border-left: medium none;
                        border-right: medium none;
                        border-top: .5pt solid windowtext;
                        border-bottom: medium none;
                    }

                    td.border-bottom {
                        border-left: medium none;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-top-bottom {
                        border-left: medium none;
                        border-right: medium none;
                        border-top: .5pt solid windowtext;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-top-right {
                        border-left: medium none;
                        border-right: .5pt solid windowtext;
                        border-top: .5pt solid windowtext;
                        border-bottom: medium none;
                    }

                    td.border-top-right-bottom {
                        border-left: medium none;
                        border-right: .5pt solid windowtext;
                        border-top: .5pt solid windowtext;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-left-right-bottom {
                        border-left: .5pt solid windowtext;
                        border-right: .5pt solid windowtext;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-left-right-top {
                        border-left: .5pt solid windowtext;
                        border-right: .5pt solid windowtext;
                        border-top: .5pt solid windowtext;
                        border-bottom: medium none;
                    }

                    td.border-right-bottom {
                        border-left: medium none;
                        border-right: .5pt solid windowtext;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-left-bottom {
                        border-left: .5pt solid windowtext;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-left-right {
                        border-left: .01pt solid #000001;
                        border-right: .01pt solid #000001;
                        border-top: medium none;
                        border-bottom: medium none;
                    }

                    td.border-left-top {
                        border-left: .5pt solid windowtext;
                        border-right: medium none;
                        border-top: .5pt solid windowtext;
                        border-bottom: medium none;
                    }

                    td.border-right-top {
                        border-left: medium none;
                        border-right: .5pt solid windowtext;
                        border-top: .5pt solid windowtext;
                        border-bottom: medium none;
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
                        font-family: Courier;
                        color: windowtext;
                    }

                    div.page {
                        width: 210mm;
                        height: 297mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
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
                        font-family: Courier;
                        font-size: 12.0pt;
                    }

                    .graph-number {
                        font-size: 9pt;
                        font-weight: bold;
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <table border="1" cellpadding="3" cellspacing="0">
                  <tr>
                     <td colspan="3" height="86" width="355">
                                1. Goods consigned from (exporter's business name, address, country)
                                <br/>
                        <span class="value">
                           <xsl:apply-templates select="saf:Consignor"/>
                        </span>
                     </td>
                     <td class="value" colspan="4" height="171" rowspan="2" width="382">
                                Reference No
                                <xsl:value-of select="saf:RegistrationDocument/cat_ru:PrDocumentNumber"/>
                        <br/>
                        <p align="center">
                           <span>GENERALIZED SYSTEM OF PREFERENCES
                                        <br/>
                                        CERTIFICATE OF ORIGIN
                                        <br/>
                                        (Combined declaration and certificate)
                                        <br/>
                                        FORM A
                                    </span>
                           <br/>
                                    Issued in
                                    <u>
                              <xsl:value-of select="saf:CountryCode"/>
                           </u>
                           <br/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <span class="graph">(country)</span>
                        </p>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3" height="85" width="355">
                                2. Goods consigned to (consignee's name, address, country)
                                <br/>
                        <xsl:if test="saf:ConsigneeName">
                           <span class="value">
                              <xsl:apply-templates select="saf:ConsigneeName"/>
                           </span>
                        </xsl:if>
                        <xsl:if test="saf:ConsigneeCountry">
                           <span class="value">
                              <xsl:value-of select="saf:ConsigneeCountry/saf:CountryCode"/>
                           </span>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3" height="188" width="355">
                                3. Means of transport and route (as far as known)
                                <br/>
                        <span class="value">
                           <xsl:apply-templates select="saf:Route"/>
                        </span>
                     </td>
                     <td colspan="4" height="188" width="382">
                                4. For official use
                                <br/>
                        <span class="value">
                           <xsl:apply-templates select="saf:SpecialComments"/>
                           <xsl:apply-templates select="saf:AnnuledSertifAForm"/>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td height="73" width="5%">5. Item<br/>number
                            </td>
                     <td height="73" width="10%">6. Marks and
                                <br/>
                                numbers of
                                <br/>
                                packadeges
                            </td>
                     <td colspan="2" height="73" style="width:80mm;" width="50%">7. Number and kind of packages;
                                description of goods
                            </td>
                     <td height="73" width="10%">8. Origin
                                <br/>
                                criterion
                                <br/>
                                (see notes
                                <br/>
                                overleaf)
                            </td>
                     <td height="73" width="10%">9. Gross weight
                                <br/>
                                or other
                                <br/>
                                quantity
                            </td>
                     <td height="73" width="10%">10. Number<br/>and date of<br/>invoices</td>
                  </tr>
                  <xsl:for-each select="saf:Goods">
                     <tr>
                        <td class="border-left-right" width="39">
                           <span class="value">
                              <xsl:value-of select="saf:GoodsNumeric"/>
                           </span>
                        </td>
                        <td class="border-left-right" width="118">
                           <span class="value">
                              <xsl:value-of select="saf:Marking"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="saf:PlacesQuantity"/>
                           </span>
                        </td>
                        <td class="border-left-right" colspan="2" width="304">
                           <span class="value">
                              <xsl:for-each select="saf:GoodsDescription">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                           </span>
                        </td>
                        <td class="border-left-right" width="97">
                           <span class="value">
                              <xsl:value-of select="saf:OriginCriterionCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="saf:PercentPart"/>%
                                    </span>
                        </td>
                        <td class="border-left-right" width="96">
                           <span class="value">
                          <!-- <xsl:if test="saf:GrossWeightQuantity">
                              <xsl:value-of select="saf:GrossWeightQuantity"/>KGS</xsl:if>-->
                              <xsl:choose>
								  <xsl:when test="saf:GrossWeightQuantity"><xsl:value-of select="saf:GrossWeightQuantity"/>
								  <xsl:if test="saf:GoodsQuantity">, <xsl:value-of select="saf:GoodsQuantity"/> <xsl:if test="saf:MeasureUnitQualifierCode">(<xsl:value-of select="saf:MeasureUnitQualifierCode"/>)</xsl:if></xsl:if>
								   <xsl:if test="saf:SupplementaryGoodsQuantity">, <xsl:value-of select="saf:SupplementaryGoodsQuantity"/> <xsl:if test="saf:SupplementaryMeasureUnitQualifierCode">(<xsl:value-of select="saf:SupplementaryMeasureUnitQualifierCode"/>)</xsl:if></xsl:if>
								  </xsl:when>
								  <xsl:when test="not(saf:GrossWeightQuantity) and saf:GoodsQuantity"><xsl:value-of select="saf:GoodsQuantity"/> <xsl:if test="saf:MeasureUnitQualifierCode">(<xsl:value-of select="saf:MeasureUnitQualifierCode"/>)</xsl:if> <xsl:if test="saf:SupplementaryGoodsQuantity">, <xsl:value-of select="saf:SupplementaryGoodsQuantity"/> <xsl:if test="saf:SupplementaryMeasureUnitQualifierCode">(<xsl:value-of select="saf:SupplementaryMeasureUnitQualifierCode"/>)</xsl:if></xsl:if>
								  </xsl:when>
								 <xsl:when test="not(saf:GrossWeightQuantity) and not(saf:GoodsQuantity) and saf:SupplementaryGoodsQuantity"><xsl:value-of select="saf:SupplementaryGoodsQuantity"/> <xsl:if test="saf:SupplementaryMeasureUnitQualifierCode">(<xsl:value-of select="saf:SupplementaryMeasureUnitQualifierCode"/>)</xsl:if>
								  </xsl:when>
								  <xsl:otherwise>Отсутствие сведений в оригинале документа</xsl:otherwise>
								</xsl:choose>
                                    </span>
                        </td>
                        <td class="border-left-right" width="83">
                           <span class="value">
                              <xsl:for-each select="saf:GoodsInvoice | //saf:SertifAForm/saf:Invoice">
                                 <xsl:if test="position() > 1">
                                    <br/>
                                 </xsl:if>
                                 <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </xsl:for-each>
                           </span>
                        </td>
                     </tr>
                  </xsl:for-each>
                  <tr>
                     <td colspan="3" height="96" width="355">
                        <span class="value">11. Certification</span>
                        <br/>
                                It is hereby certified, on the basis of control carried out, that
                                <br/>
                                the declaration by the exporter is correct.
                                <br/>
                        <p/>
                        <span class="value">
                           <xsl:value-of select="saf:RegistrationDocument/saf:Place"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="saf:RegistrationDocument/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <br/>
                           <xsl:value-of select="saf:RegistrationDocument/saf:Agency"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <br/>
                           <xsl:if test="saf:RegistrationDocument/saf:AuthSign/cat_ru:PersonSurname">
                              <xsl:value-of select="saf:RegistrationDocument/saf:AuthSign/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="saf:RegistrationDocument/saf:AuthSign/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="saf:RegistrationDocument/saf:AuthSign/cat_ru:PersonMiddleName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:if>
                           <xsl:if test="saf:RegistrationDocument/saf:AuthSign/cat_ru:PersonPost">
                                        /<xsl:value-of select="saf:RegistrationDocument/saf:AuthSign/cat_ru:PersonPost"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>/
                                    </xsl:if>
                           <xsl:if test="saf:RegistrationDocument/saf:AuthSign/cat_ru:IssueDate">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="saf:RegistrationDocument/saf:AuthSign/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </span>
                     </td>
                     <td colspan="4" height="96" width="382">
                        <span class="value">12. Declaration by the exporter</span>
                        <br/>
                                The undersigned hereby declares that the above details and
                                <br/>
                                statements are correct; that all the goods were
                                <br/>
                                produced in
                                <span class="value">
                           <u>
                              <xsl:value-of select="saf:CountryOriginName"/>
                           </u>
                        </span>
                        <br/>
                                and that they comply with the origin requirements specified
                                <br/>
                                for those goods in the generalized system of preferences for
                                <br/>
                                goods exported to
                                <span class="value">
                           <u>
                              <xsl:value-of select="saf:DestinationCountryName"/>
                           </u>
                        </span>
                        <p/>
                        <span class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="saf:FilledDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="saf:Place"/>
                           <br/>
                           <xsl:if test="saf:ExportSign/cat_ru:PersonName">
                              <xsl:value-of select="saf:ExportSign/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="saf:ExportSign/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="saf:ExportSign/cat_ru:PersonMiddleName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:if>
                           <xsl:if test="saf:ExportSign/cat_ru:PersonPost">
                                        /<xsl:value-of select="saf:ExportSign/cat_ru:PersonPost"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>/
                                    </xsl:if>
                           <xsl:if test="saf:ExportSign/cat_ru:IssueDate">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="saf:ExportSign/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </span>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="saf:Consignor | saf:ConsigneeName">
      <xsl:value-of select="cat_ru:OrganizationName"/>
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
   <xsl:template match="catSert_ru:LegalAddress">
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
		<!--xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode"-->
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO">
			<xsl:text> (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<!--xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if-->
			<xsl:text>)</xsl:text>
		</xsl:if>
   </xsl:template>
   <xsl:template match="saf:AnnuledSertifAForm">
      <br/>
      <xsl:value-of select="cat_ru:PrDocumentName"/>
      <xsl:text> </xsl:text>
      <xsl:if test="cat_ru:PrDocumentNumber">
		  № <xsl:value-of select="cat_ru:PrDocumentNumber"/>
		  <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
		  <xsl:text>от </xsl:text>
		  <xsl:call-template name="russian_date">
			  <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
		  </xsl:call-template>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
