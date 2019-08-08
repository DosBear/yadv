<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mtc="urn:customs.ru:Information:SQDocuments:RosTrudConfirmation:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="mtc:RosTrudConfirmation">
      <html>
         <head>
            <title>Подтверждение Федеральной службы по труду и занятости  целевого назначения материалов и предметов для слепых и других лиц с физическими или умственными недостатками, ввозимых на территорию РФ
			</title>
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
							font-size: 10pt;
							}
				.graph1 {
							font-family: Arial;
							font-size: 8pt;
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
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Подтверждение Федеральной службы по труду и занятости  целевого назначения материалов и предметов 
					для слепых и других лиц с физическими или умственными недостатками, ввозимых на территорию Российской Федерации<br/>№ <u>
                                 <xsl:if test="mtc:ConfirmationInfo/cat_ru:PrDocumentNumber">
                                    <xsl:value-of select="mtc:ConfirmationInfo/cat_ru:PrDocumentNumber"/>
                                 </xsl:if>
                              </u>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="graph" style="border:solid 0pt" width="60%"> </td>
                     <td align="center" class="graph" style="border:solid 0pt">от <xsl:if test="mtc:ConfirmationInfo/cat_ru:PrDocumentDate">
                           <u>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="mtc:ConfirmationInfo/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </u>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt" width="55%"> </td>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <u>
                           <xsl:value-of select="mtc:Customs/cat_ru:Code"/> 
					    <xsl:if test="mtc:Customs/cat_ru:OfficeName">
                              <xsl:value-of select="mtc:Customs/cat_ru:OfficeName"/>
                           </xsl:if>
                        </u>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt" width="60%"> </td>
                     <td align="center" class="graph1" style="border:solid 0pt">(наименование таможенного органа)</td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt" width="60%">
                        <xsl:if test="mtc:ConfirmationInfo/cat_ru:PrDocumentName">
                           <xsl:value-of select="mtc:ConfirmationInfo/cat_ru:PrDocumentName"/>
                        </xsl:if>
                     </td>
                     <td align="center" class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Федеральная служба по труду и занятости на основании документов, представленных <u>
                           <xsl:apply-templates select="mtc:Importer"/>
                        </u>, </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph1" style="border:solid 0pt">(наименование, ИНН импортера)</td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">подтверждает, что ввозимый в Российскую Федерацию (получаемый) товар:</td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <table>
                           <tr>
                              <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">№</td>
                              <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">Наименование (описание) товара</td>
                              <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">Количество товара</td>
                              <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">Страна<br/>происхож-<br/>дения</td>
                              <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">Дополнительная<br/>информация</td>
                           </tr>
                           <tr>
                              <td align="center" class="graph" style="border:solid 1pt #000000">в осн.<br/>ед. изм.</td>
                              <td align="center" class="graph" style="border:solid 1pt #000000">в доп.<br/>ед. изм.</td>
                           </tr>
                           <xsl:for-each select="mtc:Goods">
                              <tr>
                                 <td align="center" class="graph" style="border:solid 1pt #000000">
                                    <xsl:value-of select="position()"/>
                                 </td>
                                 <td class="graph" style="border:solid 1pt #000000">
                                    <xsl:for-each select="mtc:GoodsDescription">
                                       <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td align="center" class="graph" style="border:solid 1pt #000000">
                                    <xsl:value-of select="mtc:GoodsQuantity/cat_ru:GoodsQuantity"/>
                                    <xsl:if test="mtc:GoodsQuantity/cat_ru:MeasureUnitQualifierName">
										 <xsl:value-of select="mtc:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
									</xsl:if>
                                    <xsl:if test="mtc:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"> (код
                                       <xsl:value-of select="mtc:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)
                                    </xsl:if>
                                 </td>
                                 <td align="center" class="graph" style="border:solid 1pt #000000">
                                    <xsl:if test="mtc:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity">
                                       <xsl:value-of select="mtc:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
                                    </xsl:if>
                                    <xsl:if test="mtc:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName">
										 <xsl:value-of select="mtc:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
									</xsl:if>
									<xsl:if test="mtc:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"> (код 
                                       <xsl:value-of select="mtc:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)
                                    </xsl:if>
                                 </td>
                                 <td align="center" class="graph" style="border:solid 1pt #000000">
                                    <xsl:value-of select="mtc:OriginCountryCode"/>
                                 </td>
                                 <td class="graph" style="border:solid 1pt #000000">
                                    <xsl:if test="mtc:AdditionalInfo">
                                       <xsl:value-of select="mtc:AdditionalInfo"/>
                                    </xsl:if>
                                 </td>
                              </tr>
                           </xsl:for-each>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">по контракту <u>
                           <xsl:if test="mtc:Contract/cat_ru:PrDocumentName">
                              <xsl:value-of select="mtc:Contract/cat_ru:PrDocumentName"/> </xsl:if>
                           <xsl:if test="mtc:Contract/cat_ru:PrDocumentNumber">№<xsl:value-of select="mtc:Contract/cat_ru:PrDocumentNumber"/> </xsl:if>
                           <xsl:if test="mtc:Contract/cat_ru:PrDocumentDate">
						(<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="mtc:Contract/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>) 
						</xsl:if>
                           <xsl:if test="mtc:Contract/mtc:SupplementaryContract">
						Дополнение (спецификация) к контракту: 
						<xsl:for-each select="mtc:Contract/mtc:SupplementaryContract">
                                 <xsl:if test="cat_ru:PrDocumentName">
                                    <xsl:value-of select="cat_ru:PrDocumentName"/> </xsl:if>
                                 <xsl:if test="cat_ru:PrDocumentNumber">№<xsl:value-of select="cat_ru:PrDocumentNumber"/> </xsl:if>
                                 <xsl:if test="cat_ru:PrDocumentDate">
						(от <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>)</xsl:if>
                                 <xsl:if test="position()!=last()">; </xsl:if>
                              </xsl:for-each>
                           </xsl:if>
                        </u>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph1" style="border:solid 0pt">(номер и дата, а также дополнений к нему и спецификаций при наличии)</td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">предназначен для обеспечения прогресса слепых и других лиц с физическими и умственными недостатками и подпадает под действие Соглашения о ввозе материалов образовательного, научного и культурного характера от 22 ноября 1950 г. и Протокола к нему от 26 ноября 1976 г.</td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <u>
                           <xsl:for-each select="mtc:AgreementParagraph">
                              <xsl:value-of select="."/>
                              <xsl:if test="position()!=last()"> </xsl:if>
                           </xsl:for-each>
                        </u>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph1" style="border:solid 0pt">(пункт приложения к Соглашению или приложения к Протоколу)</td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="graph" style="border:solid 0pt" width="20%">Уполномоченное лицо</td>
                     <td class="graph" style="border:solid 0pt" width="7%"> </td>
                     <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;" width="25%"> </td>
                     <td class="graph" style="border:solid 0pt" width="7%"> </td>
                     <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;" width="41%">
                        <xsl:value-of select="mtc:AuthorizedPerson/cat_ru:PersonSurname"/> 
						<xsl:value-of select="mtc:AuthorizedPerson/cat_ru:PersonName"/>
                        <xsl:if test="mtc:AuthorizedPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="mtc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
                        </xsl:if>
                        <xsl:if test="mtc:AuthorizedPerson/cat_ru:PersonPost"> (<xsl:value-of select="mtc:AuthorizedPerson/cat_ru:PersonPost"/>)</xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                     <td class="graph" style="border:solid 0pt"> </td>
                     <td align="center" class="graph" style="border:solid 0pt">(подпись)</td>
                     <td class="graph" style="border:solid 0pt"> </td>
                     <td align="center" class="graph" style="border:solid 0pt">(расшифровка подписи)
						</td>
                  </tr>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">М.П.</td>
                     <td class="graph" colspan="4" style="border:solid 0pt"> </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
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
   <xsl:template match="mtc:Importer">
      <!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if> 
	
	<xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <!--	<xsl:if test="cat_ru:Address">
		<xsl:apply-templates select="cat_ru:Address"/>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCard">
		<xsl:apply-templates select="cat_ru:IdentityCard"/>
	</xsl:if>	-->
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <!--<xsl:if test="cat_ru:OGRN">
		<span>ОГРН: <xsl:value-of select="cat_ru:OGRN" /></span>&#160;
	</xsl:if>-->
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span> 
	</xsl:if>
      <!--<xsl:if test="cat_ru:KPP">
		<span>	КПП: <xsl:value-of select="cat_ru:KPP" /></span>&#160;
	</xsl:if>-->
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span> 
	</xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span> 
	</xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span> 
	</xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span> 
	</xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span> 
	</xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <span class="header">Адрес:</span> 
	<xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode"> Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
	 
</xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span> 
	<xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode"> </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
		 
	</xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
