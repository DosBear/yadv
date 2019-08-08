<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru kimpc catSert_ru" version="1.0" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.13.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:kimpc="urn:customs.ru:Information:SertifDocuments:KimberleyProcessCertificate:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
   <xsl:template name="Date">
      <!--<table>
		<tbody>
			<tr>
				<td style="width:5mm;border:solid 1.5pt #000000;" class="graph" align="center" valign="middle">
						<span class="graphBold"><xsl:value-of select="substring (., 9, 2)"/>&#160;</span>
				</td>
				<td style="width:5mm;border:solid 1.5pt #000000;" class="graph" align="center" valign="middle">
						<span class="graphBold"><xsl:value-of select="substring (., 6, 2)"/>&#160;</span>
				</td>	
				<td style="width:5mm;border:solid 1.5pt #000000;" class="graph" align="center" valign="middle">
						<span class="graphBold"><xsl:value-of select="substring (., 1, 4)"/>&#160;</span>
				</td>
			</tr>
		</tbody>
	</table>-->
      <xsl:value-of select="substring (., 9, 2)"/>
      <xsl:value-of select="substring (., 6, 2)"/>
      <xsl:value-of select="substring (., 1, 4)"/>
   </xsl:template>
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="kimpc:KimberleyProcessCertificate">
      <html>
         <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
         <style type="text/css">
                    body {background: #cccccc;}
                    div.page {
                        width: 210mm;
                        max-width: 210mm;
                        margin: auto;
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
                     .graph12 {
                        font-family: Arial, serif, bold;
                        font-size: 12pt;}
                        
                    .graph10 {
                        font-family: Arial, serif;
                        font-size: 10pt;}

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt;}

                       td {border: 0px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    graphBold {
							font-family: Arial;
							font-size: 7pt;
							font-weight: bold;
							}
                    </style>
	<div class="page">
         <table style="width:100%">
            <!--<tr>
					<td colspan="2" align="center" class="graph12">МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
				</tr>
				<tr>
					<td colspan="2" align="center" class="graph8">Ministry of Finance of the Russian Federation</td>
				</tr>
				<tr>
					<td colspan="2" align="center" class="graph12">СЕРТИФИКАТ ВЫВОЗА<br/>НЕОБРАБОТАННЫХ ПРИРОДНЫХ АЛМАЗОВ</td>
				</tr>
				<tr>
					<td colspan="2" align="center" class="graph8">Certificate of Export of Rough Diamonds</td>
				</tr>-->
            <tr>
               <td align="center" class="graph10" style="font-weight:900">Unique Number: <xsl:value-of select="kimpc:CertificateNumber/kimpc:CountryCode"/>
                  <xsl:value-of select="kimpc:CertificateNumber/kimpc:Number"/>
               </td>
            </tr>
            <br/>
            <br/>
            <tr>
               <td align="center" class="graph12" style="font-weight:900; font-size:25">
				   Сертификат (сведения о сертификате) международной схемы сертификации необработанных природных алмазов<br/>(сертификат Кимберлийского процесса)
				</td>
            </tr>
            <br/>
            <tr>
               <td align="center" class="graph12" style="font-weight:900; font-size:25">
				   KIMBERLEY PROCESS CERTIFICATE
				</td>
            </tr>
            <br/>
            <br/>
            <tr>
               <td align="center" class="graph8">The rough diamonds in this shipment have been handled in accordance with the provisions <br/>of the Kimberley Process Certification Scheme for rough diamonds</td>
            </tr>
         </table>
         <br/>
         <table style="width:100%">
            <tbody>
               <tr>
                  <td class="graph10" style="width=25%; font-weight:600">Country of Origin</td>
                  <td class="graph8" style="width=25%; border-bottom:solid 0.8pt #000000;" valign="bottom">
                     <xsl:value-of select="kimpc:ExtractingCountry"/>
                  </td>
                  <td class="graph10" style="width=25%; font-weight:600">Number of Parcels</td>
                  <td class="graph8" style="width=25%; border-bottom:solid 0.8pt #000000;">
                     <xsl:value-of select="kimpc:PackageNumber"/>
                  </td>
               </tr>
               <tr>
                  <td class="graph10" style="width=25%; font-weight:600">Name and address of Exporter</td>
                  <td class="graph8" style="width=25%; border-bottom:solid 0.8pt #000000;">
                     <xsl:value-of select="kimpc:Exporter/cat_ru:OrganizationName"/>
                  </td>
                  <td class="graph10" style="width=25%; font-weight:600">Name and address of Importer</td>
                  <td class="graph8" style="width=25%; border-bottom:solid 0.8pt #000000;">
                     <xsl:value-of select="kimpc:Importer/cat_ru:OrganizationName"/>
                  </td>
               </tr>
               <!--br/-->
               <tr>
                  <xsl:choose>
                     <xsl:when test="kimpc:Exporter/catSert_ru:LegalAddress">
                        <td class="graph8" colspan="2" style="width=50%; border-bottom:solid 0.8pt #000000;" valign="top">
							 <xsl:for-each select="kimpc:Exporter/catSert_ru:LegalAddress">
								 <xsl:apply-templates select="."/><br/>
							 </xsl:for-each>
                           <xsl:if test="kimpc:Exporter/catSert_ru:FactAddress">
                              <xsl:for-each select="kimpc:Exporter/catSert_ru:FactAddress">
                                 <xsl:apply-templates select="."/><br/>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:if test="kimpc:Exporter/catSert_ru:FactAddress">
                           <td class="graph8" colspan="2" style="width=50%; border-bottom:solid 0.8pt #000000;" valign="top">
                              <xsl:for-each select="kimpc:Exporter/catSert_ru:FactAddress">
                                 <xsl:apply-templates select="."/>
                              </xsl:for-each>
                           </td>
                        </xsl:if>
                     </xsl:otherwise>
                  </xsl:choose>
                  <xsl:choose>
						<xsl:when test="kimpc:Importer">
						  <xsl:choose>
							 <xsl:when test="kimpc:Importer/catSert_ru:LegalAddress">
								<td class="graph8" colspan="2" style="width=50%; border-bottom:solid 0.8pt #000000;" valign="top">
									 <xsl:for-each select="kimpc:Importer/catSert_ru:LegalAddress">
										 <xsl:apply-templates select="."/><br/>
									 </xsl:for-each>
								   <xsl:if test="kimpc:Importer/catSert_ru:FactAddress">
									  <xsl:for-each select="kimpc:Importer/catSert_ru:FactAddress">
										 <xsl:apply-templates select="."/><br/>
									  </xsl:for-each>
								   </xsl:if>
								</td>
							 </xsl:when>
							 <xsl:otherwise>
								<xsl:if test="kimpc:Importer/catSert_ru:FactAddress">
								   <td class="graph8" colspan="2" style="width=50%; border-bottom:solid 0.8pt #000000;" valign="top">
									  <xsl:for-each select="kimpc:Importer/catSert_ru:FactAddress">
										 <xsl:apply-templates select="."/><br/>
									  </xsl:for-each>
								   </td>
								</xsl:if>
							 </xsl:otherwise>
						  </xsl:choose>
						</xsl:when>
						<xsl:otherwise><td class="graph8" colspan="2" style="width=50%; border-bottom:solid 0.8pt #000000;" valign="top"></td></xsl:otherwise>
                  </xsl:choose>
               </tr>
			   <tr>
                  <td class="graph10" style="width=25%; font-weight:600">Name and address of Recipient</td>
                  <td class="graph8" style="width=25%; border-bottom:solid 0.8pt #000000;">
                     <xsl:value-of select="kimpc:Recipient/cat_ru:OrganizationName"/>
                  </td>
                  <td class="graph10" style="width=25%; font-weight:600"></td>
                  <td class="graph8" style="width=25%;">
                  </td>
               </tr>
               <!--br/-->
               <tr>
                  <xsl:choose>
                     <xsl:when test="kimpc:Recipient/catSert_ru:LegalAddress">
                        <td class="graph8" colspan="2" style="width=50%; border-bottom:solid 0.8pt #000000;" valign="top">
                           <xsl:for-each select="kimpc:Recipient/catSert_ru:LegalAddress">
								<xsl:apply-templates select="."/><br/>
                           </xsl:for-each>
                           <xsl:if test="kimpc:Recipient/catSert_ru:FactAddress">
                              <xsl:for-each select="kimpc:Recipient/catSert_ru:FactAddress">
                                 <xsl:apply-templates select="."/><br/>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:if test="kimpc:Recipient/catSert_ru:FactAddress">
                           <td class="graph8" colspan="2" style="width=50%; border-bottom:solid 0.8pt #000000;" valign="top">
                              <xsl:for-each select="kimpc:Recipient/catSert_ru:FactAddress">
                                 <xsl:apply-templates select="."/><br/>
                              </xsl:for-each>
                           </td>
                        </xsl:if>
                     </xsl:otherwise>
                  </xsl:choose>
				  <td class="graph8" colspan="2" style="width=50%;" valign="top"></td>
               </tr>
            
            </tbody>
         </table>
         <br/>
         <table align="center" cellpadding="0" cellspacing="0" class="graph8" style="width=35%; border-top:solid 1pt #000000; border-right:solid 1pt #000000; border-left:solid 1pt #000000;">
            <tbody>
               <tr>
                  <td align="center" style="border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000; font-weight:600">H.S. CODE</td>
                  <td align="center" style="border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000; font-weight:600">CARAT</td>
                  <td align="center" style="border-bottom:solid 0.8pt #000000; font-weight:600">VALUE (US$)</td>
               </tr>
               <xsl:for-each select="kimpc:DiamondsInfo">
                  <tr>
                     <td align="center" style="border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
                        <xsl:value-of select="kimpc:HarmonizedCode"/>
                     </td>
                     <td align="center" style="border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
                        <xsl:value-of select="kimpc:TotalWeight"/>
                     </td>
                     <td align="center" style="border-bottom:solid 0.8pt #000000;">
                        <xsl:value-of select="kimpc:TotalCost"/>
                     </td>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
         <br/>
         <table style="width=100%">
            <tbody>
               <tr>
                  <td align="left" class="graph10" style="width=50%">Issued on 
					<xsl:for-each select="kimpc:IssueDate">
                        <xsl:call-template name="Date"/>
                     </xsl:for-each>
                  </td>
                  <td align="left" class="graph10" style="width=50%">Expired on 
					<xsl:for-each select="kimpc:ValidityDateEnd">
                        <xsl:call-template name="Date"/>
                     </xsl:for-each>
                  </td>
               </tr>
            </tbody>
         </table>
         <br/>
         <table style="width:100%">
            <tbody>
               <tr>
                  <td align="left" class="graph10">Signature of Authorised Officer/Official Stamp</td>
               </tr>
            </tbody>
         </table>
	</div>
      </html>
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
