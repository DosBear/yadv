<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ml="urn:customs.ru:Information:WarehouseDocuments:MistakeLetter:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="ml:MistakeLetter">
      <html>
         <head>
            <title>Письмо владельца СВХ о самостоятельно выявленных ошибках в отчетности по форме ДО-1</title>
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
                     <td align="center" class="graph" colspan="100%" style="border:solid 0pt">
                        <font face="Times new roman" size="5">
                           <b>
                              <xsl:if test="ml:LetterDetails/ml:LetterName">
                                 <xsl:value-of select="ml:LetterDetails/ml:LetterName"/> 
					</xsl:if>№<xsl:value-of select="ml:LetterDetails/ml:LetterNumber"/>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Порядковый номер <u>
                           <xsl:value-of select="ml:LetterDetails/ml:LetterOrderNumber"/>
                        </u>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Сведения об отчете о принятии по форме ДО-1, в отношении которого составлено настоящее Письмо:
						№<xsl:value-of select="ml:DO1Report/catWH_ru:ReportNumber"/> от
						<xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="ml:DO1Report/catWH_ru:ReportDate"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <b>Данные о владельце склада:</b>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <xsl:apply-templates select="ml:WarehouseOwner"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
						Документ, на основании которого разрешено временное хранение:
						<xsl:value-of select="ml:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind"/> 
						№<xsl:value-of select="ml:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/> 
						<xsl:if test="ml:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ml:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate"/>
                           </xsl:call-template>
                        </xsl:if>
                     </td>
                  </tr>
                  <xsl:if test="ml:WarehouseOwner/catWH_ru:WarehousePerson">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Представитель СВХ:
						<u>
                              <xsl:apply-templates select="ml:WarehouseOwner/catWH_ru:WarehousePerson"/>
                           </u>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">Сведения о выявленных ошибках</td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Дата:
						<xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="ml:MistakesInfo/ml:Date"/>
                        </xsl:call-template> 
					    <xsl:value-of select="ml:MistakesInfo/ml:Time"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Описание причин ошибок и обстоятельств их выявления:
					    <xsl:for-each select="ml:MistakesInfo/ml:Reasons">
                           <xsl:value-of select="."/>
                           <xsl:if test="position()!=last()"> </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="ml:MistakesInfo/ml:MistakesDescription/ml:CustomsDocsMistakes">
                     <tr>
                        <td align="center" class="graph" style="border:solid 0pt">Ошибки в реквизитах таможенных документов</td>
                     </tr>
                     <xsl:for-each select="ml:MistakesInfo/ml:MistakesDescription/ml:CustomsDocsMistakes">
                        <xsl:call-template name="H1"/>
                     </xsl:for-each>
                     <tr>
                        <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ml:MistakesInfo/ml:MistakesDescription/ml:CommercialDocsMistakes">
                     <tr>
                        <td align="center" class="graph" style="border:solid 0pt">Ошибки в реквизитах коммерческих документов</td>
                     </tr>
                     <xsl:for-each select="ml:MistakesInfo/ml:MistakesDescription/ml:CommercialDocsMistakes">
                        <xsl:call-template name="H1"/>
                     </xsl:for-each>
                     <tr>
                        <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ml:MistakesInfo/ml:MistakesDescription/ml:TransportDocsMistakes">
                     <tr>
                        <td align="center" class="graph" style="border:solid 0pt">Ошибки в реквизитах транспортных документов (в накладных)</td>
                     </tr>
                     <xsl:for-each select="ml:MistakesInfo/ml:MistakesDescription/ml:TransportDocsMistakes">
                        <xsl:call-template name="H1"/>
                     </xsl:for-each>
                     <tr>
                        <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
               </table>
               <table>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <u>
                           <xsl:if test="ml:WareHousePerson/cat_ru:PersonPost">
                              <xsl:value-of select="ml:WareHousePerson/cat_ru:PersonPost"/> </xsl:if>
                           <xsl:value-of select="ml:WareHousePerson/cat_ru:PersonSurname"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="ml:WareHousePerson/cat_ru:PersonName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="ml:WareHousePerson/cat_ru:PersonMiddleName"/>
                        </u>
                     </td>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <u>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ml:LetterDetails/ml:LetterDate"/>
                           </xsl:call-template>
                        </u>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">(уполномоченный сотрудник от получателя)</td>
                     <td align="center" class="graph" style="border:solid 0pt">(дата оформления документа)</td>
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
   <xsl:template match="ml:WarehouseOwner">
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
      <xsl:if test="catWH_ru:Address">
         <xsl:apply-templates select="catWH_ru:Address"/>
      </xsl:if>
      <!--xsl:if test="RUScat_ru:IdentityCard">
         <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
      </xsl:if>
      <xsl:if test="catWH_ru:IdentityCard">
         <xsl:apply-templates select="catWH_ru:IdentityCard"/>
      </xsl:if-->
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span> 
	</xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span> 
	</xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span> 
	</xsl:if>
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
   <xsl:template match="catWH_ru:Address">
      <span class="header">Адрес:</span> 
	<xsl:if test="cat_ru:PostalCode"> Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
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
      <xsl:if test="catWH_ru:AddressLine"> Информация об адресе: <xsl:value-of select="catWH_ru:AddressLine"/>
      </xsl:if>
	 
</xsl:template>
   <xsl:template match="RUScat_ru:IdentityCard | catWH_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span> 
	<xsl:if test="RUScat_ru:IdentityCardName">
         <xsl:value-of select="RUScat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode"> </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
         </span>
		 
	</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="RUScat_ru:OrganizationName"/>
		 
	</xsl:if>
	 
