<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru cacc" version="1.0" xmlns:cacc="urn:customs.ru:Information:CommercialFinanceDocuments:CertificateAccountsOrgan:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
   <xsl:template name="Date_2">
	   <xsl:param name="dateIn"/>
      <xsl:value-of select="substring ($dateIn, 9, 2)"/>.
					<xsl:value-of select="substring($dateIn, 6, 2)"/>.
					<xsl:value-of select="substring($dateIn, 1, 4)"/>
   </xsl:template>
   <xsl:template name="Date">
      <xsl:value-of select="substring (., 9, 2)"/> 
					<xsl:variable name="month" select="substring(., 6, 2)"/>
      <xsl:choose>
         <xsl:when test="$month=1">января</xsl:when>
         <xsl:when test="$month=2">февраля</xsl:when>
         <xsl:when test="$month=3">марта</xsl:when>
         <xsl:when test="$month=4">апреля</xsl:when>
         <xsl:when test="$month=5">мая</xsl:when>
         <xsl:when test="$month=6">июня</xsl:when>
         <xsl:when test="$month=7">июля</xsl:when>
         <xsl:when test="$month=8">августа</xsl:when>
         <xsl:when test="$month=9">сентября</xsl:when>
         <xsl:when test="$month=10">октября</xsl:when>
         <xsl:when test="$month=11">ноября</xsl:when>
         <xsl:when test="$month=12">декабря</xsl:when>
      </xsl:choose> 					
					<xsl:value-of select="substring(., 1, 4)"/> г.
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
   <xsl:template match="cacc:CertificateAccountsOrgan">
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
                     .graph12 {
                        font-family: Arial, serif, bold;
                        font-size: 12pt;}
                        font-size: 12pt;}
                        
                    .graph10 {
                        font-family: Arial, serif;
                        font-size: 10pt;}
					
					.graph101 {
                        font-family: Arial, serif;
                        font-size: 10pt;
                        border-bottom: solid 1pt #000000;}

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt;}

                       td {border: 0px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    
                     table.items {font-size: 9pt; border-collapse: collapse;}
                    table.items td, table.items th {border: 1px solid black; padding: 2px;}
                    table.items th {background-color: WhiteSmoke;}
                    </style>
         <table style="width:170mm">
            <tr>
               <td style="width:85mm"/>
               <td align="right" class="graph101" style="width:85mm">
                  <xsl:value-of select="cacc:TaxInfo/cat_ru:OrganizationName"/>
               </td>
            </tr>
            <tr>
               <td/>
               <td align="right" class="graph10">
                  <xsl:for-each select="cacc:TaxInfo/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph12" colspan="2">Справка о наличии счетов в банке у организации (индивидуального предпринимателя, нотариуса,  занимающегося частной практикой, адвоката, учредившего адвокатский кабинет)</td>
            </tr>
            <tr>
               <td class="graph101" colspan="2">Банк "
				<xsl:value-of select="cacc:BankInfo/cat_ru:OrganizationName"/>"
				</td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(полное или сокращенное наименование банка в соответствии с Книгой государственной регистрации кредитных организаций)</td>
            </tr>
            <tr>
               <td>
                  <table class="items">
                     <td>ИНН </td>
                     <xsl:for-each select="cacc:BankInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,1,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,2,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,3,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,4,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,5,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,6,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,7,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,8,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,9,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,10,1)"/>
                        </td>
                     </xsl:for-each>
                  </table>
               </td>
               <td style="width:85mm">
                  <table class="items">
                     <td class="graph10">КПП </td>
                     <xsl:for-each select="cacc:BankInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,1,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,2,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,3,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,4,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,5,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,6,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,7,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,8,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,9,1)"/>
                        </td>
                     </xsl:for-each>
                  </table>
               </td>
            </tr>
            <tr>
               <td>
                  <table class="items">
                     <td class="graph10">БИК </td>
                     <xsl:for-each select="cacc:BankInfo/cacc:BIC">
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,1,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,2,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,3,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,4,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,5,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,6,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,7,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,8,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,9,1)"/>
                        </td>
                     </xsl:for-each>
                  </table>
               </td>
               <td/>
            </tr>
            <tr>
               <td class="graph10" colspan="2">В соответствии с запросом налогового органа от 
