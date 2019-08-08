<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catSert_ru cat_ru fsc" version="1.0" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.13.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:fsc="urn:customs.ru:Information:SertifDocuments:FitoSanitaryCertificate:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="Date_2">
      <xsl:value-of select="substring (., 9, 2)"/>.
	  <xsl:value-of select="substring(., 6, 2)"/>.
	  <xsl:value-of select="substring(., 1, 4)"/>
   </xsl:template>
   <xsl:template match="fsc:FitoSanitaryCertificate">
      <html>
         <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
         <style type="text/css">
                    body {
                    background: #cccccc;
					}
                    div.page {
                        width: 210mm;
                        max-width: 210mm;
                        margin: 10px auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }

                    .graph10 {
                        font-family: Arial, serif;
                        font-size: 10pt;
                    }

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt; 
                        text-decoration:underline;
                    }

                    

                    td {border: 0px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    </style>
	<body>
	<div class="page">
         <table class="graph10" style="width:170mm">
            <tr>
               <td align="center" style="width:60mm">
                  <br>Федеральная служба</br>
                  <br>по ветеринарному и</br>
                  <br>фитосанитарному надзору</br>
               </td>
               <td style="width:50mm"/>
               <td align="center" style="width:60mm">
                  <br>Federal Service</br>
                  <br>for Veterinary and</br>
                  <br>Phytosanitary Surveillance</br>
                  <br>of the Russian Federation</br>
               </td>
            </tr>
         </table>
         <table align="center" class="graph12" style="width:170mm">
            <tr>
               <td align="center">ФИТОСАНИТАРНЫЙ СЕРТИФИКАТ № 
            <xsl:value-of select="fsc:CertNumber"/>
               </td>
            </tr>
            <tr>
               <td align="center">PHITOSANITARY CERTEFICATE</td>
            </tr>
         </table>
         <table class="graph10" style="width:170mm;">
            <tr>Кому: Организации (ям) по карантину и защите растений (страна)</tr>
            <tr>То: Plant Protection and Quarantine Organization of (country)</tr>
            <tr style="text-decoration:underline;">
               <xsl:for-each select="fsc:OrganizationQuarantine">
					<xsl:value-of select="fsc:CounryName"/>  
					<xsl:value-of select="fsc:Organization/cat_ru:OrganizationName"/>  
					<xsl:for-each select="fsc:Organization/catSert_ru:LegalAddress">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
               </xsl:for-each>
            </tr>
         </table>
         <table class="graph10" style="width: 170mm;">
            <tr align="center">
               <td colspan="2">
	I. Описание груза - Description of Consignment</td>
            </tr> 
<tr>
               <td style="width: 85mm;">Экспортер и его адрес</td>
               <td style="text-decoration:underline;width: 85mm;">
					<xsl:value-of select="fsc:DescriptionConsignment/fsc:Exporter/cat_ru:OrganizationName"/>, 
					<xsl:for-each select="fsc:DescriptionConsignment/fsc:Exporter/catSert_ru:LegalAddress">
						 <xsl:apply-templates select="."/>
						 <xsl:if test="position()!=last()">, </xsl:if>
					 </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td colspan="2">Name and address of exporter</td>
            </tr>
            <tr>
               <td>Заявленный получатель и его адрес</td>
               <td style="text-decoration:underline;">
                  <xsl:value-of select="fsc:DescriptionConsignment/fsc:Consignee/cat_ru:OrganizationName"/>, 
				  <xsl:for-each select="fsc:DescriptionConsignment/fsc:Consignee/catSert_ru:LegalAddress">
                     <xsl:apply-templates select="."/>
                     <xsl:if test="position()!=last()">, </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td colspan="2">Declared name and address of consignee</td>
            </tr>
            <tr>
               <td>Количество мест и описание упаковки</td>
               <td style="text-decoration:underline;">
                  <xsl:if test="fsc:DescriptionConsignment/fsc:Packaging">
                     <xsl:value-of select="fsc:DescriptionConsignment/fsc:Packaging/fsc:PlacesQiantity"/>,
	<xsl:if test="fsc:DescriptionConsignment/fsc:Packaging/fsc:PackingCode">
                        <xsl:value-of select="fsc:DescriptionConsignment/fsc:Packaging/fsc:PackingCode"/>
                     </xsl:if>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td colspan="2">Number and description of packages</td>
            </tr>
            <tr>
               <td>Отличительные знаки (маркировка)</td>
               <td style="text-decoration:underline;">
                  <xsl:for-each select="fsc:DescriptionConsignment/fsc:Excise">
                     <xsl:if test="fsc:ExciseSerieses">
                        <xsl:value-of select="fsc:ExciseSerieses"/>, 
	</xsl:if>
                     <xsl:value-of select="fsc:ExciseDescription"/> 
	</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td colspan="2">Distinguishing marks</td>
            </tr>
            <tr>
               <td>Место происхождения</td>
               <td style="text-decoration:underline;">
                  <xsl:value-of select="fsc:DescriptionConsignment/fsc:OriginCountryName"/>
               </td>
            </tr>
            <tr>
               <td colspan="2">Place of origin</td>
            </tr>
            <tr>
               <td>Заявленный способ транспортировки</td>
               <td style="text-decoration:underline;">
                  <xsl:value-of select="fsc:DescriptionConsignment/fsc:TransMeans"/>
               </td>
            </tr>
            <tr>
               <td colspan="2">Declared means of conveyance</td>
            </tr>
            <tr>
               <td>Заявленный пункт ввоза</td>
               <td style="text-decoration:underline;">
                  <xsl:if test="fsc:DescriptionConsignment/fsc:DeclaredPoint">
                     <xsl:value-of select="fsc:DescriptionConsignment/fsc:DeclaredPoint"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td colspan="2">Declared point of entry</td>
            </tr>
            <tr>
               <td>Наименование продукции  и  заявленное  количество/</td>
               <td style="text-decoration:underline;">
                  <xsl:for-each select="fsc:DescriptionConsignment/fsc:GoodsName">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
						 <xsl:value-of select="fsc:DescriptionConsignment/fsc:GoodsQuantity"/> 
						<xsl:value-of select="fsc:DescriptionConsignment/fsc:MeasureUnitQualifierName"/>
               </td>
            </tr>
            <tr>
               <td colspan="2">Name of  produce
and quantity declared</td>
            </tr>
            <tr>
               <td>Ботаническое название растений</td>
               <td style="text-decoration:underline;">
                  <xsl:if test="fsc:DescriptionConsignment/fsc:PlantName">
                     <xsl:value-of select="fsc:DescriptionConsignment/fsc:PlantName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td colspan="2">Botanical name of plants</td>
            </tr> 
				<tr>
               <td colspan="2">Настоящим   удостоверяется,   что растения, растительные  продукты
или   другие   подкарантинные   материалы,   описанные  выше, были
обследованы   и/или     проанализированы   согласно   существующим
официальным   процедурам   и    признаны свободными от карантинных
вредных организмов, перечисленных  импортирующей  договаривающейся
стороной,  и   отвечают   действующим    фитосанитарным   правилам
импортирующей   договаривающейся  стороны,  включая таковые  и для
регулируемых некарантинных вредных организмов.</td>
            </tr>
            <tr>
               <td colspan="2">This  is  to  certify that the plants, plant products or other
regulated  articles  described  herein  have been inspected and/or
tested  according  to  appropriate  official  procedures  and  are
considered  to be free from the quarantine pests, specified by the
importing  contracting  party  and  to  conform  with  the current
phytosanitary  requirements  of  the  importing contracting party,
including those for regulated non-quarantine pests.</td>
            </tr>
         </table> 
            <table class="graph10" style="width: 170mm;">
            <tr>
               <td align="center" colspan="2"> II. Дополнительная декларация - Additional declaration</td>
            </tr> 
			<tr>
               <td colspan="2" style="text-decoration:underline;">
                  <xsl:for-each select="fsc:AddDeclaration">
                     <xsl:value-of select="."/>, 
				</xsl:for-each>
               </td>
            </tr>
         </table> 
			<table class="graph10" style="width: 170mm;">
            <tr>
               <td align="center" colspan="4">
                  <br>III. Обеззараживание - Desinfestation and/or </br>
                  <br>disinfection Treatment</br>
               </td>
            </tr> 
			<xsl:if test="fsc:Desinfestation">
               <tr>
                  <td>Дата /Date/</td>
                  <td style="text-decoration:underline;">
					  <xsl:for-each select="fsc:Desinfestation/fsc:DateDesinfestation">
						  <xsl:call-template name="Date_2"/>
					  </xsl:for-each>
                  </td>
                  <td>Способ обработки /Treatment method/</td>
                  <td style="text-decoration:underline;">
                     <xsl:if test="fsc:Desinfestation/fsc:TreatmentMethod">
                        <xsl:value-of select="fsc:Desinfestation/fsc:TreatmentMethod"/>
                     </xsl:if>
                  </td>
               </tr>
               <tr>
                  <td colspan="3">Химикат (действующее вещество) /Chemical (active ingredient)/</td>
                  <td style="text-decoration:underline;">
                     <xsl:if test="fsc:Desinfestation/fsc:Chemical">
                        <xsl:value-of select="fsc:Desinfestation/fsc:Chemical"/>
                     </xsl:if>
                  </td>
               </tr>
               <tr>
                  <td colspan="3">Экспозиция и температура /Duration and temperature/</td>
                  <td style="text-decoration:underline;">
                     <xsl:if test="fsc:Desinfestation/fsc:Duration">
                        <xsl:value-of select="fsc:Desinfestation/fsc:Duration"/>, 
							</xsl:if>
                     <xsl:if test="fsc:Desinfestation/fsc:Temperature">
                        <xsl:value-of select="fsc:Desinfestation/fsc:Temperature"/>
                     </xsl:if>
                  </td>
               </tr>
               <tr>
                  <td colspan="2">Концентрация /Concentration/</td>
                  <td colspan="2" style="text-decoration:underline;">
                     <xsl:if test="fsc:Desinfestation/fsc:Concentration">
                        <xsl:value-of select="fsc:Desinfestation/fsc:Concentration"/>
                     </xsl:if>
                  </td>
               </tr>
               <tr>
                  <td colspan="3">Дополнительная информация /Additional information/</td>
                  <td style="text-decoration:underline;">
                     <xsl:for-each select="fsc:Desinfestation/fsc:AddInfo">
                        <xsl:value-of select="."/> 
							</xsl:for-each>
                  </td>
               </tr>
            </xsl:if>
         </table>
			 
			<table class="graph10" style="width: 170mm;">
            <tbody>
               <tr>
                  <td rowspan="6" width="120mm">
                     <br>М.П.</br>
                     <br>Stamp</br>
                  </td>
                  <td colspan="4">Место выдачи    RUSSIAN FEDERATION</td>
               </tr>
               <tr>
                  <td colspan="2">Place of issue</td>
                  <td colspan="2" style="text-decoration:underline;">
                     <xsl:for-each select="fsc:PlaceIssue">
                        <xsl:call-template name="Address"/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td colspan="4">Уполномоченное должностное лицо Федеральной службы по ветеринарному и фитосанитарному надзору</td>
               </tr>
               <tr>
                  <td colspan="4">Authorized officer of the Federal Service
                       for Veterinary and Phytosanitary</td>
               </tr>
               <tr>
                  <td colspan="2">Surveillance</td>
                  <td colspan="2" style="text-decoration:underline;">
                     <xsl:value-of select="fsc:PersonSignature/cat_ru:PersonSurname"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="fsc:PersonSignature/cat_ru:PersonName"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="fsc:PersonSignature/cat_ru:PersonMiddleName"/>
                  </td>
               </tr>
               <tr>
                  <td style="width:30mm">Дата /Date/</td>
                  <td style="text-decoration:underline; width:30mm">
                     <xsl:for-each select="fsc:PersonSignature/cat_ru:IssueDate">
                        <xsl:call-template name="Date_2"/>
                     </xsl:for-each>
                  </td>
                  <td style="width:30mm">Подпись /Signature/</td>
                  <td style="width:30mm">__________</td>
               </tr>
            </tbody>
         </table> 
			<table class="graph10" style="width: 170mm;">
            <tr>Примечание:   Данный    сертификат    не    накладывает    никаких
финансовых  обязательств  на Федеральную службу по ветеринарному и
фитосанитарному   надзору,   а  также  на  ее  должностных  лиц  и
представителей.</tr> 
<tr>Note:  No financial liability with  respect  to  this  certificate
shall  attach  to Federal Service for Veterinary and Phytosanitary
Surveillance or to any of its officers or representatives.</tr>
         </table>
	</div>
	</body>         
      </html>
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
		<!-- xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode"-->
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<br/>
			<xsl:text>(</xsl:text>
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