</xsl:template>
   <xsl:template match="catWH_ru:WarehousePerson | ml:WareHousePerson">
      <xsl:value-of select="cat_ru:PersonSurname"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonMiddleName"/>
      <xsl:if test="cat_ru:PersonPost">, должность - <xsl:value-of select="cat_ru:PersonPost"/>
      </xsl:if>
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
   <xsl:template name="H1">
      <tr>
         <td class="graph" style="border:solid 0pt">
            <table>
               <tr>
                  <td class="graph" colspan="3" style="border:solid 0pt">Порядковый номер документа в соответствующем списке документов отчета о принятии по форме ДО-1:
									<xsl:value-of select="ml:PrDocumentOrderNumber"/>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph" style="border:solid 1pt #000000">Описание выявленных ошибок</td>
                  <td align="center" class="graph" style="border:solid 1pt #000000">Ошибочное значение, указанное в отчете по форме ДО-1</td>
                  <td align="center" class="graph" style="border:solid 1pt #000000">Правильное значение</td>
               </tr>
               <xsl:if test="ml:DocModeCodeMistake">
                  <tr>
                     <td class="graph" style="border:solid 1pt #000000">Ошибка в коде вида документа</td>
                     <td align="center" class="graph" style="border:solid 1pt #000000">
                        <xsl:if test="ml:DocModeCodeMistake/ml:CodeMistakeValue">
                           <xsl:value-of select="ml:DocModeCodeMistake/ml:CodeMistakeValue"/>
                        </xsl:if>
                     </td>
                     <td align="center" class="graph" style="border:solid 1pt #000000">
                        <xsl:if test="ml:DocModeCodeMistake/ml:CodeValidValue">
                           <xsl:value-of select="ml:DocModeCodeMistake/ml:CodeValidValue"/>
                        </xsl:if>
                     </td>
                  </tr>
               </xsl:if>
               <xsl:if test="ml:DocNameMistake">
                  <tr>
                     <td class="graph" style="border:solid 1pt #000000">Ошибка в наименовании документа</td>
                     <td class="graph" style="border:solid 1pt #000000">
                        <xsl:if test="ml:DocNameMistake/ml:NameMistakeValue">
                           <xsl:value-of select="ml:DocNameMistake/ml:NameMistakeValue"/>
                        </xsl:if>
                     </td>
                     <td class="graph" style="border:solid 1pt #000000">
                        <xsl:if test="ml:DocNameMistake/ml:NameValidValue">
                           <xsl:value-of select="ml:DocNameMistake/ml:NameValidValue"/>
                        </xsl:if>
                     </td>
                  </tr>
               </xsl:if>
               <xsl:if test="ml:DocNumberMistake">
                  <tr>
                     <td class="graph" style="border:solid 1pt #000000">Ошибка в номере документа</td>
                     <td align="center" class="graph" style="border:solid 1pt #000000">
                        <xsl:if test="ml:DocNumberMistake/ml:NumberMistakeValue">
                           <xsl:value-of select="ml:DocNumberMistake/ml:NumberMistakeValue"/>
                        </xsl:if>
                     </td>
                     <td align="center" class="graph" style="border:solid 1pt #000000">
                        <xsl:value-of select="ml:DocNumberMistake/ml:NumberValidValue"/>
                     </td>
                  </tr>
               </xsl:if>
               <xsl:if test="ml:DocDateMistake">
                  <tr>
                     <td class="graph" style="border:solid 1pt #000000">Ошибка в дате документа</td>
                     <td align="center" class="graph" style="border:solid 1pt #000000">
                        <xsl:if test="ml:DocDateMistake/ml:DateMistakeValue">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ml:DocDateMistake/ml:DateMistakeValue"/>
                           </xsl:call-template>
                        </xsl:if>
                     </td>
                     <td align="center" class="graph" style="border:solid 1pt #000000">
                        <xsl:if test="ml:DocDateMistake/ml:DateValidValue">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ml:DocDateMistake/ml:DateValidValue"/>
                           </xsl:call-template>
                        </xsl:if>
                     </td>
                  </tr>
               </xsl:if>
               <xsl:if test="ml:WaybillRegNumberMistake">
                  <tr>
                     <td class="graph" style="border:solid 1pt #000000">Ошибка в регистрационном номере накладной</td>
                     <td class="graph" style="border:solid 1pt #000000">
                        <xsl:if test="ml:WaybillRegNumberMistake/ml:MistakeValue">
                           <xsl:value-of select="ml:WaybillRegNumberMistake/ml:MistakeValue/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="ml:WaybillRegNumberMistake/ml:MistakeValue/cat_ru:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="ml:WaybillRegNumberMistake/ml:MistakeValue/cat_ru:GTDNumber"/>
                           <br/>Порядковый номер по журналу регистрации: <xsl:value-of select="ml:WaybillRegNumberMistake/ml:MistakeValue/catWH_ru:WaybillNumPP"/>
                        </xsl:if>
                     </td>
                     <td class="graph" style="border:solid 1pt #000000">
                        <xsl:if test="ml:WaybillRegNumberMistake/ml:ValidValue">
                           <xsl:value-of select="ml:WaybillRegNumberMistake/ml:ValidValue/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="ml:WaybillRegNumberMistake/ml:ValidValue/cat_ru:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="ml:WaybillRegNumberMistake/ml:ValidValue/cat_ru:GTDNumber"/>
                           <br/>Порядковый номер по журналу регистрации: <xsl:value-of select="ml:WaybillRegNumberMistake/ml:ValidValue/catWH_ru:WaybillNumPP"/>
                        </xsl:if>
                     </td>
                  </tr>
               </xsl:if>
            </table>
         </td>
      </tr>
      <tr>
         <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
      </tr>
   </xsl:template>
</xsl:stylesheet>
