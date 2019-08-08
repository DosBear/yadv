<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mc="urn:customs.ru:Information:SQDocuments:MediaCertificate:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="mc:MediaCertificate">
      <html>
         <head>
            <title>Информация из свидетельств СМИ</title>
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
                           <b>Информация из свидетельств СМИ</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="mc:MediaName">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>
                              <xsl:value-of select="mc:MediaName"/>
                           </u>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mc:AdvertisementPercent">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Процент рекламы: 
				<xsl:value-of select="mc:AdvertisementPercent"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mc:Periodicity">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Периодичность: 
				<xsl:value-of select="mc:Periodicity"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mc:Specialty">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Специализация: 
				<xsl:value-of select="mc:Specialty"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mc:Append">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Наличие, наименование и количество приложений: 
				<xsl:value-of select="mc:Append"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Свидетельство СМИ: 
				<xsl:if test="mc:Certificate/cat_ru:PrDocumentName">
                           <xsl:value-of select="mc:Certificate/cat_ru:PrDocumentName"/>
                        </xsl:if>
                        <xsl:if test="mc:Certificate/cat_ru:PrDocumentNumber"> №<xsl:value-of select="mc:Certificate/cat_ru:PrDocumentNumber"/>
                        </xsl:if>
                        <xsl:if test="mc:Certificate/cat_ru:PrDocumentDate"> (<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="mc:Certificate/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>)</xsl:if>
                     </td>
                  </tr>
                  <xsl:if test="mc:Language">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Язык: 
				<xsl:for-each select="mc:Language">
                              <xsl:if test="mc:Name">
                                 <xsl:value-of select="mc:Name"/> </xsl:if>
                              <xsl:if test="mc:Code">
				(<xsl:value-of select="mc:Code"/>)</xsl:if>
                              <xsl:if test="position()!=last()">; </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mc:Founder">
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Учредитель СМИ:</u>
                           <br/>
                           <xsl:for-each select="mc:Founder">
                              <xsl:apply-templates select="."/>
                              <br/>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mc:EditorialAddress">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Адрес редакции СМИ</u>:<br/>
                           <xsl:apply-templates select="mc:EditorialAddress"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mc:MediaTopic">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Тематика: 
				<xsl:for-each select="mc:MediaTopic">
                              <xsl:if test="mc:Name">
                                 <xsl:value-of select="mc:Name"/> </xsl:if>
                              <xsl:if test="mc:Code">
				(<xsl:value-of select="mc:Code"/>)</xsl:if>
                              <xsl:if test="position()!=last()">; </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mc:DistributionForm">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Форма распространения: 
				<xsl:for-each select="mc:DistributionForm">
                              <xsl:if test="mc:Name">
                                 <xsl:value-of select="mc:Name"/> </xsl:if>
                              <xsl:if test="mc:Code">
				(<xsl:value-of select="mc:Code"/>)</xsl:if>
                              <xsl:if test="position()!=last()">; </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mc:DistributionTerritory">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Территория распространения: 
				<xsl:if test="mc:DistributionTerritory/mc:RegionName">
                              <xsl:value-of select="mc:DistributionTerritory/mc:RegionName"/>
                           </xsl:if>
                           <xsl:if test="mc:DistributionTerritory/mc:RegionCode"> (<xsl:value-of select="mc:DistributionTerritory/mc:RegionCode"/>)</xsl:if>
                           <xsl:if test="mc:DistributionTerritory/mc:Comment">
                              <br/>Комментарий: 
				<xsl:value-of select="mc:DistributionTerritory/mc:Comment"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mc:ReferenceDoc">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Свидетельство СМИ: 
				<xsl:if test="mc:ReferenceDoc/cat_ru:PrDocumentName">
                              <xsl:value-of select="mc:ReferenceDoc/cat_ru:PrDocumentName"/>
                           </xsl:if>
                           <xsl:if test="mc:ReferenceDoc/cat_ru:PrDocumentNumber"> №<xsl:value-of select="mc:ReferenceDoc/cat_ru:PrDocumentNumber"/>
                           </xsl:if>
                           <xsl:if test="mc:ReferenceDoc/cat_ru:PrDocumentDate"> (<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="mc:ReferenceDoc/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>)</xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
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
   <xsl:template match="mc:Founder">
      <!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
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
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
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
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address | mc:EditorialAddress">
      <span class="header">Адрес:</span>
      <br/>
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
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>
      <br/>
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
      <br/>
   </xsl:template>
   <xsl:template match="mc:EditorialAddress">
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
      <br/>
   </xsl:template>
</xsl:stylesheet>
