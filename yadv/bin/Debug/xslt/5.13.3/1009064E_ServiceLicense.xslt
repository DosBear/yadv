<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:sl="urn:customs.ru:Information:SQDocuments:ServiceLicense:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="sl:ServiceLicense">
      <html>
         <head>
            <title>Сведения из лицензии на осуществление перевозок воздушным транспортом грузов и пассажиров для юр. лиц/из реестра сертификатов на обслуживание и ремонт авиационной техники, в том числе авиационной техники двойного назначения/о наличии лицензии на право осуществления страховой деятельности/из реестра лицензий на деятельность по перевозкам внутренним водным транспортом, морским транспортом опасных грузов/из удостоверения допуска к осуществлению международных автомобильных перевозок</title>
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
                     <td align="center" class="graph" colspan="2" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Сведения
						<xsl:if test="sl:DocSign=1"> из лицензии на осуществление перевозок воздушным транспортом грузов и пассажиров для юр. лиц</xsl:if>
                              <xsl:if test="sl:DocSign=2"> из реестра сертификатов на обслуживание и ремонт авиационной техники, в том числе авиационной техники двойного назначения</xsl:if>
                              <xsl:if test="sl:DocSign=3"> о наличии лицензии на право осуществления страховой деятельности</xsl:if>
                              <xsl:if test="sl:DocSign=4"> из реестра лицензий на деятельность по перевозкам внутренним водным транспортом, морским транспортом опасных грузов</xsl:if>
                              <xsl:if test="sl:DocSign=5"> из удостоверения допуска к осуществлению международных автомобильных перевозок</xsl:if>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph" colspan="2" style="border:solid 0pt">Решение 
						<xsl:if test="sl:DecisionNum"> №<xsl:value-of select="sl:DecisionNum"/>
                        </xsl:if>
                        <xsl:if test="sl:DecisionDate"> 
						(<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="sl:DecisionDate"/>
                           </xsl:call-template>)
						</xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">Орган власти:<br/>
                        <xsl:if test="sl:AuthorityOrg">
                           <xsl:apply-templates select="sl:AuthorityOrg"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">Сведения о лицензии/сертификате:
						<xsl:if test="sl:License/cat_ru:PrDocumentName">
                           <xsl:value-of select="sl:License/cat_ru:PrDocumentName"/>
                        </xsl:if>
                        <xsl:if test="sl:License/cat_ru:PrDocumentNumber"> №<xsl:value-of select="sl:License/cat_ru:PrDocumentNumber"/>
                        </xsl:if>
                        <xsl:if test="sl:License/cat_ru:PrDocumentDate"> 
						(<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="sl:License/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>)</xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 1pt">Дата начала действия документа</td>
                     <td class="graph" style="border:solid 1pt">
                        <xsl:if test="sl:License/sl:BeginDate">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="sl:License/sl:BeginDate"/>
                           </xsl:call-template>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 1pt">Дата окончания действия документа</td>
                     <td class="graph" style="border:solid 1pt">
                        <xsl:if test="sl:License/sl:ExpirationDate">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="sl:License/sl:ExpirationDate"/>
                           </xsl:call-template>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 1pt">Номер документа (сертификата) в госреестре</td>
                     <td class="graph" style="border:solid 1pt">
                        <xsl:if test="sl:License/sl:DocReestrNum">
                           <xsl:value-of select="sl:License/sl:DocReestrNum"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 1pt">Дата первоначальной выдачи (сертификата)</td>
                     <td class="graph" style="border:solid 1pt">
                        <xsl:if test="sl:License/sl:OriginalIssueDate">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="sl:License/sl:OriginalIssueDate"/>
                           </xsl:call-template>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 1pt">Серия документа</td>
                     <td class="graph" style="border:solid 1pt">
                        <xsl:if test="sl:License/sl:LicenseSeries">
                           <xsl:value-of select="sl:License/sl:LicenseSeries"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 1pt">Наименование лицензируемого вида деятельности</td>
                     <td class="graph" style="border:solid 1pt">
                        <xsl:if test="sl:License/sl:LicensedServiceName">
                           <xsl:value-of select="sl:License/sl:LicensedServiceName"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 1pt">Код лицензируемого вида деятельности</td>
                     <td class="graph" style="border:solid 1pt">
                        <xsl:if test="sl:License/sl:LicensedServiceCode">
                           <xsl:value-of select="sl:License/sl:LicensedServiceCode"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 1pt">Информация о продлении документа</td>
                     <td class="graph" style="border:solid 1pt">
                        <xsl:if test="sl:License/sl:ProlongDate">
                           <xsl:value-of select="sl:License/sl:ProlongDate"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 1pt">Информация о наличии приложения к документу:</td>
                     <td class="graph" style="border:solid 1pt">
                        <xsl:if test="sl:License/sl:Append='1' or sl:License/sl:Append='t' or sl:License/sl:Append='true'">есть</xsl:if>
                        <xsl:if test="sl:License/sl:Append='0' or sl:License/sl:Append='f' or sl:License/sl:Append='false'">нет</xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">Лицензиат/Сертифицируемое лицо:<br/>
                        <xsl:apply-templates select="sl:Licensee"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">Уполномоченное лицо  
						<u>
                           <xsl:value-of select="sl:AuthorizedPerson/cat_ru:PersonSurname"/> 
						<xsl:value-of select="sl:AuthorizedPerson/cat_ru:PersonName"/>
                           <xsl:if test="sl:AuthorizedPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="sl:AuthorizedPerson/cat_ru:PersonMiddleName"/>
                           </xsl:if>
                           <xsl:if test="sl:AuthorizedPerson/cat_ru:PersonPost"> (<xsl:value-of select="sl:AuthorizedPerson/cat_ru:PersonPost"/>)</xsl:if>
                        </u>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">Описание деятельности:<br/>
                        <table>
                           <tr>
                              <td align="center" class="graph" style="border:solid 1pt">Наименование вида деятельности (обслуживания)</td>
                              <td align="center" class="graph" style="border:solid 1pt">Код вида деятельности</td>
                              <td align="center" class="graph" style="border:solid 1pt">Наименование типа авиатехники</td>
                              <td align="center" class="graph" style="border:solid 1pt">Код типа авиатехники</td>
                           </tr>
                           <xsl:for-each select="sl:ServiceDescription">
                              <tr>
                                 <td class="graph" style="border:solid 1pt">
                                    <xsl:if test="sl:ServiceName">
                                       <xsl:value-of select="sl:ServiceName"/>
                                    </xsl:if>
                                 </td>
                                 <td class="graph" style="border:solid 1pt">
                                    <xsl:if test="sl:ServiceCode">
                                       <xsl:value-of select="sl:ServiceCode"/>
                                    </xsl:if>
                                 </td>
                                 <td class="graph" style="border:solid 1pt">
                                    <xsl:if test="sl:AerotechnicsName">
                                       <xsl:value-of select="sl:AerotechnicsName"/>
                                    </xsl:if>
                                 </td>
                                 <td class="graph" style="border:solid 1pt">
                                    <xsl:if test="sl:AerotechnicsTypeCode">
                                       <xsl:value-of select="sl:AerotechnicsTypeCode"/>
                                    </xsl:if>
                                 </td>
                              </tr>
                           </xsl:for-each>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">Место осуществления деятельности:<br/>
                        <xsl:for-each select="sl:ServicePlace">
                           <xsl:value-of select="position()"/>. 
						<xsl:apply-templates select="."/>
                        </xsl:for-each>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="sl:AuthorityOrg | sl:Licensee">
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
      <!--xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if-->
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
   <xsl:template match="cat_ru:Address">
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
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
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
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
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
   <xsl:template match="sl:ServicePlace">
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
