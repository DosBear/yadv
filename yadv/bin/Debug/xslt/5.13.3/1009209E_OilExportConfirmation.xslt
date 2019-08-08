<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:oic="urn:customs.ru:Information:SQDocuments:OilExportConfirmation:5.13.2">
 <!-- Шаблон для типа OilExportConfirmationType -->
<xsl:template match="oic:OilExportConfirmation">
<html><head>
            <title>Результат обработки запроса справки о подтверждении соответствия сведений об экспорте нефти сырой (стабильного газового конденсата) с определенными физико-химическими характеристиками графику транспортировка нефти (стабильного газового конденсата)
			</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #cccccc;
				}

				div
				{
				white-space: normal;
				}

				div.page {
					width: 210mm;
					max-width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
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
                           <b>Результат обработки запроса справки о подтверждении соответствия сведений об экспорте нефти сырой (стабильного газового конденсата) с определенными физико-химическими характеристиками графику транспортировка нефти (стабильного газового конденсата)</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"><span class="header">Информация о справке: </span>
						<xsl:apply-templates select="oic:Reference"/>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"><span class="header">Получатель:</span>
				<xsl:apply-templates select="oic:Recipient"/>
                     </td>
                  </tr>
                  <!--tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr-->
                  <tr>
                     <td class="graph" style="border:solid 0pt"><span class="header">Сведения о поставке:</span><br/>
                        <table>
                           <xsl:if test="oic:PhysicoChemicalCharacteristics">
                              <tr>
                                 <td width="35%" class="graph" style="border:solid 1pt">Физико-химические характеристики нефти сырой (стабильного газового конденсата)</td>
                                 <td width="65%" class="graph" style="border:solid 1pt">
									<xsl:for-each select="oic:PhysicoChemicalCharacteristics">
										<xsl:apply-templates select="."/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td width="35%" class="graph" style="border:solid 1pt">Прериод поставки:</td>
                              <td width="65%" class="graph" style="border:solid 1pt"><br/></td>
                           </tr>
                           <tr>
                              <td class="graph" style="border:solid 1pt">&#160;&#160;&#160;Год</td>
                              <td class="graph" style="border:solid 1pt">
                                 <xsl:value-of select="oic:DeliveryPeriod/oic:Year"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="border:solid 1pt">&#160;&#160;&#160;Квартал</td>
                              <td class="graph" style="border:solid 1pt">
                                 <xsl:value-of select="oic:DeliveryPeriod/oic:Quarter"/>
                              </td>
                           </tr>
							<xsl:if test="oic:DeliveryPeriod/oic:FirstMonth">
								<tr>
									<td class="graph" style="border:solid 1pt">&#160;&#160;&#160;1-й месяц</td>
									<td class="graph" style="border:solid 1pt">
										<xsl:value-of select="oic:DeliveryPeriod/oic:FirstMonth"/>
									</td>
								</tr>
							</xsl:if>	
							<xsl:if test="oic:DeliveryPeriod/oic:SecondMonth">
								<tr>
									<td class="graph" style="border:solid 1pt">&#160;&#160;&#160;2-й месяц</td>
									<td class="graph" style="border:solid 1pt">
										<xsl:value-of select="oic:DeliveryPeriod/oic:SecondMonth"/>
									</td>
								</tr>
							</xsl:if>	
							<xsl:if test="oic:DeliveryPeriod/oic:ThirdMonth">
								<tr>
									<td class="graph" style="border:solid 1pt">&#160;&#160;&#160;3-й месяц</td>
									<td class="graph" style="border:solid 1pt">
										<xsl:value-of select="oic:DeliveryPeriod/oic:ThirdMonth"/>
									</td>
								</tr>
							</xsl:if>	
                           <tr>
                              <td class="graph" style="border:solid 1pt">Объем поставки (тонны):</td>
                              <td class="graph" style="border:solid 1pt"><br/></td>
                           </tr>
							<xsl:if test="oic:DeliveryScope/oic:Quarter">
								<tr>
									<td class="graph" style="border:solid 1pt">&#160;&#160;&#160;Всего за квартал</td>
									<td class="graph" style="border:solid 1pt">
										<xsl:value-of select="oic:DeliveryScope/oic:Quarter"/>
									</td>
								</tr>
							</xsl:if>	
							<xsl:if test="oic:DeliveryScope/oic:FirstMonth">
								<tr>
									<td class="graph" style="border:solid 1pt">&#160;&#160;&#160;за 1-й месяц</td>
									<td class="graph" style="border:solid 1pt">
										<xsl:value-of select="oic:DeliveryScope/oic:FirstMonth"/>
									</td>
								</tr>
							</xsl:if>	
							<xsl:if test="oic:DeliveryScope/oic:SecondMonth">
								<tr>
									<td class="graph" style="border:solid 1pt">&#160;&#160;&#160;за 2-й месяц</td>
									<td class="graph" style="border:solid 1pt">
										<xsl:value-of select="oic:DeliveryScope/oic:SecondMonth"/>
									</td>
								</tr>
							</xsl:if>	
							<xsl:if test="oic:DeliveryScope/oic:ThirdMonth">
								<tr>
									<td class="graph" style="border:solid 1pt">&#160;&#160;&#160;за 3-й месяц</td>
									<td class="graph" style="border:solid 1pt">
										<xsl:value-of select="oic:DeliveryScope/oic:ThirdMonth"/>
									</td>
								</tr>
							</xsl:if>	
                           <tr>
                              <td class="graph" style="border:solid 1pt">Наименование месторождения</td>
                              <td class="graph" style="border:solid 1pt">
                                 <xsl:value-of select="oic:Deposit"/>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="oic:Recipient">
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
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="oic:Reference">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
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
</xsl:stylesheet>