<xsl:if test="cacc:RequestTax/cat_ru:PrDocumentDate">
                     <xsl:call-template name="Date_2">
						 <xsl:with-param name="dateIn" select="cacc:RequestTax/cat_ru:PrDocumentDate"/>
                     </xsl:call-template>
                  </xsl:if>
			<xsl:value-of select="cacc:RequestTax/cat_ru:PrDocumentName"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">в отношении "
				<xsl:value-of select="cacc:Organization/cat_ru:OrganizationName"/>"
				</td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(Наименование организации, ФИО индивидуального предпринимателя (нотариуса, занимающегося частной практикой, адвоката, учредившего адвокатский кабинет)</td>
            </tr>
            <tr>
               <td>
                  <table class="items">
                     <td class="graph10">ИНН/КИО </td>
                     <xsl:for-each select="cacc:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                        <td>
                           <xsl:value-of select="substring(.,1,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,2,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,3,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,4,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,5,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,6,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,7,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,8,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,9,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,10,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,11,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,12,1)"/>
                        </td>
                     </xsl:for-each>
                  </table>
               </td>
               <td>
                  <table class="items">
                     <td class="graph10">КПП </td>
                     <xsl:for-each select="cacc:Organization/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,1,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,2,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,3,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,4,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,5,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,6,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,7,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,8,1)"/>
                        </td>
                        <td style="width:3mm">
                           <xsl:value-of select="substring(.,9,1)"/>
                        </td>
                     </xsl:for-each>
                  </table>
               </td>
            </tr>
            <tr>
               <td class="graph10" style="width:145mm">1. Представляет   информацию  о  счетах,  открытых  в  банке указанному лицу
</td>
               <td>
                  <table align="right" class="items" style="width:10mm">
                     <xsl:choose>
                        <xsl:when test="cacc:AccountInfo">
                           <td align="center">X</td>
                        </xsl:when>
                        <xsl:otherwise>
                           <td align="center"> </td>
                        </xsl:otherwise>
                     </xsl:choose>
                  </table>
               </td>
            </tr>
         </table>
         <table class="items" style="width:170mm">
            <tr>
               <td align="center" class="graph10" style="width:35mm">1</td>
               <td align="center" class="graph10" style="width:35mm">2</td>
               <td align="center" class="graph10" style="width:80mm">3</td>
               <td align="center" class="graph10" style="width:10mm">4</td>
               <td align="center" class="graph10" style="width:10mm">5</td>
            </tr>
            <tr>
               <td align="center" class="graph10">номер счета</td>
               <td align="center" class="graph10">вид счета</td>
               <td align="center" class="graph10">цифровой код вида валюты счета (в соответствии с Общероссийским классификатором валют)</td>
               <td align="center" class="graph10">дата открытия счета (дд.мм.гг)</td>
               <td align="center" class="graph10">дата закрытия счета (дд.мм.гг)</td>
            </tr>
            <xsl:for-each select="cacc:AccountInfo">
               <tr>
                  <td class="graph10">
                     <xsl:value-of select="cacc:BankAccount"/>
                  </td>
                  <xsl:for-each select="cacc:BankAccountDescription">
                     <td class="graph10">
                        <xsl:value-of select="."/>
                     </td>
                  </xsl:for-each>
                  <td class="graph10">
                     <xsl:value-of select="cacc:CurrencyCode"/>
                  </td>
                  <td class="graph10">
                     <xsl:for-each select="cacc:StartDate">
                        <xsl:call-template name="Date_2">
							<xsl:with-param name="dateIn" select="."/>
                        </xsl:call-template>
                     </xsl:for-each>
                  </td>
                  <td class="graph10">
                     <xsl:for-each select="cacc:EndDate">
                        <xsl:call-template name="Date_2">
							<xsl:with-param name="dateIn" select="."/>
                        </xsl:call-template>
                     </xsl:for-each>
                  </td>
               </tr>
            </xsl:for-each>
         </table>
         <table style="width:170mm">
            <tr>
               <td class="graph10" colspan="4">2. Сообщает об отсутствии счетов в банке у указанного лица</td>
               <td>
                  <table align="right" class="items" style="width:10mm">
                     <xsl:choose>
                        <xsl:when test="cacc:AccountInfo">
                           <td> </td>
                        </xsl:when>
                        <xsl:otherwise>
                           <td align="center">X</td>
                        </xsl:otherwise>
                     </xsl:choose>
                  </table>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="5">Указанная   информация    предоставляется      по    состоянию
на 
<xsl:for-each select="cacc:DateIssue">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10">Представитель банка</td>
               <td class="graph101">
                  <xsl:value-of select="cacc:BankRepresentative/cat_ru:PersonPost"/>
               </td>
               <td class="graph101">
                  <xsl:value-of select="cacc:BankRepresentative/cat_ru:PersonSurname"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                  <xsl:value-of select="cacc:BankRepresentative/cat_ru:PersonName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                  <xsl:value-of select="cacc:BankRepresentative/cat_ru:PersonMiddleName"/>
               </td>
               <td class="graph101">
                  <text> </text>
               </td>
               <td class="graph101">
                  <xsl:for-each select="cacc:BankRepresentative/cat_ru:IssueDate">
                     <xsl:call-template name="Date_2">
						 <xsl:with-param name="dateIn" select="."/>
                     </xsl:call-template>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td/>
               <td align="center" class="graph8">(должность)</td>
               <td align="center" class="graph8">(Ф.И.О.)</td>
               <td align="center" class="graph8">(подпись)</td>
               <td align="center" class="graph8">(дата)</td>
            </tr>
            <tr>
               <td/>
               <td/>
               <td/>
               <td align="center" class="graph10">М.П.</td>
               <td/>
            </tr>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
