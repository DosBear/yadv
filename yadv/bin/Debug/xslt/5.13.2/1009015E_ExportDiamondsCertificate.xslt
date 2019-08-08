<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru ediac " version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ediac="urn:customs.ru:Information:SertifDocuments:ExportDiamondsCertificate:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="ediac:ExportDiamondsCertificate">
      <html>
         <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
         <style type="text/css">
                    body {}
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

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                    .graph16 {
                        font-family: Arial, serif, bold;
                        font-size: 16pt;}
                     .graph14 {
                        font-family: Arial, serif, bold;
                        font-size: 14pt;}
                        
                    .graph12 {
                        font-family: Arial, serif;
                        font-size: 12pt;}

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 7pt;}

                       td {border: 0px solid gray;
                        font-family: Arial, serif; font-size: 11pt;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    </style>
         <table align="center" style="width:190mm">
            <tr>
               <td align="center" class="graph14" colspan="2">МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
            </tr>
            <tr>
               <td align="center" class="graph12" colspan="2">Ministry of Finance of the Russian Federation</td>
            </tr>
            <tr>
               <td align="center" class="graph14" colspan="2">СЕРТИФИКАТ ВЫВОЗА<br/>НЕОБРАБОТАННЫХ ПРИРОДНЫХ АЛМАЗОВ</td>
            </tr>
            <tr>
               <td align="center" class="graph12" colspan="2">Certificate of Export of Rough Diamonds</td>
            </tr>
            <tr>
               <td align="left" class="graph14" colspan="2">
                  <xsl:value-of select="ediac:CertificateNumber/ediac:CountryCode"/>
                  <xsl:value-of select="ediac:CertificateNumber/ediac:Number"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph16" colspan="2">KIMBERLEY PROCESS CERTIFICATE</td>
            </tr>
         </table>
         <table align="center" style="width:190mm">
            <tbody>
               <tr>
                  <td style="width:40mm">
                     <b>Дата выдачи:</b>
                     <br/>
					Date of issue
					</td>
                  <td style="width:50mm">
                     <span style="border: 1px solid #000000">
                        <xsl:value-of select="substring(ediac:IssueDate,9,2)"/>
                     </span> 
				<span style="border: 1px solid #000000">
                        <xsl:value-of select="substring(ediac:IssueDate,6,2)"/>
                     </span> 
				<span style="border: 1px solid #000000">
                        <xsl:value-of select="substring(ediac:IssueDate,1,4)"/>
                     </span> 
					</td>
                  <td style="width:10mm">   </td>
                  <td style="width:40mm">
                     <b>Срок действия:</b>
                     <br/>
						Date of expiry</td>
                  <td style="width:50mm">
                     <span style="border: 1px solid #000000">
                        <xsl:value-of select="substring(ediac:ExpiryDate,9,2)"/>
                     </span> 
							<span style="border: 1px solid #000000">
                        <xsl:value-of select="substring(ediac:ExpiryDate,6,2)"/>
                     </span> 
							<span style="border: 1px solid #000000">
                        <xsl:value-of select="substring(ediac:ExpiryDate,1,4)"/>
                     </span> 
					</td>
               </tr>
               <tr>
                  <td>   </td>
                  <td class="graph8">
						(День, месяц, год)<br/>
						day, month, year
					</td>
                  <td>   </td>
                  <td>   </td>
                  <td class="graph8">
							(День, месяц, год)<br/>
							day, month, year
					</td>
               </tr>
            </tbody>
         </table>
         <table align="center" style="width:190mm">
            <tbody>
               <tr>
                  <td style="width:40mm">
                     <b>Экспортер:</b>
                     <br/> Exporter</td>
                  <td style="border: 1px solid #000000; width:150mm">
                     <xsl:for-each select="ediac:ExporterInfo">
                        <xsl:value-of select="ediac:CountryCodeA"/> 
							<xsl:value-of select="ediac:CountryCodeN"/> 
							<xsl:value-of select="ediac:CountryName"/> 
							
							<xsl:value-of select="cat_ru:OrganizationName"/> 
						</xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td style="width:40mm"> </td>
                  <td class="graph8" style="width:150mm">(код страны, страна, наименование)<br/>country code, country, name</td>
               </tr>
               <tr>
                  <td style="width:40mm">
                     <b>Получатель:</b>
                     <br/>Consignee</td>
                  <td style="border: 1px solid #000000; width:150mm">
                     <xsl:for-each select="ediac:Recipient">
                        <xsl:value-of select="ediac:CountryCodeA"/> 
							<xsl:value-of select="ediac:CountryCodeN"/> 
							<xsl:value-of select="ediac:CountryName"/> 
							
							<xsl:value-of select="cat_ru:OrganizationName"/> 
						</xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td style="width:40mm"> </td>
                  <td class="graph8" style="width:150mm">(код страны, страна, наименование)<br/>country code, country, name</td>
               </tr>
            </tbody>
         </table>
         <table align="center" style="width:190mm">
            <tbody>
               <tr>
                  <td style="width:40mm">
                     <b>Контракт №:</b>
                     <br/> Contract</td>
                  <td style="border: 1px solid #000000; width:80mm">
                     <xsl:value-of select="ediac:ContractInfo/cat_ru:PrDocumentName"/> 
						<xsl:value-of select="ediac:ContractInfo/cat_ru:PrDocumentNumber"/>
                  </td>
                  <td style="width:10mm">от <br/>of
						</td>
                  <td style="border: 1px solid #000000; width:15mm">
                     <xsl:value-of select="substring(ediac:ContractInfo/cat_ru:PrDocumentDate,9,2)"/>
                  </td>
                  <td style="border: 1px solid #000000; width:15mm">
                     <xsl:value-of select="substring(ediac:ContractInfo/cat_ru:PrDocumentDate,6,2)"/>
                  </td>
                  <td style="border: 1px solid #000000; width:30mm">
                     <xsl:value-of select="substring(ediac:ContractInfo/cat_ru:PrDocumentDate,1,4)"/>
                  </td>
               </tr>
               <tr>
                  <td style="width:40mm"> </td>
                  <td style="width:80mm"> </td>
                  <td style="width:10mm"> </td>
                  <td align="center" class="graph8" colspan="3" style="width:60mm">(День, месяц, год)<br/>
							day, month, year</td>
               </tr>
               <tr>
                  <td style="width:40mm">
                     <b>Код товара:</b>
                     <br/> Code system</td>
                  <td style="border: 1px solid #000000; width:80mm">
                     <xsl:value-of select="ediac:DiamondsInfo/ediac:GoodsTNVEDCode"/>
                  </td>
                  <td> </td>
                  <td colspan="3"> </td>
               </tr>
               <tr>
                  <td colspan="6">
                     <br/>
                  </td>
               </tr>
            </tbody>
         </table>
         <table align="center" style="width:190mm">
            <tbody>
               <tr>
                  <td style="width:40mm">
                     <b>Количество мест:</b>
                     <br/>Number of  pieces</td>
                  <td style="border: 1px solid #000000; width:25mm">
                     <xsl:value-of select="ediac:DiamondsInfo/ediac:PlaceNumber"/>
                  </td>
                  <td style="width:10mm">
                     <b>шт.</b>
                     <br/>pc</td>
                  <td style="width:50mm">
                     <b>Общая масса алмазов:</b>
                     <br/>Total diamond weight</td>
                  <td style="border: 1px solid #000000; width:50mm">
                     <xsl:value-of select="ediac:DiamondsInfo/ediac:TotalDiamondsWeight"/>
                  </td>
                  <td style="width:15mm">
                     <b>карат</b>
                     <br/>carats</td>
               </tr>
               <tr>
                  <td colspan="6">
                     <br/>
                  </td>
               </tr>
            </tbody>
         </table>
         <table align="center" style="width:190mm">
            <tbody>
               <tr>
                  <td style="width:50mm">
                     <b>Общая стоимость алмазов:</b>
                     <br/>Total diamond value</td>
                  <td style="border: 1px solid #000000; width:80mm">
                     <xsl:value-of select="ediac:DiamondsInfo/ediac:TotalDiamodsCost"/>
                  </td>
                  <td style="width:60mm">
                     <b>дол. США</b>
                     <br/>US $</td>
               </tr>
            </tbody>
         </table>
         <table align="center" style="width:190mm">
            <tbody>
               <tr>
                  <td>
                     <br/>
                     <b>Необработанные алмазы в данной партии(поставке) прошли оформление в соответствии с положением международной схемы сертификации необработанных алмазов Кимберлийского процесса</b>
                     <br/> The rough diamonds in this shipment have been handled in accordance with provisions of the Kimberley Process internation certification scheme for rough diamonds<br/>
                     <br/>
                  </td>
               </tr>
            </tbody>
         </table>
         <table align="center" style="width:170mm">
            <tbody>
               <tr>
                  <td align="center" style="border: 1px solid #000000; width:70mm">
                     <xsl:for-each select="ediac:Note">
                        <xsl:value-of select="."/> 
							</xsl:for-each>
                  </td>
                  <td style="width:30mm"> </td>
                  <td align="center" style="border: 1px solid #000000; width:70mm">
                     <xsl:value-of select="ediac:CustomsControler/cat_ru:PersonName"/> 
							<xsl:value-of select="ediac:CustomsControler/cat_ru:LNP"/>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" style="width:70mm">
                     <b>Номера пломб</b>
                     <br/>Number of seals</td>
                  <td style="width:30mm"> </td>
                  <td align="center" class="graph8" style="width:70mm">
                     <b>Государственный контролер</b>
                     <br/>State controller</td>
               </tr>
            </tbody>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
